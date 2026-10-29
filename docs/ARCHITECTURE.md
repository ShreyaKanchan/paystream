# Architecture notes

Payment state is represented by immutable stream terms plus mutable withdrawal accounting. Accrual is derived rather than stored, which keeps the state machine compact.
