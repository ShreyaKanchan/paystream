// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract PayStream {
    struct Stream { address sender; address recipient; uint256 deposit; uint64 start; uint64 stop; uint256 withdrawn; }
    uint256 public nextId; mapping(uint256 => Stream) public streams;
    event Created(uint256 indexed id, address indexed sender, address indexed recipient, uint256 deposit, uint64 stop);
    function create(address recipient, uint64 duration) external payable returns (uint256 id) { require(recipient != address(0) && duration > 0 && msg.value > 0, "invalid"); id = nextId++; streams[id] = Stream(msg.sender, recipient, msg.value, uint64(block.timestamp), uint64(block.timestamp) + duration, 0); emit Created(id, msg.sender, recipient, msg.value, streams[id].stop); }
    function accrued(Stream memory s) public view returns (uint256) { uint256 elapsed = block.timestamp < s.stop ? block.timestamp - s.start : s.stop - s.start; return s.deposit * elapsed / (s.stop - s.start); }
    function withdraw(uint256 id) external { Stream storage s = streams[id]; require(msg.sender == s.recipient, "recipient only"); uint256 amount = accrued(s) - s.withdrawn; require(amount > 0, "nothing due"); s.withdrawn += amount; payable(s.recipient).transfer(amount); }
}
