Logic & Proofs
---------------

### Propositional Logic

We begin with the language of _propositional logic_. It gives us a clean formalism in which to write and prove mathematical statements. Specifically, it treats statements in a black or white fashion, as either true or false. There are no "shades of gray," no ambiguity. The formal name for this "black and white" behavior is the *law of the excluded middle*, which states that either a statement or it's negation must be true.

#### Proposition

A proposition is a statement which is true or false. It is the most basic construct in our language of _propsitional logic_. Some examples of propositions:

 1. This text is black
 2. 1 + 1 = 5
 3. There are fish in the pond

Notice how each of these propositions is well-defined. We can quickly determine whether any of these statements are true or false, primarily because we understand well the parameters on which they are conditioned. Said another way, these propositions are unabimbiguous because they are simple to check. We know the definition of the addition operator, "+", and therefore can verify whether `1 + 1 = 5`. It does not. Therefore we say that the proposition is false.

An example of a statement which is not a proposition:

 1. Johnny Depp is a good actor

Specifically, what does it mean to be 'good.' This is hard to define, and moreover, perhaps can not be unanimously decided. Therefore we say that it is ill-defined and not a proposition.

#### Connectives

Given a proposition *P* and another proposition, say, *Q*, we can combine them in a number of ways to obtain more interesting propositions. We introduce three logical connectives, namely AND, OR and NOT, to achieve this aim.

 1. **Conjunction (AND)**: P ∧ Q (i.e., "P and Q"). True only when both *P* and *Q* are true.
 2. **Disjunction (OR)**:  P ∨ Q (i.e., "P or Q"). True when at least one of *P* and *Q* is true.
 3. **Negation (NOT)**: ¬P (i.e., "not P"). True when *P* is false.

Suppose that P(n) = "n is odd". ¬P(n) would then be "n is not odd". We may see that this is equivalent to saying that "n is even". Now let *P* denote the proposition "10² = 100" and Q denote "4 + 5 = 49".

 * P ∧ Q is False
 * P ∨ Q is True
 *  ¬Q   is True

##### Tautology & Contradiction

We call a statement which is always true, regardless of the truth of its variables, a **tautology**. For example, consider *P* ∨ ¬*P*.  In contrast, a statement which is always false is a **contradiction**; and example is the statement *P* ∧ ¬*P*.

#### Truth Tables

By using these connectives to combine propositions, we can obtain complicated statements such as:

    ¬((P₁ ∨ P₂) ∧ ¬(P₁ ∨ P₃)) ∨ ((P₂ ∨ P₃)∧ ¬(P₄ ∨ P₅)).

However, such statements quickly become difficult to digest. Thankfully, there is a simple equivalent representation of propositions called a truth table. A truth table is exactly what you might expect: For a given proposition, we simply list all the possible input values for its variables, along with the outputs given those inputs (The order does not matter). To illustrate, here are the truth tables for conjunction (AND) and negation (¬), where *T* and *F* stand for true and false, respectively.

###### Negation:

| P | ¬P |
| - | -- |
| T | F  |
| F | T  |

###### Conjunction:

| P | Q | P ∧ Q |
| - | - | ----- |
| T | T |   T   |
| T | F |   F   |
| F | T |   F   |
| F | F |   F   |

These tables likely confirm our intuition for these two connectives. Can you write the truth table for disjunction (OR)?

#### Implication

So far we have introduced the connectives, AND, OR, and NOT. Now that we're warmed up, let us introduce a fourth connective, which is a bit trickier but possibly the most important.

 * **Implication (IMPLIES, ⇒ )**: *P* ⇒ *Q* (i.e., "P implies Q"). This is the same as "If P, then Q."

Intuitively, an implication is only false when *P* is true and *Q* is false. Which is what we want. Let P denote the proposition "chemical waste is dumped into the river" and D denote the proposition "fish die".

If P, then Q says If *chemical waste is dumped into the river*, then *fish die*. Recall our truth table. There are four possible combinations for the truthiness of this statement. If P, is false, then the implication is vaccuously true. Our statement says nothing about scenario in which there is no chemical waste! 

If P is true, and D is true, then our implication holds! Of course, this is not equivalent to the statement "The chemical waste is the factor killing fish," but still does hold; chemical waste is sufficient for fish to be dying, even if it is just a correlation. 

If, however, P is true and Q is false, our implication fails. This is the _only_ scenario in which it fails. Naturally, if P is occuring (true) and we do not see D, then clearly P's existence (truthiness) does not force D into being. The equivalent truth table confirms this intuition:

| P | Q | P ⇒  Q |
| - | - | ------ |
| T | T |   T    |
| T | F |   F    |
| F | T |   T    |
| F | F |   F    |

A useful fact to keep in mind for the simplication of certain statements is that *P* ⇒ *Q* is equivalent to the statement ¬*P* ∨ *Q*. If you think about this for long enough it makes sense. We can also verify it with a truth table:

| P | Q | ¬P ∨ Q |
| - | - | ------ |
| T | T |    T   |
| T | F |    F   |
| F | T |    T   |
| F | T |    T   |

We write, P ⇒ Q is equivalent to ('≡') ¬P ∨ Q:

    (P ⇒  Q) ≡ (¬P ∨ Q)

Implication is a bit trickier that the other connectives, but it is possibily the most important one we have seen so far. Intuitively, it gives us a way to talk about which conditions are necessary for another proposition to be true. i.e.,

    If it is not a weekday, I do not have work
                    ≡
    If it is a weekday, I do have work
                    ≡
    Today is a weekday ⇒  I have work
                    ≡
    P (weekday) ⇒  Q (work)

#### The Contrapositive and the Converse

Two fundamentail statements which are closely related to *P* ⇒ *Q* are its contrapositive and the converse.

 1. **Contrapositive**: ¬Q ⇒ ¬P
 2. **Converse**: Q ⇒ P

One of these is equivalent to P ⇒  Q, the other is not. Can you tell which is which? How would you formally _check_ your guess. One way is to write down the truth tables and compare them:

| P | Q | ¬P | ¬Q | P ⇒  Q | Q ⇒  P | ¬Q ⇒  ¬P |
| - | - | -- | -- | ------ | ------ | -------- |
| T | T |  F |  F |   T    |   T    |     T    |
| T | F |  F |  T |   F    |   T    |     F    |
| F | T |  T |  F |   T    |   F    |     T    |
| F | F |  T |  T |   T    |   T    |     T    |

Note that the columns for P ⇒ Q and ¬Q ⇒ ¬P match, whereas Q ⇒ P differes; thus, we say P ⇒ Q is _logically equivalent_ to ¬Q ⇒  ¬P (its contrapositive). In general, to denote tht statements R and S are equivalent we use notation R ⇔ S, or in English, "R if and only S" (informally abbreviated as R iff S). (Alternative, one can use the notation R ≡ S, which is useful especially for noting equivalence _by defintion_)

The contrapositive is important because sometimes it is easier to prove than the original statement. But it is _equivalent_ to the original statment. So proving ¬Q ⇒ ¬P proves P ⇒ Q!

The converse on the other hand, is _not_ in general equivalent to P ⇒ Q. Rathey, the converse plays a very important role in proving the equivalence of two statements:

    P ⇔ Q ≡ (P ⇒ Q) ∧ (Q ⇒ P)

The verification of this fact is left to the reader. But this identity says that if you wish to prove the equivalence of two statements, proceed by showing the implication in each direction.
