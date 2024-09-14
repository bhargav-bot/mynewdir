from fastapi import FastAPI,APIRouter,HTTPException,status,Response,Request,Depends,requests,Query,Header,Cookie,UploadFile,File,Form
from fastapi.responses import JSONResponse, PlainTextResponse, RedirectResponse, FileResponse, HTMLResponse, StreamingResponse
from fastapi.encoders import jsonable_encoder
from fastapi.middleware.cors import CORSMiddleware
from fastapi.security import OAuth2PasswordBearer, OAuth2PasswordRequestForm
from jose import JWTError, jwt
from datetime import datetime, timedelta
from pydantic import BaseModel, Field
from typing import List, Optional


router = APIRouter()


from pymongo.mongo_client import MongoClient
from pymongo.server_api import ServerApi

uri = "mongodb+srv://760041bp:Yesha14@cluster0.g5vqr.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0"

# Create a new client and connect to the server
client = MongoClient(uri, server_api=ServerApi('1'))

# Send a ping to confirm a successful connection
try:
    client.admin.command('ping')
    print("Pinged your deployment. You successfully connected to MongoDB!")
except Exception as e:
    print(e)
    print("Could not connect to MongoDB")

db=client.bhargav
collection=db.users

@router.get('/1')
async def get_items():
    items = collection.find()
    items_list = []
    for item in items:
        item['_id'] = str(item['_id'])

        items_list.append(item)
    return items_list
@router.get('/entry/{id}')
async def get_item(id:Optional[int]=0):
    item_list=[]
    item=collection.find_one().skip(id)
    item['_id']=str(item['_id'])
    return item
@router.get('/entry1/{id}')
async def get_item(id:Optional[int]=0):
    item=collection.find().skip(id-1).limit(1)
    item_list=list(item)
    item=item_list[0]
    item['_id']=str(item['_id'])
    return item
@router.post('/entry')
async def add_item(item:dict,response:Response):
    collection.insert_one(item)
    response.status_code=status.HTTP_201_CREATED
    return {"message":"Item added successfully"}
@router.post('/entry1')
async def add_item1(item:list[dict],response:Response):
    collection.insert_many(item)
    response.status_code=status.HTTP_201_CREATED
    return {"message":"Items added successfully"}


@router.put('/entry/{id}')
async def update_item(id:int, item:dict,response:Response):
    collection.update_many({"age":{"$gt":id}},{"$set":item})
    rem=collection.find()
    list_rem=[]
    for i in rem:
        i['_id']=str(i['_id'])
        list_rem.append(i)
    response.status_code=status.HTTP_201_CREATED
    return list_rem

@router.put('/entry1/{id}')
async def update_item(id:int, item:dict,response:Response):
    collection.update_one({"age":{"$gt":id}},{"$set":item})
    rem=collection.find()
    list_rem=[]
    for i in rem:
        i['_id']=str(i['_id'])
        list_rem.append(i)
    response.status_code=status.HTTP_201_CREATED
    return list_rem

@router.delete('/entry/{id}')
async def delete_item(id:int,response:Response):
    collection.delete_many({"age":{"$gt":id}})

@router.get('/pipeline')
async def get_items2():
    items=collection.aggregate([
        {"$match":{"amount":{"$lt":400}}},
        {"$group":{"_id":"$product","total_sales": {"$sum" : "$amount"}}},
        {"$sort":{"total_sales":-1}} ])
    return list(items)


@router.get('/pipeline2')
async def get_items2():
    items=collection.aggregate([
        {"$match":{"product":{"$in":("Webcam","Monitor","Mouse")}}},
        {"$group":{"_id":"$product","total_amount":{"$sum":"$amount"}}},
        {"$sort":{"total_amount":1}},
        {"$project":{
            "_id":0,
            "pro":"$_id",
            "total_amount":1,
            "number":{"$multiply":[10,"$total_amount"]}
        }}
        
  
    ])
    return list(items)




@router.get('/har')
async def funce():
    items=collection.find()
    item_list=[]
    for item in items:
        item['_id']=str(item['_id'])
        item_list.append(item)
    return item_list
        
@router.get('/har2')
async def funce():
    items=collection.find_one()
    items['_id']=str(items['_id'])
    return items
import random
from random import randint
direct=[]
fruit = ['apple', 'banana', 'orange', 'grape', 'mango', 'pineapple', 'strawberry', 'blueberry', 'kiwi', 'watermelon', 'peach']
city = ['New York', 'Los Angeles', 'Chicago', 'Houston', 'Miami', 'San Francisco', 'Dallas', 'Seattle', 'Denver', 'Boston', 'Atlanta']
color = ['red', 'blue', 'green', 'yellow', 'purple', 'orange', 'pink', 'brown', 'black', 'white', 'gray']

class returnrespo(BaseModel):
    fruit:str
    color:str
    city:str
@router.get('/har3',response_model=returnrespo,)
async def funce():
    createlist={}
    id= randint(0,9)
    createlist['fruit']=fruit[id]
    id= randint(0,9)
    createlist['color']=color[id]
    id= randint(0,9)
    createlist['city']=city[id]
    var2=createlist
    collection.insert_one(var2)
    createlist['_id']=str(createlist['_id'])
    return createlist
@router.get('/har4')
async def fidrhgrhg():
    createlist={}
    id= randint(0,9)
    createlist['fruit']=fruit[id]
    id= randint(0,9)
    createlist['color']=color[id]
    id= randint(0,9)
    createlist['city']=city[id]
    result=collection.update_many({'product':{'$regex':'K'}},{'$set':createlist})
    return result.modified_count

@router.get('/har5')
async def funcefgtyhg():
    results=collection.aggregate([
        {"$match":{'amount':{'$gt':20}}},
        {"$group":{'_id':'$product','total_amount':{'$sum':'$amount'}}},
        {"$project":{'product_name':'$_id','total_amount':1,"_id":0}},
        {"$sort":{"total_amount":-1}}
    ])
    return list(results)
