:- include(vector).

line(P0, V) :-
  vec3(P0), vec3(V),
  V =\= 0-0-0.

lineFromTwoPoints(A, B, L) :-
  vec3(A), vec3(B),
  A =\= B,
  sub(B, A, V),
  L = line(A, V).
