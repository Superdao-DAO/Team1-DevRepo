import "github.com/adibas03/ethereum-grove/contracts/Grove.sol";

library GroveAPI {
    struct Index {
        bytes32 id;
        bytes32 name;
        bytes root;
        mapping(bytes32 => Node) nodes;
    }
    
    struct Node {
        bytes32 nodeId;
        bytes32 indexId;
        bytes32 id;
        int value;
        bytes32 parent;
        bytes32 left;
        bytes32 right;
        uint height;
    }
    function insert(Index storage index, bytes32 id, int value) public;
    function remove(Index storage name, bytes32 id) public;
}

import "SuperdaoActionManager";

contract SuperdaoContractDb is SuperdaoDougEnabled{
	
    address addr;
	mapping(bytes32 => address) contracts;
	
	//Integration with Grove to be follow
	//Grove sGrove;
    // GroveAPI.Index contract_s;
	
	
	modifier onlyDoug(){
		if(msg.sender != sDOUG){
			throw;
		}
	}
	
	
	
	function addContract(bytes32 name,address addr) onlyDoug() returns (bool){
		if(contracts[name] == 0x0 && contracts['sdaoactiondb'] != 0x0){
			contracts[name] = addr;
			return true;
		}
		else return false;
	}
	
	
	function removeContract(bytes32 name) onlyDoug returns (bool){
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