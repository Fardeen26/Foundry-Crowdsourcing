# Foundry CrowdSourcing

This project is a decentralized application (dApp) built using Solidity and the Foundry framework, zkSync, and various other tools and technologies. The goal of this project is to provide a robust and efficient platform for funding and managing decentralized projects.

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Technologies Used](#technologies-used)
- [Installation](#installation)
- [Project Structure](#project-structure)
- [License](#license)
- [Acknowledgements](#acknowledgements)

## Introduction

Foundry CrowdSourcing is an open-source project built using Solidity and the Foundry framework to accept funds from multiple users in different cryptocurrencies and from different chains. All the amounts funded by the contributors can only be withdrawn by the owner of the contract. Users can fund the contracts using wallets like MetaMask. It also utilizes the power of zkSync to enhance the development process.

## Features

- Accepts funding in Ethereum and various other currencies
- Funds can only be withdrawn by the owner

## Technologies Used

- **Foundry**: A blazing fast, portable, and modular toolkit for Ethereum application development.
- **zkSync**: A user-centric zkRollup platform for scaling Ethereum.
- **Solidity**: The smart contract programming language.
- **Anvil**: A personal blockchain for Ethereum development.
- **Alchemy**: A blockchain developer platform and API.
- **MetaMask**: A local wallet for cryptocurrency transactions.

### Prerequisites

- [NPM](https://nodejs.org/)
- [Node.js](https://nodejs.org/)
- [Foundry](https://github.com/gakonst/foundry)
- [zkSync CLI](https://zksync.io/docs/tools/cli.html)
- [Alchemy API Key](https://www.alchemy.com/)
- Windows Subsystem for Linux (WSL)
- Make

## Installation

1. Clone the repository:
    ```sh
    git clone https://github.com/Fardeen26/Foundry-CrowdSourcing.git
    cd foundry-crowdsourcing
    make
    ```

2. Set up environment variables:
    ```sh
    cp .env.example .env
    # Edit .env file to add your API keys and other configuration details
    ```

3. Compile the project:
    ```sh
    make build
    ```

4. Deploy contracts:
    ```sh
    make deploy --network your-network
    ```

5. Deploy on Sepolia:
    ```sh
    make deploy-sepolia --args
    ```

6. Deploy on zkSync:
    ```sh
    make deploy-zk --args
    ```

7. Deploy on zkSync Sepolia:
    ```sh
    make deploy-zk-sepolia
    ```

## Building with zkSync

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