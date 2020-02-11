contract test {
    function f(bool cond) public pure returns(uint) {
        uint32 x = 0x1234_ab;
        uint y = 0x1234_abcd_1234;
        return cond ? x : y;
    }
}

// ----
// f(bool): true -> 0x1234ab
// f(bool): false -> 0x1234abcd1234
