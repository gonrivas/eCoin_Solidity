const ECoin = artifacts.require("ECoin");

module.exports = function (deployer) {
  deployer.deploy(ECoin, 100000000000000);
};
