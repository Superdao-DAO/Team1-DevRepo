import("/ContractProvider.sol");
import("/DougEnabled.sol");

contract SuperdaoActionManagerEnabled is DougEnabled {
    //to make sure action manager is the caller
    function isActionManager()onlyCreator() internal constant returns (bool) {
        address am = ContractProvider(sDOUG).contracts("actions");
        if(msg.sender == am){
            return true;
        }
    }
    return false;
}