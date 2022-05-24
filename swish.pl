aresta(a,b).
aresta(a,c).
aresta(a,d).

aresta(b,a).
aresta(b,f).

aresta(c,a).
aresta(c,e).

aresta(d,a).
aresta(d,b).
aresta(d,g).

aresta(e,c).
aresta(e,i).
aresta(e,h).

aresta(f,b).
aresta(f,h).

aresta(g,d).
aresta(g,l).

aresta(h,e).
aresta(h,f).
aresta(h,k).

aresta(i,e).
aresta(i,j).
aresta(i,m).

aresta(j,i).
aresta(j,k).
aresta(j,n).

aresta(k,j).
aresta(k,h).

aresta(l,g).
aresta(l,m).
aresta(l,q).

aresta(m,i).
aresta(m,l).
aresta(m,o).
aresta(m,s).

aresta(n,j).
aresta(n,q).

aresta(o,m).
aresta(o,r).
aresta(o,p).

aresta(p,o).
aresta(p,t).
aresta(p,q).

aresta(q,n).
aresta(q,l).
aresta(q,t).

aresta(r,o).
aresta(r,s).

aresta(s,m).
aresta(s,r).
aresta(s,t).

aresta(t,s).
aresta(t,p).
aresta(t,q).

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