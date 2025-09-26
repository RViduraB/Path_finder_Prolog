:- consult('data.pl').
:- consult('dfs.pl').
:- consult('bfs.pl').
:- consult('cost.pl').
%importing all the necessary data



%---------------------------------------------
%main program
%--------------------------------------------


% Main predicate to start the program.
main :-
    %asking city 1
    %take the string
    %asking city 2
    %take the city 2 response
    %execute processs command
    write('>>> Enter the starting location: '),
    read(Start), nl,
    write('>>> Enter the destination location: '),
    read(Destination), nl,
    write('******************************************************'), nl,
    write('*** For the shortest path in terms of steps: Press #1'), nl,
    write('*** For all possible paths: Press #2'), nl,
    write('******************************************************'), nl,
    write('>>> Enter your choice: '),
    read(Choice), nl,
    process_command(Choice, Start, Destination).


% Process the user's command based on their choice.
process_command(1, Start, Destination) :-
    write('Finding the shortest path by steps...'), nl,
    % Use the  BFS predicate
    (   find_bfs_path(Start, Destination, Route) ->
        write('Shortest path (by steps): '), write(Route), nl,
        path_cost(Route, Cost),
        write('Path cost (km): '), write(Cost), nl
    ;   write('No path found between '), write(Start), write(' and '), write(Destination), write('.'), nl
    ).

process_command(2, Start, Destination) :-
    write('Finding all possible paths and their costs...'), nl,
    % Use the DFS predicate to find all paths.
    find_all_paths(Start, Destination, Paths),
    (   Paths = [] ->
        write('No paths found.'), nl
    ;
        % Display each path and its cost.
        write('All possible paths:'), nl,
        display_paths_with_cost(Paths)
    ).

% Handling invalid choices
process_command(_, _, _) :-
    write('Invalid choice. Please select either 1 or 2.'), nl.

% iterate through the list of paths and show each one with its cost.
display_paths_with_cost([]) :- !.
display_paths_with_cost([Path|Rest]) :-
    path_cost(Path, Cost),
    write('   - Path: '), write(Path),
    write(', Cost: '), write(Cost), write(' km'), nl,
    display_paths_with_cost(Rest).