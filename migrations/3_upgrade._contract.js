const GES = artifacts.require("GES");
const GESV2 = artifacts.require("GESV2");

const { upgradeProxy } = require('@openzeppelin/truffle-upgrades');  

module.exports = async function(deployer) {

    // const i721 = await INNO721.deployed();
    // const i721v2 = await upgradeProxy(i721.address, INNO721V2, { deployer });
    // console.log("Upgraded", i721v2.address);

    const ges = await GES.deployed();
    const gesV2 = await upgradeProxy(ges.address, GESV2, { deployer });
    console.log("Upgraded", gesV2.address);

};