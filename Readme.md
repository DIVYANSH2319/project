# On-Chain Tutoring Service

## Overview

The **On-Chain Tutoring Service** is a decentralized platform for managing tutoring sessions on the Ethereum blockchain. Tutors and students can interact with each other through a smart contract that securely handles booking, payments, and refunds. The platform uses an ERC-20 token for payment and allows tutors to complete sessions and refund students when necessary. All interactions are transparent, secure, and verifiable on the blockchain.

### Key Features

- **Booking Sessions**: Students can book tutoring sessions with their chosen tutors, paying a deposit upfront.
- **Session Completion**: Tutors can mark sessions as completed and receive payment for their services.
- **Refund Process**: Tutors can refund students if a session is canceled or if there is a dispute.
- **Smart Contract Interaction**: All transactions (booking, payment, and refund) are recorded on the Ethereum blockchain, ensuring transparency and security.
- **Payment in ERC-20 Tokens**: Payments are made in an ERC-20 token (e.g., USDT, DAI, or any custom token), ensuring a decentralized method of payment.

## Table of Contents

- [Technologies Used](#technologies-used)
- [How It Works](#how-it-works)
- [Prerequisites](#prerequisites)
- [Setup and Installation](#setup-and-installation)
- [Smart Contract Deployment](#smart-contract-deployment)
- [Frontend Integration](#frontend-integration)
- [Usage Instructions](#usage-instructions)
- [Contributing](#contributing)
- [License](#license)

## Technologies Used

- **Ethereum Blockchain**: The project utilizes the Ethereum blockchain for decentralization and security.
- **Smart Contracts (Solidity)**: The backend logic for booking sessions, transferring payments, and issuing refunds is written in Solidity.
- **Web3.js**: The Web3.js library is used for interacting with Ethereum from the frontend.
- **MetaMask**: A browser extension that serves as the wallet and allows users to interact with the Ethereum network.
- **HTML, CSS, JavaScript**: The frontend is built using plain HTML, CSS, and JavaScript, with Web3.js integrated to interact with the blockchain.

## How It Works

1. **Student Books a Session**: The student selects a tutor, sets a session fee, and sends a deposit (50% of the session fee). The session details are saved in the smart contract.
2. **Session Completion**: After the tutoring session is completed, the tutor marks the session as completed in the smart contract. The remaining payment is transferred to the tutor.

3. **Refunding a Session**: If there is a canceled session or a dispute, the tutor can refund the student their deposit.

All actions such as booking, payment, and refunding are handled by a smart contract on the Ethereum blockchain, ensuring full transparency and traceability.

## Prerequisites

- **MetaMask** installed in your browser.
- **Ether or ERC-20 Tokens** in your MetaMask wallet to pay for the sessions.
- A deployed Ethereum smart contract for the On-Chain Tutoring Service.
- Basic knowledge of Ethereum, Web3, and smart contracts.

## Setup and Installation

### Frontend (Web3.js Integration)

1. **Clone the Repository**:

   ```bash
   git clone https://github.com/yourusername/on-chain-tutoring-service.git
   cd on-chain-tutoring-service
   ```

2. **Open the HTML file**:
   Open the `index.html` file in your browser. The frontend will allow you to interact with the deployed smart contract.

3. **Configure the Smart Contract**:
   Update the contract's address and ABI in the frontend's `index.html` file:

   - Replace `contractAddress` with the actual deployed contract address.
   - Replace `contractABI` with the actual ABI of your smart contract.

4. **Connect to MetaMask**:
   Make sure you have **MetaMask** installed in your browser. Once the page loads, click the **"Connect MetaMask"** button to connect your Ethereum wallet.

### Smart Contract Deployment

1. **Install Truffle/Hardhat (Optional)**:
   You can use **Truffle** or **Hardhat** to deploy the smart contract. If you don't have them installed, use one of the following:

   ```bash
   npm install -g truffle
   # or
   npm install --save-dev hardhat
   ```

2. **Compile and Deploy the Contract**:

   - If using **Truffle**, navigate to your project folder and run:
     ```bash
     truffle compile
     truffle migrate --network <network>
     ```
   - If using **Hardhat**, follow the documentation to compile and deploy the smart contract.

3. **Update Frontend with the Contract Address and ABI**:
   - After deployment, update the `contractAddress` and `contractABI` in the `index.html` file.

## Usage Instructions

### Booking a Session

1. Enter the **tutor's Ethereum address** and **session fee**.
2. Click **Book Session**. The smart contract will lock a deposit (half the session fee) from the student's wallet.
3. The tutor will be notified of the booking.

### Completing a Session

1. After the session is completed, the **tutor** will input the **session ID** and click **Complete Session**.
2. The tutor will receive the remaining session fee, and the session will be marked as completed in the smart contract.

### Refunding a Session

1. If the tutor needs to **refund** the student, the tutor can input the **session ID** and click **Refund Session**.
2. The **deposit** will be refunded to the student.

### Wallet Connection

Click **"Connect MetaMask"** to link your MetaMask wallet to the application. Ensure your wallet is connected to the same network as the deployed contract (e.g., Mainnet or Rinkeby testnet).

## Contributing

If you would like to contribute to this project, feel free to fork the repository and submit a pull request with your improvements. Here are a few ideas for contribution:

- Implement additional features (e.g., reviews for tutors).
- Improve the user interface.
- Optimize gas fees in the smart contract.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

This README provides an overview of the **On-Chain Tutoring Service** project, instructions for setting up the frontend, and how to interact with the deployed smart contract. It's suitable for users and developers who want to use or contribute to the project.
