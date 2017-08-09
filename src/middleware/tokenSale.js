import Web3 from 'web3'
import { default as contract } from 'truffle-contract'
import tokenSale_artifacts from '../../build/contracts/BeeTokenSale.json'

var web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));
var TokenSale = contract(tokenSale_artifacts);
TokenSale.setProvider(web3.currentProvider);

export const getAddress = async () => {
  try {
    let ts = await TokenSale.deployed();
    return ts.address;
  } catch (err) {
    return 'in getAddress .. Not Deployed';
  }
}

export const getBalance = async (address) => {
  try {
    let ts     = await TokenSale.deployed();
    let balance = await ts.balanceOf.call(address);

    return balance.toNumber();
  } catch (err) {
    return 'in getBalance .. Not Deployed';
  }
}

export const activateSale = async (txParams) => {
  try {
    let ts = await TokenSale.deployed();
    let result = await ts.activateSale(txParams);

    console.log(`result: ${result}`);
    return result;
  } catch (err) {
    return 'in activateSale .. error';
  }
}

export const setAnt = async (tokenAddr, networkPlaceholderAddr, salWalletAddr, txParams) => {
  try {
    let ts = await TokenSale.deployed();
    let result = await ts.setAnt(tokenAddr, networkPlaceholderAddr, salWalletAddr, txParams);

    console.log(`result: ${result}`);
    return result;
  } catch (err) {
    return 'in setAnt .. error';
  }
}

export const isActivated = async () => {
  try {
    let ts = await TokenSale.deployed();
    let result = await ts.isActivated();

    console.log(`result: ${result}`);
    return result
  } catch (err) {
    return 'in setAnt .. error';
  }
}

/*
export const allocatePresaleTokens = async (receiver, amount, cliffDate, vestingDate) => {
  try {
    let ts = await TokenSale.deployed();
    let result = await ts.allocatePresaleTokens(receiver, amount, cliffDate, vestingDate);

    console.log(`result: ${result}`);
    return result;
  } catch (err) {
    return 'in getPrice .. error';
  }  

}
*/
export const getPrice = async (blockNumber) => {
  try {
    let ts = await TokenSale.deployed();
    let result = await ts.getPrice(blockNumber);

    console.log(`result: ${result}`);
    return result;
  } catch (err) {
    return 'in getPrice .. error';
  }  
}

/*
  function AragonTokenSale (
  function setANT(address _token, address _networkPlaceholder, address _saleWallet)
  function activateSale()
  function doActivateSale(address _entity)
  function isActivated() constant public returns (bool) {
  function getPrice(uint _blockNumber) constant public returns (uint256) {
  function priceForBlock(uint _block) constant internal returns (uint256) {
  function allocatePresaleTokens(address _receiver, uint _amount, uint64 cliffDate, uint64 vestingDate)
  function () public payable {
  function proxyPayment(address _owner) payable public returns (bool) {
  function onTransfer(address _from, address _to, uint _amount) public returns (bool) {
  function onApprove(address _owner, address _spender, uint _amount) public returns (bool) {
  function doPayment(address _owner)
  function emergencyStopSale()
  function restartSale()
  function finalizeSale(uint256 _cap, uint256 _cap_secure)
  function distributeTokens(uint count) {
  function deployNetwork(address networkAddress)
  function setAragonDevMultisig(address _newMultisig)
  function setCommunityMultisig(address _newMultisig)
  function getBlockNumber() constant internal returns (uint) {
*/
