
		contract C {
			function f() public returns (uint) {
				return [4][0];
			}
		}
	
// ----
// f() -> 0x04

