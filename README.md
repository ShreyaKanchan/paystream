# PayStream

> A time-based payment stream prototype for depositing funds once and releasing them linearly to a recipient.

![PayStream](assets/logo.svg)

Solidity prototype for time-based payment streams. A sender deposits funds, the recipient withdraws accrued value, and the sender can cancel the remainder.

Prototype limitations: native ETH only, no upgradeability, no fee model, and no audit.

## Lifecycle

1. A sender deposits ETH and chooses a recipient and duration.
2. Accrual is calculated linearly from elapsed time, capped at the stream end.
3. The recipient withdraws only the amount not previously withdrawn.

For production, add cancellation/refunds, reentrancy protection, safe transfer helpers, protocol accounting, precise timestamp semantics, and comprehensive invariant tests.
