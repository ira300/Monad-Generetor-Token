# Monad Flavored Hardhat Launcher

This project demonstrates a use case for generating tokens on the Monad network from Hardhat Optimize.

## Project Structure

```
hardhat-monad/
├── contracts/             
│   └── TokenFactory.sol   
├── .env.example           
├── hardhat.config.ts      
├── package.json
├── artifacts   
└── tsconfig.json          
├── scripts/             
│   └── deploy.sol           
```

## Getting Started

### Prerequisites

- Node.js (v16+)

### Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/portdeveloper/hardhat-monad.git
   cd hardhat-monad
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Create a `.env` file based on `.env.example`:
   ```bash
   cp .env.example .env
   ```

4. Add your private key to the `.env` file:
   ```
   PRIVATE_KEY=your_private_key_here
   ```
   ⚠️ **IMPORTANT**: Never commit your `.env` file or expose your private key.


## How to deploy your contract

This project uses Hardhat Ignition for deployments, which makes it easy to manage complex deployment procedures.

```bash
npx hardhat run scripts/deploy.js --network monadTestnet
```

## How to verify your contract

This project is configured to use Sourcify for contract verification on Monad. After deployment, you can verify your contract with:

```bash
npx hardhat verify --network monadTestnet <contract_address> 
```

Once verified, you can view your contract on the [Monad Explorer](https://testnet.monadexplorer.com).

## Customizing the Lock Contract



## Got questions?

- Refer to [docs.monad.xyz](https://docs.monad.xyz) for Monad-specific documentation
- Visit [Hardhat Documentation](https://hardhat.org/docs) for Hardhat help
- Check [Hardhat Ignition Guide](https://hardhat.org/ignition/docs/getting-started) for deployment assistance



