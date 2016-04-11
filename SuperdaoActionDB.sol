    import "github.com/adibas03/ethereum-grove/contracts/Grove.sol";

library GroveAPI {
    struct Index {
        bytes32 id;
        bytes32 name;
        bytes root;
        mapping(bytes32 => Node) nodes;
    }
    
    struct Node {
        bytes32 nodeId;
        bytes32 indexId;
        bytes32 id;
        int value;
        bytes32 parent;
        bytes32 left;
        bytes32 right;
        uint height;
    }
    function insert(Index storage index, bytes32 id, int value) public;
    function remove(Index storage name, bytes32 id) public;
}

import "SuperdaoActionManagerEnabled";
contract SuperdaoActionDb is SuperdaoActionManagerEnabled {
    GroveAPI.Index action;
    Grove sGrove;
    
    //ensure call is from action manager
    modifier verifyAm(){
        if(!isActionManager()){
            throw;
        }
    }
    modifier checkNull(){
        if(action.name == 0){
            throw;
        }
    }
    function addAction(bytes32 name, address addr)verifyAm() returns (bool){
       // sGrove.insert(action.name, name, addr);
    }
    
    function removeAction(bytes32 name)verifyAm()checkNull() returns (bool){
       // Grove.remove(name, id );
    }
}