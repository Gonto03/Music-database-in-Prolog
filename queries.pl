:- module(queries, [songs_by_artist/2, genres_by_artist/2, artists_by_genre/2, songs_by_genre/2, songs_by_language/2, active_years_by_artist/2, all_international_collaborations/1, songs_by_year/2, songs_newer_than/2, songs_older_than/2, songs_between/3, bands_by_genre/2, songs_by_artist_count/2, albums_by_artist_count/2, collaborations_count/2, songs_by_artist_before_year/3, songs_by_artist_after_year/3, songs_shorter_than/2, songs_longer_than/2, songs_by_artist_shorter_than/3, songs_by_artist_longer_than/3, artists_by_country/2, albums_by_artist/2, singles_by_artist/2, collaborations/2, genres/1, songs_by_artist_genre/3, genres_by_artist_count/2, languages_by_artist/2, languages_by_artist_count/2, artists/1]).

% SongList is a list containing every song performed by ArtistName
songs_by_artist(SongList, ArtistName) :-
    setof(SongTitle, artist_song(ArtistName, SongTitle), SongList).

% GenreList is a list containing every genre performed by ArtistName
genres_by_artist(GenreList, ArtistName) :-
    setof(GenreName, artist_genre(ArtistName, GenreName), GenreList).

% ArtistList is a list containing every artist that performs GenreName
artists_by_genre(ArtistList, GenreName) :-
    setof(ArtistName, artist_genre(ArtistName, GenreName), ArtistList).

% SongList is a list containing every song whose genre is GenreName
songs_by_genre(SongList, GenreName) :-
    setof(SongTitle, genre_song(GenreName, SongTitle), SongList).

% SongList is a list containing every song in Language
songs_by_language(SongList, Language) :-
    setof(SongTitle, language_song(Language, SongTitle), SongList).

% YearList is a list containing every year in which ArtistName had a release or featured in a song
active_years_by_artist(YearList, ArtistName) :-
    setof(Year, artist_active_year(ArtistName, Year), YearList).

% CollaborationList contains every international collaboration, which consists of a song title, its main artist and a featured artist, with the artists being from different countries
all_international_collaborations(CollaborationList) :-
    setof( [SongTitle, MainArtistName, FeaturedArtistName],
           international_collaboration(SongTitle, MainArtistName, FeaturedArtistName),
           CollaborationList).

% SongList contains every song release in Year
songs_by_year(SongList, Input) :-
    atom_number(Input, Year),  % converts string to number
    setof(SongTitle, year_song(Year, SongTitle), SongList).

% SongList contains every song whose release year is older than the given Year
songs_older_than(SongList, Input) :-
    atom_number(Input, Year),
    setof(SongTitle, old_songs(Year, SongTitle), SongList).

% SongList contains every song whose release year is more recent than the given Year
songs_newer_than(SongList, Input) :-
    atom_number(Input, Year),
    setof(SongTitle, recent_songs(Year, SongTitle), SongList).

% SongList contains every song released between MinYear and MaxYear (including boundaries)
songs_between(SongList, Input1, Input2) :-
    atom_number(Input1, MinYear),
    atom_number(Input2, MaxYear),
    setof(SongTitle, recent_songs(MinYear, SongTitle), RecentSongList),
    setof(SongTitle, old_songs(MaxYear, SongTitle), OldSongList),
    intersection(RecentSongList, OldSongList, BetweenSongList),
    setof(SongTitle, year_song(MinYear, SongTitle), MinYearSongList),
    setof(SongTitle, year_song(MaxYear, SongTitle), MaxYearSongList),
    union(BetweenSongList, MinYearSongList, SongList0),
    union(SongList0, MaxYearSongList, SongList).

% BandList contains every band that plays the genre GenreName
bands_by_genre(BandList, GenreName) :-
    setof(ArtistName, band_genre(ArtistName, GenreName), BandList).

% SongCount is the number of songs performed by ArtistName
songs_by_artist_count(SongCount, ArtistName) :-
    songs_by_artist(SongList, ArtistName),
    length(SongList, SongCount).

% AlbumCount is the number of albums released by ArtistName
albums_by_artist_count(AlbumCount, ArtistName) :-
    setof(AlbumTitle, artist_album(ArtistName, AlbumTitle), AlbumList),
    length(AlbumList, AlbumCount).

% FeaturedArtistCount is the number of artists that featured in MainArtistName songs
collaborations_count(FeaturedArtistCount, MainArtistName) :-
    setof(FeaturedArtistName, collaboration(MainArtistName, FeaturedArtistName), FeaturedArtistList),
    length(FeaturedArtistList, FeaturedArtistCount).

% SongList contains every song released by ArtistName before Year
songs_by_artist_before_year(SongList, ArtistName, Input) :-
    atom_number(Input, Year),
    setof(SongTitle, old_song_artist(SongTitle, ArtistName, Year), SongList).

% SongList contains every song released by ArtistName after Year
songs_by_artist_after_year(SongList, ArtistName, Input) :-
    atom_number(Input, Year),
    setof(SongTitle, recent_song_artist(SongTitle, ArtistName, Year), SongList).

% SongList contains every song whose duration is less than Seconds
songs_shorter_than(SongList, Input) :-
    atom_number(Input, Seconds),
    setof(SongTitle, short_song(SongTitle, Seconds), SongList).

% SongList contains every song whose duration is more than Seconds
songs_longer_than(SongList, Input) :-
    atom_number(Input, Seconds),
    setof(SongTitle, long_song(SongTitle, Seconds), SongList).

% SongList contains every song from ArtistName whose duration is less than Seconds
songs_by_artist_shorter_than(SongList, ArtistName, Input) :-
    atom_number(Input, Seconds),
    setof(SongTitle, short_song_artist(SongTitle, Seconds, ArtistName), SongList).

% SongList contains every song from ArtistName whose duration is more than Seconds
songs_by_artist_longer_than(SongList, ArtistName, Input) :-
    atom_number(Input, Seconds),
    setof(SongTitle, long_song_artist(SongTitle, Seconds, ArtistName), SongList).

% ArtistList contains every artist from CountryName
artists_by_country(ArtistList, CountryName) :-
    setof(ArtistName, country_artist(CountryName, ArtistName), ArtistList).

% AlbumList contains every album released by ArtistName
albums_by_artist(AlbumList, ArtistName) :-
    setof(AlbumName, artist_album(ArtistName, AlbumName), AlbumList).

% SingleList contains every single released by ArtistName
singles_by_artist(SingleList, ArtistName) :-
    setof(SingleName, artist_single(ArtistName, SingleName), SingleList).

% FeaturedArtistList contains every artist that collaborated with MainArtistName
collaborations(FeaturedArtistList, MainArtistName) :-
    setof(FeaturedArtistName, collaboration(MainArtistName, FeaturedArtistName), FeaturedArtistList).

% GenreList contains every single genre in the database
genres(GenreList) :-
    setof(GenreName, is_genre(GenreName), GenreList).

artists(ArtistList) :-
    setof(ArtistName, is_artist(ArtistName), ArtistList).

% SongList contains every song performed by ArtistName whose genre is GenreName
songs_by_artist_genre(SongList, ArtistName, GenreName) :-
    setof(SongTitle, song_artist_genre(SongTitle, ArtistName, GenreName), SongList).

% GenreCount is the number of genres that ArtistName performs
genres_by_artist_count(GenreCount, ArtistName) :-
    setof(GenreName, artist_genre(ArtistName, GenreName), GenreList),
    length(GenreList, GenreCount).

% LanguageList contains every language in which ArtistName performs
languages_by_artist(LanguageList, ArtistName) :-
    setof(Language, language_artist(Language, ArtistName), LanguageList).

% LanguageCount is the number of languages in which ArtistName performs
languages_by_artist_count(LanguageCount, ArtistName) :-
    setof(Language, language_artist(Language, ArtistName), LanguageList),
    length(LanguageList, LanguageCount).