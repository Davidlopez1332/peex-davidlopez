import json
from unittest import result
from flask import render_template, Flask, jsonify
from utils import api
import requests

app = Flask(__name__)

characters_url = "https://rickandmortyapi.com/api/character/"

def get_all_characters(url):

    response = requests.get(url).json()

    result = response["results"]

    return [[character["id"],character["name"], character["status"], character["gender"], character["image"]] for character in result ]
    
    
    
@app.route("/")
def index():
     characters = get_all_characters(characters_url)
     return render_template("index.html", characters1=characters) 
 
@app.route("/secondary")
def ping():
    characters = get_all_characters(characters_url)
    return render_template("secondary.html", characters1=characters) 

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=9000, debug=True)

