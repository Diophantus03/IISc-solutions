import Mathlib.Tactic.Basic
set_option linter.unusedVariables false

/-!

# Logic in Lean, example sheet 3 : "not" (`¬`)

We learn about how to manipulate `¬ P` in Lean.

# The definition of `¬ P`

In Lean, `¬ P` is *defined* to mean `P → False`. So `¬ P` and `P → False`
are *definitionally equal*. 
## Tactics

You'll need to know about the tactics from the previous sheets,
and also the following tactics:

* `change`
* `by_contra` or `by_cases`

-/

-- Throughout this sheet, `P` and `Q` will denote propositions.

variable (P Q : Prop)

example : ¬ True → False := by
  -- sorry
  intro h
  change True → False at h
  apply h
  trivial

example : False → ¬ True := by
  -- sorry
  intro h
  intro h2
  exact h

example : ¬ False → True := by
  -- sorry
  intro h
  trivial

example : True → ¬ False := by
  -- sorry
  intro h
  intro h2
  exact h2

example : False → ¬ P := by
  -- sorry
  intro h
  intro hP
  exact h

example : P → ¬ P → False := by
  -- sorry
  intro hP
  intro hnP
  apply hnP
  exact hP

example : P → ¬ (¬ P) := by
  -- sorry
  intro hP
  intro hnP
  apply hnP
  exact hP

example : (P → Q) → (¬ Q → ¬ P) := by
  -- sorry
  intros hPQ hnQ hP
  apply hnQ
  apply hPQ
  assumption

example : ¬ ¬ False → False := by
  -- sorry
  intro h
  apply h
  intro h2
  exact h2

example : ¬ ¬ P → P := by
  -- sorry
  intro h
  by_contra h2
  apply h
  exact h2

example : (¬ Q → ¬ P) → (P → Q) := by
  -- sorry
  intros h hP
  change (Q → False) → (P → False) at h
  by_contra hnQ
  apply h
  { exact hnQ }
  { exact hP }
