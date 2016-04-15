import "SuperdaoActions";

contract SuperdaoActionDb is SuperdaoActionManagerEnabled {
	// This is where we keep all the actions.
    mapping (bytes32 => address) public Superdaoactions;
	
    //ensure call is from action manager
    modifier verifyAm(){
        if(!isActionManager()){
            throw;
        }
    }
    modifier checkNull(bytes32 name){
        if(Superdaoactions[name] == 0x0){
            throw;
        }
    }
	
	// To make sure we have an add action action, we need to auto generate
    // it as soon as we got the DOUG address.
    function setDougAddress(address dAddr) returns (bool result) {
      super.setSuperdaoDougAddress(dAddr);

      var addaction = new ActionAddAction();
      // If this fails, then something is wrong with the add action contract.
      // Will be events logging these things in later parts.
      if(!SuperdaoDougEnabled(addaction).setSuperdaoDougAddress(dAddr)){
          return false;
      }
      Superdaoactions["addaction"] = address(addaction);
    }
	
	
    function addAction(bytes32 name, address addr)verifyAm() returns (bool){
		
		bool sdda = SuperdaoDougEnabled(addr).setSuperdaoDougAddress(sDOUG);
		if(!sdda)return false;
		
		Superdaoactions[name] = addr;
		return true;
	}
    
    function removeAction(bytes32 name)verifyAm()checkNull(name) returns (bool){
		Superdaoactions[name] = 0x0;
		return true;
    }
}