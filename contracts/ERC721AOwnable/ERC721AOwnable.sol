// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Openzeppelin
import "@openzeppelin/contracts/access/Ownable.sol";
// ERC721ABase
import "./base/ERC721ABase.sol";

/**
 * @title ERC721A-based NFT sale contract
 * @author kazunetakeda25
 * @custom:version 1.0.2
 * @dev ERC721 contract which the following features
 * - NFT sale with an configurable price.
 * - Reserve function for the contract owner to mint free NFTs.
 * - Fixed maximum supply.
 */

contract ERC721AOwnable is Ownable, ERC721ABase {
    string private _baseURIextended;

    uint256 public maxMintPerWallet;
    uint256 public maxTotalSupply;
    uint256 public mintPrice;

    // Errors
    error ExceedMaxTotalSupply();
    error ExceedMaxMintPerWallet();
    error InsufficientMintAmount();

    /**
     * @param name_ NFT Name
     * @param symbol_ NFT Symbol
     * @param startTokenId_ the starting number of tokenId
     * @param baseURI_ basement of URI concatinating with tokenId
     * @param maxMintPerWallet_ maximum number of nft individual wallet can mint (zero means unlimitted)
     * @param maxTotalSupply_ the maximum supply of NFT collection (zero means unlimitted)
     * @param mintPrice_ the mint price of the NFT (in ETH) (zero means for free)
     */
    constructor(
        string memory name_,
        string memory symbol_,
        uint256 startTokenId_,
        string memory baseURI_,
        uint256 maxMintPerWallet_,
        uint256 maxTotalSupply_,
        uint256 mintPrice_
    ) ERC721ABase(name_, symbol_, startTokenId_) {
        _baseURIextended = baseURI_;
        maxMintPerWallet = maxMintPerWallet_;
        maxTotalSupply = maxTotalSupply_;
        mintPrice = mintPrice_;
    }

    /**
     * @dev only contact owner can mint a `quantity` of NFT for free.
     * Requirements:
     * - total quantity of NFT will not be exceed the maxSupply.
     * @param to the receiver's wallet address
     * @param quantity the quantity of minting NFT
     */
    function ownerMint(address to, uint256 quantity) public onlyOwner {
        uint256 currentSupply = totalSupply();
        if (maxTotalSupply > 0 && currentSupply + quantity > maxTotalSupply) {
            revert ExceedMaxTotalSupply();
        }

        _safeMint(to, quantity);
    }

    /**
     * @dev anyone can mint the `quantity` of NFT up to `maxMintQuantity`.
     * Requirements:
     * - the max mintable qunatitiy for one user is `maxMintQuantity`.
     * - total quantity of NFT will not be exceed the `maxSupply`.
     * - sender should pay the exact amount of price * quantity.
     * @param quantity the quantity of minting NFT
     */
    function mint(uint256 quantity) public payable {
        uint256 currentSupply = totalSupply();
        if (maxTotalSupply > 0 && currentSupply + quantity > maxTotalSupply) {
            revert ExceedMaxTotalSupply();
        }

        uint256 minted = _numberMinted(msg.sender);
        if (maxMintPerWallet > 0 && minted + quantity > maxMintPerWallet) {
            revert ExceedMaxMintPerWallet();
        }

        if (mintPrice * quantity != msg.value) {
            revert InsufficientMintAmount();
        }

        _safeMint(msg.sender, quantity);
    }

    /**
     * @dev A way for the owner to withdraw all proceeds from the sale.
     */
    function withdraw() external onlyOwner {
        uint256 balance = address(this).balance;
        payable(msg.sender).transfer(balance);
    }

    /**
     * @dev Updates the baseURI that will be used to retrieve NFT metadata.
     * @param baseURI_ The baseURI to be used.
     */
    function setBaseURI(string memory baseURI_) external onlyOwner {
        _baseURIextended = baseURI_;
    }

    /**
     * @dev Only contract owner can update the maximum quantity for one user to mint NFT.
     * The default is 3 for one wallet address.
     * @param maxMintPerWallet_ the maximum quantity of NFTs
     */
    function setMaxMintPerWallet(uint256 maxMintPerWallet_) external onlyOwner {
        maxMintPerWallet = maxMintPerWallet_;
    }

    /**
     * @dev Only contract owner can update the total supply of NFTs.
     * @param maxTotalSupply_ the quantity of total amount
     */
    function setMaxTotalSupply(uint256 maxTotalSupply_) external onlyOwner {
        maxTotalSupply = maxTotalSupply_;
    }

    /**
     * @dev Sets the price of each NFT during the initial sale.
     * @param mintPrice_ The price of each NFT during the initial sale | precision:18
     */
    function setMintPrice(uint256 mintPrice_) external onlyOwner {
        mintPrice = mintPrice_;
    }

    /**
     * @dev getter of _baseURI
     * @return _baseURI
     */
    function baseURI() public view returns (string memory) {
        return _baseURI();
    }

    /**
     * @dev Only contact owner can burn the NFT token by specifing the tokenId.
     * @param tokenId the tokenId of NFT
     */
    function burn(uint256 tokenId) public virtual onlyOwner {
        // Your custom tokenId check here, admin can burn any tokens without token owner's permission
        // TODO: custom code

        _burn(tokenId);
    }

    /**
     * @dev check if the tokenId exists or not.
     * @param tokenId the tokenId of NFT
     * @return boolean
     */
    function exists(uint256 tokenId) public view returns (bool) {
        return _exists(tokenId);
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
     * @dev Orverride baseURI which will be concatiated with tokenIndex to get the tokenURI.
     * @return  _baseURIextended baseURI stored inside this contract.
     */
    function _baseURI() internal view virtual override returns (string memory) {
        return _baseURIextended;
    }
}
