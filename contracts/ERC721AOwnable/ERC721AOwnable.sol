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
 * - TODO
 */
contract ERC721AOwnable is Ownable, ERC721ABase{

    // Review-4: Need to input setBaseURI(): recomendation to input setBaseURI function and having a reigstered data inside.
    // tokenURI is the string concatination of baseURI and tokenIndex.
    string private _baseURIextended;
    uint256 public maxMintQuantity = 3;
    uint256 public maxSupply;
    uint256 public currentPrice;

    /**
     * @param name_ NFT Name
     * @param symbol_ NFT Symbol
     * @param startTokenId_ the starting number of tokenId
     * @param baseURI_ basement of URI concatinating with tokenId
     * @param price the price to sale NFT in Ethereum| precision:18
     * @param maxSupply_ the maximum supply of all NFTs
     */
    constructor(
        string memory name_,
        string memory symbol_,
        uint256 startTokenId_,
        string memory baseURI_,
        uint256 price,
        uint256 maxSupply_
    ) ERC721ABase(name_, symbol_, startTokenId_) {
        _baseURIextended = baseURI_;
        currentPrice = price;
        maxSupply = maxSupply_;
    }

/**
 * Main operation functions
 */

  /**
    * @dev only contact owner can mint a `quantity` of NFT.
    * Requirements:
    * - TODO
    * @param to the receiver's wallet address
    * @param quantity the quantity of minting NFT
    */
    function ownerMint(address to, uint256 quantity) public payable onlyOwner {
        uint256 ts = totalSupply();
        require(ts + quantity <= maxSupply, "Exceed totalSuuply");
        require(
            currentPrice * quantity == msg.value,
            "Value sent is not correct"
        );

        _safeMint(to, quantity);
    }

  /**
    * @dev anyone can mint the `quantity` of NFT up to `maxMintQuantity`.
    * Requirements:
    * - TODO
    * @param quantity the quantity of minting NFT
    */
    function mint(uint256 quantity) public payable {
        uint256 ts = totalSupply();
        require(ts + quantity <= maxSupply, "Exceed totalSuuply");
        require(_numberMinted(msg.sender) + quantity <= maxMintQuantity, "Too many NFT to mint for you.");
        require(
            currentPrice * quantity == msg.value,
            "Value sent is not correct"
        );

        _safeMint(msg.sender, quantity);
    }

  /** 
    * @dev Only contact owner can burn the NFT token by specifing the tokenId.
    * @param tokenId the tokenId of NFT
    */
    function burn(uint256 tokenId) public virtual onlyOwner {
        _burn(tokenId);
    }

    /**
     * @dev A way for the owner to withdraw all proceeds from the sale.
     */
    function withdraw() external onlyOwner {
        uint256 balance = address(this).balance;
        payable(msg.sender).transfer(balance);
    }

/**
 * Setter functions
 */

   /**
    * @dev Updates the baseURI that will be used to retrieve NFT metadata.
    * @param baseURI_ The baseURI to be used.
    */
    function setBaseURI(string memory baseURI_) public onlyOwner{
        _baseURIextended = baseURI_;
    }

   /**
    * @dev Only contract owner can update the maximum quantity for one user to mint NFT.
    * The default is 3 for one wallet address.
    * @param _maxMintQuantity the maximum quantity of NFTs
    */
    function setMaxMintQuantity(uint256 _maxMintQuantity) public onlyOwner {
        maxMintQuantity = _maxMintQuantity;
    }

   /**
    * @dev Only contract owner can update the total quantity of NFTs.
    * @param _maxSupply the quantity of total amount
    */
    function setMaxSupply(uint256 _maxSupply) public onlyOwner {
        maxSupply = _maxSupply;
    }


    /**
     * @dev Sets the price of each NFT during the initial sale.
     * @param price The price of each NFT during the initial sale | precision:18
     */
    function setCurrentPrice(uint256 price) external onlyOwner {
        currentPrice = price;
    }


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