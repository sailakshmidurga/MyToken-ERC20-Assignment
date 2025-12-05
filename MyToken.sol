// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyToken {
    // Token metadata
    string public name = "MyToken";
    string public symbol = "MTK";
    uint8 public decimals = 18;
    uint256 public totalSupply;

    // Balances
    mapping(address => uint256) public balanceOf;

    // Allowances: owner => spender => amount
    mapping(address => mapping(address => uint256)) public allowance;

    // Events
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    constructor(uint256 _initialSupply) {
        require(_initialSupply > 0, "Initial supply must be > 0");

        totalSupply = _initialSupply;
        balanceOf[msg.sender] = _initialSupply;

        emit Transfer(address(0), msg.sender, _initialSupply);
    }

    // Internal reusable transfer function
    function _transfer(address _from, address _to, uint256 _value) internal {
        require(_from != address(0), "Cannot transfer from zero address");
        require(_to != address(0), "Cannot transfer to zero address");
        require(balanceOf[_from] >= _value, "Insufficient balance");

        unchecked {
            balanceOf[_from] -= _value;
            balanceOf[_to] += _value;
        }

        emit Transfer(_from, _to, _value);
    }

    // Public transfer
    function transfer(address _to, uint256 _value) public returns (bool) {
        _transfer(msg.sender, _to, _value);
        return true;
    }

    // Approve spender
    function approve(address _spender, uint256 _value) public returns (bool) {
        require(_spender != address(0), "Cannot approve zero address");
        require(
            _value == 0 || allowance[msg.sender][_spender] == 0,
            "Must set allowance to 0 before changing"
        );

        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);

        return true;
    }

    // Increase allowance safely
    function increaseAllowance(address _spender, uint256 _addedValue)
        public
        returns (bool)
    {
        require(_spender != address(0), "Cannot approve zero address");

        allowance[msg.sender][_spender] += _addedValue;

        emit Approval(msg.sender, _spender, allowance[msg.sender][_spender]);
        return true;
    }

    // Decrease allowance safely
    function decreaseAllowance(address _spender, uint256 _subtractedValue)
        public
        returns (bool)
    {
        require(_spender != address(0), "Cannot approve zero address");

        uint256 current = allowance[msg.sender][_spender];
        require(current >= _subtractedValue, "Allowance too low");

        allowance[msg.sender][_spender] = current - _subtractedValue;

        emit Approval(msg.sender, _spender, allowance[msg.sender][_spender]);
        return true;
    }

    // transferFrom with proper zero-address checks
    function transferFrom(address _from, address _to, uint256 _value)
        public
        returns (bool)
    {
        require(_from != address(0), "Cannot transfer from zero address");
        require(_to != address(0), "Cannot transfer to zero address");
        require(allowance[_from][msg.sender] >= _value, "Insufficient allowance");

        allowance[_from][msg.sender] -= _value;

        _transfer(_from, _to, _value);
        return true;
    }

    // Helper (optional)
    function getTokenInfo()
        public
        view
        returns (string memory, string memory, uint8, uint256)
    {
        return (name, symbol, decimals, totalSupply);
    }
}
