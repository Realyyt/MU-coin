pragma solidity >=0.6.0;

import "./SafeMath.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/security/Pausable.sol";

contract MUCoin is AccessControl, Pausable {
    using SafeMath for uint256;

    // Roles
    bytes32 public constant UNIVERSITY_ROLE = keccak256("UNIVERSITY_ROLE");
    bytes32 public constant ADMIN_ROLE = keccak256("ADMIN_ROLE");
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

    mapping(address => uint256) public balances;  // Mapping to store token balances of addresses
    uint256 public totalSupply;  // Variable to track the total token supply

    address public emergencyRecoveryAddress;  // Address for emergency fund recovery
    bool public isEmergencyMode;  // Flag to indicate if the contract is in emergency mode

    event Transfer(
        address indexed _from,
        address indexed _to,
        uint256 _value
    );

    // Constructor to initialize the contract with initial supply and the university address
    constructor(uint256 initialSupply, address _universityAddress) {
        // Setup roles for access control
        _setupRole(DEFAULT_ADMIN_ROLE, msg.sender);  // Set the contract deployer as an admin
        _setupRole(UNIVERSITY_ROLE, _universityAddress);  // Assign the university role
        _setRoleAdmin(MINTER_ROLE, UNIVERSITY_ROLE);  // Define that minters are controlled by the university
        totalSupply = initialSupply;  // Initialize the total supply
        balances[_universityAddress] = initialSupply;  // Assign the initial supply to the university
        emergencyRecoveryAddress = msg.sender;  // Set the initial emergency recovery address to the contract deployer
    }

    // Function to mint new tokens and assign them to a specified address
    function mint(address to, uint256 amount) public onlyRole(MINTER_ROLE) whenNotPaused {
        require(amount > 0, "Amount must be greater than zero");  // Ensure the minted amount is valid
        require(totalSupply + amount >= totalSupply, "Minting would cause overflow");  // Prevent overflow
        totalSupply += amount;  // Increase the total supply
        balances[to] += amount;  // Assign minted tokens to the target address
        emit Transfer(msg.sender, to, amount);  // Emit a transfer event
    }

    // Function to toggle the emergency mode and set a new emergency recovery address
    function toggleEmergencyMode(address newEmergencyRecoveryAddress) public onlyRole(ADMIN_ROLE) whenNotPaused {
        isEmergencyMode = !isEmergencyMode;  // Toggle the emergency mode flag
        if (isEmergencyMode) {
            require(newEmergencyRecoveryAddress != address(0), "New emergency recovery address cannot be zero address");
            emergencyRecoveryAddress = newEmergencyRecoveryAddress;  // Set the new emergency recovery address
        }
    }

    // Function to recover funds in emergency mode when the contract is paused
    function emergencyRecoverFunds(uint256 amount) public whenPaused {
        require(msg.sender == emergencyRecoveryAddress, "Only the emergency recovery address can recover funds");
        require(amount <= address(this).balance, "Insufficient balance to recover");
        payable(emergencyRecoveryAddress).transfer(amount);  // Transfer the specified amount to the emergency recovery address
    }

    // Event to log minting activity
    event Minted(address minter, address to, uint256
