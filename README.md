# Blockchain Health Record System 🏥🔐

A decentralized system to share encrypted medical reports with doctors and researchers securely — and reward patients using HealthCoin (ERC-20).

## ✨ Features

* Encrypted medical records stored on IPFS (uploaded manually via Pinata)
* Access controlled via smart contract
* Doctors/Researchers pay patients 1 HLTH token per access
* Patient approves access for each participant
* Access history is logged on-chain

---

## 🔗 Technologies

* Solidity Smart Contracts (ERC-20, access control)
* Remix IDE (contract deployment)
* MetaMask (wallet for hospital, doctors, patient)
* IPFS via Pinata (file storage)
* RSA encryption (manually via browser or script)

---

## 📂 Project Structure

```
blockchain-health-records/
├── contracts/
│   ├── HealthCoin.sol
│   └── HealthRecordAccess.sol
├── README.md
```

---

## 🚀 Step-by-Step Workflow

### 🏥 1. Deploy `HealthCoin.sol`

* Deployed by **Hospital**
* Set `initialSupply = 1000000` (1 million HLTH tokens)
* Tokens are minted to hospital account

---

### 👤 2. Deploy `HealthRecordAccess.sol`

* Deployed by **Patient**
* Constructor only needs `HealthCoin` contract address

```solidity
new HealthRecordAccess(healthCoinAddress)
```

---

### 📟 3. Upload Encrypted Report to IPFS

* Encrypt file manually (e.g., using browser-based RSA tool)
* Upload encrypted file to [https://www.pinata.cloud](https://www.pinata.cloud)
* Copy the IPFS CID (e.g., `bafkre...`)

---

### 📄 4. Patient Uploads Report CID

Patient calls:

```solidity
uploadReport("xray", "bafkre....")
```

---

### 👨‍⚕️ 5. Patient Approves Doctor/Researcher

```solidity
approveDoctor(doctorAddress)
approveResearcher(researcherAddress)
```

---

### 💰 6. Hospital Transfers HLTH Tokens

Hospital sends tokens to:

* Doctor address
* Researcher address

Example (in `HealthCoin` contract):

```solidity
transfer(doctorAddress, 10 ether)
transfer(researcherAddress, 10 ether)
```

---

### ✅ 7. Doctor/Researcher Approves Contract

Doctor or researcher must approve `HealthRecordAccess` contract to spend 1 HLTH:

```solidity
approve(healthRecordAccessAddress, 1 ether)
```

---

### 📬 8. Doctor/Researcher Accesses Report

Doctor or researcher calls:

```solidity
getReportCID("xray")
```

💡 Result:

* 1 HLTH is transferred from doctor/researcher to patient
* CID is returned
* Access is logged

---

### 📜 9. Patient Checks Access History

```solidity
getAccessLogCount()
getAccessLog(index)
```

---

## 🛡️ Smart Contract Logic Summary

* `uploadReport()`: Stores CID per report type
* `approveDoctor()` / `approveResearcher()`: Grants access
* `getReportCID()`: Validates access, transfers token, logs event
* Uses `transferFrom(msg.sender, patient, 1 ether)` — doctor/researcher pays patient

---

## 📄 Example IPFS CID

```
bafkreihtssozujr5z4gabwhm7akxyhlzppghfz7cuqbkh4iutwc7enukge
```

---

## 📜 License

MIT
