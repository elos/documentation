## Set Theory

### Sets

A *set* is a well-defined collection of objects. These objects are referred to as *elements* or *members* of the set. Elements of a set can be anything, including numbers, letters, people, cities, and even other sets. By convention, sets are usually denoted by capital letters and can be described or defined by listing its elements and surrounding the list by curly braces For example, we can define the set A to be the first 5 prime numbers:

    A = {2, 3, 5, 7, 11}

If we want to indicate an object x is an element of the set A, we write x ∈ A. Conversely, the statement that x is not an element of A is written x ∉ A. By definition sets are completely defined by their elements. Therefore we can define the equivalence of two sets, written A = B, to be the case in which they have exactly the same elements. The order and repetition of elements does not matter.

    (A = B) ≡ (∀a ∈ A)(a ∈ B) and (∀b ∈ B)(b ∈ A)

    {1, 2, 3} = {3, 2, 1} = {3, 3, 2, 1}

More complicated sets are sometimes denoted by conditional tests of membership. For example, we can define the set of all rational numbers

    ℚ = {a/b | a, b are integers, b ≠ 0}

As the set of rational numbers is conventionally denoted ℚ, the set of integers is conventionally denoted ℤ. We can use our set notation to more concisely define the set of rational numbers

    ℚ = {a/b | a, b ∈ ℤ, b ≠ 0}

In English this is read as "The set of all fractions such that the numerator is an integer and the denominator is a non-zero integer."

#### Russell's Paradox

Our present definition of membership is a bit primitive. It's frailty can be demonstrated by Russell's Paradox, a construction first intruduced by the mathematician and philosopher Bertrand Russel.  It follows:

    Let R be the set of all sets A such that A ∉ R. Then R ∈ R if and only if R ∉ R.

    We can prove this by demonstrating a contradiction which follows from the definition of our set, R.

        (i) if R ∈ R, then by definition of R, R ∉ R
        (ii) if R ∉ R, then by definition R ∈ R

    The result, clearly, is that R is _not_ a well-defined set.

We can't be too cavaliering with our notion of membership. Under normal circumstances, the sets we are discussing are subsets of a well-defined, specified set S, known as a *universal set*. The use of a universal set precludes Russell's Paradox. Given a universal set S, and a predicate p(x) defined on S ∀x, then {x ∈ S: p(x)} is a valid subset of x. Defining a set in this way, as we did with the rational numbers, ℚ, is known as _predicate form_. Listing the elements is known, unsurprisingly as _list form_.

### Cardinality

We can also talk about the size of a set, or its *cardinality*. Suppose A = {1, 2, 3, 4}. The cardinality of A, denoted |A|, is 4. Indeed the cardinality of a set can be zero. This is true for only one set, the empty set. The empty set is denoted ∅.

    |∅| = 0

A set can also have infinite size, if it has an infinite number of elements. The set of integers, ℤ, is one example.

### Subsets and Proper Subsets

If every element in A is an element in B, then we say A is a *subset* of B, denoted A ⊆ B. Equivalently, we can write B ⊇ A, B is a superset of A. If B contains an elements not in A, we say that A is *proper subset* of B, written A ⊂ B.

    A = {1, 2, 3}
    B = C = {1, 2, 3, 4, 5}

    A ⊂ B and A ⊆ B

    but C ⊆ B, not a proper subset.

Generally, we call A is a proper subset of B only if A ⊂ B and A ≠ ∅. If A can be the empty set, then we say strict subset.

#### Basic Properties

 * The empty set, denoted by {} or ∅, is a _proper subset_ of any non-empty set A: ∅ ⊂ A
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

    A ∪ B = {x ∈ S:x ∈ A or x ∈ B}

Note:
 * A ∪ B = B ∪ A
 * A ∪ ∅ = A.

Example: union of the positive odd integers and the positive integers is the set of all positive integers (often denoted ℤ⁺)

#### Intersection

The intersection of the sets A and B is the set of all elements in both A and B.

    A ∩ B = {x ∈ S:x ∈ A and x ∈ B}

Two sets are said to be *disjoint* if A ∩ B = ∅.

Note:
 * A ∩ B = B ∩ A
 * A ∩ ∅ = ∅

Example: The intersection of the integers, ℤ, and the set {0}, is the set {0}. This illustrates the property that if A ⊆ B, then A ∩ B = A.

#### Complement

The complement of A is the set of elements that are not in A:

    A^c ={x ∈ S: x ∉ A}

#### Set Difference (Relative Complement)

The set difference of B and A is the set of elements that are in B but not in A:

    B ∖ A = {x ∈ S:x ∈ B and x ∉ A}

Union, Intersection and Set Difference are binary operations. Complement is a unary operation.

Note:
 * A \ A = ∅
 * A \ ∅ = A
 * ∅ \ A = ∅

Example: ℝ \ ℚ = set of irrational numbers. It can be useful to think of B \ A as B without A. 

#### Cartesian Product (Cross Product)

The cartesian product of the sets A and B is the set of all pairs whose first component is an element of A and whose second component is an element of B. It is a binary operator.

    A × B = = {(a,b) | a ∈ A,b ∈ B}


Example: If A = {1,2,3} and B = {u, v}, then A × B = {(1,u),(1, v),(2,u),(2, v),(3,u),(3, v)}

A deck of cards can be defined: D = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, j, q, k} × {♣, ♢ , ♡, ♠}

#### Power Set

The power set of a A is the set of all subsets of A:

    ℘(A) = {B| B ⊆ A}

Example: if S = {1,2,3}, then the power set of S is: ℘(S) = {{},{1},{2},{3},{1,2},{1,3},{2,3},{1,2,3}}

Note:
 * If |A| = k, then |℘(A)| = 2^k

### Laws

 These are a collection of axiomatically verifiable statements, some of which we have already seen. All can be verified with ease and this should be treated more as a reference.

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

##### References
 - Strongly based on Berkeley CS 70 Note 0
