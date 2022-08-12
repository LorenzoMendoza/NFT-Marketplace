// SPDX-Licens-Identifier: MIT

pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract Marketplace is ReentrancyGuard {

    address payable public immutable feeAccount;
    uint public immutable feePercent;
    uint public itemCount;

    struct Item {
        uint itemID;
        IERC721 nft;
        uint tokenID;
        uint price;
        address payable seller;
        bool sold;
    }

    //itemId -> Item(struct)

    mapping(uint => Item) public items;

    constructor (uint _feePercent) {
        feeAccount = payable(msg.sender);
        feePercent = _feePercent;
    }
}