import uuid
from flask import Flask, request
from flask_smorest import abort
from db import items, stores

app = Flask(__name__)



#when we open 127.0.0.1:5000
#flask runs get_store

#returns every store
@app.get("/store")
def get_stores():
    return {"stores": list(stores.values())}

#creates a store on a post request
#requires json body with the name of the store
@app.post("/store")
def create_store():
    store_data = request.get_json()
    store_id = uuid.uuid4().hex
    new_store = {**store_data, "id": store_id} #**store data just unpacks the store data input json to create a new store
    stores[store_id] = new_store
    return new_store, 201

#Add a new item
#Loops through all stores until it finds a match from the request
@app.post("/item")
def create_item(name):
    item_data = request.get_json()
    if item_data["store_id"] not in stores:
        abort(404, message="Item not found")
    item_id = uuid.uuid4().hex
    item = {**item_data, "id": item_data}
    items[item_id] = item
    return item, 201

@app.get("/item")
def get_all_items():
    return {"items": list(items.values())}

#get store info
@app.get("/store/<string:store_id>")
def get_store(store_id):
    try:
        return stores[store_id]
    except KeyError:
        abort(404, message="Store not found")

#Get item info from a particular store
@app.get("/item/<string:item_id>")
def get_item(name):
    try:
        return items[item_id]
    except:
        abort(404, message="Item not found")