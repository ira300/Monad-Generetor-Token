const hre = require("hardhat");

async function main() {
  const [deployer] = await hre.ethers.getSigners();
  console.log("Deploying contracts with the account:", deployer.address);

  const Paywall = await hre.ethers.getContractFactory("GameAccessPaywall");

  const fee = hre.ethers.parseEther("0.005"); 
  const paywall = await Paywall.deploy(fee);

  await paywall.waitForDeployment();

  const address = await paywall.getAddress();
  console.log("✅ GameAccessPaywall deployed to:", address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});

