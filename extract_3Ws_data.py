import pandas as pd
import requests
import json
import logging
import openpyxl

def extract_3Ws_data(csv_path: str) -> list[dict]:
    # read list of country codes
    