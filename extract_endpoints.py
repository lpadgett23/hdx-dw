import pandas as pd
import requests
import json
import logging
from secrets_config import api_key
import datetime as dt
import boto3
from io import BytesIO


def extract_endpoint():
    endpoint = "affected-people/humanitarian-needs"
    url = f"https://hapi.humdata.org/api/v1/{endpoint}" 
    headers = {
        'X-HDX-HAPI-APP-IDENTIFIER': api_key
    }
    params = {
        'location_code': 'AFG',
        'limit': 100,
        'output_format': 'json',
        'offset': 0
    }
    response = requests.get(url=url, params=params, headers=headers)
    
    print("URL: ", response.url)  # Print the full URL for debugging
    print("Response Content: ", response.text)  # Print the response content
    
    return response


def parse_json_to_df(json_response):
    json_response_data = json_response.json()
    df_response = pd.json_normalize(json_response_data['data'])
    print(df_response.head())
    return df_response


def load_data_to_output_folder(df):
    endpoint_pattern = "humanitarian-needs"
    current_timestamp = dt.datetime.now().isoformat().replace(":", "-").replace(".", "-")
    return df.to_csv(f"output/hdx_{endpoint_pattern}_{current_timestamp}")
   

def load_data_to_s3(df):
    s3 = boto3.resource("s3")
    bucket = s3.Bucket("humanitarian-data-exchange-hdx-api-data-warehouse-for-our-org")
    endpoint_pattern = "humanitarian-needs"
    current_timestamp = dt.datetime.now().strftime("%Y-%m-%dT%H:%M:%S")
    key = f"hdx_dump_afg_{endpoint_pattern}_{current_timestamp}"
    out_buffer = BytesIO()
    parquet_file = df.to_parquet(out_buffer, index=False)
    bucket.put_object(Body=out_buffer.getvalue(), Key=key)
    return parquet_file


# def load_to_postgres(parquet_file):


if __name__ == "__main__":
    json_response = extract_endpoint()
    print(json_response.status_code)
    df_endpoint = parse_json_to_df(json_response)
    load_data_to_output_folder(df_endpoint)
    load_data_to_s3(df_endpoint)
    # print(df_response.head())