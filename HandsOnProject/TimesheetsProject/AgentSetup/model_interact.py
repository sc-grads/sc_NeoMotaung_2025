import requests
import json

def query_llama(prompt, model="llama3.2"):
    url = "http://localhost:11434/api/generate"
    payload = {
        "model": model,
        "prompt": prompt,
        "stream": False
    }
    response = requests.post(url, json=payload)
    if response.status_code == 200:
        return json.loads(response.text)["response"]
    else:
        raise Exception(f"Ollama API error: {response.text}")
    
test_prompt = "Hello, I'm testing Llama 3.2. Can you respond with 'Success'?"
print(query_llama(test_prompt))  # Should print "Success"