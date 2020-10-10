pragma solidity >=0.4.21;

import "./ERC721Mintable.sol";
import "./verifier.sol";
import "./Oraclize.sol";

// TODO define a contract call to the zokrates generated solidity contract <Verifier> or <renamedVerifier>
contract SquareVerifier is Verifier {

}

// TODO define another contract named SolnSquareVerifier that inherits from your ERC721Mintable class
contract SolnSquareVerifier is ERC721Mintable {


    SquareVerifier squareVerifier;

    // TODO define a solutions struct that can hold an index & an address
    struct Solutions {
        uint256 _index;
        address _address;
    }

    // TODO define an array of the above struct
    Solutions[] solutions;

    // TODO define a mapping to store unique solutions submitted
    mapping(bytes32 => Solutions) private uniqueSolutions;

    // TODO Create an event to emit when a solution is added
    event SolutionAdded(address _address, uint256 index);

    // TODO Create a function to add the solutions to the array and emit the event
    function _addSolution(address _address, uint256 _index, bytes32 _key) internal {
        uniqueSolutions[_key]._address = _address;
        uniqueSolutions[_key]._index = _index;
        solutions.push(uniqueSolutions[_key]);
        emit SolutionAdded(_address, _index);
    }

    // TODO Create a function to mint new NFT only after the solution has been verified
    //  - make sure the solution is unique (has not been used before)
    //  - make sure you handle metadata as well as tokenSupply
    function mintToken( address _address, uint256 tokenId, uint[2] memory a, uint[2][2] memory b, uint[2] memory c, uint[2] memory input) public {
        bytes32 key = keccak256(abi.encodePacked(a, b, c, input));
        require(uniqueSolutions[key]._address == _address, "This solution has already been used");
        require(squareVerifier.verifyTx(a, b, c, input), "Could not verify solutions");

        _addSolution(_address, tokenId, key);
        super.mint(_address, tokenId);
    }

}

  


























