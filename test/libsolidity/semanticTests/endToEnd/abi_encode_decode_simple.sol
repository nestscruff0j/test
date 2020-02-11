contract C {
    function f() public pure returns(uint, bytes memory) {
        bytes memory arg = "abcdefg";
        return abi.decode(abi.encode(uint(33), arg), (uint, bytes));
    }
}

// ----
// f()  -> 33, 64, 7, "abcdefg"
