from flask import Flask, request

app = Flask(__name__)

stores = [
    {
        "name": "My Store",
        "items": [
            {
                "name":"Chair",
                "price": 15.99
            }
        ]
    }
]


#when we open 127.0.0.1:5000
#flask runs get_store

#returns every store
@app.get("/store")
def get_stores():
    return {"stores": stores}

#creates a store on a post request
#requires json body with the name of the store
@app.post("/store")
def create_store():
    request_data = request.get_json()
    new_store = {"name": request_data["name"], "items":[]}
    stores.append(new_store)
    return new_store, 201

#Add a new item
#Loops through all stores until it finds a match from the request
@app.post("/store/<string:name>/item")
def create_item(name):
    request_data = request.get_json()
    for store in stores:
        if store["name"] == name:
            new_item = {"name": request_data["name"], "price" : request_data["price"]}
            store["items"].append(new_item)
            return new_item, 201
    return {"message": "Store not found"}, 401

#get store info
@app.get("/store/<string:name>")
def get_store(name):
    for store in stores:
        if store["name"] == name:
            return store
    return {"message": "Store not found"}, 404

#Get item info
@app.get("/store/<string:name>/item")
def get_item_in_store(name):
    for store in stores:
        if store["name"] == name:
            return {"items": store["items"]}
    return {"message": "Store not found"}, 404