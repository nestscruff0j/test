/*
	This file is part of solidity.

	solidity is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.

	solidity is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with solidity.  If not, see <http://www.gnu.org/licenses/>.
*/

#include <fstream>
#include <test/tools/evmoneRunner.h>
#include "abiV2FuzzerCommon.h"

using namespace dev::test::abiv2fuzzer;
using namespace external::evmone;
using namespace std;
using namespace dev;

extern "C" int LLVMFuzzerTestOneInput(uint8_t const* _data, size_t _size)
{
	string input(reinterpret_cast<char const*>(_data), _size);
	EvmOneVM vm;
	dev::bytes byteCode;

	// TODO: Configure message with
	//      - sufficient gas to complete execution
	//      - deployment code
	//      - input
	evmc_message m;
	m.gas = 12312312;
//	m.value = {};
//	m.destination = {};
//	// Input

	/* First, execute the deploy code returned by Solidity
	 *  Then, execute the run time code returned by evmone after it has executed the deploy code.
     */

	// If we cannot compile contract, we simply bail.
	try
	{
		// Compile contract generated by the proto fuzzer
		SolidityExecutionFramework executionFramework;
		byteCode = executionFramework.compileContract(input);
		Json::Value methodIdentifiers = executionFramework.getMethodIdentifiers();

		// Call the first function
	    for (auto const& id : methodIdentifiers.getMemberNames())
	    {
	    	auto msg_input = EvmOneVM::from_hex(methodIdentifiers[id].asString());
            m.input_data = &msg_input[0];
            m.input_size = msg_input.size();
		    break;
	    }

	}
	catch (...)
	{
		throw;
	}

	// Execute runtime code generated by Solidity
	std::string hexEncodedRuntimeCode = toHex(byteCode);
	std::string rawRuntimeCode{byteCode.begin(), byteCode.end()};
	ofstream myfile;
	myfile.open("/tmp/runtimeCode");
	myfile << hexEncodedRuntimeCode;
	myfile.close();

	vm.execute(m, rawRuntimeCode);
	return 0;
}