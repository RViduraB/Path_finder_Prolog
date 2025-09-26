:-consult('data.pl').

% =========================================================================
% Corrected and optimized Depth-First Search (DFS) Algorithm
% =========================================================================

% The main predicate to find all paths.
find_all_paths(Start, End, AllPaths) :-
    % The dfs_path  will find one path at a time.
    findall(Path, dfs_path(Start, End, Path), AllPaths).

% recursive predicate for DFS.
% finding a single path
dfs_path(Start, End, Path) :-
    % The initial call
    dfs_path_helper(Start, End, [Start], Path).

% Base case
dfs_path_helper(End, End, VisitedPath, Path) :-
    % everse the VisitedPath to get the correct order
    reverse(VisitedPath, Path).

% Recursive case: Explore the graph.
dfs_path_helper(Current, End, VisitedPath, Path) :-
    % Find a connected node 'Next' from 'Current'.
    connected(Current, Next, _),
    % Ensure the 'Next' node has not been visited in the current path to prevent cycles.
    \+ member(Next, VisitedPath),
    % Recursively call the helper predicate
    dfs_path_helper(Next, End, [Next|VisitedPath], Path).
