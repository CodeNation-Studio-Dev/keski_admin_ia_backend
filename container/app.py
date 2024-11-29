import requests
from langchain.chains import RetrievalQA
from langchain_community.document_loaders import TextLoader
# from langchain_community.vectorstores import FAISS
from langchain_community.embeddings.fastembed import FastEmbedEmbeddings

from langchain_community.vectorstores import Chroma
from langchain_community.embeddings.fastembed import FastEmbedEmbeddings
from langchain.text_splitter import CharacterTextSplitter
# from langchain.prompts import PromptTemplate
# from langchain.chains.combine_documents import create_stuff_documents_chain
# from langchain.chains import create_retrieval_chain


# Función para cargar el esquema y su explicación
def load_schema_and_explanation():
    with open('/home/sandbox/llm_container/schema.sql', 'r') as schema_file:
        schema_content = schema_file.read()

    with open('/home/sandbox/llm_container/schema_explanation.txt', 'r') as explanation_file:
        explanation_content = explanation_file.read()

    return schema_content, explanation_content


def ingest():
    # Get the doc
    # Cargar el esquema y su explicación
    schema_content, explanation_content = load_schema_and_explanation()

    # Crear el contexto combinado
    combined_context = f"""
    ### Esquema de la base de datos:
    {schema_content}

    ### Explicación del esquema:
    {explanation_content}
    """
    print(combined_context)

    # Crear el document loader con el contexto combinado
    documents = [combined_context]
    # loader = TextLoader(documents)

    # Split the pages by char
    text_splitter = CharacterTextSplitter(
        separator="\n\n",
        chunk_size=1024,
        chunk_overlap=100,
        length_function=len,
        add_start_index=False,
    )

    chunks = text_splitter.create_documents(documents)
    # print(f"Split {len(loader)} documents into {len(chunks)} chunks.")
    #
    embedding = FastEmbedEmbeddings()
    #Create vector store
    Chroma.from_documents(documents=chunks,  embedding=embedding)


    # # Generar embeddings y crear el vectorstore
    # embeddings = FastEmbedEmbeddings()  # Puedes usar otro método si lo prefieres
    # vectorstore = FAISS.from_documents(documents, embeddings)

    # # Configurar el endpoint de Ollama
    # ollama_endpoint = "http://localhost:11434/v1/models/llama3"


ingest()