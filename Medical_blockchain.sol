// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title MedicalCrowdfunding
 * @dev A decentralized platform for medical crowdfunding campaigns
 * @notice This contract allows patients to create campaigns and receive donations for medical expenses
 */
contract MedicalCrowdfunding {
    
    // Struct to store campaign details
    struct Campaign {
        address payable patient;
        string title;
        string description;
        uint256 goalAmount;
        uint256 raisedAmount;
        uint256 deadline;
        bool isActive;
        bool fundsWithdrawn;
    }
    
    // State variables
    mapping(uint256 => Campaign) public campaigns;
    mapping(uint256 => mapping(address => uint256)) public donations;
    uint256 public campaignCount;
    
    // Events
    event CampaignCreated(
        uint256 indexed campaignId,
        address indexed patient,
        string title,
        uint256 goalAmount,
        uint256 deadline
    );
    
    event DonationReceived(
        uint256 indexed campaignId,
        address indexed donor,
        uint256 amount
    );
    
    event FundsWithdrawn(
        uint256 indexed campaignId,
        address indexed patient,
        uint256 amount
    );
    
    /**
     * @dev Create a new medical crowdfunding campaign
     * @param _title Campaign title
     * @param _description Detailed description of medical need
     * @param _goalAmount Target amount to raise (in wei)
     * @param _durationDays Campaign duration in days
     */
    function createCampaign(
        string memory _title,
        string memory _description,
        uint256 _goalAmount,
        uint256 _durationDays
    ) external {
        require(_goalAmount > 0, "Goal amount must be greater than 0");
        require(_durationDays > 0, "Duration must be greater than 0");
        require(bytes(_title).length > 0, "Title cannot be empty");
        require(bytes(_description).length > 0, "Description cannot be empty");
        
        uint256 deadline = block.timestamp + (_durationDays * 1 days);
        
        campaigns[campaignCount] = Campaign({
            patient: payable(msg.sender),
            title: _title,
            description: _description,
            goalAmount: _goalAmount,
            raisedAmount: 0,
            deadline: deadline,
            isActive: true,
            fundsWithdrawn: false
        });
        
        emit CampaignCreated(
            campaignCount,
            msg.sender,
            _title,
            _goalAmount,
            deadline
        );
        
        campaignCount++;
    }
    
    /**
     * @dev Donate to a specific campaign
     * @param _campaignId ID of the campaign to donate to
     */
    function donate(uint256 _campaignId) external payable {
        require(_campaignId < campaignCount, "Campaign does not exist");
        require(msg.value > 0, "Donation amount must be greater than 0");
        
        Campaign storage campaign = campaigns[_campaignId];
        
        require(campaign.isActive, "Campaign is not active");
        require(block.timestamp < campaign.deadline, "Campaign has ended");
        
        campaign.raisedAmount += msg.value;
        donations[_campaignId][msg.sender] += msg.value;
        
        emit DonationReceived(_campaignId, msg.sender, msg.value);
    }
    
    /**
     * @dev Withdraw raised funds (only campaign creator can withdraw)
     * @param _campaignId ID of the campaign to withdraw from
     */
    function withdrawFunds(uint256 _campaignId) external {
        require(_campaignId < campaignCount, "Campaign does not exist");
        
        Campaign storage campaign = campaigns[_campaignId];
        
        require(msg.sender == campaign.patient, "Only patient can withdraw funds");
        require(!campaign.fundsWithdrawn, "Funds already withdrawn");
        require(campaign.raisedAmount > 0, "No funds to withdraw");
        require(
            block.timestamp >= campaign.deadline || campaign.raisedAmount >= campaign.goalAmount,
            "Campaign still active and goal not reached"
        );
        
        campaign.fundsWithdrawn = true;
        campaign.isActive = false;
        
        uint256 amount = campaign.raisedAmount;
        
        (bool success, ) = campaign.patient.call{value: amount}("");
        require(success, "Transfer failed");
        
        emit FundsWithdrawn(_campaignId, campaign.patient, amount);
    }
    
    // View functions
    
    /**
     * @dev Get campaign details
     * @param _campaignId ID of the campaign
     */
    function getCampaign(uint256 _campaignId) external view returns (
        address patient,
        string memory title,
        string memory description,
        uint256 goalAmount,
        uint256 raisedAmount,
        uint256 deadline,
        bool isActive,
        bool fundsWithdrawn
    ) {
        require(_campaignId < campaignCount, "Campaign does not exist");
        Campaign memory campaign = campaigns[_campaignId];
        
        return (
            campaign.patient,
            campaign.title,
            campaign.description,
            campaign.goalAmount,
            campaign.raisedAmount,
            campaign.deadline,
            campaign.isActive,
            campaign.fundsWithdrawn
        );
    }
    
    /**
     * @dev Get donation amount by a specific donor for a campaign
     * @param _campaignId ID of the campaign
     * @param _donor Address of the donor
     */
    function getDonationAmount(uint256 _campaignId, address _donor) external view returns (uint256) {
        return donations[_campaignId][_donor];
    }
    
    /**
     * @dev Get total number of campaigns
     */
    function getTotalCampaigns() external view returns (uint256) {
        return campaignCount;
    }
    
    /**
     * @dev Check if campaign deadline has passed
     * @param _campaignId ID of the campaign
     */
    function isDeadlinePassed(uint256 _campaignId) external view returns (bool) {
        require(_campaignId < campaignCount, "Campaign does not exist");
        return block.timestamp >= campaigns[_campaignId].deadline;
    }
    
    /**
     * @dev Get campaign progress percentage (in basis points, e.g., 7550 = 75.50%)
     * @param _campaignId ID of the campaign
     */
    function getCampaignProgress(uint256 _campaignId) external view returns (uint256) {
        require(_campaignId < campaignCount, "Campaign does not exist");
        Campaign memory campaign = campaigns[_campaignId];
        
        if (campaign.goalAmount == 0) return 0;
        
        return (campaign.raisedAmount * 10000) / campaign.goalAmount;
    }
}
