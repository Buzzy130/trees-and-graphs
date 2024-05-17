domains
 
btree = btree(integer, btree, btree); empty()
 
predicates
 
btree_Insert(integer, btree, integer, btree)
 
clauses
 
btree_Insert(Val, btree(Element,Left,Right), Element, btree(Val, btree(Element,Left,Right), empty())):-!.
btree_Insert(Val, btree(H, Left, Right), Element,btree(H, NewLeft, Right)) :- btree_Insert(Val,Left,Element,NewLeft),!.
btree_Insert(Val, btree(H, Left, Right), Element,btree(H, Left, NewRight)) :- btree_Insert(Val,Right,Element,NewRight).
 
goal
btree_Insert(7,btree(5, btree(3, empty(), empty()), btree(8, empty(), empty())),3,Ans).