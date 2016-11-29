vec3(_-_-_).

mat4(
  _-_-_-_-
  _-_-_-_-
  _-_-_-_-
  _-_-_-_
).

add(AX-AY-AZ, BX-BY-BZ, VX-VY-VZ) :-
  VX is AX + BX, VY is AY + BY, VZ is AZ + BZ.

add(AX-AY-AZ, S, VX-VY-VZ) :-
  number(S),
  VX is AX+S, VY is AY+S, VZ is AZ+S.

sub(AX-AY-AZ, BX-BY-BZ, VX-VY-VZ) :-
  VX is AX - BX, VY is AY - BY, VZ is AZ - BZ.

sub(AX-AY-AZ, S, VX-VY-VZ) :-
  number(S),
  VX is AX-S, VY is AY-S, VZ is AZ-S.

multiply(X-Y-Z, S, VX-VY-VZ) :-
  number(S),
  VX is X*S, VY is Y*S, VZ is Z*S.

multiply(X-Y-Z, AX-BX-CX-DX-AY-BY-CY-DY-AZ-BZ-CZ-DZ-AW-BW-CW-DW, VX-VY-VZ) :-
  W is X*DX + Y*DY + Z*DZ + DW,
  VX is (X*AX + Y*AY + Z*AZ + AW) / W,
  VY is (X*BX + Y*BY + Z*BZ + BW) / W,
  VZ is (X*CX + Y*CY + Z*CZ + CW) / W.

/** This is taking waaay to long :)
multiply(
  A1-B1-C1-D1-
  E1-F1-G1-H1-
  I1-J1-K1-L1-
  M1-N1-O1-P1,
  A2-B2-C2-D2-
  E2-F2-G2-H2-
  I2-J2-K2-L2-
  M2-N2-O2-P2,
  A-B-C-D-
  E-F-G-H-
  I-J-K-L-
  M-N-O-P) :-
    A is A1*A2 + B1*E2 + C1*I2 + D1*M2,
    B is A1* + B1* + C1*I2 + D1*M2,
    C is A1* + B1* + C1*I2 + D1*M2,
    D is A1* + B1* + C1*I2 + D1*M2,

    E is E1* + F1* + C1*I2 + D1*M2,
    F is E1* + F1* + C1*I2 + D1*M2,
    G is E1* + F1* + C1*I2 + D1*M2,
    H is E1* + F1* + C1*I2 + D1*M2,

    I is A1* + B1* + C1*I2 + D1*M2,
    J is A1* + B1* + C1*I2 + D1*M2,
    K is A1* + B1* + C1*I2 + D1*M2,
    L is A1* + B1* + C1*I2 + D1*M2,

    M is A1* + B1* + C1*I2 + D1*M2,
    N is A1* + B1* + C1*I2 + D1*M2,
    O is A1* + B1* + C1*I2 + D1*M2,
    P is A1* + B1* + C1*I2 + D1*M2.
**/

divide(X-Y-Z, S, VX-VY-VZ) :-
  number(S),
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

angle(A, B, Phi) :-
  vec3(A), vec3(B),
  A =\= 0-0-0, B =\= 0-0-0,
  dot(A, B, D),
  len(A, AL), len(B, BL),
  Phi is acos(D/(AL*BL)).

rad2deg(Rad, Deg) :-
  Deg is Rad *180/3.1415926535.

deg2rad(Deg, Rad) :-
  Rad is Deg*3.1415926535/180.
