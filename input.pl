:- module(input, [normalize_input/2, match_input_query/2]).

input_pattern(['list', 'all', 'artists'], artists(_)).
input_pattern(['list', 'all', 'genres'], genres(_)).
input_pattern([['what','which'], 'songs', ['does','do'], ArtistName, 'perform'], songs_by_artist(_, ArtistName)).
input_pattern([['what','which'], 'albums', 'did', ArtistName, 'release'], albums_by_artist(_, ArtistName)).
input_pattern([['what','which'], 'singles', 'did', ArtistName, 'release'], singles_by_artist(_, ArtistName)).
input_pattern([['what','which'], ['genre','genres'], ['does','do'], ArtistName, 'perform'], genres_by_artist(_, ArtistName)).
input_pattern([['what','which'], 'artists', 'perform', GenreName], artists_by_genre(_, GenreName)).
input_pattern([['what','which'], GenreName, 'songs', ['does','do'], ArtistName, 'perform'], songs_by_artist_genre(_, ArtistName, GenreName)).
input_pattern(['find', GenreName, 'songs'], songs_by_genre(_, GenreName)).
input_pattern(['find', 'songs', 'in', Language], songs_by_language(_, Language)).
input_pattern(['in', 'which', 'years', 'was', ArtistName, 'active'], active_years_by_artist(_, ArtistName)).
input_pattern([['which','what'], 'songs', 'were', 'released', 'in', Year], songs_by_year(_, Year)).
input_pattern([['which','what'], 'songs', 'were', 'released', 'before', Year], songs_older_than(_, Year)).
input_pattern([['which','what'], 'songs', 'were', 'released', 'after', Year], songs_newer_than(_, Year)).
input_pattern([['which','what'], 'songs', 'were', 'released', 'between', MinYear, 'and', MaxYear], songs_between(_, MinYear, MaxYear)).
input_pattern([['which','what'], 'songs', 'did', ArtistName, 'release', 'before', Year], songs_by_artist_before_year(_, ArtistName, Year)).
input_pattern([['which','what'], 'songs', 'did', ArtistName, 'release', 'after', Year], songs_by_artist_after_year(_, ArtistName, Year)).
input_pattern(['find', GenreName, 'bands'], bands_by_genre(_, GenreName)).
input_pattern(['how', 'many', 'songs', ['does', 'do'], ArtistName, 'have'], songs_by_artist_count(_, ArtistName)).
input_pattern(['how', 'many', 'albums', ['does', 'do'], ArtistName, 'have'], albums_by_artist_count(_, ArtistName)).
input_pattern(['how', 'many', 'genres', ['does', 'do'], ArtistName, 'perform'], genres_by_artist_count(_, ArtistName)).
input_pattern(['find', 'songs', 'shorter', 'than', Seconds, 'seconds'], songs_shorter_than(_, Seconds)).
input_pattern(['find', 'songs', 'longer', 'than', Seconds, 'seconds'], songs_longer_than(_, Seconds)).
input_pattern(['find', 'songs', 'from', ArtistName, 'shorter', 'than', Seconds, 'seconds'], songs_by_artist_shorter_than(_, ArtistName, Seconds)).
input_pattern(['find', 'songs', 'from', ArtistName, 'longer', 'than', Seconds, 'seconds'], songs_by_artist_longer_than(_, ArtistName, Seconds)).
input_pattern(['in', ['which','what'], 'languages', ['does','do'], ArtistName, 'perform'], languages_by_artist(_, ArtistName)).
input_pattern(['how', 'many', 'languages', ['does','do'], ArtistName, 'perform', 'in'], languages_by_artist_count(_, ArtistName)).
input_pattern(['find', 'artists', 'from', CountryName], artists_by_country(_, CountryName)).
input_pattern([['which','what'], 'artists', 'collaborated', 'with', ArtistName], collaborations(_, ArtistName)).
input_pattern(['how', 'many', 'artists', 'have', 'featured', 'in', ArtistName, 'songs'], collaborations_count(_, ArtistName)).
input_pattern(['find', 'international', 'collaborations'], all_international_collaborations(_)).

normalize_input(RawInput, WordList) :-
    clean_string(RawInput, Cleaned),
    downcase_atom(Cleaned, Lower),
    atomic_list_concat(Words, ' ', Lower),
    WordList = Words.

match_input_query(UserWords, Query) :-
    % try every input_pattern
    input_pattern(Pattern, Query),
    % check if it matches the user input
    pattern_match(Pattern, UserWords).

pattern_match([], []).
pattern_match([PatternHead|PatternTail], [InputHead|InputTail]) :-
    % if PatternHead is a list of options, succeed if any option matches InputHead
    (is_list(PatternHead),
      member(InputHead, PatternHead)
    -> true
    % if it is a variable, unify it with InputHead
    ; var(PatternHead),
      PatternHead = InputHead
    -> true
    % if it is a single atom, check for exact match with InputHead
    ; atom(PatternHead),
      PatternHead == InputHead
    -> true
    ),
    pattern_match(PatternTail, InputTail).

clean_string(Input, Cleaned) :-
    string_codes(Input, Codes),
    exclude(is_punctuation, Codes, CleanCodes),
    string_codes(Cleaned, CleanCodes).

is_punctuation(Code) :-
    char_code(Char, Code),
    member(Char, ['.', ',', '?', '!', ':', ';']).
