import pandas as pd
import requests
import json
import logging
from secrets_config import api_key
import datetime as dt
import boto3
from io import BytesIO
import re


endpoints_list = [
        "affected-people/humanitarian-needs",
        "affected-people/refugees",
        #"food/food-security",
        "population-social/poverty-rate"
    ]

def util_extract_name(text):
    pattern = r'/([a-z-]+)$'
    match = re.search(pattern, text)
    if match:
        return match.group(1)
    else: return None


def extract_endpoint(endpoint):
    url_base = "https://hapi.humdata.org/api/v1/" 
    url = f"{url_base}{endpoint}"
    headers = {
        'X-HDX-HAPI-APP-IDENTIFIER': api_key
    }
    params = {
        'location_code': 'AFG',#['AFG', 'YEM'],
        'limit': 100,
        'output_format': 'json',
        'offset': 0
    }
        
    response = requests.get(url=url, params=params, headers=headers)

    print("Endpoint: ", endpoint) 
    print("URL: ", response.url)  # Print the full URL and endpoint for debugging
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
   

def load_data_to_s3(df, endpoint):
    s3 = boto3.resource("s3")
    bucket_name = "humanitarian-data-exchange-hdx-api-data-warehouse-for-our-org"
    bucket = s3.Bucket(bucket_name)
    
    # Generate a S3 key (path + filename) with the current timestamp
    extracted_ep_name = util_extract_name(endpoint)
    endpoint_pattern = f"build_testing_{extracted_ep_name}-dataset"
    current_timestamp = dt.datetime.now().strftime("%Y-%m-%dT%H:%M:%S")
    key = f"hdx_datasets/hdx_dump_afg_{endpoint_pattern}_{current_timestamp}"
    
    # Convert the df to Parquet format in memory
    out_buffer = BytesIO()
    df.to_parquet(out_buffer, index=False)
    
    # Upload the parquet file to S3
    bucket.put_object(Body=out_buffer.getvalue(), Key=key, ContentType="application/x-parquet")
    
    print(f"Uploaded file to s3://{bucket_name}/{key}")
    return key


# def load_to_postgres(parquet_file):


if __name__ == "__main__":
    for endpoint in endpoints_list:
        json_response = extract_endpoint(endpoint)
        print(json_response.status_code)
        df_endpoint = parse_json_to_df(json_response)
        load_data_to_output_folder(df_endpoint)
        load_data_to_s3(df_endpoint, endpoint)
        # print(df_response.head())