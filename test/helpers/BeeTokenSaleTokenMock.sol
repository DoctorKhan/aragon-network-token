pragma solidity ^0.4.8;

import './BeeTokenSaleMock.sol';

// @dev BeeTokenSaleTokenMock for ERC20 tests purpose.
// As it also deploys MiniMeTokenFactory, nonce will increase and therefore will be broken for future deployments

contract BeeTokenSaleTokenMock is BeeTokenSaleMock {
  function BeeTokenSaleTokenMock(address initialAccount, uint initialBalance)
    BeeTokenSaleMock(10, 20, msg.sender, msg.sender, 100, 50, 2)
    {
      BEE token = new BEE(new MiniMeTokenFactory());
      ANPlaceholder networkPlaceholder = new ANPlaceholder(this, token);
      token.changeController(address(this));

      setANT(token, networkPlaceholder, new SaleWallet(msg.sender, 20, address(this)));
      allocatePresaleTokens(initialAccount, initialBalance, uint64(now), uint64(now));
      activateSale();
      setMockedBlockNumber(21);
      finalizeSale(mock_hiddenCap, mock_capSecret);

      token.changeVestingWhitelister(msg.sender);
  }
}
