contract receiver {
    uint public calledLength;
    fallback() external {
        calledLength = msg.data.length;
    }
}
contract sender {
    receiver rec;
    constructor() public {
        rec = new receiver();
    }

    function viaCalldata() public returns(uint) {
        (bool success, ) = address(rec).call(msg.data);
        require(success);
        return rec.calledLength();
    }

    function viaMemory() public returns(uint) {
        bytes memory x = msg.data;
        (bool success, ) = address(rec).call(x);
        require(success);
        return rec.calledLength();
    }
    bytes s;

    function viaStorage() public returns(uint) {
        s = msg.data;
        (bool success, ) = address(rec).call(s);
        require(success);
        return rec.calledLength();
    }
}

// ----
// viaCalldata() -> 4
// viaMemory() -> 4
// viaStorage() -> 4
// viaCalldata(): "abc" -> 36
// viaMemory(): "abc" -> 36
// viaStorage(): "abc" -> 36
