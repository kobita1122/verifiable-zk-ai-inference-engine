# Verifiable ZK-AI Inference Engine (2026)

This repository implements the gold standard for the **AI-on-Chain** narrative of 2026. While optimistic challenges are useful, this engine focuses on **ZK-ML (Zero-Knowledge Machine Learning)**, ensuring that a specific AI model was run exactly as specified without needing a challenge period.

### Core Innovation
* **Verifiable Inference:** Instead of trusting a node, the node provides a ZK-proof ($ \pi $) that the output $ y $ is the result of model $ M $ with input $ x $.
* **Privacy-Preserving ML:** Allows models to run on private user data (witness) while only posting the proof and the non-sensitive result on-chain.
* **Agentic Settlement:** Integrated with autonomous payment rails, allowing AI agents to pay for verifiable compute in real-time.

### System Architecture
1. **Client Request:** Submits input $ x $ and a compute bounty to the `InferenceRegistry`.
2. **Node Computation:** Executes the model and generates a SNARK/STARK proof using libraries like `EZKL` or `Giza`.
3. **On-Chain Verification:** The `ZKVerifier` contract validates the proof in constant time ($ O(1) $), releasing payment immediately.
