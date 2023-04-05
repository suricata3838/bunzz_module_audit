// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Openzeppelin
import "@openzeppelin/contracts/access/Ownable.sol";
// ERC721ABase
import "./base/ERC721ABase.sol";

contract ERC721AOwnable is Ownable, ERC721ABase {
    constructor(
        string memory name_,
        string memory symbol_,
        uint256 startTokenId_
    ) ERC721ABase(name_, symbol_, startTokenId_) {}

    function numberMinted(address owner) public view returns (uint256) {
        return _numberMinted(owner);
    }

    function numberBurned(address owner) public view returns (uint256) {
        return _numberBurned(owner);
    }

    function totalMinted() public view returns (uint256) {
        return _totalMinted();
    }

    function getAux(address owner) public view returns (uint64) {
        return _getAux(owner);
    }

    function setAux(address owner, uint64 aux) public virtual onlyOwner {
        _setAux(owner, aux);
    }

    function baseURI() public view returns (string memory) {
        return _baseURI();
    }

    function exists(uint256 tokenId) public view returns (bool) {
        return _exists(tokenId);
    }

    function safeMint(address to, uint256 quantity) public virtual onlyOwner {
        _safeMint(to, quantity);
    }

    function safeMint(
        address to,
        uint256 quantity,
        bytes memory _data
    ) public virtual {
        _safeMint(to, quantity, _data);
    }

    function mint(address to, uint256 quantity) public virtual onlyOwner {
        _mint(to, quantity);
    }

    function burn(uint256 tokenId) public virtual onlyOwner {
        _burn(tokenId);
    }

    function burnWithApprovalCheck(
        uint256 tokenId,
        bool approvalCheck
    ) public virtual onlyOwner {
        _burn(tokenId, approvalCheck);
    }
}