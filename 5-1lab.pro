DOMAINS
    tree = tr(integer, tree, tree); nil
PREDICATES
    derevo(tree)
    nondeterm max(tree, integer)
    max(integer, integer, integer)
    max3(integer, integer, integer, integer)
CLAUSES
    derevo(tr(X, L, R)) :-
        readint(X), X <> 0, derevo(L), derevo(R), !.
    derevo(nil) :- !.

    max(A, B, A) :- A >= B, !.
    max(_, B, B).

    max3(A, B, C, Max) :- max(A, B, MaxAB), max(MaxAB, C, Max).

    max(tr(N, nil, nil), N).
    max(tr(F, nil, R), Max) :- max(R, MaxR), max(F, MaxR, Max).
    max(tr(F, L, nil), Max) :- max(L, MaxL), max(F, MaxL, Max).
    max(tr(F, L, R), Max) :- max(L, MaxL), max(R, MaxR), max3(F, MaxL, MaxR, Max).
GOAL
    write("Введите дерево: "), nl,
    derevo(Tree), nl,
    max(Tree, Max),
    write("Максимальный элемент: "),nl, write(Max).

% Tree=tr(10,tr(5,tr(3,tr(1,nil,nil),tr(4,nil,nil)),tr(7,nil,nil)),tr(15,tr(12,nil,nil),tr(20,nil,nil)))