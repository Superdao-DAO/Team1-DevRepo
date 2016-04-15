import "SuperdaoActionManagerEnabled";
import "SuperdaoActionDb";

contract Action is SuperdaoActionManagerEnabled{
  /*// Note auto accessor.
  uint8 public permission;

  function setPermission(uint8 permVal) returns (bool) {
    if(!validate()){
      return false;
    }
    permission = permVal;
  }
  */
}

// Add action. NOTE: Overwrites currently added actions with the same name.
contract ActionAddAction is Action {

    function execute(bytes32 name, address addr) returns (bool) {
        if(!isActionManager()){
            return false;
        }
        SuperdaoContractProvider dg = SuperdaoContractProvider(sDOUG);
        address adb = dg.contracts("actiondb");
        if(adb == 0x0){
            return false;
        }
        return SuperdaoActionDb(adb).addAction(name, addr);
    }

}

// Remove action. Does not allow 'addaction' to be removed, though that it can still
// be done by overwriting this action with one that allows it.
contract ActionRemoveAction is Action {

    function execute(bytes32 name) returns (bool) {
        if(!isActionManager()){
            return false;
        }
        SuperdaoContractProvider dg = SuperdaoContractProvider(sDOUG);
        address adb = dg.contracts("sdaoactiondb");
        if(adb == 0x0){
            return false;
        }
        if(name == "addaction"){
          return false;
        }
        return SuperdaoActionDb(adb).removeAction(name);
    }

}

/* Lock actions. Makes it impossible to run actions for everyone but the owner.
// It is good to unlock the actions manager while replacing parts of the system
// for example.
contract ActionLockActions is Action {

    function execute() returns (bool) {
        if(!isActionManager()){
            return false;
        }
        SuperContractProvider dg = SuperdaoContractProvider(DOUG);
        address am = dg.contracts("actions");
        if(am == 0x0){
            return false;
        }
        return SuperdaoActionManager(am).lock();
    }

}

// Unlock actions. Makes it possible for everyone to run actions.
contract ActionUnlockActions is Action {

    function execute() returns (bool) {
        if(!isActionManager()){
            return false;
        }
        SuperdaoContractProvider dg = SuperdaoContractProvider(DOUG);
        address am = dg.contracts("actions");
        if(am == 0x0){
            return false;
        }
        return SuperdaoActionManager(am).unlock();
    }

}*/

/* Add contract.
contract ActionAddContract is Action {

    function execute(bytes32 name, address addr) returns (bool) {
        if(!isActionManager()){
            return false;
        }
        SuperdaoDoug d = SuperdaoDoug(sDOUG);
        return d.addContract(name,addr);
    }

}

// Remove contract.
contract ActionRemoveContract is Action {

    function execute(bytes32 name) returns (bool) {
        if(!isActionManager()){
            return false;
        }
        SuperdaoDoug d = SuperdaoDoug(sDOUG);
        return d.removeContract(name);
    }

}*/
