// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
library StreamMath { function vested(uint256 deposit, uint64 start, uint64 stop, uint256 nowTime) internal pure returns (uint256) { if (nowTime <= start) return 0; if (nowTime >= stop) return deposit; return deposit * (nowTime - start) / (stop - start); } }
