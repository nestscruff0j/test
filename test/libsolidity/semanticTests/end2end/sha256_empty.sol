
		contract C {
			function f() public returns (bytes32) {
				return sha256("");
			}
		}
	
// ----
// f() -> 0xe3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855

