// SPDX-License-Identifier: GPL-3.0-only

pragma solidity >=0.8.0;

import "lib/solmate/src/tokens/ERC721.sol";

contract Test_Sbl is ERC721 {

    address public immutable addr_nft;
    address public immutable xEco;

    error Deny();

    mapping(address => uint256) public owner_sbts;

    uint256 public next = 1;

    event Mint(address indexed usr, uint256 indexed sid, uint256 indexed nft_id);

    constructor(address xEco_, address addrNft_) ERC721("SoulBound","Soul") {
        xEco = xEco_; 
        addr_nft = addrNft_;
    }

    function mint(uint256 nft_id) public {
        if(ERC721(addr_nft).ownerOf(nft_id) != msg.sender) revert Deny();

        uint256 sid;

        unchecked {
            sid = next++;
        }

        _mint(msg.sender, sid);

        emit Mint(msg.sender, sid, nft_id);
    }

    function bond(uint256 sid, address addr_user) public {
        if (ownerOf[sid] != msg.sender) revert Deny();
    
        owner_sbts[addr_user] = sid;
    }

    function tokenURI(uint256 sid) public view override returns (string memory) {

    }

    function checkOwnerSbt(address addr_user) public view returns (bool) {
        if(owner_sbts[addr_user] != 0) return true;
        else return false;
    }

}