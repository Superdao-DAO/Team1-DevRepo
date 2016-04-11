import "SuperdaoDougEnabled";
import "SuperdaoContractProvider";
import "SuperdaoActionDb";

contract SuperdaoActionManager is SuperdaoDougEnabled {
    address activeAction;
    address actionDb;
    address actn;
    address sDoug;
    bytes32 actionName;
    function SuperdaoActionManager(){
        
    }
    
modifier check(){
    actionDb = SuperdaoContractProvider(sDoug).contracts("sdaoactiondb");
    //actn =  SuperdaoActionDb(actionDb).actions(actionName);
    if(actionDb == 0x0){
        throw;
    }else if(actn == 0x0){
        throw;
    }
}
modifier checkAction(){
    actionDb = SuperdaoContractProvider(sDoug).contracts("sdaoactiondb");
    if(actionDb ==0x0){
        throw;
    }
}
    function execute(bytes32 actionName, bytes data)check() returns (bool){
        activeAction = actn;
        
        actn.call(data);
        activeAction = 0x0;
        return true;
    }
    
    function addAction(bytes32 name, address addr)checkAction() returns (bool){
        bool res1 = SuperdaoActionDb(actionDb).addAction(name,addr);
        return res1;
    }
    
    function removeAction(bytes32 name)checkAction() returns (bool) {
        bool res1 =SuperdaoActionDb(actionDb).removeAction(name);
        return res1;
    }
    
    function validate(address addr) constant returns (bool){
        return addr == activeAction;
    }
}