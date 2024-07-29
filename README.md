# Foundry Fund Me

This project is a decentralized application (dApp) built using the solidity and Foundry framework, zkSync, and various other tools and technologies. The goal of this project is to provide a robust and efficient platform for funding and managing decentralized projects.

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Technologies Used](#technologies-used)
- [Installation](#installation)
- [Project Structure](#project-structure)
- [License](#license)
- [Acknowledgements](#acknowledgements)

## Introduction

It is an open source Crowdsourcing project built using solidity and foundry framework to accept the funds from the multiple user from the different cryptocurrencies and from different chains. The all the amount funded by the funders can be withdraw only by the owner of the contract. User can fund into the contracts using the wallet like MetaMask.
It also utilize the power of zkSync to enhance the devlopment process.

## Features

- Feature 1: Accept Funding of Ethereum and different currencies
- Feature 2: Withdrawing of funds only by the owner

## Technologies Used

- **Foundry**: A blazing fast, portable, and modular toolkit for Ethereum application development.
- **zkSync**: A user-centric zkRollup platform for scaling Ethereum.
- **Solidity**: The smart contract programming language.
- **Anvil**: A personal blockchain for Ethereum development.
- **Alchemy**: A blockchain developer platform and API.
- **MetaMask**: A local wallet for the do transactions in cryptocurrency.

### Prerequisites

- [NPM](https://nodejs.org/)
- [Node.js](https://nodejs.org/)
- [Foundry](https://github.com/gakonst/foundry)
- [zkSync](https://zksync.io/docs/tools/cli.html)
- [Alchemy API Key](https://www.alchemy.com/)
- Windows Subsystem for Linux (WSL)
- Make

## Installation

1. Clone the repository:
    ```sh
    git clone https://github.com/Fardeen26/Foundry-CrowdSourcing.git
    cd foundry-fund-me
    make
    ```

3. Set up environment variables:
    ```sh
    cp .env.example .env
    # Edit .env file to add your API keys and other configuration details
    ```

4. Compiling the project:
    ```sh
    make build
    ```

5. Deploy contracts:
    ```sh
    make deploy --network your-network
    ```

6. Deploy Sepolia
    ```sh
    make deploy-sepolia --args
    ```

7. Deploy ZkSync
    ```sh
    make deploy-zk --args
    ```

8. Deploy ZkSync Sepolia
    ```sh
    make deploy-zk-sepolia
    ```
    
## ZkSync Build
```sh
make zkbuild
```

## Update Dependencies

```sh
make update
```

### Running Tests

```sh
make test
```

## FuneMe

```sh
make fund --sender --network-args
```

## Withdraw

```sh
make withdraw --sender --network-args
```

## project-structure

- `contracts/`: Contains Solidity smart contracts.
- `scripts/`: Deployment and interaction scripts.
- `test/`: Test files for smart contracts.

## Acknowledgements

- Patrick Collins: [text](https://github.com/PatrickAlphaC)
- Cyfrin Updraft: [text](https://github.com/Cyfrin/Updraft)

## License

- MIT License