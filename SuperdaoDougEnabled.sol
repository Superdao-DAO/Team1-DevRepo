contract SuperdaoDougEnabled {
    address sDOUG;
    
    function setSuperdaoDougAdress(address addr)onlyCreator() returns (bool result){
        if(sDOUG != 0x0 && addr != sDOUG){
            return false;
        }
        sDOUG = addr;
        return true;
    }
    modifier onlyCreator(){
        if(msg.sender != sDOUG){
           throw; 
        }
    }
      function remove()onlyCreator(){
            selfdestruct(sDOUG);
        
    }
    function(){
        throw;
    }
}