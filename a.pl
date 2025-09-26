:-consult('data.pl').
%importing data

% Heuristic values to Gampaha

h(gampaha, 0).
h(colombo, 20).
h(kelaniya, 12).
h(wattala, 8).
h(kadawatha, 5).
h(ragama, 9).
h(kiribathgoda, 10).
h(ja_ela, 7).
h(negombo, 10).
h(minuwangoda, 15).
h(kottawa, 25).
h(maharagama, 27).
h(nugegoda, 26).
h(dehiwala, 30).
h(moratuwa, 35).
h(ratmalana, 32).

%------------------------
%algorithm A
%-------------------------


astar(Start, Goal, Path, Cost) :-
    % take heuristic value for the Start city.
    % The "Goal" variable is only used to check if h(Start,Goal) exists
    h(Start, H0),
    % search with the initial node.
    astar_search([node(Start, [Start], 0, H0)], Goal, RevPath, Cost),
    % Reverse the path to et correct format of path
    reverse(RevPath, Path).

astar_search([node(State, Path, G, _)|_], State, Path, G) :-
    % Base case for if curren state is the goal
    !.

astar_search([node(State, Path, G, _)|Rest], Goal, FinalPath, Cost) :-
    % Find all possible next steps from the current state.
    findall(node(Next, [Next|Path], G1, F1),
            (   connected(State, Next, StepCost),
                \+ member(Next, Path),
                G1 is G + StepCost,
                % get the heuristic for the Next city.
                h(Next, H), 
                F1 is G1 + H
            ),
            Children),
    % Append the child nodes to the open list.
    append(Rest, Children, OpenList),
    % Sorting the list by the F-cost, the 4th element.
    sort(4, @=<, OpenList, Sorted),
    % Continue the search with the sorted list.
    astar_search(Sorted, Goal, FinalPath, Cost).