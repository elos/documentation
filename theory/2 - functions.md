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

We can notice that range(f) ⊆ T. If range(f) = T, then f is said to map S *onto* T (instead of just into T). This property is also known as a function being *surjective*

##### Injective Functions

A function f: S → T is said to be one-to-one, or injective, if distinct elements in the domain are mapped to distinct elements in the range. That is, if u, v ∈ S and u ≠ v then f(u) ≠ f(v). Equivalently, if f(u) = f(v) then u = v.

##### Bijections

Intuitively, a bijection is a function with the property that any output of the function can be uniquely mapped back to some input. More formally, a function f : A → B is a bijection iff for all b ∈ B, there exists a unique pre-image a ∈ A such that f(a) = b. This reduces to a function being both injective and surjective.

##### Inverse Functions

If f is a one-to-one function from S onto T, we can define inverse of f as the function f^{-1} from T onto S given by:

    f^{−1}(y) = x | f(x) = y; x ∈ S, y ∈ T

If we take the paradigm of the function as a set of ordered pairs, then:

    f^{−1} = {(y,x) ∈ T × S : (x,y) ∈ f}

Note that the facts that f is onto and one-to-one ensure that f^{-1} is a valid function from T onto S. We can say that the sets S and T are in one-to-one correspondence if there exists an injective function from S onto T.  We can also state the following theorem:

    f: A → A is a bijection ⇔ ∃ an inverse function g: A → A such that
    g(f(x)) = x and f(g(y)) = y, ∀x, y ∈ A

##### Restrictions

Suppose that f: S → T and that A ⊆ S. The function f_A: A → T defined by the rule f_A(x) = f(x) ∀x ∈ A is called, appropriately enough, the restriction of f to A. As a set of ordered pairs, note that f_A = {(x,y) ∈ f: x ∈ A}. The notion of a function as a set of ordered pairs is formally quite handy.

##### Identity

The identity function on a set S is the function from S onto S defined by I_S(x) = x ∀x ∈ S

#### Composition

We wrote earlier, f(g(x)). This is in fact a function composition. Suppose that g: R → S and f: S → T. The composition of f with g is the function f ○ g: R → T defined by:

    (f ○ g)(x) = f(g(x)), ∀ x ∈ R

##### Associativity of Composition

Suppose that h: R → S, g: S → T, and f: T → U. Then:

    f ○ (g ○ h) = (f ∘ g) ∘ h

Therefore we can write f ○ g ○ h without any ambiguity. Recall that we apply from right to left, f(g(h(x))). Apply h first, then g and then f.

##### Commuativity of Composition

On the other hand, composition is not commutitive. Depending on the domain and range of f and g, f ○ g might be defined and g ○ f might not. Even when both are defined, they may have different domains and co-domains, and so of course cannot be the same function. Even when both are defined and have the same domains and co-domains, the two compositions will not be the same in general.

##### Theorems

###### Injective and Surjective Compositions

Suppose that g: R → S and f: S → T.

 * If f and g are injective, then f ○ g is injective
 * If f and g are surjective then f ○ g is surjective

###### Identity Compositions

The identity function acts like an identity with respect to the operation of composition.

Suppose f: S → T:

 * f ○ I_S = f
 * I_T ○ f = f

###### Extendting Inverse

The inverse of a function is really the inverse with respect to composition. Suppose f is a bijection from S onto T. Then

 * f^{-1} ○ f = I_S
 * f ○ f^{-1} = I_T

###### Inverse of Composition

Suppose that g is a one-to-one function from R onto S and that f is a one-to-one function from S onto T. Then:

    (f ○ g)^{−1} = g^{−1} ○ f^{−1}





























