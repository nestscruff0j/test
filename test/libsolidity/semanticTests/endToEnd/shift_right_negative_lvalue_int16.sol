contract C {
    function f(int16 a, int16 b) public returns(int) {
        return a >> b;
    }
}

// ----
// f(int16,int16): -4266, 0 -> -4266
// f(int16,int16): -4266, 1 -> -2133
// f(int16,int16): -4266, 4 -> -267
// f(int16,int16): -4266, 8 -> -17
// f(int16,int16): -4266, 16 -> -1
// f(int16,int16): -4266, 17 -> -1
// f(int16,int16): -4267, 0 -> -4267
// f(int16,int16): -4267, 1 -> -2134
// f(int16,int16): -4267, 4 -> -267
// f(int16,int16): -4267, 8 -> -17
// f(int16,int16): -4267, 16 -> -1
// f(int16,int16): -4267, 17 -> -1
