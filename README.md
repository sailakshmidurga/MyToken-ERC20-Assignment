# MyToken – ERC20 Assignment

This project is an ERC-20–style token implementation using Solidity and the Remix IDE.  
The assignment demonstrates deployment, token transfers, approvals, and delegated transfers using `transferFrom()`.

---

## Contract Information

Contract Name: MyToken  
Standard: Custom ERC-20–like token  

Features implemented:

1. Minting the initial supply to `msg.sender`  
2. `transfer()` to send tokens between accounts  
3. `approve()` to allow another account to spend tokens  
4. `transferFrom()` for delegated transfers  
5. `balanceOf()` to check address balances  
6. `allowance()` to check approved token amounts  
7. `getTokenInfo()` to return name, symbol, decimals, and total supply  

---

## Screenshot Descriptions

### Screenshot 1 – Compilation

Shows successful compilation of `MyToken.sol` in Remix.

### Screenshot 2 – Deployment

Shows the contract deployed in Remix VM with the initial supply.

### Screenshot 3 – Token Information

Displays the outputs of:
- `name`
- `symbol`
- `decimals`
- `totalSupply`
- `balanceOf` for the deployer address.

### Screenshot 4 – Transfer (Three Screenshots)

The token transfer process required multiple steps, so it is shown using three separate screenshots:

- Screenshot 4 Part 1: Balances before transfer  
- Screenshot 4 Part 2: `transfer()` transaction execution  
- Screenshot 4 Part 3: Updated balances after transfer  

These clearly demonstrate that `transfer()` is functioning correctly.

### Screenshot 5 – Approve and TransferFrom

Shows the `approve()` call from Account 0 to Account 1, and the `transferFrom()` call executed by Account 1.  
Remix logs confirm both `Approval` and `Transfer` events.

---

## How to Run the Project

1. Open Remix IDE  
2. Create a file named `MyToken.sol`  
3. Paste the contract code  
4. Compile using Solidity `0.8.x`  
5. Deploy using Remix VM  
6. Interact with the functions:
   - `balanceOf`
   - `transfer`
   - `approve`
   - `transferFrom`

---

## Assignment Completed

This assignment has been fully completed as required.  
The ERC-20–style token contract was implemented, compiled, deployed, and tested using the Remix IDE.  
All required functions such as `transfer`, `approve`, and `transferFrom` were demonstrated successfully.  
Screenshots of every step have been provided with explanations.  
The project submission includes the smart contract, screenshots, and this README documentation.
