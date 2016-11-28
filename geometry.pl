:- include(vector).

line(P0, V) :-
  vec3(P0), vec3(V),
  V =\= 0-0-0.

lineFromTwoPoints(A, B, L) :-
  vec3(A), vec3(B),
  A =\= B,
  sub(B, A, V),
  L = line(A, V).

isOnLine(line(PX-PY-PZ, VX-VY-VZ), QX-QY-QZ) :-
  (VX =:= 0 -> PX = QX; T is (PX - QX) / VX),
  (VY =:= 0 -> PY = QY; T is (PY - QY) / VY),
  (VZ =:= 0 -> PZ = QZ; T is (PZ - QZ) / VZ).
