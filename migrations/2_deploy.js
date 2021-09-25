
const { deployProxy } = require('@openzeppelin/truffle-upgrades');  

const GES = artifacts.require("GES");

module.exports = async function(deployer) {

  var _GES = await deployProxy(GES, ["GES", "GES", web3.utils.toBN("100000000000000000000000000")], { deployer, initializer: 'initialize' });
  
};