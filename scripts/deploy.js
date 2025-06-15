const readline = require("readline");
const hre = require("hardhat");

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

async function main() {
  rl.question("What is the name of your token? ", async (name) => {
    rl.question("What is the symbol of your token? ", async (symbol) => {
      rl.question("What is the initial supply? ", async (initialSupply) => {
        console.log("Iniciando o deploy...");
        const TokenFactory = await hre.ethers.getContractFactory("TokenFactory");
        const tokenFactory = await TokenFactory.deploy();
        console.log("TokenFactory deployed on:", tokenFactory.address);
        const tx = await tokenFactory.createToken(name, symbol, initialSupply);
        await tx.wait();
        console.log("Token generated successfully!!");
        rl.close();
      });
    });
  });
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});

