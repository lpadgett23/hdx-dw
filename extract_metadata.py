import pandas as pd
import requests
import logging
from secrets_config import api_key

headers = {
    "X-HDX-HAPI-APP-IDENTIFIER": api_key
}

url = f"https://hapi.humdata.org/api/v1/{metadata_endpoints}"

params = {
    "location_code": country_code,
    "limit": "1000"
}

def extract_country_codes(csv_path: str) -> pd.DataFrame:
    location_list_path = "data/codes_list.csv"
    return pd.read_csv(csv_path)


# start a basic logging set up
logging.basicConfig(level=logging.INFO, format='%(message)s')

# initialise a list to hold the response
hdx_metadata_response_list = []

# request data for each country and push to a list
for location_code in df_loc_codes["country_codes"]:
    params = {
        "location_code": location_code,
        "limit": "1000"
    }
    headers = {
        "X-HDX-HAPI-APP-IDENTIFIER": "aGR4ZHc6bHBhZGdldHQyM0BnbWFpbC5jb20="
    }
    
    response = requests.get(f"https://hapi.humdata.org/api/v1/metadata/admin2", params=params, headers=headers)

    if response.status_code == 200: 
        data = response.json()
    
        # check if 'data' key exists and is not empty
        if 'data' in data and data['data']:  
            hdx_metadata_response_list.append(data)
            logging.info(f"The call to location code {location_code} has returned data with {len(data['data'])} rows.")
        else:
            logging.info(f"The call to location code {location_code} did not return any data.")
    else:
        raise Exception("Extracting 3Ws data failed for location code {location_code}. Please check if limits have been reached")
    





    dataframes = []

    # loop through each json response in the list
    for i in range(len(hdx_3Ws_data)):
        df = pd.json_normalize(hdx_3Ws_data[i]['data'])
        dataframes.append(df)

    # concatenate all the dataframes into one
    combined_df = pd.concat(dataframes, ignore_index=True)

    print(combined_df)


if __name__ == "__main__":
    
    df_metadata_endpoints = extract_metadata_endpoints("data/metadata_endpoints.csv")
    df_countries = extract_country_codes("data/country_codes.csv")
    metadata_update = extract_metadata_datasets(df_metadata_endpoints)
    