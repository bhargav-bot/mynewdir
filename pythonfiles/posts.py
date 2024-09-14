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
import requests


router=APIRouter()
templates=Jinja2Templates(directory="templates")