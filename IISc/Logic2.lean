import Std.Tactic.Basic
set_option linter.unusedVariables false
/-!

# Logic in Lean, example sheet 2 : `True` and `False`

We learn about the `True` and `False` propositions.

## Tactics you will need

To solve the levels on this sheet you will need to know all previous
tactics, plus the following two new ones. 

* `trivial` -- proves `True`
* `exfalso` -- changes goal to `False`

-/

-- Throughout this sheet, `P` and `Q` will denote arbitrary propositions.

variable (P Q : Prop)

example : True := by
  -- sorry
  trivial

example : True → True := by
  -- sorry 
  intro h
  exact h

example : False → True := by
  -- sorry
  intro h
  trivial

example : False → False := by
  -- sorry
  intro h
  exact h

example : (True → False) → False := by
  -- sorry
  intro h
  apply h
  trivial

example : False → P := by
  -- sorry
  intro h
  exfalso
  exact h

example : True → False → True → False → True → False := by
  -- sorry
  intros h1 h2 h3 h4 h5
  exact h4

example : P → ((P → False) → False) := by
  -- sorry
  intros hP h
  apply h
  assumption

example : (P → False) → P → Q := by
  -- sorry
  intros h1 h2
  exfalso
  apply h1
  exact h2

example : (True → False) → P := by
  -- sorry
  intro h
  exfalso
  apply h
  trivial
