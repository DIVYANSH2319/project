// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Interface for ERC-20 token (optional) for payment
interface IERC20 {
    function transfer(address recipient, uint256 amount) external returns (bool);
    function balanceOf(address account) external view returns (uint256);
}

// Main contract for the On-Chain Tutoring Service
contract OnChainTutoring {

    // Declare the ERC-20 token (if used for payments, otherwise use native token)
    IERC20 public paymentToken;

    // Structure to store tutor and student session details
    struct TutoringSession {
        address tutor;             // Tutor's address
        address student;           // Student's address
        uint256 sessionFee;        // The fee for the session (in tokens or ether)
        uint256 deposit;           // Deposit made by the student
        bool isCompleted;          // Flag to indicate if the session is completed
        bool isRefunded;           // Flag to indicate if the session was refunded
    }

    // Mapping to store ongoing tutoring sessions (sessionId -> session details)
    mapping(uint256 => TutoringSession) public sessions;

    // Event to notify when a session is booked
    event SessionBooked(address indexed student, address indexed tutor, uint256 sessionId, uint256 sessionFee);

    // Event to notify when a session is marked as completed and payment is released
    event SessionCompleted(uint256 sessionId);

    // Event to notify when a session is refunded
    event SessionRefunded(uint256 sessionId);

    // Counter to generate session IDs
    uint256 public sessionIdCounter;

    // Constructor to set the ERC-20 token (or use native ether)
    constructor(address _paymentToken) {
        paymentToken = IERC20(_paymentToken);
    }

    // Function 1: Book a tutoring session
    function bookSession(address tutor, uint256 sessionFee) external {
        require(sessionFee > 0, "Session fee must be greater than 0");
        require(tutor != msg.sender, "You cannot book a session with yourself");

        // Transfer the deposit from the student to the contract
        uint256 deposit = sessionFee / 2;  // Example: Student pays half as deposit
        require(paymentToken.balanceOf(msg.sender) >= deposit, "Insufficient balance for deposit");
        paymentToken.transfer(address(this), deposit);  // Lock the deposit in the contract

        // Increment the session ID and store session details
        uint256 sessionId = sessionIdCounter++;
        sessions[sessionId] = TutoringSession({
            tutor: tutor,
            student: msg.sender,
            sessionFee: sessionFee,
            deposit: deposit,
            isCompleted: false,
            isRefunded: false
        });

        // Emit event for session booking
        emit SessionBooked(msg.sender, tutor, sessionId, sessionFee);
    }

    // Function 2: Complete the session and transfer payment
    function completeSession(uint256 sessionId) external {
        TutoringSession storage session = sessions[sessionId];

        // Ensure only the tutor can complete the session
        require(session.tutor == msg.sender, "Only the tutor can complete the session");
        require(!session.isCompleted, "Session already completed");

        // Mark the session as completed
        session.isCompleted = true;

        // Calculate the total payment (session fee minus deposit)
        uint256 totalPayment = session.sessionFee - session.deposit;

        // Transfer the remaining session fee to the tutor
        require(paymentToken.balanceOf(address(this)) >= totalPayment, "Insufficient contract balance");
        paymentToken.transfer(session.tutor, totalPayment);

        // Emit event for session completion and payment release
        emit SessionCompleted(sessionId);
    }

    // Function to refund the student in case of a canceled session or dispute
    function refundSession(uint256 sessionId) external {
        TutoringSession storage session = sessions[sessionId];

        // Only the tutor can refund the session
        require(session.tutor == msg.sender, "Only the tutor can issue a refund");
        require(!session.isCompleted, "Cannot refund after session completion");
        require(!session.isRefunded, "Session already refunded");

        // Refund the deposit to the student
        paymentToken.transfer(session.student, session.deposit);
        session.isRefunded = true;

        // Emit event for session refund
        emit SessionRefunded(sessionId);
    }
}
