:- use_module([database, rules, queries, input, output]).

my_write([]).
my_write([H|T]) :-
    ( \+is_list(H) ->
        match_name(H,O),
        writeln(O)
        ; my_write_aux(H), nl),
    my_write(T).

my_write_aux([]).
my_write_aux([H|T]) :-
    match_name(H,O), write(O),
    length(T,Len),
    (Len>0 -> write(', '); !),
    my_write_aux(T).

run :-
    nl, writeln('Please enter your request: '),
    % Use dashes (-) for multi-word names. Example: Michael-Jackson
    read_line_to_string(user_input, Raw),
    normalize_input(Raw, Words),
    % if the input matches a query, then execute the query, retrieve the result and write it
    ( match_input_query(Words, Query) ->
        (call(Query) ->
            arg(1, Query, Result),
            nl, writeln('Result: '), nl,
            (is_list(Result) -> my_write(Result), nl; writeln(Result), nl)
            ; nl, writeln('I understood your question, but couldn\'t find any matching results.'), nl
            )
        ; nl, writeln('I don\'t understand your question. Please check the spelling or try another phrasing.'), nl
    ),
    run.

:- initialization(run, main).