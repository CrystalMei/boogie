// RUN: %boogie -useArrayTheory "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

var {:layer 0,1} g: int;

procedure {:yield_invariant} {:layer 1} Inv();
requires g > 0;

procedure {:yields} {:layer 1} foo()
{
    yield;
    call A();
    yield;
}

procedure {:yields} {:layer 0} {:refines "atomic_A"} A();
procedure {:atomic} {:layer 1,1} atomic_A()
modifies g;
{
    g := g - 1;
}
