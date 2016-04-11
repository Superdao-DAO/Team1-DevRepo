import "SuperdaoContractProvider";
import "SuperdaoDougEnabled";

contract SuperdaoActionManagerEnabled is SuperdaoDougEnabled {
    //to make sure action manager is the caller
    address sDOUG;
    
    modifier onlyCreator(){
        if(msg.sender != sDOUG)
        throw;
    }
    
    
    function isActionManager()onlyCreator() internal constant returns (bool) {
        address am = SuperdaoContractProvider(sDOUG).contracts("actions");
        if(msg.sender == am){
            return true;
        }
		return false;
    }
    
}