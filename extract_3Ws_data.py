import pandas as pd
import requests
import json
import logging
import openpyxl
from secrets_config import api_key

def extract_3Ws_data(csv_path: str) -> list[dict]:
    # read list of country codes
    