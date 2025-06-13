# converting csv tables to Prolog facts, extracting only the relevant data
import csv
import unicodedata

def remove_accents(text):
    return ''.join(
        c for c in unicodedata.normalize('NFKD', text)
        if not unicodedata.combining(c)
    )
    
def convert_name(name: str):
    name = name.replace(' ','-')
    name = name.replace("'", "\\'")
    name = name.replace('''"''', '''\\"''')
    name = name.lower()
    name = remove_accents(name)
    return name

def convert_name_simple(name: str):
    name = name.replace("'", "\\'")
    name = name.replace('''"''', '''\\"''')
    return name

artist_type_dict = {1: "solo", 2: "band", 3: "orchestra", 4: "choir", 5: "character", 6: "other"}

# Artists
def row_to_prolog_fact_artists(row):
    r0 = row[0]
    r2 = row[2]
    r10 = row[10]
    r11 = row[11]

    if r0 == '\\N' or r2 == '\\N' or r10 == '\\N' or r11 == '\\N':
        raise Exception('something is undefined')
    id = int(r0)
    name = convert_name(r2)
    artist_type = artist_type_dict[int(r10)]
    country_id = int(r11)

    return f"artist({id}, '{name}', {artist_type}, {country_id})."

# Releases
def row_to_prolog_fact_releases(row):
    r0 = row[0]
    r1 = row[1]
    r2 = row[2]
    r3 = row[3]
    r4 = row[4]

    id = int(r0)
    title = convert_name_simple(r1)
    year = int(r2)
    release_type = r3
    artist_id = int(r4)

    return f"release({id}, '{title}', {year}, '{release_type}', {artist_id})."

# Songs
def row_to_prolog_fact_songs(row):
    r0 = row[0]
    r1 = row[1]
    r2 = row[2]
    r3 = row[3]
    r4 = row[4]
    r5 = row[5]

    id = int(r0)
    title = convert_name_simple(r1)
    length = int(r2)
    language = r3
    release_id = int(r4)
    genre_id = int(r5)

    return f"song({id}, '{title}', {length}, {language}, {release_id}, {genre_id})."

# Names to be displayed to the user
def row_to_prolog_fact_names(row):
    r0 = row[0]
    r2 = row[2]
    r10 = row[10]
    r11 = row[11]

    if r0 == '\\N' or r2 == '\\N' or r10 == '\\N' or r11 == '\\N':
        raise Exception('something is undefined')
    converted_name = convert_name(r2)
    r2: str = r2.replace("'", "\\'")
    return f'''match_name('{converted_name}', '{r2}').'''
    

input_csv = 'csv/song.csv'
output_prolog = 'database.pl'

with open(input_csv, newline='', encoding='utf-8') as csvfile, \
     open(output_prolog, 'a', encoding='utf-8') as plfile:

    reader = csv.reader(csvfile, delimiter=',')
    next(reader)

    for row in reader:
        try:
            # fact = row_to_prolog_fact_artists(row)
            # fact = row_to_prolog_fact_releases(row)
            fact = row_to_prolog_fact_songs(row)
            plfile.write(fact + '\n')
            print("row successfully converted")
        except Exception as e:
            print(f"Skipping row due to error: {e}")