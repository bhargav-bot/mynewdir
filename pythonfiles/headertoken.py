from fastapi import FastAPI,APIRouter,HTTPException,status,Response,Request,Depends,requests,Query,Header,Cookie,UploadFile,File,Form
from fastapi.responses import JSONResponse, PlainTextResponse, RedirectResponse, FileResponse, HTMLResponse, StreamingResponse
from fastapi.encoders import jsonable_encoder
from fastapi.middleware.cors import CORSMiddleware
from fastapi.security import OAuth2PasswordBearer, OAuth2PasswordRequestForm
from jose import JWTError, jwt
from datetime import datetime, timedelta
from pydantic import BaseModel, Field
from typing import List, Optional
from fastapi.security import APIKeyHeader,APIKeyCookie,APIKeyQuery
from fastapi.params import Body
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, Integer, String, ForeignKey
from sqlalchemy.orm import relationship
import bcrypt
from sqlalchemy.orm import Session




class UserCreate(BaseModel):
    email: str
    password: str
class UserDB(BaseModel):
    email: str
    hashed_password: str

async def hashed_password(password: str):
    
    hashed_password = bcrypt.hashpw(password.encode('utf-8'),bcrypt.gensalt())
    return hashed_password
async def check_password(password: str, hashed_password)->bool:
        return bcrypt.checkpw(password.encode('utf-8'), hashed_password)

router = APIRouter()
FASTAPI_TOKEN='mytoken'
FASTAPI_COOKIE='mycookie'
FASTAPI_QUERY='myquery'
api_key_header = APIKeyHeader(name="Token")
api_key_cookie=APIKeyCookie(name="cookie")
api_key_query=APIKeyQuery(name="query")

@router.get("/protected-route")
async def func(token12:str=Depends(api_key_header),token13:str=Depends(api_key_cookie),token14:str=Depends(api_key_query)):
    if token12!=FASTAPI_TOKEN:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED,detail="Invalid token")
    
    else:
        if token13!=FASTAPI_COOKIE:
            raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="Invalid cookie")
        else:
            if token14!=FASTAPI_QUERY:
                raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="Invalid query")
            else:
                pass
    return {"message":"Access granted"}

    
