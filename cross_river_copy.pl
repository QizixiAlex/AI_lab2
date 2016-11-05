%[Policeman,Criminal,Father,Mother,Son,Son,Daughter,Daughter]
%from left shore to right shore
%[_,_,_,_,_,_,_,_]
diff(X,Y):-
    X \= Y.
cross(left,right).
cross(right,left).    
scold([_,_,X,Y,_,_,_,X]):-
    diff(X,Y).
scold([_,_,X,Y,Y,_,_,_]):-
    diff(X,Y).
scold([_,_,X,Y,_,_,X,_]):-
    diff(X,Y).
scold([_,_,X,Y,_,Y,_,_]):-
    diff(X,Y).
harm([X,Y,Y,_,_,_,_,_]):-
    diff(X,Y).
harm([X,Y,_,Y,_,_,_,_]):-
    diff(X,Y).
harm([X,Y,_,_,Y,_,_,_]):-
    diff(X,Y).
harm([X,Y,_,_,_,Y,_,_]):-
    diff(X,Y).
harm([X,Y,_,_,_,_,Y,_]):-
    diff(X,Y).
harm([X,Y,_,_,_,_,_,Y]):-
    diff(X,Y).
safe(X):-
    \+harm(X),
    \+scold(X).
otherside([A,B,C,D,E,F,G,H],[I,J,K,L,M,N,O,P]):-
    cross(A,I),
    cross(B,J),
    cross(C,K),
    cross(D,L),
    cross(E,M),
    cross(F,N),
    cross(G,O),
    cross(H,P).
transport([A,B,X,C,D,E,F,G],father_none,[A,B,Y,C,D,E,F,G],Boat):-
    X = Boat,
    cross(X,Y).
transport([A,B,C,X,D,E,F,G],mother_none,[A,B,C,Y,D,E,F,G],Boat):-
    X = Boat,
    cross(X,Y).
transport([X,A,B,C,D,E,F,G],policeman_none,[Y,A,B,C,D,E,F,G],Boat):-
    X = Boat,
    cross(X,Y).
transport([X,X,A,B,C,D,E,F],policeman_criminal,[Y,Y,A,B,C,D,E,F],Boat):-
    X = Boat,
    cross(X,Y).
transport([X,A,X,B,C,D,E,F],policeman_father,[Y,A,Y,B,C,D,E,F],Boat):-
    X = Boat,
    cross(X,Y).
transport([X,A,B,X,C,D,E,F],policeman_mother,[Y,A,B,Y,C,D,E,F],Boat):-
    X = Boat,
    cross(X,Y).
transport([X,A,B,C,X,D,E,F],policeman_son,[Y,A,B,C,Y,D,E,F],Boat):-
    X = Boat,
    cross(X,Y).
transport([X,A,B,C,D,X,E,F],policeman_son,[Y,A,B,C,D,Y,E,F],Boat):-
    X = Boat,
    cross(X,Y).
transport([X,A,B,C,D,E,X,F],policeman_daughter,[Y,A,B,C,D,E,Y,F],Boat):-
    X = Boat,
    cross(X,Y).
transport([X,A,B,C,D,E,F,Y],policeman_daughter,[Y,A,B,C,D,E,F,Y],Boat):-
    X = Boat,
    cross(X,Y).
transport([A,B,X,X,C,D,E,F],father_mother,[A,B,Y,Y,C,D,E,F],Boat):-
    X = Boat,
    cross(X,Y).
transport([A,B,X,C,X,D,E,F],father_son,[A,B,Y,C,Y,D,E,F],Boat):-
   X = Boat,
   cross(X,Y).
transport([A,B,C,X,D,E,X,F],mother_daughter,[A,B,C,Y,D,E,Y,F],Boat):-
    X = Boat,
    cross(X,Y).
transport([A,B,X,C,D,X,E,F],father_son,[A,B,Y,C,D,Y,E,F],Boat):-
    X = Boat,
    cross(X,Y).
transport([A,B,C,X,D,E,F,X],mother_daughter,[A,B,C,Y,D,E,F,Y],Boat):-
    X = Boat,
    cross(X,Y).
solution([right,right,right,right,right,right,right,right],[],right).
solution(Status,[Passenger|NextMoves],Boat):-
    transport(Status,Passenger,NextStatus,Boat),
    safe(NextStatus),
    otherside(NextStatus,Otherside),
    safe(Otherside),
    cross(Boat,NewBoat),
    solution(NextStatus,NextMoves,NewBoat).
