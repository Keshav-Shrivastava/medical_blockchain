Medical Crowdfunding - Help Individuals with Medical Bills
Project Description
Medical Crowdfunding is a decentralized blockchain-based platform that enables individuals facing high medical expenses to create fundraising campaigns and receive financial support from a global community. Built on Ethereum, this smart contract eliminates intermediaries, reduces fees, and provides complete transparency in the donation process.

The platform addresses the critical issue of unaffordable healthcare costs by connecting patients directly with donors through blockchain technology. Every transaction is recorded immutably on-chain, ensuring accountability and trust between campaign creators and supporters.

Project Vision
Our vision is to create a transparent, accessible, and efficient healthcare funding ecosystem where:

No patient is left behind due to lack of financial resources
Global communities can support medical causes without geographical barriers
Transparency is guaranteed through blockchain's immutable ledger
Fees are minimized so maximum funds reach those in need
Trust is built through verifiable on-chain transactions
Healthcare equity is promoted across all socioeconomic backgrounds
We envision a world where medical financial emergencies can be crowdsourced efficiently, transparently, and compassionately through decentralized technology.

Key Features
1. Campaign Creation
Patients can create detailed medical fundraising campaigns
Set custom funding goals and campaign durations
Store campaign information securely on-chain
Each campaign has a unique ID for easy tracking
2. Transparent Donations
Anyone can donate cryptocurrency to support campaigns
All donations are recorded on the blockchain
Real-time tracking of funds raised
Individual donation amounts are tracked per donor
3. Secure Fund Withdrawal
Only campaign creators can withdraw their raised funds
Funds can be withdrawn after deadline or when goal is reached
Protection against duplicate withdrawals
Automatic campaign closure upon withdrawal
4. Campaign Monitoring
View complete campaign details including progress
Check deadline status and funding percentage
Track total number of campaigns on the platform
Verify donation history for any campaign
5. Smart Contract Security
Built with Solidity best practices
Input validation on all functions
Reentrancy protection through state changes
Clear error messages for failed transactions
Future Scope
Short-term Enhancements
Milestone-based Fund Release - Release funds in stages as treatment progresses
Medical Document Verification - Integration with IPFS for storing encrypted medical records
Refund Mechanism - Allow donors to request refunds if campaign is fraudulent
Campaign Categories - Categorize by medical condition (surgery, cancer treatment, emergency)
Donor Recognition - NFT receipts for donors as proof of contribution
Medium-term Developments
Multi-signature Withdrawals - Require approval from trusted parties before fund release
Direct Hospital Payments - Enable direct payment to medical institutions
Stablecoin Support - Accept USDC, DAI, and other stablecoins to reduce volatility
KYC Integration - Verify campaign creator identity to prevent fraud
Social Features - Comments, updates, and thank-you messages from patients
Mobile App - Native mobile application for iOS and Android
Long-term Vision
Cross-chain Compatibility - Support donations from multiple blockchain networks
AI-powered Fraud Detection - Machine learning to identify suspicious campaigns
Insurance Integration - Connect with insurance providers for partial coverage
DAO Governance - Community voting on platform improvements and dispute resolution
Global Partnerships - Collaborate with hospitals, NGOs, and healthcare organizations
Predictive Analytics - Help patients estimate realistic funding goals based on historical data
Recurring Donations - Enable monthly subscriptions to support ongoing treatments
Impact Reporting - Detailed analytics showing platform's social impact metrics
Technical Improvements
Layer 2 scaling solutions to reduce gas fees
Enhanced security audits and bug bounty programs
GraphQL API for third-party integrations
Advanced analytics dashboard
Multi-language support for global accessibility
Getting Started
Prerequisites
Node.js v16+ and npm/yarn
Hardhat or Truffle for smart contract deployment
MetaMask or similar Web3 wallet
Test ETH for deployment on testnets
Installation
Clone the repository
bash
git clone <repository-url>
cd medical-crowdfunding
Install dependencies
bash
npm install
Compile the smart contract
bash
npx hardhat compile
Deploy to testnet
bash
npx hardhat run scripts/deploy.js --network sepolia
Usage Example
Create a Campaign:

solidity
createCampaign(
    "Emergency Heart Surgery for John",
    "John needs urgent bypass surgery costing $50,000...",
    50000000000000000000000, // 50,000 in wei equivalent
    60 // 60 days duration
);
Donate to Campaign:

solidity
donate(0); // Donate to campaign ID 0
// Send ETH with the transaction
Withdraw Funds:

solidity
withdrawFunds(0); // Campaign creator withdraws from campaign ID 0
Contract Functions
Core Functions
createCampaign() - Create a new medical fundraising campaign
donate() - Donate ETH to a specific campaign
withdrawFunds() - Withdraw raised funds (campaign creator only)
View Functions
getCampaign() - Get complete campaign details
getDonationAmount() - Check donation by specific address
getTotalCampaigns() - Get total number of campaigns
isDeadlinePassed() - Check if campaign deadline has passed
getCampaignProgress() - Get funding progress percentage
License
This project is licensed under the MIT License.

Contributing
Contributions are welcome! Please feel free to submit a Pull Request.

Support
For questions or support, please open an issue in the repository.

Together, we can make healthcare accessible to everyone. 💙

Contract Address: 0xd9145CCE52D386f254917e481eB44e9943F39138
<img width="1912" height="918" alt="image" src="https://github.com/user-attachments/assets/fb8a0f89-10df-420e-bcc8-f9bffe39496e" />

