From Hammer Require Import Hammer.



























Require Export Relations_1.
Require Export Relations_2.

Section Relations_3.
Variable U : Type.
Variable R : Relation U.

Definition coherent (x y:U) : Prop :=
exists z : _, Rstar U R x z /\ Rstar U R y z.

Definition locally_confluent (x:U) : Prop :=
forall y z:U, R x y -> R x z -> coherent y z.

Definition Locally_confluent : Prop := forall x:U, locally_confluent x.

Definition confluent (x:U) : Prop :=
forall y z:U, Rstar U R x y -> Rstar U R x z -> coherent y z.

Definition Confluent : Prop := forall x:U, confluent x.

Inductive noetherian (x: U) : Prop :=
definition_of_noetherian :
(forall y:U, R x y -> noetherian y) -> noetherian x.

Definition Noetherian : Prop := forall x:U, noetherian x.

End Relations_3.
Hint Unfold coherent: sets.
Hint Unfold locally_confluent: sets.
Hint Unfold confluent: sets.
Hint Unfold Confluent: sets.
Hint Resolve definition_of_noetherian: sets.
Hint Unfold Noetherian: sets.
