from flask import Flask , request,jsonify
import numpy as np
import tensorflow as tf
import json
import nltk
from nltk.stem.lancaster import LancasterStemmer
import random
import numpy as np
from sklearn.cluster import KMeans
from sklearn.preprocessing import StandardScaler
from geopy.distance import geodesic
import numpy as np

import json
import keras
import nltk
from nltk.stem.lancaster import LancasterStemmer

# Load the intents data from the json file
with open("intentsara.json", encoding="utf-8") as file:
    data = json.load(file)

# Initialize the stemmer
# used in natural language processing to reduce words to their base or root form.
stemmer = LancasterStemmer()

model = keras.models.load_model('chatara.h5')

words = []
labels = []

for intent in data["intents"]:
    for pattern in intent["patterns"]:
        wrds = nltk.word_tokenize(pattern) #Tokenization is the process of breaking down a text into individual words or tokens.
        words.extend(wrds)

        if intent["tag"] not in labels:
            labels.append(intent["tag"])

words = [stemmer.stem(w.lower()) for w in words if w != "?"] # converts them to lowercase.# filters out any question marks from the words list.

words = sorted(list(set(words)))# converts the words list to a set to remove duplicates, converts it back to a list, sorts it, and assigns it back to words.

labels = sorted(labels)


def bag_of_words(s,words):
	bag = [0 for _ in range(len(words))]

	s_words = nltk.word_tokenize(s)
	s_words = [stemmer.stem(word.lower()) for word in s_words]

	for se in s_words:
		for i, w in enumerate(words):
			if w == se:
				bag[i] = 1
# If a word from the sentence matches a word from the vocabulary,
# the corresponding element in the bag list is set to 1, indicating the presence of that word in the sentence.
	return np.array(bag)

# Define chat function using the trained model

def chat(inp):
    # converts the input sentence into a bag-of-words vector 
    results = model.predict(np.array([bag_of_words(inp, words)]))[0] #The [0] at the end is used to extract the predictions for the first
    results_index = np.argmax(results) #returns the index of the maximum value in an array
    tag = labels[results_index] #assigned the label (or tag) corresponding to the highest probability prediction

    if results[results_index] > 0.7: #predicted probability for the most likely intent
        for tg in data["intents"]:
            if tg['tag'] == tag:
                responses = tg['responses']
                print(responses)
        return np.random.choice(responses)
    
    else:
        return "I didn't get that, try again in the first aid field."


# Haversine distance between two geographic coordinates
def haversine_distance(coord1, coord2):
    return geodesic(coord1, coord2).kilometers


def calculate_cluster_info(labels, data):
    cluster_info = {}
    
    for label in np.unique(labels):
        cluster_indices = [i for i in range(len(labels)) if labels[i] == label]
        cluster_points = [data[i] for i in cluster_indices]
        cluster_center = np.mean([[point['lat'], point['long']] for point in cluster_points], axis=0)
        cluster_size = len(cluster_points)

        # Calculate distances between cluster center and each point in the cluster
        distances = [haversine_distance(cluster_center, (point['lat'], point['long'])) for point in cluster_points]
        average_distance = np.mean(distances)

        # Convert label to a compatible data type (str in this case)
        label_str = str(label)

        # Format center as a dictionary with keys 'lat' and 'long'
        cluster_info[label_str] = {
            'center': {'lat': cluster_center[0], 'long': cluster_center[1]},
            'num_accidents': cluster_size,
            'average_distance': average_distance
        }

    return cluster_info



def runKmeans(data):
    # Extract latitude and longitude from the dataset
    X = np.array([[point['lat'], point['long']] for point in data])

    # Standardize data like training
    X = StandardScaler().fit_transform(X)

    # Experiment with adjusting the number of clusters (n_clusters parameter)
    cluster_sizes = list(range(100000, 0, -100))
                  # get the nearset number to size from cluster_sizes  
    n_clusters = next(size for size in cluster_sizes if len(data) >= size) // 20 if len(data) >= 100 else len(data)
    if n_clusters ==0:
        n_clusters = 10

    kmeans = KMeans(n_clusters=n_clusters)
    labels = kmeans.fit_predict(X)

    # Calculate cluster information
    return calculate_cluster_info(labels, data)



# Replace this with your actual dataset
# data1 = [{'lat': random.uniform(22.0, 31.0), 'long': random.uniform(25.0, 35.0)} for _ in range(3000)]#chnage the number of data points to test


app = Flask(__name__)


@app.route('/',methods=['POST'])
def kmeans():
    locations_list = request.json
    # Example processing
    processed_data = []
    for location in locations_list:
        # Example processing: Accessing data in each map
        latitude = location.get('locationLat')
        longitude = location.get('locationLong')
        # Do something with latitude and longitude...

        # Example: Append processed data to a new list
        processed_data.append({'lat': latitude, 'long': longitude})

    response = runKmeans(processed_data)
    return jsonify(response) 



@app.route('/chat',methods=['GET'])
def chatbot():
    Query = request.args['Query']
    response = chat(Query)
    return jsonify(response) 

if __name__ == '__main__':
    app.run(debug=True,host='0.0.0.0',port=5000)
