// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract ANGOLA_USER_POOL {
    struct Pool {
        uint256[] ids;
        uint256 count;
    }

    mapping(address => Pool) private ownerPool;

    function _push(uint256 tokenId, address to) internal {
        ownerPool[to].ids.push(tokenId);
        ownerPool[to].count = ownerPool[to].count + 1;
    }

    function _pop(uint256 tokenId, address to) internal {
        for (uint i = 0; i < ownerPool[to].ids.length; i++) {
            if (tokenId == ownerPool[to].ids[i]) {
                delete ownerPool[to].ids[i];
                ownerPool[to].count = ownerPool[to].count - 1;
            }
        }
    }

    function getIds(address owner) public view returns (Pool memory) {
        return ownerPool[owner];
    }
}