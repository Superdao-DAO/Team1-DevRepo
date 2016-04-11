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
    function remove(Index storage name) public;
}



import("/SuperdaoDougEnabled.sol");

contract SuperdaoDoug{
    address contractOwner;
    
    Grove.Index contract_s;
	
    function SuperdaoDoug(){
        contractOwner = msg.sender;
    }
    modifier onlyCreator(){
	if(msg.sender != contractOwner ){
	throw;
	}
	}
	
    function addContract(bytes32 name, address addr)onlyCreator() returns (bool result){
       SuperdaoDougEnabled sde = SuperdaoDougEnabled(addr);
       if(!de.setSuperdaoDougAddress(address(this))){
            return false;
        }else{
       //  contracts[name] = addr;
       Grove.insert(contract_s,name,addr);
        return true;   
        }
        
    }
    
    function removeContract(bytes name)onlyCreator() returns (bool result){
        address cName = contracts[name];
        if(cName == 0x0){
            return false;
        }else{
            SuperdaoDoug(cName).remove();
         //   contracts[name] = 0x0;
         Grove.remove(name);
            return true;
        }
    }
    function remove()onlyCreator(){
            selfdestruct(contractOwner);
        
    }
	}