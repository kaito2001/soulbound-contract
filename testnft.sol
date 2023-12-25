// SPDX-License-Identifier: GPL-3.0-only
pragma solidity >=0.8.0;

import "lib/solmate/src/tokens/ERC721.sol";

contract NFT is ERC721 {
    constructor() ERC721("NFT Token", "NFT") {}

    function mint(address to, uint256 id) public {
        _mint(to, id);
    }

    function tokenURI(uint256) public pure override returns (string memory) {
        return "https://google.com";
    }
}
