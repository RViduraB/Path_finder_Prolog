:-consult('data.pl').

%--------------------------------------------
% Path cost (sum of distances along a path)
%--------------------------------------------

% path_cost/2: Calculates the total cost of a given path.
% It sums up the weights (distances) of all edges in the path.

% this is the Base case:- The cost of a path with only one node (or an empty path) is 0.

path_cost([_], 0).
path_cost([], 0).

%this is Recursive case: Calculate the cost for a given path.

path_cost([Start, End | RestOfPath], TotalCost) :-
    % checking the distance of the nodes from Start to End.
    % we using 3 parameters to handles both unidirectional and bidirectional roads with our knwoledgebase
    % The 'connected/3' function now checks for 'open' status in data.pl.
    connected(Start, End, Weight),
    % calculate the cost of the rest of the path, starting from 'End'.
    path_cost([End | RestOfPath], RestCost),
    % The total cost is the distance of the current edge plus the cost of the rest of the path.
    TotalCost is Weight + RestCost.
