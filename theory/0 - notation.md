Notation
--------

### Universal Quantifier

If we want to quantify a statement over the all the elements of a set, we say something like:

    For all natural numbers n, n^2 ≥ n

In notation we may write:

    (∀n ∈ ℕ)(n^2 ≥ n)

A perhaps more compact and convenient expression. We used the "for all" quantifier: ∀.

### Existential Quantifier

If we want to quantify a statement for a single element in a set, we say something like:

    There exists a natural number n, such that n is prime.

Of course, there are in fact infinite primes. But here we claim only that there exists at least one.

    (∃n ∈ ℕ)(n is prime)

Again, simply in search of a more compact and clear expression. There is no disputing what we mean here. ∃ is the existential quantifier.

### Duality

"∃," is sort of the second half of the universal quantifier, "∀." Consider these two statements

    (∀n ∈ ℕ)(n^ + n + 41 is prime)

    (∃n ∈ ℕ)(n^2 + n + 41 is not prime)

Do you see that these two statements can not both be true? We will further explore this in propositional logic.

### Order

Also consider the if you wanted to use both quantifiers in one statement. Consider these two statements

 1. (∀x ∈ ℤ)(∃y ∈ ℤ) y > x
 2. (∃y ∈ ℤ)(∀x ∈ ℤ) y > x

Are these two the same statement? They are not! The first statement says that, given an integer, we can find a larger one. The second statment says something quite different: that there is alargest integer! The first statement is true, the second is not

Order matters.

References:
 - https://inst.eecs.berkeley.edu/~cs70/fa15/notes/n0.pdf
