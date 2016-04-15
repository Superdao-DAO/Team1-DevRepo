contract SuperdaoDougEnabled {
    address sDOUG;
   
    modifier onlyCreator(){
        if(msg.sender != sDOUG){
           throw; 
        }
    }
	
	function setSuperdaoDougAddress(address addr) returns (bool result){
        if(sDOUG != 0x0 && addr != sDOUG){
            return false;
        }
        sDOUG = addr;
        return true;
    }
	
      function remove()onlyCreator(){
            selfdestruct(sDOUG);
        }
		
    function(){
        throw;
    }
}