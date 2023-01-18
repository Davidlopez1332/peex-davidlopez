import requests
characters_url = "https://rickandmortyapi.com/api/character/"

def get_all_characters(url):

    response = requests.get(url).json()

    result = response["results"]

    return [[character["id"],character["name"], character["status"], character["gender"], character["image"]] for character in result ]

