:-consult('data.pl').
%importing the data knowledgebase file


%(BFS) Algorith

% The main predicate for the bfs
find_bfs_path(Start, End, Path) :-
    % Starting the search with a queue containing only the initial path.
    % The initial path is a list, that containing only the Start node.
    % The visited list is also initilizsed with started of bfs.
    bfs_helper([[Start]], [Start], End, Path).




% Base case for when a path is found but the head of the queue is the destination.
bfs_helper([[End|RestOfPath] | _], _, End, Path) :-
    %  we reverse it to get the correct order.
    reverse([End|RestOfPath], Path).

% Recursive case for explore the next level of the graph.
bfs_helper([[Current|PathTail] | Queue], Visited, End, Path) :-
    % Finding all neighbors of the current node that not visited yet.
    findall(
        NewNode,
        (
            % Finding a connected node from the `Current` node.
            % looking for open nodes.
            connected(Current, NewNode, _),
            % checking whether that the new node is not visited yet the visited list
            \+ member(NewNode, Visited)
        ),
        Neighbors
    ),
    
    % making paths from the current node to other unvisited neighbors nodes.
    % new found paths will be added to queue
    create_new_paths(Neighbors, [Current|PathTail], NewPaths),
    append(Queue, NewPaths, NewQueue),
    
    % Update the visited list with founded nodes
    append(Visited, Neighbors, NewVisited),
    
    % Recursively call the helper predicate
    bfs_helper(NewQueue, NewVisited, End, Path).
    
% Base case for the recursive call when the queue is empty.
bfs_helper([], _, _, []) :-
    write('Queue is empty. No path found.').

% Predicate of create new paths from a list of neighbors.
create_new_paths([], _, []).
create_new_paths([Neighbor|RestOfNeighbors], OldPath, [[Neighbor|OldPath]|RestOfNewPaths]) :-
    create_new_paths(RestOfNeighbors, OldPath, RestOfNewPaths).
