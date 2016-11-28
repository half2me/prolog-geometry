:- include(vector).

line(P0, V) :-
  vec3(P0), vec3(V),
  V =\= 0-0-0.

lineFromTwoPoints(A, B, L) :-
  vec3(A), vec3(B),
  A =\= B,
  sub(B, A, V),
  L = line(A, V).

perpendicular(V1, V2) :-
  vec3(V1), vec3(V2),
  dot(V1, V2, 0).
perpendicular(line(_, V), Q) :-
  vec3(Q),
  perpendicular(V, Q).

isOnLine(line(PX-PY-PZ, VX-VY-VZ), QX-QY-QZ) :-
  (VX =:= 0 -> PX = QX; T is (PX - QX) / VX),
  (VY =:= 0 -> PY = QY; T is (PY - QY) / VY),
  (VZ =:= 0 -> PZ = QZ; T is (PZ - QZ) / VZ).

distance(line(P0, V), Q, D) :-
  vec3(Q),
  sub(Q, P0, PQ),
  cross(PQ, V, C),
  len(C, CL),
  len(V, VL),
  D is CL/VL, !.

% not working
distance(L1, L2, D) :-
  vec3(P), vec3(Q), sub(Q, P, PQ),
  len(PQ, D),
  perpendicular(L1, P), perpendicular(L2, Q),
  isOnLine(L1, Q), isOnLine(L2, P).
