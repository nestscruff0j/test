contract C {
    function f(bytes calldata data) external pure returns(uint, bytes memory r) {
        return abi.decode(data, (uint, bytes));
    }
}
// ----
// f(bytes): 32, 128, 33, 64, 7, "abcdefg" -> 33, 64, 7, "abcdefg"
