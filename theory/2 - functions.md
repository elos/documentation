## Function Theory

### Functions

Functions play a central role understanding elos as they do in every branch of mathematics. We will offer some formal definitions and properties here.

#### Definition

Suppose that S and T are sets. Formally, a function *f* from S to T is a subset of the product set S × T with the property that ∀ x ∈ S, ∃ a unique y ∈ T such that (x, y) ∈ *f*. We then write, as you have likely often seen it, y = f(x).

Indeed it is useful to think of a function as simply a logical pairing, or association. And less formally, a function f from S to T is really just a "rule," or "procedure," or "algorithm" which assigns to each x ∈ S a unique f(x) ∈  T.

We denote f as a function from S to T as:

    f: S → T

The set S is the domain of f and the set T is codomain or range "space" of f. The actual _range_ of f is defined as the set of function values:

    range(f) = {y ∈ T | y = f(x) for some x ∈ S}

We can notice that range(f) ⊆ T. If range(f) = T, then f is said to map S *onto* T (instead of just into T).






