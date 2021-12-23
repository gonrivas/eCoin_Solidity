// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.3;

contract ECoin {
    uint private supply;
    address private owner;
    mapping (address => uint) private balances;

constructor (uint _supply) {
    owner = msg.sender;
    supply = _supply;
    balances[owner] = supply;
}

    function getBalance () public view returns (uint256){
        return balances[msg.sender];
    }

    function accountOwner () public view returns (address){
        return msg.sender;
    }

    function inicialDeploy(uint _amount, address _to) public onlyOwner haveEnough (_amount){
       balances[owner] = balances[owner] - _amount;
       balances[_to] += _amount;
    }

    function transferToken(uint _amount, address _to) public haveEnough(_amount) {
        balances[msg.sender] -= _amount;
        balances[_to] += _amount;
    }


    modifier haveEnough (uint _amount){
        require(balances[msg.sender] >= _amount, "no tiene saldo suficiente");
        _;
    }

    modifier onlyOwner(){
        require (owner == msg.sender, "usted no tiene autorizacion para transferir estos fondos");
        _;
    }














}