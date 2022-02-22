'''
Simple zippopotam API test getting a location from Brazil
'''
import requests

response = requests.get("https://api.zippopotam.us/BR/08700-000")
response_body = response.json()

def test_check_status_code_equals_200():
     assert response.status_code == 200

def test_check_content_type_equals_json():
     assert response.headers["Content-Type"] == "application/json"

def test_get_check_country_equals_brazil():
     assert response_body["country"] == "Brazil"

def test_check_city_name_is_correct():
     api_city_name = response_body["places"][0]["place name"]
     assert api_city_name == "Mogi das Cruzes"

def test_check_one_place_is_returned():
     assert len(response_body["places"]) == 1

def test_check_empty_zipcode_status_code_404():
     r = requests.get("https://api.zippopotam.us/BR")
     assert r.status_code == 404