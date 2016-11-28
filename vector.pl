vec3(X-Y-Z) :-
  number(X), number(Y), number(Z).

add(AX-AY-AZ, BX-BY-BZ, VX-VY-VZ) :-
  VX is AX + BX, VY is AY + BY, VZ is AZ + BZ.

sub(AX-AY-AZ, BX-BY-BZ, VX-VY-VZ) :-
  VX is AX - BX, VY is AY - BY, VZ is AZ - BZ.

dot(AX-AY-AZ, BX-BY-BZ, K) :-
  K is AX * BX + AY * BY + AZ * BZ.

cross(AX-AY-AZ, BX-BY-BZ, VX-VY-VZ) :-
  VX is AY * BZ - BY * AZ,
  VY is BX * AZ - AX * BZ,
  VZ is AX * BY - BX * AY.
