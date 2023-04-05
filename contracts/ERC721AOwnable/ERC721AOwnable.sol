// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Openzeppelin
import "@openzeppelin/contracts/access/Ownable.sol";
// ERC721ABase
import "./base/ERC721ABase.sol";

/**
 * @title NFT Sale with bulk mint discount
 * @author Bunzz, Inc.
 * @custom:version 1.0.9 
 * @notice
 * @dev feature decscirpiton here
 */
contract ERC721AOwnable is Ownable, ERC721ABase{

    // Review: recomendation to input setBaseURI function and having a reigstered data inside.
    // tokenURI is the string concatination of baseURI and tokenIndex.
    string private _baseURIextended;

    /**
     * @param name_ NFT Name
     * @param symbol_ NFT Symbol
     * @param startTokenId_ the first tokenId of NFT 
     */
    constructor(
        string memory name_,
        string memory symbol_,
        uint256 startTokenId_
    ) ERC721ABase(name_, symbol_, startTokenId_) {

    }

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

    /**
     * @dev If there are multiple variables, please pack them into a uint64.
     */
    function setAux(address owner, uint64 aux) public virtual onlyOwner {
        _setAux(owner, aux);
    }

    function baseURI() public view returns (string memory) {
        return _baseURI();
    }

    function exists(uint256 tokenId) public view returns (bool) {
        return _exists(tokenId);
    }

/**
 * @dev An external method for users to mint and receive NFTs. 
 * Caller is only the contract owner. 
 * Requirements:
 * - the sale is active.
 * - the minted NFTs will not exceed the `MAX_SUPPLY`.
 * - a sufficient payable value is sent.
 */
    function safeMint(address to, uint256 quantity) public virtual onlyOwner {
        _safeMint(to, quantity);
    }

// Reivew-1: Please remove this functoin. 
// Or input proper whitelist management modifier to control the caller of this funciton.
    function safeMint(
        address to,
        uint256 quantity,
        bytes memory _data
    ) public virtual {
        _safeMint(to, quantity, _data);
    }

// Review-2: Write the usage of this mint() funciton.
// What is the difference from safeMint if this mint() has same signature of safeMint() and same control level.
    function mint(address to, uint256 quantity) public virtual onlyOwner {
        _mint(to, quantity);
    }

    function burn(uint256 tokenId) public virtual onlyOwner {
        _burn(tokenId);
    }

/**
 * @dev
 * - how apprival check works
 */
    function burnWithApprovalCheck(
        uint256 tokenId,
        bool approvalCheck
    ) public virtual onlyOwner {
        _burn(tokenId, approvalCheck);
    }

    // Review-3: Need to input setBaseURI()
    /**
    * @dev Updates the baseURI that will be used to retrieve NFT metadata.
    * @param baseURI_ The baseURI to be used.
    */
    function setBaseURI(string memory baseURI_) public onlyOwner{
        _baseURIextended = baseURI_;
    }

    /**
    * @dev Orverride baseURI which will be concatiated with tokenIndex to get the tokenURI.
    * @return  
    */
    function _baseURI() internal view virtual override returns (string memory) {
        return _baseURIextended;
    }
}