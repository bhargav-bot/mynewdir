from fastapi import FastAPI,Request,Query,Body,Form,File,UploadFile,Header,Cookie,status,Response
from fastapi.encoders import jsonable_encoder
from fastapi.exceptions import RequestValidationError,HTTPException
from fastapi.middleware.cors import CORSMiddleware
import httpx  # Import httpx for async requests
from datetime import datetime  # Import datetime separately
import time 
import asyncio
from fastapi.responses import StreamingResponse
from pydantic import BaseModel
from typing import Optional,List
from fastapi.responses import HTMLResponse,Response,PlainTextResponse,RedirectResponse,FileResponse
from pydantic import BaseModel
import random
import requests
import os
from sqlalchemy import create_engine, Column, Integer, String, ForeignKey
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker, relationship
from pythonfiles.posts import router as post_router
from pythonfiles.users import router as user_router
from pythonfiles.mongodb import router as mongodb_router
from pythonfiles.headertoken import router as header_router
from fastapi import Depends
import psycopg2
from psycopg2.extras import RealDictCursor
from pythonfiles.headertoken import UserCreate,UserDB,hashed_password,check_password
from pythonfiles.headertoken import *
from fastapi_csrf_protect import CsrfProtect
from fastapi_csrf_protect.exceptions import CsrfProtectError

from fastapi.templating import Jinja2Templates

templates=Jinja2Templates(directory='html')

Base=declarative_base()
class User1234(Base):
    __tablename__ = "users45"  # Set the table name    
    id = Column(Integer, primary_key=True, autoincrement=True)
    email = Column(String(255), unique=True, nullable=False, index=True)
    hashed_password = Column(String(255), nullable=False)
class whatever(Base):
    __tablename__ = 'whatever'  # The name of the table
    name = Column(String, nullable=False)
    id = Column(Integer, primary_key=True)
    email = Column(String, nullable=False)
    password = Column(String, nullable=False)
class bbb(Base):
    __tablename__ = 'bbb'  # The name of the table
    id = Column(Integer, primary_key=True)

class token_table(Base):
    __tablename__ = 'token_table'  # The name of the table
    id = Column(Integer, primary_key=True)
    password = Column(String, nullable=False)
    token=Column(String, nullable=False)


engine=create_engine('postgresql://bhargav:Yesha14@postgres/fastapi_db')
SessionLocal=sessionmaker(autocommit=False,autoflush=False,bind=engine)


Base.metadata.create_all(bind=engine)



async def func_secret(var:Optional[str]=Header(None)):
    if var is None:
        raise HTTPException(status_code=401, detail="Authorization header is missing.")
async def func_cookie(var2:Optional[str]=Cookie(None)):
    if var2 is None:
        raise HTTPException(status_code=401, detail="Cookie is missing.")

    
#app = FastAPI(dependencies=[Depends(func_secret),Depends(func_cookie)])
app = FastAPI()
app.include_router(post_router,prefix="/posts",tags=["posts"])
app.include_router(user_router,prefix="/users",tags=["users"])
app.include_router(mongodb_router,tags=["mongodb"])
app.include_router(header_router,tags=["header"])


app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)



try:
    cursor = psycopg2.connect(
        host='postgres',
        user='bhargav',
        password='Yesha14',
        port=5432,
        dbname='fastapi_db'
    )
    cursor.autocommit = True
    print('Database is connected successfully')
except Exception as e:
    print(e)
    print('Database is not connected')

conn=cursor.cursor()




def get_db():
    db=SessionLocal()
    try:
        yield db
    finally:
        db.close()
import logging
logging.basicConfig(level=logging.DEBUG)

@app.get('/fff')
async def func(db=Depends(get_db)):
    conn.execute("""insert into bbb (id) values (1) returning *""")
    cursor.commit()
    ra=conn.fetchone()
    print("ra",ra)
    return ra

@app.get('/fff1')
async def func(db=Depends(get_db),item=6):
    db_item=bbb(id=item)
    db.add(db_item)
    db.commit()
    db.refresh(db_item) 
    return db_item

@app.get('/fff23')
async def func(db=Depends(get_db)):
    rows=db.query(bbb).filter(bbb.id==3).update({bbb.id:33})
    db.commit()
    if rows==0:
        raise HTTPException(status_code=404, detail="Item not found")
    else:
        valu=db.query(bbb).filter(bbb.id==33).first()
        return valu

@app.get('/fff22')
async def func(response:Response,db=Depends(get_db)):
    rows=db.query(bbb).filter(bbb.id==1).delete()
    db.commit()
    if rows!=0:
        print('deleted succesfully')
        response.status_code=status.HTTP_204_NO_CONTENT

    else:
        print('not deleted')
        response.status_code=status.HTTP_404_NOT_FOUND

    



@app.get('/fff2')
async def func(db=Depends(get_db)):
    rows=db.query(bbb).all()
    return rows

@app.get('/joo')
async def func(db=Depends(get_db)):
    try:
        rows=db.query(whatever).all()
        logging.debug(rows)
        return rows
    except Exception as e:
        return e





@app.get('/hii1')
def func():
    conn.execute("""select * from whatever""")
    rows = conn.fetchall()
    return rows

@app.get('/hii2')
def func():
    try:
        conn.execute("""insert into whatever (name,id,email,password) values (%s,%s,%s,%s) returning *""",("bhargav",1,"7600411bp@gmail.com","Yesha14"))

        rows = conn.fetchone()
        return rows
    except Exception as e:
        return e

@app.get('/hii3')
def func():
    try:
        conn.execute("""update whatever set name=%s,id=%s,email=%s,password=%s where id=%s returning *""",("bhargav1",2,"7600411bp@gmail.com","Yesha14",2
                                                                                                           ))
        rows = conn.fetchone()
        print(rows)
        return rows
    except Exception as e:
        return e


@app.get('/')
async def root():
    return {"message": "Hello, World"}
@app.get("/")
async def root():
    url = 'https://ww4.123moviesfree.net/movie/it-ends-with-us-1630857518/'
    async with httpx.AsyncClient() as client:
        response = await client.get(url)
        var = response.text

    return {"message": var}

@app.get('/httpx')
async def http():
    url2='https://mcloud.vvid30c.site/watch/?v21#WEcyVzMweVFNZU11bXh3VlVrUWxZeFFvcUhqTXVUREdNMHp5RlBXYWNSbTl3Sno4OVRNcVFZeW9MU0h0U0hsVi9PT0RicVZBcDQ4PQ'
    async with httpx.AsyncClient() as client:
        response = await client.get(url2, follow_redirects=True)
        # Ensure the response is successful and has content
        if response.status_code == 200 and response.content:
            # Return the binary content as a StreamingResponse
            return StreamingResponse(
                content=response.content,
                media_type="video/mp4",
                headers={"Content-Disposition":"inline"},
            )
        else:
            return {"message": f"Failed to retrieve content or no content found {response.status_code}"}



import httpx
@app.get('/http2')
async def http2():
    url2 = 'https://whisperingauroras.comos.xyz/watch/?v21#WEcyVzMweVFNZU11bXh3VlVrUWxZeFFvcUhqTXVUREdNMHp5RlBXYWNSbTl3Sno4OVRNcVFZeW9MU0h0U0hsVi9PT0RicVZBcDQ4PQ'
    
    async with httpx.AsyncClient() as client:
        response = await client.get(url2, follow_redirects=True)
        final_url = response.url
        status_code = response.status_code
        content = response.content
        headers = response.headers  # Use .content to get the binary data
        text=response.text

    return {
        "status_code": status_code,
        "final_url": str(final_url),
        "content_length": len(content),
        "headers": headers
      #  "text": text,  # This will contain the HTML content of the redirected page.
    }

@app.get('/post')
async def post():
    url1='https://httpbin.org/post'
    data={
        "name": "John Doe",
        "age": 30,
        "city": "New York"  # Add your data here for testing with POST request.
    }
    async with httpx.AsyncClient() as client:
        response = await client.post(url1, data=data)
        var = response.json()
        return {"message": var}
    

async def func1(): 
    task1=asyncio.create_task(func2())
    

    print("func1: start")
    await asyncio.sleep(3)
    print("func1: mid")
    await asyncio.sleep(4)
    print("func1: end")
    await task1  


async def func2():
    print("func2: start2")
    await asyncio.sleep(2)
    print("func2: mid2")
    await asyncio.sleep(6)
    print("func2: end2")


async def main():
    task=asyncio.gather(func1(),func2())
    await task

i=10

#asyncio.run(main())





import asyncio

async def task1():
    print("Task 1 started")
    await asyncio.sleep(2)
    print("Task 1 finished")

async def task2():
    print("Task 2 started")
    await asyncio.sleep(1)
    print("Task 2 finished")

async def main():
    async with asyncio.TaskGroup() as tg:
        tg.create_task(task1())
        tg.create_task(task2())

    print("All tasks finished")

#asyncio.run(main())

from httpx import AsyncClient,ASGITransport
from fastapi.encoders import jsonable_encoder
url="https://jsonplaceholder.typicode.com/todos/1"


@app.get('/httpx2')
async def httpx2():
    async with httpx.AsyncClient() as client:
        response = await client.get('https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4')
        final_url = response.url
        status_code = response.status_code
        content = response.content
        headers = response.headers  # Use .content to get the binary data
        text=response.text
        return {
            "status_code": status_code,
            "final_url": str(final_url),
            "content_length": len(content),
            "headers": headers,
            "text": text  # This will contain the HTML content of the redirected page.
            }
    
@app.get('/usr/{id}')
async def usr(id: int,request:Request):
    
    return {"id": request.headers}
@app.get('/usr2/{id}')
async def usr2(id:int):
    async with httpx.AsyncClient() as client:
        respose=await client.get('http://127.0.0.1:8002/usr/1')
    return {"header" :respose.headers,"json":respose.json()}


@app.get('/query')
def func23(id:int):
    return {"id":id}

@app.get('/query2')
def func232(id:int=Query(1,gt=0,lt=10)):
    return {"id":id}

class User(BaseModel):
    name:str
    age:int

class Comp(BaseModel):
    name2:str
@app.post("/users22")
async def create_user(user:User,comp:Comp):
    return {"name": user.name, "age": user.age ,"name2":comp.name2}

class Usa():
    name:str
    password:str

@app.post('/form')
async def form(username:str=Form(...),password:str=Form(...)):
    response=Usa()
    response.name=username
    response.password=password
    responsejson=jsonable_encoder(response)
    
    return responsejson


@app.post('/file')
async def file(file: UploadFile = File(...)):
    return {"filename": file.filename, "size": file.size, "content_type": file.content_type}

import base64
@app.post('/file2')
async def file(file: bytes = File(...)):
    encoded_file = base64.b64encode(file).decode('utf-8')
    return {"content": encoded_file}

@app.post('/files',status_code=status.HTTP_201_CREATED)
async def files(files: List[UploadFile] = File(...)):
    return [{"filename": file.filename, "size": file.size, "content_type": file.content_type} for file in files]


@app.get('/header')
async def header(x_token: str = Header(...)):
    return {"X-Token": x_token}

@app.get('/cookie')
async def cookie(cookie:str=Cookie(...)):
    return {"Cookie": cookie}

@app.get('/cookie2')
async def cookie(response: Response):
    response.set_cookie(key="my_cookie", value="my_cookie_value")
    return {"message": f"Cookie set successfully! {response.headers.get('Set-Cookie')}"}

@app.get('/request12')
async def request(request: Request):
    return {"path": request.url.path, "query_params": request.query_params, "headers": request.headers,"client":request.client}
@app.post('/request2')
async def request2(request: Request):
    return {"path": request.url.path, "query_params": request.query_params, "headers": request.headers,"body":await request.body(),"client":request.client}

@app.get('/request3')
async def request3(request:Request,header:str=Header(...),cookie:str=Cookie(...)):
    return {"state":request.state}

@app.get('/request4')
async def redirect(request:Request):
    async with httpx.AsyncClient() as client:
        response=await client.post('http://localhost:8002/request6')
        return {"response":response.json(),"url":response.url
}
@app.post('/request6')
async def fiu(response:Response):
    return {"status":response.status_code, "headers":response.headers,"cookies":response.set_cookie(key="my_cookie", value="my_cookie_value"),"cookie":response.set_cookie(key="name",value="Bhargav")}

@app.get('/request5')
async def func23424334535():
    async with httpx.AsyncClient() as client:
        response= await client.get('http://localhost:8002/request4')
        return {"response":response.json(),"url12":response.url,"method":response.headers,"content-type":response.headers.get('content-type')}

@app.get('/request7')
async def function2324324(response:Response):
    response.headers['name2']="Bhargav"
    
    
@app.get('/request8')
async def sesgg():
    async with httpx.AsyncClient() as client:
        response=await client.get('http://localhost:8002/request7')
        return response.headers.get('name2')

@app.get('/request9')
async def funcret(request:Request,response:Response):
    my_request=requests.get('http://worldtimeapi.org/api/timezone/Etc/UTC')
    response.set_cookie(key="mynameis",value="slim shady")
    return my_request.json()


@app.get('/request10')
async def funwre():
    async with httpx.AsyncClient() as client:
        response12=await client.get('http://localhost:8002/request9')
        response_time1=response12.json()
        response_time2=response_time1['datetime']

        set_cookie_header = response12.headers.get('set-cookie')
        
        return {"response": set_cookie_header,"time":response_time2}

@app.get('/request11')
async def funetet(response:Response):
    response.status_code=status.HTTP_201_CREATED
    response.headers['surname']='patel'
    response.set_cookie(key="my_cookie12", value="my_cookie_v")
    if 1==1:
        raise HTTPException(status_code=status.HTTP_202_ACCEPTED,detail={
"message": "Passwords don't match.",
"hints": [
"Check the caps lock on your keyboard",
"Try to make the password visible by clicking on the eye icon to check your typing",
],
},)
    return {'header':response.headers.get('surname'),'cook':response.headers.get('set-cookie')}


@app.get('/request13')
async def func1234():
    async with httpx.AsyncClient() as client:
        response=await client.get('https://support.logi.com/hc/en-ca')
        return {"text":response.text,"media-type":response.headers.get('content-type')}
    

@app.get('/request14',response_class=HTMLResponse)
async def func12342():
    async with httpx.AsyncClient() as client:
        response=await client.get('https://support.logi.com/hc/en-ca')
        return """
                <html>
                <body>
                <h1>Hello, World!</h1>
                </body>
                </html>
                """

@app.get('/request15')
async def func12343():
    async with httpx.AsyncClient() as client:
        response=await client.get('https://support.logi.com/hc/en-ca')
        responseHTml=response.text
        HTTPException(status_code=status.HTTP_300_MULTIPLE_CHOICES,detail='ghrthj')
        return Response(content=responseHTml,media_type="text/html")

@app.get('/request16',response_class=HTMLResponse)
async def func12344(response:Response):
        async with httpx.AsyncClient() as client:
          response12=await client.get('https://support.logi.com/hc/en-ca')
          response.content=response12.text

          response.media_type='text/html'
          response.status_code=status.HTTP_202_ACCEPTED

          return response.content
@app.get('/redirect')
def fgerhg(response:Response):
    return RedirectResponse(url='http://localhost:8002/request15',status_code=status.HTTP_303_SEE_OTHER)


@app.get('/filetype')
def file12(var:UploadFile=File(...)):
    return {"filename": var.filename, "size": var.size, "content_type": var.content_type,"content":var.read,"g":var.file.readable}

@app.get('/filetype2')
def file122(var: bytes = File(...)):

    return {"filename": "noname", "size": len(var), "content_type": "application/octet-stream","content":var}

@app.get('/filereturn')
async def file2343():
    root_dir=os.path.dirname(__file__)
    async with httpx.AsyncClient() as client:
        resp=await client.get('https://loripsum.net/api')
        response=resp.text
        os.makedirs(os.path.join(root_dir, 'static'), exist_ok=True)
        file_path=os.path.join(root_dir,'static','donwload.txt')
        with open(file_path, 'w') as file:
            file.write(response)


    picturepath=os.path.join(root_dir,'static','download.jpeg')
    return FileResponse(path=file_path)

@app.get('/c')
async def func23():
    root_dir=os.path.dirname(__file__)
    static_path=os.path.join(root_dir,'static')
    file_path=os.path.join(root_dir,'static','donwload.txt')

    os.makedirs(static_path, exist_ok=True)
    if os.path.exists(static_path):
        return FileResponse(path=file_path,headers={"Content-Disposition": "attachment; filename=download.txt"})
    

@app.get('/c2')
async def func(response:Response):
    str2=''
    for i in range(50):
     rand=random.randint(1, 2)
     if rand==1:
        random_string=random.randint(65,90)
     else:
        random_string=random.randint(97,122)
     str1=chr(random_string)
     str2=str2+str1
    return Response(content=str2, media_type="text/plain",headers={'content-Disposition': 'attachment; filename=download2.txt'})

import dicttoxml

@app.get('/c4')
def fdsrh(response:Response):
    rand=random.randint(1, 2)
    dict12={"name": "Bhargav","age": 25}
    if rand==1:
        response.headers['content-type']='application/json'
        json_res=jsonable_encoder(dict12)

        response.content=json_res
        return response.content

    else:
        # Convert dict to XML and return as PlainTextResponse
        response.headers['content-type']='application/xml'
        xml_res = dicttoxml.dicttoxml(dict12, root=True)
        print(xml_res)

        response.content = xml_res
        return Response(content=xml_res, media_type="application/xml")

from datetime import date,datetime
from enum import Enum
from typing import List, Optional
from pydantic import BaseModel, Field,ValidationError,Extra

class Gender(str, Enum):
    male = "male"
    female = "female"
    other = "other"


class Person(BaseModel):
    name: str
    age: int
    gender: Gender
    birthdate: Optional[date] = None
    interests: List[str] = []
    class config:
        extra='forbid'

@app.post('/c5')
async def dfghdf(request:Request,response:Response,var:Person):
    try:
        response.headers['content-type']='application/json'
        response.status_code=status.HTTP_201_CREATED
        return {"json":var.dict(),"request_body":await request.body()}
    except ValidationError as e:
        return {"error": str(e)}


    

#if __name__ == '__main__':
 #   import uvicorn
  #  uvicorn.run(app, host='127.0.0.1', port=8002,reload=True)


class user1(BaseModel):
    name:str

class user2(BaseModel):
    age:int
    user:user1
class user3(user1):
    surname:str





@app.post('/c6')
async def dfghdf(request:Request,response:Response,var:user2):
    try:
        response.headers['content-type']='application/json'
        response.status_code=status.HTTP_201_CREATED
        return {"json":var.dict(),"request_body":await request.body()}
    except ValidationError as e:
        return {"error": str(e)}
    
@app.post('/c7')
async def dfghdf(request:Request,response:Response,var:user3):
    return {"json":var.dict()}

class time1(BaseModel):
    time:Optional[datetime]=None

var3=time1()
var3.time=datetime.now()

#print(var3.time)
#time.sleep(5)
#var3.time=datetime.now()

#print(var3.time)

from pydantic import Field

class user123(BaseModel):
    age:int=Field(...,ge=5,le=22)

@app.post('/c8')
async def dfghdf(request:Request,response:Response,var:user123):
    return {"json":var}

class time2(BaseModel):
    time:datetime=Field(default_factory=datetime.now)

var4=time2()

#print(var4.time)
#time.sleep(2)
var5=time2()



#print(var5.time)

class time3(BaseModel):
    time:datetime=datetime.now()

var56=time3()

#print(var56.time)

#time.sleep(2)
var57=time3()

#print(var57.time)





from pydantic import HttpUrl,EmailStr
class validate12(BaseModel):
    url:HttpUrl
    email:EmailStr

var6=validate12(url='https://www.google.com',email='invalid@email.com')



#if __name__ == '__main__':
   # import uvicorn
  #  uvicorn.run("python:app", host='127.0.0.1', port=8004,reload=True)


from pydantic import BaseModel, Field, field_validator

class Validate123(BaseModel):
    name: str
    age: int

    @field_validator('name')
    def validate_name(cls, value):
        if not value.isalpha():
            raise ValueError('Name must contain only alphabetic characters')
        return value

# Attempt to create an instance
try:
    instance = Validate123(name='Bhargav', age=25)
except ValueError as e:
    print(e)


class val2(BaseModel):
    birthdate:date=Field(default_factory=date.today)
    @field_validator('birthdate')
    def func(cls,value):
        day=value.day
        month=value.month
        year=value.year
        if year<1900 or year>2022 or month<1 or month>12 or day<1 or day>31:
            raise ValueError('Invalid date12')
        else:
            if day>date.today().day:
                raise ValueError('Invalid date 222')
            else:
                return value

        



varerg=val2(birthdate='2013-08-01')
print(varerg.birthdate)

name="hefew"
for j in name:
    print(j)
date12=date.today()
print(date12.day)
print(date12.month)
print(date12.year)

from pydantic import model_validator

class passwordvalidate(BaseModel):
    email:EmailStr
    password:str
    password_confirmation:str
    @model_validator(mode='after')
    def func(cls,value):
        password=value.password
        password_confirmation=value.password_confirmation
        if password!=password_confirmation:
            raise ValueError('Passwords do not match')
        else:
            return value
        
var45=passwordvalidate(email='760043@gmail.com',password='123456',password_confirmation='123456')


class biodata(BaseModel):
    first_name:str
    last_name:str
class biodata2(BaseModel):
    age:int
    name:biodata


var67=biodata2(age=25,name=biodata(first_name='Bhargav',last_name='patel'))

biodata2_dict=var67.dict(include={"age":...,"name":{"first_name"}})
print(biodata2_dict)
from fastapi import FastAPI,Depends

def dependancyfunc(var1):
    return int(var1)*10


@app.get('/ttt')
async def func3443234532(var=Depends(dependancyfunc)):
    return {"var":var}

import jose

from jose import JWTError, jwt
from datetime import timedelta,UTC,datetime


secret_key = "your_secret_key"
algorithm='HS256'
time23=datetime.utcnow()+timedelta(minutes=15)

def func_token(var:dict):
    var['exp']=time23
    token=jwt.encode(var,secret_key,algorithm=algorithm)
    return token
from fastapi.security import OAuth2PasswordBearer,OAuth2PasswordRequestForm

oauth=OAuth2PasswordBearer(tokenUrl='token')

def decode_token(token:str=Depends(oauth)):
    try:
        var=jwt.decode(token,secret_key,algorithms=[algorithm])
        return var
    except JWTError:
        raise HTTPException(status_code=403, detail="Invalid token")
        

var456=func_token({"sub":"123456","email":"760043@gmail.com"})
print(var456)
print(decode_token(var456))

def funcerretyhye(request:Request):
    return request.headers.get('authorization')

@app.get('/oauth')
async def func354(var=Depends(decode_token),var2=Depends(funcerretyhye)):
    return {"var":var, "var2":var2}

async def func333():
    var1=random.randint(1,2)
    if var1==1:
        raise HTTPException(status_code=400, detail="Bad request")
    else:
        return var1

@app.get('/1212')
async def func444(var=Depends(func333)):
    return {"var":var}


    
class use_for_depend:
    def __init__(self,var:int):
        self.var=var
    def __call__(self, var22):
        return int(self.var)*int(var22)
    def multi(self,var22):
        return int(self.var)*int(var22)*int(var22)

    
user222233=use_for_depend(2)
@app.get('/c33')
async def funcw3r(var2=Depends(user222233)):
    return {"var":var2}
@app.get('/c34')
async def funcw3dfbr(var2=Depends(user222233.multi)):
    return {"var":var2}
class ketan:
    def __init__(self,var:int):
        self.var=var
        
    def __call__(self, var22):
        return int(self.var)*int(var22)



@app.get('/var')
async def func2345(var:int=Depends(ketan)):
    return {"var":var}
var33=ketan(20)
async def func_secret_header_cookie(var1:Optional[str]=Header(None),var2:Optional[str]=Cookie(None)):
    if var1 is None or var2 is None:
        raise HTTPException(status_code=401, detail="Unauthorized")


@app.get('/var2')
async def func23456(var:int=Depends(var33),var3=Depends(func_secret_header_cookie)):
    return {"var":var}

@app.get('/path_operator',dependencies=[Depends(func_secret_header_cookie)])
async def feree():
    return {"message":"Hello, world"}

class mycvl:
    id:int
    def __init__(self,int):
        self.id=int
    def __call__(self, var22):
        return int(self.id)*int(var22)
    def multi(self,var23):
        return int(self.id)*int(var23)

varcvl=mycvl(2)
@app.get('/cvl',)
async def func34(var:int=Depends(varcvl)):
    return {"var":var}
i=21

@app.get('/cvl2')
def func(db=Depends(get_db)):
    try:
        for i in range(30):
            var332=bbb(id=i)
            db.add(var332)
            db.commit()
    except Exception as e:
        db.rollback()
        raise e
    var4456=db.query(bbb).offset(6).limit(1).all()
    return var4456

from random import randint


@app.post('/ern',response_model=UserDB)
async def funcc(user:UserCreate,db=Depends(get_db)):
    hashed_password12=await hashed_password(user.password)
    var=User1234(email=user.email,hashed_password=hashed_password12,id=randint(1,100))
    try:
        db.add(var)
        db.commit()
        db.refresh(var)
    except Exception as e:
        db.rollback()
        print('error',e)
        raise e
    return var

@app.get('/ern2')
async def func353dg(db=Depends(get_db),email:str=Query(...),password:str=Query(...)):
  var=db.query(User1234).filter(User1234.email==email).first()

  pass2=bcrypt.hashpw(var.hashed_password.encode('utf-8'), bcrypt.gensalt())
  print(pass2)
  pass3=password
  pas4=bcrypt.hashpw(pass3.encode('utf-8'), bcrypt.gensalt())
  print(pas4)
  d= await check_password(password,pass2)

  if var is not None:
      if d:
          pass
      else:
          raise HTTPException(status_code=401, detail="Invalid password")
  else:
      raise HTTPException(status_code=404, detail="User not found")
  return var
@app.get('/ern3')
async def func35(db=Depends(get_db)):
    var=db.query(User1234).all()
    return var

@app.get('/setcookie')
async def func35(response:Response):
    response.set_cookie(key='bhargav', value='patel',expires=3600,httponly=True,secure=False)

    return {"message":"success"}

@app.get('/getcookie')
async def func35(request:Request):
    var=request.cookies.get('bhargav')
    return {"message":var}


from jose import jwt
from datetime import datetime, timedelta

def create___token(data: dict,db=Depends(get_db)):
    to_encode1=data.copy()
    expre=datetime.utcnow()+timedelta(minutes=15)
    to_encode1.update({"exp": expre})
    token12=jwt.encode(to_encode1,secret_key,algorithm='HS256')
    vargdsrhh=token_table(id=data['id'],password=data['password'],token=token12)
    db.add(vargdsrhh)
    db.refresh(vargdsrhh)
    
    return token12

print("token")
#print(create___token({'password':"760041bp@gmail.com","id":2333}))
data={'password':"760041bp@gmail.com","id":2333}
@app.get('/fg')
async def frh(response:Response,db=Depends(get_db)):
    to_encode1=data.copy()
    expre=datetime.utcnow()+timedelta(minutes=15)
    to_encode1.update({"exp": expre})
    token12=jwt.encode(to_encode1,secret_key,algorithm='HS256')
    vargdsrhh=token_table(id=data['id'],password=data['password'],token=token12)
    db.add(vargdsrhh)
    response.set_cookie(key='token',value=token12,expires=3600,httponly=True,secure=False)
    

    return vargdsrhh

@app.get('/')
async def root():
    return {"message": "Hello, World"}

@app.get('/coo1')
async def funcgrteghestgzh(response:Response,request:Request):
    response.set_cookie(key='bhargav', value='patel', expires=120, httponly=True, secure=False)
    return "done"
@app.get('/coo2')
async def funcgrteghestgzh(request:Request):
    var=request.cookies.get('bhargav')
    if var is None:
        raise HTTPException(status_code=401, detail="Unauthorized")
    return {"var":var}


@app.get('/gettime')
async def funcrhsrth():
    token=jwt.encode({"name":"bhargav", "age":25,"exp":datetime.utcnow()+timedelta(minutes=15)},secret_key,algorithm='HS256')

    print(token)
    decodeddd=jwt.decode(token,secret_key,algorithms=['HS256'])
    print(decodeddd)
    return decodeddd['exp']

@app.get('/formsub',response_class=HTMLResponse)
async def erfhgrtsh(request:Request,response:Response):
    return templates.TemplateResponse('form.html', {"request":request})

@app.post('/formsub')
async def fdbfdfb(response:Response,username:str=Form(...),password:str=Form(...)):

   return RedirectResponse(url='/',status_code=status.HTTP_303_SEE_OTHER)

@app.get('/mytime')
async def funcret():
    async with httpx.AsyncClient() as client:
        response=await client.get('https://worldtimeapi.org/api/timezone/Etc/UTC')
        data= response.json()
        data2=data['datetime']
        onlydate=data2.split('T')[1]
        return onlydate
