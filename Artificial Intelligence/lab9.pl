% 1. additional members
% Male members
male(john).
male(peter).
male(mike).
male(david).
male(steve).
male(maleman).
male(bob).


% Female members
female(mary).
female(linda).
female(susan).
female(anna).
female(kate).
female(femaleperson).
female(melvie).


% Parent relationships
parent(john, peter).
parent(mary, peter).
parent(john, anna).
parent(mary, anna).
parent(peter, mike).
parent(susan, mike).
parent(peter, kate).
parent(susan, kate).
parent(steve, david).
parent(linda, david).
parent(maleman, femaleperson).
parent(melvie, bob).
parent(john, melvie).


% Mother
mother(X, Y) :- female(X), parent(X, Y).

% Father
father(X, Y) :- male(X), parent(X, Y).

% Grandparent
grandparent(X, Y) :- parent(X, Z), parent(Z, Y).

% Sibling
sibling(X, Y) :- parent(P, X), parent(P, Y), X \= Y.

% Brother
brother(X, Y) :- male(X), sibling(X, Y).

% Sister
sister(X, Y) :- female(X), sibling(X, Y).

% Ancestor
ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).

% Descendant
descendant(X, Y) :- ancestor(Y, X).

% Uncle
uncle(X, Y) :- brother(X, Z), parent(Z, Y).

% Aunt
aunt(X, Y) :- sister(X, Z), parent(Z, Y).

% 2. cousin
cousin(X, Y) :- parent(P1, X), parent(P2, Y), sibling(P1, P2), X \= Y.

% 3. in-laws and step-siblings.
married(melvie, maleman).

married(X, Y) :- married(Y, X).
step_parent(X, Y) :- married(X, Z), parent(Z, Y), \+ parent(X, Y).
step_sibling(X, Y) :- step_parent(SP, X), parent(SP, Y), X \= Y.
step_sibling(X, Y) :- step_parent(SP, Y), parent(SP, X), X \= Y.
parent_in_law(X, Y) :- married(Y, Z), parent(X, Z).
sibling_in_law(X, Y) :- married(Y, Z), sibling(X, Z).
sibling_in_law(X, Y) :- married(X, Z), sibling(Z, Y).

% 4. nephews and nieces
nephew(X, Y) :- male(X), parent(P, X), sibling(P, Y).

niece(X, Y) :- female(X), parent(P, X), sibling(P, Y).

% 5. relationships?
relationship(X, Y, mother) :- mother(X, Y).
relationship(X, Y, father) :- father(X, Y).
relationship(X, Y, daughter) :- female(X), parent(Y, X).
relationship(X, Y, son) :- male(X), parent(Y, X).
relationship(X, Y, grandparent) :- grandparent(X, Y).
relationship(X, Y, grandchild) :- grandparent(Y, X).
relationship(X, Y, sibling) :- sibling(X, Y).
relationship(X, Y, brother) :- brother(X, Y).
relationship(X, Y, sister) :- sister(X, Y).
relationship(X, Y, uncle) :- uncle(X, Y).
relationship(X, Y, aunt) :- aunt(X, Y).
relationship(X, Y, cousin) :- cousin(X, Y).
relationship(X, Y, ancestor) :- ancestor(X, Y).
relationship(X, Y, descendant) :- descendant(X, Y).
relationship(X, Y, father_in_law) :- father_in_law(X, Y).
relationship(X, Y, mother_in_law) :- mother_in_law(X, Y).
relationship(X, Y, brother_in_law) :- brother_in_law(X, Y).
relationship(X, Y, sister_in_law) :- sister_in_law(X, Y).


% 6. married
is_married(X, Y) :- married(X, Y).

% 7. ancs
ancestor_third_gen(X, Y) :- parent(X, Y).
ancestor_third_gen(X, Y) :- parent(X, Z), parent(Z, Y).
ancestor_third_gen(X, Y) :- parent(X, Z1), parent(Z1, Z2), parent(Z2, Y).

% 8. first cousin
first_cousin(X, Y) :- parent(P1, X), parent(P2, Y), sibling(P1, P2), X \= Y.
