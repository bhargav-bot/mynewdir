from fastapi import APIRouter,FastAPI,Request,status,Response,HTTPException
from fastapi.responses import JSONResponse,RedirectResponse
from fastapi.encoders import jsonable_encoder
from fastapi.templating import Jinja2Templates
from fastapi.staticfiles import StaticFiles
from pydantic import BaseModel
from typing import List,Optional
from datetime import datetime
import json
import os
import sqlite3
from fastapi import Query,Header,Cookie

router=APIRouter()
templates=Jinja2Templates(directory="templates")

@router.get('/{id}')
async def func(response:Response,id:int,var1:str=Query(...),var2:str=Header(...),var3:str=Cookie(...)):
    response.headers['X-Custom-Header']='custom header value'
    response.set_cookie('X-Custom-Cookie','custom cookie value')
    response.status_code=status.HTTP_201_CREATED
    return {"id":id, "var1":var1,"var2":var2,"var3":var3}