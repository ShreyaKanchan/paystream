# Invariants

- A stream cannot be created with a zero recipient, zero duration, or zero deposit.
- A recipient can never withdraw more than the deposited amount.
- `withdrawn` is monotonically increasing.
- Accrued value is capped at the stream deposit after the stop time.
- Every withdrawal should emit an auditable event in a production version.
