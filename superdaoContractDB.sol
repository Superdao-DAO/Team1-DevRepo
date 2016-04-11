import "SuperdaoDougEnabled";

contract SuperdaoContractDB{
	
	address sDOUG;
	mapping(bytes32 => address) contracts;
	
	modifier onlyCreator(){
		if(msg.sender != sDOUG){
			throw;
		}
	}
	
	function SuperdaoContractDB() {
	}
	
	function addContract(bytes32 name,address addr) onlyCreator() returns (bool){
		if(contracts[name] != 0x0){
			contracts[name] = addr;
			return true;
		}
		else return false;
	}
	
	
	function removeContract(bytes32 name) onlyCreator returns (bool){
		if(contracts[name] == 0x0){
			return false;
		}
		contracts[name] = 0x0;
		return true;
	}
	
	function getContract(bytes32 name) constant returns (address addr){
		if(contracts[name] == 0x0){
			throw;
		}
		return contracts[name];
	}
	
	
}