import("SuperdaoDougEnabled.sol");
contract SuperdaoActionManager is SuperdaoDougEnabled {
    address activeAction;
    address actionDb;
    address actn;
    function SuperdaoActionManager(){
        
    }
modifier check(){
    actionDb = SuperdaoContractProvider(sDoug).contracts("sdaoactiondb");
    actn = ActionDb(actionDb).actions(actionName);
    if(actionDb ==0x0){
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
        bool res1 = ActionDb(actionDb),addAction(name,addr);
        return res1;
    }
    
    function removeAction(bytes32 name)checkAction() returns (bool) {
        bool res1 =ActionDb(actionDb).removeAction(name);
        return res1;
    }
    
    function validate(address addr) constant returns (bool){
        return addr == activeAction;
    }
}