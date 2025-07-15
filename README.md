# Blockchain-Based Health Record System 🏥

This project allows secure storage and controlled access of medical records using:
- IPFS for decentralized storage
- RSA encryption for privacy
- Solidity smart contracts for access control and HealthCoin (ERC-20) micropayments

## 🛠 Technologies
- Solidity (ERC-20, access logs)
- IPFS via Pinata
- Node.js for encryption
- MetaMask + Remix for interaction

## 📂 Folders
- `contracts/`: Solidity smart contracts
- `encryption/`: Node.js RSA encryption scripts
- `ipfs/`: Pinata file uploader
- `frontend/`: Optional UI

## 🚀 Deployment
1. Deploy `HealthCoin` and `HealthRecordAccess` from Remix
2. Upload encrypted reports to IPFS using `upload_to_pinata.js`
3. Access records via doctor wallets to trigger payments and logs

