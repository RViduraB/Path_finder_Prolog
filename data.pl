% This is the Knowledge Base for the Western Province road network.
% It defines unidirectional edges (one-way roads), their distances, and their status (open/blocked).
% Primary Edges (unidirectional)
% Format: edge(start, end, distance, status).
edge(colombo, dehiwala, 13, open).
edge(colombo, nugegoda, 11, open).
edge(colombo, maharagama, 13, open).
edge(colombo, kottawa, 18, open).
edge(colombo, moratuwa, 18, open).
edge(colombo, ratmalana, 11, open).
edge(colombo, panadura, 28, blocked). % blocked
edge(colombo, negombo, 33, open).
edge(colombo, wattala, 12, open).
edge(colombo, kelaniya, 10, open).
edge(colombo, gampaha, 30, open).
edge(colombo, kadawatha, 20, open).

edge(dehiwala, mount_lavinia, 4, open).
edge(dehiwala, ratmalana, 7, open).


edge(mount_lavinia, moratuwa, 8, open).
edge(moratuwa, panadura, 12, open).


edge(ratmalana, moratuwa, 7, open).
edge(ratmalana, kalutara, 40, open).
edge(ratmalana, piliyandala, 22, open).


edge(nugegoda, maharagama, 6, open).
edge(nugegoda, kottawa, 8, blocked). % blocked
edge(nugegoda, kiribathgoda, 14, open).


edge(maharagama, kottawa, 6, open).
edge(maharagama, piliyandala, 14, open).


edge(kottawa, homagama, 8, open).
edge(kottawa, piliyandala, 10, open).
edge(kottawa, hanwella, 28, open).


edge(homagama, godagama, 6, open).


edge(godagama, hanwella, 8, open).


edge(panadura, kalutara, 22, open).
edge(panadura, piliyandala, 18, open).


edge(wattala, kelaniya, 8, open).
edge(wattala, gampaha, 28, open).
edge(wattala, negombo, 30, open).


edge(kelaniya, ragama, 12, blocked). % blocked
edge(kelaniya, kiribathgoda, 6, open).


edge(ragama, gampaha, 18, open).
edge(ragama, kadawatha, 12, open).
edge(ragama, ja_ela, 16, open).


edge(gampaha, ja_ela, 14, open).
edge(gampaha, minuwangoda, 20, open).
edge(gampaha, kadawatha, 10, open).


edge(ja_ela, negombo, 18, open).
edge(minuwangoda, negombo, 15, open).
edge(kadawatha, kiribathgoda, 8, open).
edge(kotahena, colombo, 3, open).

% Bidirectional Rule
% but only if the road is 'open'.
connected(X, Y, Z) :- edge(X, Y, Z, open).
connected(X, Y, Z) :- edge(Y, X, Z, open).
