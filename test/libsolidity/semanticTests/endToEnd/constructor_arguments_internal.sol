contract Helper {
    bytes3 name;
    bool flag;

    constructor(bytes3 x, bool f) public {
        name = x;
        flag = f;
    }

    function getName() public returns(bytes3 ret) {
        return name;
    }

    function getFlag() public returns(bool ret) {
        return flag;
    }
}
contract Main {
    Helper h;
    constructor() public {
        h = new Helper("abc", true);
    }

    function getFlag() public returns(bool ret) {
        return h.getFlag();
    }

    function getName() public returns(bytes3 ret) {
        return h.getName();
    }
}

// ----
// getFlag() -> true
// getFlag(): "string" -> true
// getName() -> "abc"
// getName(): "string" -> "abc"
