pragma solidity ^0.4.18;
contract TaskBroker {
    address[] taskList;
    uint256 vertexId;
    
    bytes4 constant commandSign = bytes4(keccak256("liveTask()"));
    event Alarm(address indexed client);
    
    function TaskBroker() public {
        taskList.length = 1000;
    }

    function taskCount() view public returns(uint256) {
        return vertexId;
    }
    
    function addTask(address client) public {
        vertexId++;
        if(taskList.length < vertexId) taskList.length++;
        taskList[vertexId - 1] = client;
    }

    function doTasks() public {
        while((vertexId != 0) && ((msg.gas / 300000) > 0)) { // gasleft()
            vertexId--;
            address client = taskList[vertexId];
            bool ok = client.call.gas(250000)(commandSign);
            if(!ok) {
                Alarm(client);
            }
        }
    }
}

contract GoodClient {
    address taskBroker;
    uint public counter;
    
    function GoodClient(address _brokerAddress) public {
        taskBroker = _brokerAddress;
        TaskBroker(taskBroker).addTask(this);
    }
    
    function liveTask() public {
        counter++;
        TaskBroker(taskBroker).addTask(this);
    }
}

contract BadClient {
    uint public counter;
    function liveTask() public {
        while(counter < 1000) {
            counter++;
        }
    }
}
