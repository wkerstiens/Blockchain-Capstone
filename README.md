# Udacity Blockchain Capstone

The capstone will build upon the knowledge you have gained in the course in order to build a decentralized housing product. 

## Install
```shell script
# Clone this project
git clone git@github.com:wkerstiens/Blockchain-Capstone.git

# Install required npm packages
cd eth-contracts
npm install
truffle compile

# start ganache-cli - Feel free to adjust the number of accounts and ether amounts
ganache-cli -m "spirit supply whale amount human item harsh scare congress discover talent hamster" -a 50 -e 1000
```

## Testing
You must be in the eth-contracts directory and ganache-cli must be running as listed above to successfully run these tests.
```shell script
truffle test test/TestERC721Mintable.js
truffle test test/TestSquareVerifier.js 
truffle test test/TestSolnSquareVerifier.js

# To run all tests use the following command
truffle test
```

## Zokrates Setup
Install and instantiate a Zokrates zkSnarks development environment using Docker. Completes the Zokrates proof in square.code by adding the variable names in square.code.

Prerequisite:  Must have docker installed.

More to come as I get here.