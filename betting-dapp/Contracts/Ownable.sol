pragma solidity ^0.4.10;

contract Ownable {
 address owner;
 function Ownable() public {
//Set owner to who creates the contract
 owner = msg.sender;
 }
//Access modifier 

modifier Owned {
 require(msg.sender == owner);
 _;
 }
}

contract Mortal is Ownable {
//Our access modifier is present, only the contract creator can      use this function
  function kill() public Owned { 
 selfdestruct(owner);
 }
}

contract Casino is Mortal{
 uint minBet;
 uint houseEdge; //in %
//true+amount or false+0

event Won(bool _status, uint _amount);

function Casino(uint _minBet, uint _houseEdge) payable public {
 require(_minBet > 0);
 require(_houseEdge <= 100);
 minBet = _minBet;
 houseEdge = _houseEdge;
 }
 
function() public { //fallback
 revert();
 }
}

