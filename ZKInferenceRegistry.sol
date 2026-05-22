// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "@openzeppelin/contracts/access/Ownable.sol";

interface IZKVerifier {
    function verifyProof(uint[2] calldata a, uint[2][2] calldata b, uint[2] calldata c, uint[] calldata pubSignals) external view returns (bool);
}

contract ZKInferenceRegistry is Ownable {
    IZKVerifier public verifier;
    
    event InferenceVerified(address indexed node, uint256 taskId, bytes result);

    constructor(address _verifier) Ownable(msg.sender) {
        verifier = IZKVerifier(_verifier);
    }

    /**
     * @dev Settles a task immediately if the ZK-proof is valid.
     */
    function settleWithProof(
        uint256 taskId,
        uint[2] calldata a,
        uint[2][2] calldata b,
        uint[2] calldata c,
        uint[] calldata pubSignals,
        bytes calldata result
    ) external {
        require(verifier.verifyProof(a, b, c, pubSignals), "Invalid ZK Proof");
        
        // Logic to transfer bounty to msg.sender (the node)
        emit InferenceVerified(msg.sender, taskId, result);
    }
}
