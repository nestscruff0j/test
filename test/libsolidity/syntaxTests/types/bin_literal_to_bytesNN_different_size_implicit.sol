contract C {
   function f() public pure {
     bytes1 b1 = 0b1;
     bytes1 b2 = 0b100000000;
     bytes2 b3 = 0b11111111;
     bytes2 b4 = 0b100000000;
     bytes2 b5 = 0b10000000000000000;
     bytes3 b6 = 0b1111111111111111;
     bytes3 b7 = 0b10000000000000000;
     bytes3 b8 = 0b1000000000000000000000000;
     bytes4 b9 = 0b111111111111111111111111;
     bytes4 b10 = 0b1000000000000000000000000;
     bytes4 b11 = 0b100000000000000000000000000000000;
     bytes16 b12 = 0b1;
     bytes32 b13 = 0b1;
   }
}
// ----
// TypeError 9574: (48-63): Type int_const 1 is not implicitly convertible to expected type bytes1.
// TypeError 9574: (70-87): Type int_const 256 is not implicitly convertible to expected type bytes1.
// TypeError 9574: (94-110): Type int_const 255 is not implicitly convertible to expected type bytes2.
// TypeError 9574: (117-134): Type int_const 256 is not implicitly convertible to expected type bytes2.
// TypeError 9574: (141-160): Type int_const 65536 is not implicitly convertible to expected type bytes2.
// TypeError 9574: (167-185): Type int_const 65535 is not implicitly convertible to expected type bytes3.
// TypeError 9574: (192-211): Type int_const 65536 is not implicitly convertible to expected type bytes3.
// TypeError 9574: (218-239): Type int_const 16777216 is not implicitly convertible to expected type bytes3.
// TypeError 9574: (246-266): Type int_const 16777215 is not implicitly convertible to expected type bytes4.
// TypeError 9574: (273-295): Type int_const 16777216 is not implicitly convertible to expected type bytes4.
// TypeError 9574: (302-326): Type int_const 4294967296 is not implicitly convertible to expected type bytes4.
// TypeError 9574: (333-350): Type int_const 1 is not implicitly convertible to expected type bytes16.
// TypeError 9574: (357-374): Type int_const 1 is not implicitly convertible to expected type bytes32.
