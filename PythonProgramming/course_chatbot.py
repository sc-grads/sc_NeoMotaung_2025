#chatbot

import streamlit as st
from PyPDF2 import PdfReader
from langchain.text_splitter import RecursiveCharacterTextSplitter
#from langchain.embeddings.openai import OpenAIEmbeddings
from langchain.vectorstores import FAISS
from langchain_openai import OpenAIEmbeddings

OPENAI_API_KEY = "sk-1234uvwx5678abcd1234uvwx5678abcd1234uvwx"

st.header("My first chatbot")
with st.sidebar:
    st.title("Your Documents")
    file = st.file_uploader("Upload a PDF file and start asking questions", type="pdf")

#Extract Text

if file is not None:
    pdf_reader = PdfReader(file)
    text = ""
    for page in pdf_reader.pages:
        text += page.extract_text()
        #st.write(text)

#Break text into chunks
    text_splitter = RecursiveCharacterTextSplitter(
        separators="\n", #new lines
        chunk_size=1000, #1000 characters
        chunk_overlap=150,
        length_function=len
    )
    chunks = text_splitter.split_text(text)
    #st.write(chunks)

    #generating embeddings

    embeddings = OpenAIEmbeddings(openai_api_key=OPENAI_API_KEY)

    #creating a vector store - FAISS (Uses facebook)
    vector_store = FAISS.from_texts(chunks, embeddings)

#Get user question
    user_question = st.text_input("Type your question here")



#Do similarity search
    if user_question:
        match = vector_store.similarity_search(user_question)
        st.write(match)




#Output results


