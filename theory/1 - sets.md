## Set Theory

### Sets

A *set* is a well-defined collection of objects. These objects are referred to as *elements* or *members* of the set. Elements of a set can be anything, including numbers, letters, people, cities, and even other sets. By convention, sets are usually denoted by capital letters and can be described or defined by listing its elements and surrounding the list by curly braces. For example, we can define the set A to be the first 5 prime numbers:

    A = {2, 3, 5, 7, 11}

If we want to indicate an object x is an element of the set A, we write x ∈ A. Conversely, the statement that x is not an element of A is written x ∉ A. By definition sets are completely defined by their elements. Therefore we can define the equivalence of two sets, written A = B, to be the case in which they have exactly the same elements. The order and repetition of elements does not matter.

    (A = B) ≡ (∀x ∈ A)(x ∈ B)

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

 a) Reflexive: A ⊆ A
 b) Anti-symmetric: If A ⊆ B and B ⊆ A then A = B
 c) Transitive: If A ⊆ B and B ⊆ C, then A ⊆ C

#### Significant Sets

 * ℕ  denotes the set of natural numbers, {0, 1, 2, …}
 * ℤ  denotes the set of integers, {…, −2, −1, 0, 1, 2, …}
 * ℚ  denotes the set of all rational numbers, {a/b: a, b ∈ ℤ and b ≠ 0}
 * ℝ  denotes set of real numbers, and the universal set for the other subsets in this list
 * ℝⁿ denotes the set of n-length tuples of real numbers, i.e. ℝ² = {(x, y): x, y ∈ ℝ}
 * ℂ  denotes the set of all complex numbers

Note that ℕ ⊂ ℤ ⊂ ℚ ⊂ ℝ ⊂ ℂ



##### References
 - Strongly based on Berkeley CS 70 Note 0
