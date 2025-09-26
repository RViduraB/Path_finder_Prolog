:- consult('main.pl').
%import main file


%------------------------------------------
%welcome screen
%-----------------------------------------


% Main predicate for the welcome screen
welcome_screen :-
    nl,
    write('**************************************************************'),nl,
    write('***--------------------------------------------------------***'),nl,
    write('***                                                        ***'),nl,
    write('***                                                        ***'),nl,
    write('***                                                        ***'),nl,
    write('***                  >>>>-E-R-N-S- <<<<                    ***'),nl,
    write('*** --== ERNS: Emergency Response Navigational System ==-- ***'),nl,
    write('***                                                        ***'),nl,
    write('*** -------------------------------------------------------***'),nl,
    write('***                        Today                           ***'),nl,
    write('***                                                        ***'),nl,
    write('***            '),display_date_time,write('          ***'),nl,
    write('*** -------------------------------------------------------***'),nl,
    write('*** -------------------------------------------------------***'),nl,
    write('***       >>>USEER : test_user                             ***'),nl,
    write('***       >>>VEHICLE ID:xxxxxxxx                           ***'),nl,
    write('*** -------------------------------------------------------***'),nl,
    write('**************************************************************'),nl,
    write('***          Press  \'y\'               Main Program         ***'),nl,
    write('***          Press  \'q\'               Exit Program         ***'),nl,
    write('***              >>> Enter your choice<<<                  ***'),nl,
    write('***--------------------------------------------------------***'), nl,
    write('***                     version 1.0.0                      ***'), nl,
    write('***--------------------------------------------------------***'), nl,
    get_char(Choice), nl,
    handle_choice(Choice).



% get and display the current date and time
display_date_time :-
    get_time(TimeStamp),
    stamp_date_time(TimeStamp, DateTime, local),
    date_time_value(year, DateTime, Year),
    date_time_value(month, DateTime, Month),
    date_time_value(day, DateTime, Day),
    date_time_value(hour, DateTime, Hour),
    date_time_value(minute, DateTime, Minute),
    date_time_value(second, DateTime, Second),
    format('~w-~w-~w ~w:~w:~w', [Year, Month, Day, Hour, Minute, Second]).

% handle the user's choice
handle_choice('y') :-
    main.

handle_choice('q') :-
    write('Thank you for using ERNS. The program is now terminating.'), nl,
    halt.

handle_choice(_) :-
    write('Invalid option. Please press \'y\' or \'q\' to continue.'), nl,
    welcome_screen.