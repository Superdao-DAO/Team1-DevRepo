import "SuperdaoActionDb";
import "SuperdaoLogs";

contract SuperdaoActionManager is SuperdaoDougEnabled {
 
	
	address activeAction;
	address actn;
	address actionDb = 0x0;
	
	
	modifier check_actionDb(bytes32 actionName){
    actionDb = SuperdaoContractProvider(sDOUG).contracts("sdaoactiondb");
    if(actionDb == 0x0){
		SuperdaoLogs(sDOUG).save_log(actionName,false);
        throw;
    }else if(actn == 0x0){
		SuperdaoLogs(sDOUG).save_log(actionName,false);
        throw;
    }
	}
	modifier checkAction(bytes32 actionName){
		actn =  SuperdaoActionDb(actionDb).Superdaoactions(actionName);
		if(actn ==0x0){
			SuperdaoLogs(sDOUG).save_log(actionName,false);
			throw;
		}
	}


	
	
	//Consensus permission to be added later
    
    function execute(bytes32 actionName, bytes data)check_actionDb(actionName) checkAction(actionName) returns (bool){
        activeAction = actn;
        actn.call(data);
        activeAction = 0x0;
		SuperdaoLogs(sDOUG).save_log(actionName,true);
        return true;
    }
    
    
    function validate(address addr) constant returns (bool){
        return addr == activeAction;
    }
}