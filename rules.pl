:- module(rules, [language_song/2, language_artist/2, country_artist/2, long_songs/2, artist_type/2, artist_song/2, genre_song/2, year_song/2, old_songs/2, recent_songs/2, artist_release/2, artist_album/2, artist_single/2, release_song/2, feat_artist_song/2, artist_active_year/2, international_collaboration/3, artist_genre/2, band_genre/2, collaboration/2, old_song_artist/3, recent_song_artist/3, short_song/2, long_song/2, short_song_artist/3, long_song_artist/3, is_genre/1, song_artist_genre/3, is_artist/1]).

language_song(Language, SongTitle) :-
    song(_, SongTitle, _, Language, _, _).

language_artist(Language, ArtistName) :-
    song(_, _, _, Language, ReleaseID, _),
    Language \= none,
    release(ReleaseID, _, _, _, ArtistID),
    artist(ArtistID, ArtistName, _, _).

country_artist(Country, ArtistName) :-
    artist(_, ArtistName, _, Country).

long_songs(MinSeconds, SongTitle) :-
    song(_, SongTitle, Length, _, _, _),
    Length >= MinSeconds.

artist_type(ArtistName, ArtistType) :-
    artist(_, ArtistName, ArtistType).

artist_song(ArtistName, SongTitle) :-
    artist(ArtistID, ArtistName, _, _),
    release(ReleaseID, _, _, _, ArtistID),
    song(_, SongTitle, _, _, ReleaseID, _).

genre_song(GenreName, SongTitle) :-
    genre(GenreID, GenreName),
    song(_, SongTitle, _, _, _, GenreID).

year_song(Year, SongTitle) :-
    song(_, SongTitle, _, _, ReleaseID, _),
    release(ReleaseID, _, Year, _, _).

old_songs(MaxYear, SongTitle) :-
    song(_, SongTitle, _, _, ReleaseID, _),
    release(ReleaseID, _, Year, _, _),
    Year < MaxYear.

recent_songs(MinYear, SongTitle) :-
    song(_, SongTitle, _, _, ReleaseID, _),
    release(ReleaseID, _, Year, _, _),
    Year > MinYear.

artist_release(ArtistName, ReleaseTitle) :-
    artist(ArtistID, ArtistName, _, _),
    release(_, ReleaseTitle, _, _, ArtistID).

artist_album(ArtistName, AlbumTitle) :-
    artist(ArtistID,ArtistName, _, _),
    release(_, AlbumTitle, _, 'album', ArtistID).

artist_single(ArtistName, SingleTitle) :-
    artist(ArtistID,ArtistName, _, _),
    release(_, SingleTitle, _, 'single', ArtistID).

release_song(ReleaseTitle, SongTitle) :-
    release(ReleaseID, ReleaseTitle, _, _, _),
    song(_, SongTitle, _, _, ReleaseID, _).

% true if ArtistName featured in SongTitle
feat_artist_song(ArtistName, SongTitle) :-
    artist(ArtistID, ArtistName, _, _),
    feat_artist(SongID, ArtistID),
    song(SongID, SongTitle, _, _, _, _).

% true if ArtistName had a release in Year
artist_active_year(ArtistName, Year) :-
    artist(ArtistID, ArtistName, _, _),
    release(_, _, Year, _, ArtistID).
% true if ArtistName featured in a song released in Year
artist_active_year(ArtistName, Year) :-
    (feat_artist_song(ArtistName, SongTitle),
    song(_, SongTitle, _, _, ReleaseID, _),
    release(ReleaseID, _, Year, _, _)).

% true if MainArtistName and FeaturedArtistName are from different countries
international_collaboration(SongTitle, MainArtistName, FeaturedArtistName) :-
    song(SongID, SongTitle, _, _, ReleaseID, _),
    release(ReleaseID, _, _, _, MainArtistID),
    artist(MainArtistID, MainArtistName, _, Country1),
    feat_artist(SongID, FeaturedArtistID),
    artist(FeaturedArtistID, FeaturedArtistName, _, Country2),
    Country1 \= Country2.

% true if ArtistName has released a song of the genre GenreName
artist_genre(ArtistName, GenreName) :-
    artist(ArtistID, ArtistName, _, _),
    release(ReleaseID, _, _, _, ArtistID),
    song(_, _, _, _, ReleaseID, GenreID),
    genre(GenreID, GenreName).

% true if the artist is a band and they perform GenreName
band_genre(ArtistName, GenreName) :-
    artist(ArtistID, ArtistName, band, _),
    release(ReleaseID, _, _, _, ArtistID),
    song(_, _, _, _, ReleaseID, GenreID),
    genre(GenreID, GenreName).

% true if FeaturedArtistName featured in a MainArtistName song
collaboration(MainArtistName, FeaturedArtistName) :-
    artist(MainArtistID, MainArtistName, _, _),
    release(ReleaseID, _, _, _, MainArtistID),
    song(SongID, _, _, _, ReleaseID, _),
    feat_artist(SongID, FeaturedArtistID),
    artist(FeaturedArtistID, FeaturedArtistName, _, _).

% true if SongTitle was released by ArtistName before Year
old_song_artist(SongTitle, ArtistName, MaxYear) :-
    artist(ArtistID, ArtistName, _, _),
    release(ReleaseID, _, Year, _, ArtistID),
    Year < MaxYear,
    song(_, SongTitle, _, _, ReleaseID, _).

% true if SongTitle was released by ArtistName after Year
recent_song_artist(SongTitle, ArtistName, MinYear) :-
    artist(ArtistID, ArtistName, _, _),
    release(ReleaseID, _, Year, _, ArtistID),
    Year > MinYear,
    song(_, SongTitle, _, _, ReleaseID, _).

% true if SongTitle's duration is less than MaxDuration
short_song(SongTitle, MaxDuration) :-
    song(_, SongTitle, Length, _, _, _),
    Length < MaxDuration.

% true if SongTitle's duration is more than MinDuration
long_song(SongTitle, MinDuration) :-
    song(_, SongTitle, Length, _, _, _),
    Length > MinDuration.

% true if SongTitle is from ArtistName and has a duration shorter than MaxDuration
short_song_artist(SongTitle, MaxDuration, ArtistName) :-
    song(_, SongTitle, Length, _, ReleaseID, _),
    Length < MaxDuration,
    release(ReleaseID, _, _, _, ArtistID),
    artist(ArtistID, ArtistName, _, _).

% true if SongTitle is from ArtistName and has a duration longer than MinDuration
long_song_artist(SongTitle, MinDuration, ArtistName) :-
    song(_, SongTitle, Length, _, ReleaseID, _),
    Length > MinDuration,
    release(ReleaseID, _, _, _, ArtistID),
    artist(ArtistID, ArtistName, _, _).

% true if GenreName is in the database
is_genre(GenreName) :- genre(_, GenreName).

% true if ArtistName is in the database
is_artist(ArtistName) :- artist(_, ArtistName, _, _).

% true if SongTitle is performed by ArtistName and its genre is GenreName
song_artist_genre(SongTitle, ArtistName, GenreName) :-
    song(_, SongTitle, _, _, ReleaseID, GenreID),
    release(ReleaseID, _, _, _, ArtistID),
    artist(ArtistID, ArtistName, _, _),
    genre(GenreID, GenreName).