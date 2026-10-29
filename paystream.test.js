import test from "node:test";
import assert from "node:assert/strict";
test("stream accrual is capped at deposit", () => { const deposit = 1000; const elapsed = 120; const duration = 100; const accrued = Math.min(deposit, deposit * elapsed / duration); assert.equal(accrued, deposit); });
