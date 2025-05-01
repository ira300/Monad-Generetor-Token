const hre = require("hardhat");

async function main() {
    console.log("🚀 Iniciando o deploy do TokenFactory...");

    const TokenFactory = await hre.ethers.getContractFactory("ContractTokenGerenation");
    console.log("📌 TokenFactory carregado com sucesso.");

    const tokenFactory = await TokenFactory.deploy();
    console.log("📌 Deploy iniciado...");

    await tokenFactory.waitForDeployment(); 

    const contractAddress = await tokenFactory.getAddress(); // fix
    console.log("✅ TokenFactory deployado em:", contractAddress);
}

main().catch((error) => {
    console.error("❌ Erro no deploy:", error);
    process.exitCode = 1;
});

