// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import "../exerciseTemplate.sol";

/*
Exercise 4: Using contract functions to manipulate contract variables
In this exercise, you need to:
- Use this contract's functions in order to manipulate an internal counter unique to your address
- Once this counter reaches a certain value, call a specific function
- Your points are credited by the contract
*/

/*
What you need to know to complete this exercise
A) What was included in the previous exercises
B) "Solidity mappings are a type that has some similarities to hash tables. Solidity mappings are used to structure value types for smart contracts." https://www.bitdegree.org/learn/solidity-mappings/
https://solidity.readthedocs.io/en/develop/types.html?highlight=mapping
C)  x += y is used to add y to x. Similarly, x -= y is used to deduct y from x
D) Attributing a non 0 value to a uint in a smart contract will result in unpredictable behavior. As such, it is essential to make sure this never happens
*/
contract Ex04 is ExerciseTemplate {
    mapping(address => uint) public studentsCounter;

    constructor(ERC20TD _TDERC20) ExerciseTemplate(_TDERC20) {}

    function resetCounter() public {
        studentsCounter[msg.sender] = 0;
    }

    function incrementCounter() public {
        studentsCounter[msg.sender] += 2;
    }

    function decrementCounter() public {
        require(studentsCounter[msg.sender] > 1);
        studentsCounter[msg.sender] -= 1;
    }

    function validateCounter() public {
        require(studentsCounter[msg.sender] == 5, "Counter is not at 5");

        // Validating exercise
        creditStudent(2, msg.sender);
        validateExercise(msg.sender);
    }
}
