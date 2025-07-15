// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IERC20 {
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
}

contract HealthRecordAccess {
    address public patient;
    IERC20 public token;

    mapping(string => string) private reports;
    mapping(address => bool) public approvedDoctors;
    mapping(address => bool) public approvedResearchers;

    struct AccessEvent {
        address accessor;
        string reportType;
        uint256 timestamp;
    }

    AccessEvent[] public accessLog;

    constructor(address _tokenAddress) {
        patient = msg.sender;
        token = IERC20(_tokenAddress);
    }

    function uploadReport(string memory reportType, string memory cid) public {
        require(msg.sender == patient, "Only patient can upload");
        reports[reportType] = cid;
    }

    function approveDoctor(address doctor) public {
        require(msg.sender == patient, "Only patient can approve doctors");
        approvedDoctors[doctor] = true;
    }

    function approveResearcher(address researcher) public {
        require(msg.sender == patient, "Only patient can approve researchers");
        approvedResearchers[researcher] = true;
    }

    function getReportCID(string memory reportType) public returns (string memory) {
        require(approvedDoctors[msg.sender] || approvedResearchers[msg.sender], "Not approved");

        // Doctor/Researcher pays 1 HLTH directly to patient
        bool success = token.transferFrom(msg.sender, patient, 1 ether);
        require(success, "Token transfer failed");

        accessLog.push(AccessEvent(msg.sender, reportType, block.timestamp));
        return reports[reportType];
    }

    function getAccessLogCount() public view returns (uint256) {
        return accessLog.length;
    }

    function getAccessLog(uint256 index) public view returns (address, string memory, uint256) {
        AccessEvent memory eventInfo = accessLog[index];
        return (eventInfo.accessor, eventInfo.reportType, eventInfo.timestamp);
    }
}
