validate(1, X) :- validate(2, X).
validate(1, X) :- validate(4, X).
validate(1, X) :- validate(7, X).
validate(2, ['a'|Xs]) :- validate(2, Xs).
validate(2, ['b'|Xs]) :- validate(3, Xs).
validate(3, ['b'|Xs]) :- validate(3, Xs).
validate(3, []).
validate(4, ['a'|Xs]) :- validate(5, Xs).
validate(5, ['a'|Xs]) :- validate(5, Xs).
validate(5, ['b'|Xs]) :- validate(6, Xs).
validate(6, ['c'|Xs]) :- validate(6, Xs).
validate(6, []).
validate(7, ['e'|Xs]) :- validate(8, Xs).
validate(8, ['f'|Xs]) :- validate(9, Xs).
validate(9, []).

validate(X) :- validate(1, X).

% No predicado validate(+X), X deve ser do tipo [a, b, c]
