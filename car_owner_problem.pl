%person(name,car,mpg)
tells_truth(tito,ALL):-
    member(person(doc,_,20),ALL),
    member(person(george,_,X),ALL),
    member(person(jimmy,_,Y),ALL),
    X > Y.
lie(tito,ALL):-
    \+member(person(doc,_,20),ALL),
    member(person(george,_,X),ALL),
    member(person(jimmy,_,Y),ALL),
    X =< Y.
tells_truth(jimmy,ALL):-
    \+member(person(doc,toyota,_),ALL),
    member(person(tito,_,X),ALL),
    member(person(_,dodge,Y),ALL),
    X > Y.
lie(jimmy,ALL):-
    \+member(person(doc,toyota,_),ALL),
    member(person(tito,_,X),ALL),
    member(person(_,dodge,Y),ALL),
    X =< Y.
tells_truth(george,ALL):-
    member(person(_,ford,30),ALL),
    \+member(person(_,chevrolet,20),ALL).
lie(george,ALL):-
    \+member(person(_,ford,30),ALL),
    member(person(_,chevrolet,20),ALL).
tells_truth(doc,ALL):-
    member(person(doc,_,20),ALL).
lie(doc,ALL):-
    \+member(person(doc,_,20),ALL).
get_all(X,Y,A,B):-
    ALL = [person(tito,_,_),person(george,_,_),person(doc,_,_),person(jimmy,_,_)],
    member(person(X,_,20),ALL),
    member(person(Y,_,15),ALL),
    member(person(A,_,25),ALL),
    member(person(B,_,30),ALL),
    member(person(_,chevrolet,_),ALL),
    member(person(_,ford,_),ALL),
    member(person(_,toyota,_),ALL),
    member(person(_,dodge,_),ALL),
    tells_truth(A,ALL),
    tells_truth(B,ALL),
    lie(X,ALL),
    lie(Y,ALL).

    
