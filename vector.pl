vec3(_-_-_).

add(AX-AY-AZ, BX-BY-BZ, VX-VY-VZ) :-
  VX is AX + BX, VY is AY + BY, VZ is AZ + BZ.

sub(AX-AY-AZ, BX-BY-BZ, VX-VY-VZ) :-
  VX is AX - BX, VY is AY - BY, VZ is AZ - BZ.

multiply(X-Y-Z, S, VX-VY-VZ) :-
  VX is X*S, VY is Y*S, VZ is Z*S.

divide(X-Y-Z, S, VX-VY-VZ) :-
  VX is X/S, VY is Y/S, VZ is Z/S.

dot(AX-AY-AZ, BX-BY-BZ, K) :-
  K is AX * BX + AY * BY + AZ * BZ.

cross(AX-AY-AZ, BX-BY-BZ, VX-VY-VZ) :-
  VX is AY * BZ - BY * AZ,
  VY is BX * AZ - AX * BZ,
  VZ is AX * BY - BX * AY.

len(X-Y-Z, L) :-
  L is sqrt(X**2 + Y**2 + Z**2).

normal(V, N) :-
  vec3(V), vec3(N),
  len(V, L),
  divide(V, L, N).
