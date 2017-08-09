pragma solidity ^0.4.8;

import './BeeTokenSaleMock.sol';

contract MultisigMock {
  function deployAndSetANT(address sale) {
    BEE token = new BEE(new MiniMeTokenFactory());
    ANPlaceholder networkPlaceholder = new ANPlaceholder(sale, token);
    token.changeController(address(sale));

    BeeTokenSale s = BeeTokenSale(sale);
    token.setCanCreateGrants(sale, true);
    s.setANT(token, networkPlaceholder, new SaleWallet(s.BeeDevMultisig(), s.finalBlock(), sale));
  }

  function activateSale(address sale) {
    BeeTokenSale(sale).activateSale();
  }

  function emergencyStopSale(address sale) {
    BeeTokenSale(sale).emergencyStopSale();
  }

  function restartSale(address sale) {
    BeeTokenSale(sale).restartSale();
  }

  function finalizeSale(address sale) {
    finalizeSale(sale, BeeTokenSaleMock(sale).mock_hiddenCap());
  }

  function withdrawWallet(address sale) {
    SaleWallet(BeeTokenSale(sale).saleWallet()).withdraw();
  }

  function finalizeSale(address sale, uint256 cap) {
    BeeTokenSale(sale).finalizeSale(cap, BeeTokenSaleMock(sale).mock_capSecret());
  }

  function deployNetwork(address sale, address network) {
    BeeTokenSale(sale).deployNetwork(network);
  }

  function () payable {}
}
