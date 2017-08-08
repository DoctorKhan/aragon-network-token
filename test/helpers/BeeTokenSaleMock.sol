pragma solidity ^0.4.8;

import '../../contracts/BeeTokenSale.sol';

// @dev BeeTokenSaleMock mocks current block number

contract BeeTokenSaleMock is BeeTokenSale {

  function BeeTokenSaleMock (
      uint _initialBlock,
      uint _finalBlock,
      address _aragonDevMultisig,
      address _communityMultisig,
      uint256 _initialPrice,
      uint256 _finalPrice,
      uint8 _priceStages
  ) BeeTokenSale(_initialBlock, _finalBlock, _aragonDevMultisig, _communityMultisig, _initialPrice, _finalPrice, _priceStages, computeCap(mock_hiddenCap, mock_capSecret)) {

  }

  function getBlockNumber() internal constant returns (uint) {
    return mock_blockNumber;
  }

  function setMockedBlockNumber(uint _b) {
    mock_blockNumber = _b;
  }

  function setMockedTotalCollected(uint _totalCollected) {
    totalCollected = _totalCollected;
  }

  uint mock_blockNumber = 1;

  uint public mock_hiddenCap = 100 finney;
  uint public mock_capSecret = 1;
}
