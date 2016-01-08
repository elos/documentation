## Set Theory

### Sets

A *set* is a well-defined collection of objects. These objects are referred to as *elements* or *members* of the set. Elements of a set can be anything, including numbers, letters, people, cities, and even other sets. By convention, sets are usually denoted by capital letters and can be described or defined by listing their elements and surrounding the list by curly braces. For example, we can define the set `A` to be the first 5 prime numbers:

    A = {2, 3, 5, 7, 11}

#### Notation

If we want to indicate an object `x` is an element of the set `A`, we write `x ∈ A`. Conversely, the statement that `x` is not an element of `A` is written `x ∉ A`.

##### Universal Quantifier

If we want to quantify a statement over the all the elements of a set, we say something like:

    For all natural numbers n, n^2 ≥ n

In notation we may write:

    (∀n ∈ ℕ)(n^2 ≥ n)

We used the "for all" quantifier, `∀`, which allowed us to form a more compact and _precise_ expression. We also introduced a conventional notation `ℕ`, which designates the set of natural numbers. We used parentheses to indicate the grouping of the statements.

##### Existential Quantifier

If we want to quantify a statement for a single element in a set, we say something like:

    There exists a natural number n, such that n is prime.

Of course, there are in fact infinite primes. But here we claim only that there exists at least one.

    (∃n ∈ ℕ)(n is prime)

We used the existential quantifier, `∃` to form a more compact and precise expression. It would be difficult to dispute what we intended to say with the latter statement. We are developing a notation for constructing _precise_ statements.

##### Duality

"∃," is sort of the second half of the universal quantifier, "∀." Consider these two statements

    (∀n ∈ ℕ)(n^2 + n + 41 is prime)

    (∃n ∈ ℕ)(n^2 + n + 41 is not prime)

Do you see that these two statements can not both be true? If there existed a natural number such that `n^2 + n + 41` is not prime, then the first statement would be false because `n^2 + n + 41` would not be prime for _all_ natural numbers The universal quantifier is commonly used for proving that something is true _universally_, whereas the existential quantifier is used for stating that a counterexample _exists_. 

##### Order

We can use both quantifiers in a single statement. Consider these two statements, in which ℤ denotes the set of all integers:

    (∀x ∈ ℤ)(∃y ∈ ℤ) y > x
    
    (∃y ∈ ℤ)(∀x ∈ ℤ) y > x

Are these two the identical? They are not! The first statement says that, given an integer, we can find a larger one. The second statment says something quite different: that there exists a largest integer! The first statement is true, the second is not.

We observe that the order of the quantifiers affects the nature of the statement.

#### Equality

By definition sets are completely defined by their elements. Therefore we can define the equivalence of two sets, written A = B, to be the case in which they have exactly the same elements. The order and repetition of elements does not matter.

    (A = B) ≡ (∀a ∈ A)(a ∈ B) and (∀b ∈ B)(b ∈ A)

    {1, 2, 3} = {3, 2, 1} = {3, 3, 2, 1}

More complicated sets are sometimes denoted by conditional tests of membership. For example, we can define the set of all rational numbers

    ℚ = {a/b | a, b are integers, b ≠ 0}

As the set of rational numbers is conventionally denoted ℚ, the set of integers is conventionally denoted ℤ. We can use our set notation to more concisely define the set of rational numbers

    ℚ = {a/b | a, b ∈ ℤ, b ≠ 0}

In English this is read as "The set of all fractions such that the numerator is an integer and the denominator is a non-zero integer."

#### Russell's Paradox

Our present definition of membership is a bit primitive. It's frailty can be demonstrated by Russell's Paradox, a construction first introducted by the mathematician and philosopher Bertrand Russel.  It follows:

    Let R be the set of all sets A such that A ∉ R. Then R ∈ R if and only if R ∉ R.

We can prove this by demonstrating a contradiction which follows from the definition of our set, R.

        (i) if R ∈ R, then by definition of R, R ∉ R
        (ii) if R ∉ R, then by definition R ∈ R

The result, clearly, is that R is _not_ a well-defined set.

We can not be too cavaliering with our notion of membership. Under normal circumstances, the sets we are discussing are subsets of a well-defined, specified set S, known as a *universal set*. The use of a universal set precludes Russell's Paradox. Given a universal set S, and a *predicate* p(x) defined on S, then {x ∈ S: p(x)} is a valid subset of x.

Defining a set in this way, as we did with the rational numbers, ℚ, is known as _predicate form_. Defining a set by listing the elements is known, unsurprisingly, as _list form_.

### Cardinality

We can also talk about the size of a set, or its *cardinality*. Suppose A = {1, 2, 3, 4}. The cardinality of A, denoted |A|, is 4. Indeed the cardinality of a set can be zero. This is true for only one set, the empty set. The empty set is denoted ∅.

    |∅| = 0

A set can also have infinite size, if it has an infinite number of elements. The set of integers, ℤ, is one example.

    |ℤ| = ∞

### Subsets and Proper Subsets

If every element in A is an element in B, then we say A is a *subset* of B, denoted A ⊆ B. Equivalently, we can write B ⊇ A, B is a superset of A. If B contains any elements not in A, we say that A is *proper subset* of B, written A ⊂ B.

    A = {1, 2, 3}
    B = C = {1, 2, 3, 4, 5}

    A ⊂ B (which does imply that A ⊆ B)

    C ⊆ B (not a proper subset)

Generally, we call A a proper subset of B only if A ⊂ B and A ≠ ∅. If A can be the empty set, then we use the term *strict* subset. That is to say, proper subset implies A ≠ ∅. This is a fuzzy convention, though. Generally, defer to the context of the matter at hand.

#### Basic Properties

 * The empty set, denoted by {} or ∅, is a _strict subset_ of any non-empty set A: ∅ ⊂ A, A ≠ ∅
 * The empty set is a _subset_ of every set B: ∅ ⊆ B
 * Every set A is a subset of itself: A ⊆ A

##### As a Partial Order

Suppose that A, B and C are subsets of a set S. The subset relation is a partial order on the collection of subsets of S. That is, the subset operator is:

 1. Reflexive: A ⊆ A
 2. Anti-symmetric: If A ⊆ B and B ⊆ A then A = B
 3. Transitive: If A ⊆ B and B ⊆ C, then A ⊆ C

#### Significant Sets

 * ℕ  denotes the set of natural numbers, {0, 1, 2, …}
 * ℤ  denotes the set of integers, {…, −2, −1, 0, 1, 2, …}
 * ℚ  denotes the set of all rational numbers, {a/b: a, b ∈ ℤ and b ≠ 0}
 * ℝ  denotes set of real numbers, and the universal set for the other subsets in this list
 * ℝⁿ denotes the set of n-length tuples of real numbers, i.e. ℝ² = {(x, y): x, y ∈ ℝ}
 * ℂ  denotes the set of all complex numbers

Note that ℕ ⊂ ℤ ⊂ ℚ ⊂ ℝ ⊂ ℂ

### Operations

#### Union

The union of the sets A and B is the set of all elements which are in either A or B or both.

    A ∪ B = {x ∈ S : x ∈ A or x ∈ B}

Note:
 * A ∪ B = B ∪ A
 * A ∪ ∅ = A

Example: The union of the positive odd integers and the positive integers is the set of all positive integers (often denoted ℤ⁺).

#### Intersection

The intersection of the sets A and B is the set of all elements in both A and B.

    A ∩ B = {x ∈ S : x ∈ A and x ∈ B}

Two sets are said to be *disjoint* if A ∩ B = ∅.

Note:
 * A ∩ B = B ∩ A
 * A ∩ ∅ = ∅

Example: The intersection of the integers, ℤ, and the set {0}, is the set {0}. This illustrates the property that if A ⊆ B, then A ∩ B = A.

#### Complement

The complement of A is the set of elements that are not in A, relative to the universal set S:

    A^c = {x ∈ S : x ∉ A}

#### Set Difference (Relative Complement)

The set difference of B and A is the set of elements that are in B but not in A. The set is a generalization of the complement.

    B ∖ A = {x ∈ S : x ∈ B and x ∉ A}

Union, intersection and set difference are binary operations. Complement is a unary operation -- assuming a well-defined universal set.

Note:
 * A \ A = ∅
 * A \ ∅ = A
 * ∅ \ A = ∅

Example: ℝ \ ℚ  = set of irrational numbers. It can be useful to think of B \ A as B without A.

#### Cartesian Product (Cross Product)

The cartesian product of the sets A and B is the set of all pairs whose first component is an element of A and whose second component is an element of B. It is a binary operator.

    A × B = = {(a,b) : a ∈ A , b ∈ B}

Example: If A = {1,2,3} and B = {u, v}, then A × B = {(1,u),(1, v),(2,u),(2, v),(3,u),(3, v)}

A deck of cards can be defined: D = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, j, q, k} × {♣, ♢ , ♡, ♠}

#### Power Set

The power set of a A is the set of all subsets of A:

    𝒫(A) = {B| B ⊆ A}

Example: if S = {1,2,3}, then the power set of S is: 𝒫(S) = {{},{1},{2},{3},{1,2},{1,3},{2,3},{1,2,3}}

Note:
 * If |A| = k, then |𝒫(A)| = 2^k

### Laws

These are a collection of statements which follow directly from our axioms. All can be verified with ease and this should be treated more as a reference.

A, B, and C are subsets of a universal set S

#### Identity Laws

 1. A ∪ ∅ = A
 2. A ∩ S = A

#### Idempotent Laws

 1. A ∪ A = A
 2. A ∩ A = A

#### Complement Laws

 1. A ∪ A^c = S
 2. A ∩ A^c = ∅
 3. (A^c)^c = A

#### Commutative Laws

 1. A ∪ B = B ∪ A
 2. A ∩ B = B ∩ A

#### Associative Laws

 1. A ∪ (B ∪ C) = (A ∪ B) ∪ C
 2. A ∩ (B ∩ C) = (A ∩ B) ∩ C

Thus, we can write A ∪ B ∪ C without ambiguity. Note that x is an element of this set if and only if x is an element of at least one of the three given sets. Similarly, we can write A ∩ B ∩ C without ambiguity. Note that x is an element of this set if and only if x is an element of all three of the given sets.

#### Distributive Laws

 1. A ∪ (B ∩ C) = (A ∪ B) ∩ (A ∪ C)
 2. A ∩ (B ∪ C) = (A ∩ B) ∪ (A ∩ C)

Takeaway: You _can_ distribute.

#### DeMorgan's Laws

 1. (A ∪ B)^c = A^c ∩ B^c
 2. (A ∩ B)^c = A^c ∪ B^c

Takeaway: Distribute and flip

##### Cool Equivalence

The following statements are equivalent.

 1. A ⊆ B     |  A is a subset of B. Every element in A is in B.
 2. B^c ⊆ A^c |  The set of elements A doesn't contain is bigger than those B doesn't contain. (B contains more)
 3. A ∪ B = B |  The union of A and B is just B, because A is _in_ B
 4. A ∩ B = A |  The intersect of A and B is just A, everything in A is in B.
 5. A ∖ B = ∅ |  There are no elements in A that B doesn't contain

#### Generalzing Union and Intersection

The operations of union and intersection can be extended to a finite or even an infinite collection of sets.

##### Definitions

Suppose that 𝒜 is a nonempty collection of subsets of a universal set S. In some cases, the subsets in 𝒜 may be naturally indexed by a nonempty index set I, so that 𝒜 = {A_i : i ∈ I}. The union of the collection of sets 𝒜 is the set obtained by combining the elements of the sets in 𝒜. We define the union over the sets of 𝒜:

    ⋃ 𝒜 = { x ∈ S : x ∈ A for some A ∈ 𝒜  }

If 𝒜  = {A_i : i ∈ I}, so that the collection of sets in indexed, we can use the notation:

   ∪_{i ∈ I} A_i = { x ∈ S : x ∈ A_i for some i ∈ I}

Likewise the interesection of the collection of sets 𝒜 is the set of elements common to all of the sets in 𝒜:

    ∩ 𝒜 = { x ∈ S : x ∈ A for all A ∈ 𝒜  }

If 𝒜  = {A_i : i ∈ I}, so that the collection of sets in indexed, we can use the notation:

    ∩_{i ∈ I} A_i = {x ∈ S : x ∈ A_i for all i ∈ I}

Often the index set is a subset of ℕ. In this case it may make most sense to write lower and upper bounds on the union, as in the case of summation.

#### Pairwise Disjoint

A collection of sets 𝒜 is pairwise disjoint if the intersection of any two sets in the collection is empty:

    (A ∩ B = ∅)  ∀A, B ∈ 𝒜, A ≠ B.

The collection of sets 𝒜 is said to *parition* a set B if the collection 𝒜 is pairwise disjoint and the union over all the sets in 𝒜 is B.

### Relations

#### Definitions

Suppose that S and T are sets. A *relation* from S to T is a subset of the product set S × T. As the name suggests, a relation R from S into T is supposed to define a relationship between the elements of S and the elements of T. Therefore we use a more suggestive notation of *x R y*, when (x, y) ∈ R, R ∈ S × T.

We define the domain of R as the set of first coordinates and the range of R as the set of second coordinates:

    domain(R) = {x ∈ S : (x, y) ∈ R for some y ∈ T}
     range(R) = {y ∈ T : (x, y) ∈ R for some x ∈ S}

Recall that these are projections (which I have to write about somewhere earlier in this document ;); the domain of R is the projection of R onto S and the range of R is the projection of R onto T. A relation froma set S to itself is said to b a erlation *on* S. Ergo, it would be defined as a subset of S × S.

#### Basic Examples

Suppose that S is a set and recall that 𝒫(S) denotes the power set of S, the collection of all subsets of S.

the membership relation ∈ from S to 𝒫(S) is perhaps the most important and basic relationship in mathematics. Indeed, for us, it's a primitive (undefined) relationship -- given x and A, we assume we understand the meaning of the statement x ∈ A.

Another basic primitive relation is the equality relation = on a given set of objects S. That is, given two objects x and y, we assume that we understand the meaning of the statement x = y.

Other basic relations we have almost certainly encountered:

 1. The subset relation ⊆ on 𝒫(S)
 2. The order relation ≤ on ℝ

In fact these two relations belong to a special class of relations known as partial orders, which we cover later on.Note that a function f from S into T is a special type of relation. to compare the two types of notation (relation and function), note that xfy means that y = f(x).

##### References
 - https://inst.eecs.berkeley.edu/~cs70/fa15/notes/n0.pdf
 - http://www.math.uah.edu/stat/foundations/Sets.html
