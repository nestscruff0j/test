
		contract C {
			function f(uint a, uint b) public returns (uint) {
				a >>= b;
				return a;
			}
		}
	
// ----
// f(uint256,uint256): 0x4266, 0x00 -> 0x4266
// f(uint256,uint256): 0x4266, 0x08 -> 0x42
// f(uint256,uint256): 0x4266, 0x10 -> 0x00
// f(uint256,uint256): 0x4266, 0x11 -> 0x00

