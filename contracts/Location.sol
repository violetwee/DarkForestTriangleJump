// contracts/Location.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Verifier.sol";

contract CardGame {
    Verifier private verifier;

    mapping(address => uint256) playerLocations;

    constructor(address verifierContractAddress) {
        verifier = Verifier(verifierContractAddress);
    }

    function performTriangleJump(
        uint256[2] memory _a,
        uint256[2][2] memory _b,
        uint256[2] memory _c,
        uint256[1] memory _input
    ) public {
        require(
            verifier.verifyProof(_a, _b, _c, _input),
            "Failed triangle jump proof check"
        );

        playerLocations[msg.sender] = _input[0];
    }

    function getPlayerLocation() public view returns (uint256) {
        return playerLocations[msg.sender];
    }
}
