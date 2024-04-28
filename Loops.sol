// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract ExpenseTracker {
    struct Expense {
        address user;
        string description;
        uint amount;
    }

    Expense[] public expenses;

    constructor() {
        // Initialize with some expenses
        expenses.push(Expense(msg.sender, "Groceries", 50));
        expenses.push(Expense(msg.sender, "Transportation", 30));
        expenses.push(Expense(msg.sender, "Dining out", 25));
    }

    // Function to add a new expense
    function addExpense(string memory _description, uint _amount) public {
        expenses.push(Expense(msg.sender, _description, _amount));
    }

    // Function to calculate the total expenses of a specific user
    function getTotalExpenses(address _user) public view returns (uint totalExpenses) {
        for (uint i = 0; i < expenses.length; i++) {
            if (expenses[i].user == _user) {
                totalExpenses += expenses[i].amount;
            }
        }
        return totalExpenses;
    }
}
