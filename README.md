# Blockchain Health Record System (Solidity)

This project demonstrates secure health data sharing using:
- 📦 IPFS (via Pinata) for storing encrypted reports
- 🔐 RSA (done manually via browser tool)
- 💰 HealthCoin (ERC-20) for rewarding patients
- 🧾 Solidity smart contracts for access control and logs

## 🧱 Smart Contracts

### 1. HealthCoin.sol
An ERC-20 token used to reward patients when their data is accessed.

### 2. HealthRecordAccess.sol
Allows:
- Patients to upload IPFS CIDs of encrypted reports
- Approve doctors/researchers
- Logs every access and transfers 1 HLTH from hospital to patient

## 📋 Workflow (Manual)

1. **Encrypt** report manually using browser-based RSA tool
2. **Upload** encrypted file to [https://www.pinata.cloud/](https://www.pinata.cloud/)
3. **Copy the CID** from Pinata
4. **Deploy** `HealthCoin` contract from hospital account
5. **Deploy** `HealthRecordAccess` from patient account with:
   - token address (from step 4)
   - hospital address
6. **Approve** the contract from hospital (in HealthCoin) to spend tokens
7. **Upload report** (CID) in HealthRecordAccess contract
8. **Doctor** accesses using `getReportCID()`
9. Access log is recorded and 1 HLTH is transferred to the patient

## 🧾 Example CID
bafkreihtssozujr5z4gabwhm7akxyhlzppghfz7cuqbkh4iutwc7enukge


## 📂 Repository Structure

contracts/
├── HealthCoin.sol
└── HealthRecordAccess.sol


## 🛡️ License
MIT
