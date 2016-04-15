import "SuperdaoContractDb";


contract SuperdaoDoug{
    address contractOwner;
	address activecontract;
    
	
  
	
    modifier onlyCreator(){
	if(msg.sender != contractOwner ){
	throw;
	}
	}
	
	function SuperdaoDoug(){
        contractOwner = msg.sender;
    }
	
	
    function addContract(bytes32 name, address addr)onlyCreator() returns (bool result){
       SuperdaoDougEnabled sde = SuperdaoDougEnabled(addr);
       if(!sde.setSuperdaoDougAddress(address(this))){
            return false;
        }else{
          SuperdaoContractDb(this).addContract(name, addr);
        return true;   
        }
        
    }
    
    function removeContract(bytes32 name)onlyCreator() returns (bool result){
        address cName = SuperdaoContractDb(this).getContract(name);
        if(cName == 0x0){
            return false;
        }else{
            SuperdaoContractDb(this).removeContract(name);
            return true;
        }
    }
    function remove()onlyCreator(){
            selfdestruct(contractOwner);
        
    }
	}