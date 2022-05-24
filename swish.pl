aresta(1, 2).
aresta(1, 3).
aresta(1, 4).
aresta(2, 1).
aresta(2, 5).
aresta(3, 1).
aresta(3, 4).
aresta(3, 5).
aresta(3, 6).
aresta(4, 1).
aresta(4, 3).
aresta(4, 6).
aresta(4, 7).
aresta(5, 2).
aresta(5, 3).
aresta(5, 8).
aresta(6, 3).
aresta(6, 4).
aresta(6, 8).
aresta(7, 4).
aresta(7, 8).
aresta(7, 9).
aresta(8, 5).
aresta(8, 6).
aresta(8, 7).
aresta(8, 10).
aresta(9, 7).
aresta(9, 10).
aresta(10, 8).
aresta(10, 9).

%O caminho entre A e B é obtido se A e B forem conectados
conectado(X,Y) :- aresta(X,Y) ; aresta(Y,X).

menor([]).
menorCaminho(Inicio, Fim, Path):- 
    setof(Path, path(Inicio,Fim,Path), Set),
    sortArray(Set, []).


path(A,B,Path) :- ligacao(A,B,[A],Q), reverse(Q,Path).
ligacao(A,B,P,[B|P]) :- conectado(A,B).
ligacao(A,B,Visited,Path) :-
    conectado(A,C),
    not(C == B),
    not(member(C,Visited)),
    ligacao(C,B,[C|Visited],Path).

sortArray([], Path):- write("Caminho mais curto: "), write(Path).
sortArray([Head|Tail], Path):-
    (Path == [], sortArray(Tail, Head));
    comprimento(Path, Pth_Length),
    comprimento(Head, Length),
    (Length < Pth_Length, sortArray(Tail, Head));
    sortArray(Tail, Path).

comprimento(List,Length) :- comprimento(List,0,Length).

comprimento([],Length,Length).
comprimento([_|Tail],Acumulator,Length) :-
    NewAc is Acumulator + 1, 
    comprimento(Tail,NewAc,Length).

%?- menorCaminho(5, 10 ,CAMINHO).
