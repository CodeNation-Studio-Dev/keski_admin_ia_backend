import requests
from langchain.chains import RetrievalQA
from langchain_community.vectorstores import FAISS
from langchain_community.vectorstores import Chroma
from langchain_community.embeddings.fastembed import FastEmbedEmbeddings
from langchain.schema import Document  # Importa el esquema de documentos
from fastembed import TextEmbedding
import subprocess
import json

# Función para cargar el esquema y su explicación
def load_schema_and_explanation():
    with open('/home/sandbox/llm_container/context.txt', 'r') as schema_file:
        schema_content = schema_file.read()

    with open('/home/sandbox/llm_container/schema_explanation.txt', 'r') as explanation_file:
        explanation_content = explanation_file.read()

    return schema_content, explanation_content

# Cargar el esquema y su explicación
schema_content, explanation_content = load_schema_and_explanation()

# Crear el contexto combinado
combined_context = f"""
### Esquema de la base de datos:
{schema_content}

### Explicación del esquema:
{explanation_content}
"""

# # Crear el document loader con el contexto combinado
# documents = [combined_context]
# loader = TextLoader(documents)

# Convertir el texto en un objeto Document
documents = [Document(page_content=combined_context)]  # Crear un objeto Document con el contenido
print(documents[0]) 
print(f"Split {len(combined_context)} documents into {len(documents)} chunks.")


# Generar embeddings y crear el vectorstore
embeddings = FastEmbedEmbeddings(model_name='BAAI/bge-small-en-v1.5')  # Puedes usar otro método si lo prefieres
text_emb = TextEmbedding(model_name='BAAI/bge-small-en-v1.5')
embeddings._model = text_emb
vectorstore = FAISS.from_documents(documents, embeddings)
# Chroma.from_documents(documents=documents,  embedding=embeddings)



def query_ollama_using_docker_exec(model, prompt):
    # Ejecuta ollama dentro del contenedor usando `docker exec`
    command = [
        "docker", "exec", "ollama3",  # Nombre del contenedor
        "ollama", "run", model,
        "--prompt", prompt
    ]

    try:
        # Ejecutar el comando y obtener la salida
        result = subprocess.run(command, capture_output=True, text=True, check=True)
        return result.stdout
    except subprocess.CalledProcessError as e:
        print(f"Error ejecutando ollama: {e}")
        return None


# Configurar el endpoint de Ollama
ollama_endpoint = "http://127.0.0.1:11434/api/generate"
# Función para hacer la consulta a Ollama
def query_ollama_using_curl(question):
    # response = requests.post(ollama_endpoint, json={"prompt": question})
    response = requests.post(ollama_endpoint, json={"model": "llama2"})
    response.raise_for_status()  # Lanza un error si la respuesta no es 200
    return response.json()["completion"]

# Configurar el pipeline de RAG
def query_with_rag(question):
    # Busca en el vectorstore y genera la consulta a Ollama
    retrieval_result = vectorstore.similarity_search(question)
    query_context = retrieval_result[0].page_content  # Obtener el contexto más relevante
    full_query = f"{query_context}\n\n{question}"
    return query_ollama_using_curl(full_query)

# Pregunta en lenguaje natural
question = "¿Qué signiica stock dentro de la tabla inventario?"
response = query_with_rag(question)

# Imprimir la respuesta generada (el query SQL)
print(response)
