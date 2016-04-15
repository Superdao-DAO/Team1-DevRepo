import "SuperdaoDougEnabled";
import "SuperdaoContractProvider";

contract SuperdaoActionManagerEnabled is SuperdaoDougEnabled {
	// Makes it easier to check that action manager is the caller.
	function isActionManager() internal constant returns (bool) {
        if(sDOUG != 0x0){
            address am = SuperdaoContractProvider(sDOUG).contracts("actions");
            if (msg.sender == am){
                return true;
            }
        }
        return false;
    }
}