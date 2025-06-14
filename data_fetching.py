# API calls to retrieve data from the last.fm database
import requests
import time

API_KEY = '3ff74d7a8032cc847e524e9c17617504'
URL = 'http://ws.audioscrobbler.com/2.0/'

def get_top_artists(limit=500):
    artists = []
    page = 1
    while len(artists) < limit:
        params = {
            'method': 'chart.gettopartists',
            'api_key': API_KEY,
            'format': 'json',
            'limit': 100,
            'page': page
        }
        resp = requests.get(URL, params=params).json()
        for artist in resp['artists']['artist']:
            artists.append(artist['name'])
            if len(artists) >= limit:
                break
        page += 1
        time.sleep(0.25)
    print(artists)
    return artists


def get_albums_by_artist(artist):
    parameters = {
        'method': 'artist.getTopAlbums',
        'artist': artist,
        'api_key': API_KEY,
        'format': 'json',
        'limit': 10  # Optional: how many top albums to return
    }
    print()
    response = requests.get(URL, params=parameters)

    if response.status_code == 200:
        data = response.json()
        top_albums = data.get('topalbums', {}).get('album', [])

        for album in top_albums:
            name = album.get('name')
            # playcount = album.get('playcount')
            # url = album.get('url')
            print(f"{name}")
    else:
        print(f"Error {response.status_code}: {response.text}")
        

def get_songs_by_artist(artist):
    parameters = {
        'method': 'artist.getTopTracks',
        'artist': artist,
        'api_key': API_KEY,
        'format': 'json',
        'limit': 10  # Optional: how many top songs to return
    }
    print()
    response = requests.get(URL, params=parameters)

    if response.status_code == 200:
        data = response.json()
        top_tracks = data.get('toptracks', {}).get('track', [])

        for song in top_tracks:
            name = song.get('name')
            print(f"{name}")
    else:
        print(f"Error {response.status_code}: {response.text}")


# get_top_artists(40)
# get_albums_by_artist('Kendrick Lamar')
# get_songs_by_artist('Metallica')