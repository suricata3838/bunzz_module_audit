// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Openzeppelin
import "@openzeppelin/contracts/access/Ownable.sol";
// ERC721ABase
import "./base/ERC721ABase.sol";

/**
 * @title ERC721A-based NFT sale contract
 * @author Bunzz, Inc.
 * @custom:version 1.0.9 
 * @dev ERC721 contract which the following features
 * - 
 */
contract ERC721AOwnable is Ownable, ERC721ABase{

    // Review-4: Need to input setBaseURI(): recomendation to input setBaseURI function and having a reigstered data inside.
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

  /**
    * @dev only contact owner can mint a `quantity` of NFT.
    * Requirements: no.
    * @param to the receiver's wallet address
    * @param quantity the quantity of minting NFT
    */
    function safeMint(address to, uint256 quantity) public virtual onlyOwner {
        _safeMint(to, quantity);
    }

// Reivew-2: Please remove this functoin. 
// Or input proper whitelist management modifier to control the caller of this funciton.
    // function safeMint(
    //     address to,
    //     uint256 quantity,
    //     bytes memory _data
    // ) public virtual {
    //     _safeMint(to, quantity, _data);
    // }

// Review-3: Write the usage of this mint() funciton.
// What is the difference from safeMint if this mint() has same signature of safeMint() and same control level.
  /**
    * @dev Only contact owner can mint a `quantity` of NFT.
    * Requirements: no.
    * @param to the receiver address
    * @param quantity the quantity of minting NFT
    */
    function mint(address to, uint256 quantity) public virtual onlyOwner {
        _mint(to, quantity);
    }

  /** 
    * @dev Only contact owner can burn the NFT token by specifing the tokenId.
    * @param tokenId the tokenId of NFT
    */
    function burn(uint256 tokenId) public virtual onlyOwner {
        _burn(tokenId);
    }

// Review: if you don't explain how to use approvalCheck, please delete this function.
// /**
//  * @dev see {ERC721ABase-_burn}
//  */
//     function burnWithApprovalCheck(
//         uint256 tokenId,
//         bool approvalCheck
//     ) public virtual onlyOwner {
//         _burn(tokenId, approvalCheck);
//     }

  /**
   * Setter functions
   */
    // Review-4: Need to input setBaseURI()
   /**
    * @dev Updates the baseURI that will be used to retrieve NFT metadata.
    * @param baseURI_ The baseURI to be used.
    */
    function setBaseURI(string memory baseURI_) public onlyOwner{
        _baseURIextended = baseURI_;
    }

    // Review-1: can you remove this Aux function?
    // function setAux(address owner, uint64 aux) public virtual onlyOwner {
    //     _setAux(owner, aux);
    // }

  /**
   * Getter functions
   */

  /**
   * @dev Orverride baseURI which will be concatiated with tokenIndex to get the tokenURI.
   * @return  _baseURIextended baseURI stored inside this contract.
   */
    function _baseURI() internal view virtual override returns (string memory) {
        return _baseURIextended;
    }

   /**
    * @dev return the number of NFT which the owner has minted so far.
    * @param owner the address of NFT owner
    * @return numberMinted
    */
    function numberMinted(address owner) public view returns (uint256) {
        return _numberMinted(owner);
    }

   /**
    * @dev return the number of NFT which the owner has burned so far.
    * @param owner the address of NFT owner
    * @return numberBurned
    */
    function numberBurned(address owner) public view returns (uint256) {
        return _numberBurned(owner);
    }

   /**
    * @dev reutrn the number of all minted tokens without considering burned tokens.
    */
    function totalMinted() public view returns (uint256) {
        return _totalMinted();
    }

    // Review-1: can you remove this Aux function?
    // function getAux(address owner) public view returns (uint64) {
    //     return _getAux(owner);
    // }

   /**
    * @dev getter of _baseURI
    * @return _baseURI
    */
    function baseURI() public view returns (string memory) {
        return _baseURI();
    }

   /**
    * @dev check if the tokenId exists or not.
    * @param tokenId the tokenId of NFT
    * @return boolean
    */
    function exists(uint256 tokenId) public view returns (bool) {
        return _exists(tokenId);
    }

}