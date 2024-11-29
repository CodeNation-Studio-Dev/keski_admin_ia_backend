from langchain.chains import RetrievalQA
from langchain_community.vectorstores import FAISS
# from langchain_community.vectorstores import Chroma
# from langchain_community.vectorstores.chroma import Chroma
from langchain_chroma import Chroma
from langchain_community.embeddings.fastembed import FastEmbedEmbeddings
from langchain.schema import Document  # Importa el esquema de documentos
from langchain.text_splitter import RecursiveCharacterTextSplitter # Importing text splitter from Langchain
from fastembed import TextEmbedding
from langchain_core.prompts import ChatPromptTemplate
import subprocess
import json
import os # Importing os module for operating system functionalities
import shutil # Importing shutil module for high-level file operations
from openai import OpenAI


"""
LOADING
"""
def load_documents():

    with open('/home/sandbox/llm_container/schema.sql', 'r') as schema_file:
        schema_content = schema_file.read()

    with open('/home/sandbox/llm_container/schema_explanation.txt', 'r') as explanation_file:
        explanation_content = explanation_file.read()

    # Crear el contexto combinado
    combined_context = f"""
    ### Learn this schema of database for automation:
    {schema_content}

    ### schema explanation:
    {explanation_content}
    """

    # Convertir el texto en un objeto Document
    documents = [Document(page_content=combined_context)]  # Crear un objeto Document con el contenido
    return documents


"""
CHUNKING
"""
def split_text(documents: list[Document]):
    """
    Split the text content of the given list of Document objects into smaller chunks.
    Args:
        documents (list[Document]): List of Document objects containing text content to split.
    Returns:
        list[Document]: List of Document objects representing the split text chunks.
    """
    # Initialize text splitter with specified parameters
    text_splitter = RecursiveCharacterTextSplitter(
        chunk_size=300, # Size of each chunk in characters
        chunk_overlap=100, # Overlap between consecutive chunks
        length_function=len, # Function to compute the length of the text
        add_start_index=True, # Flag to add start index to each chunk
    )

    # Split documents into smaller chunks using text splitter
    chunks = text_splitter.split_documents(documents)
    print(f"Split {len(documents)} documents into {len(chunks)} chunks.")

    # Print example of page content and metadata for a chunk
    document = chunks[0]
    print(document.page_content)
    print(document.metadata)

    return chunks # Return the list of split text chunks

"""
Creating a Vector Database with Chroma
"""
CHROMA_PATH = "chroma"
def save_to_chroma(chunks: list[Document]):
    """
    Save the given list of Document objects to a Chroma database.
    Args:
    chunks (list[Document]): List of Document objects representing text chunks to save.
    Returns:
    None
    """

    # Clear out the existing database directory if it exists
    if os.path.exists(CHROMA_PATH):
        shutil.rmtree(CHROMA_PATH)

    embeddings = FastEmbedEmbeddings(model_name='BAAI/bge-small-en-v1.5')  # Puedes usar otro método si lo prefieres
    text_emb = TextEmbedding(model_name='BAAI/bge-small-en-v1.5')
    embeddings._model = text_emb

    # Create a new Chroma database from the documents using OpenAI embeddings
    db = Chroma.from_documents(
        chunks,
        embeddings,
        persist_directory=CHROMA_PATH
    )

    # Persist the database to disk
    # db.persist()
    print(f"Saved {len(chunks)} chunks to {CHROMA_PATH}.")


# documents = load_documents()
# chunks = split_text(documents)
# save_to_chroma(chunks)

query_text = "how much DeployTask has the first Deploy?"
PROMPT_TEMPLATE = """
Answer the question based only on the following context:
{context}
 - -
Answer the question based on the above context and just return a sql query: {question}
"""

# Generar embeddings y crear el vectorstore
embeddings = FastEmbedEmbeddings(model_name='BAAI/bge-small-en-v1.5')  # Puedes usar otro método si lo prefieres
text_emb = TextEmbedding(model_name='BAAI/bge-small-en-v1.5')
embeddings._model = text_emb
db = Chroma(persist_directory=CHROMA_PATH, embedding_function=embeddings)

# Retrieving the context from the DB using similarity search
results = db.similarity_search_with_relevance_scores(query_text, k=3)

# Check if there are any matching results or if the relevance score is too low
if len(results) == 0 or results[0][1] < 0.7:
    print(f"Unable to find matching results.")
else:
    print("Everything OK...")

# Combine context from matching documents
context_text = "\n\n - -\n\n".join([doc.page_content for doc, _score in results])

# Create prompt template using context and query text
prompt_template = ChatPromptTemplate.from_template(PROMPT_TEMPLATE)
prompt = prompt_template.format(context=context_text, question=query_text)

print(prompt)


from openai import OpenAI
client = OpenAI(
    base_url='http://127.0.0.1:11434/v1/',
    api_key='ollama',
)
chat_completion = client.chat.completions.create(
    messages=[
        {'role': 'assistant','content':'You are a Senior SQL enginner'},
    ],
    model='llama2',
)


print(chat_completion.choices[0].message.content)
print('---------------------------------')
print('Created at: ',chat_completion.created)
print('Model: ',chat_completion.model)
print('Object: ',chat_completion.object)
print('Finger print: ',chat_completion.system_fingerprint)
print('Completion tokens',chat_completion.usage.completion_tokens)
print('Prompt tokens: ',chat_completion.usage.prompt_tokens)
print('Total tokens: ',chat_completion.usage.total_tokens)