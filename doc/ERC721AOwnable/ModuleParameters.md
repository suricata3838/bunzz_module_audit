## ERC721AOwnable

ERC721 contract which the following features
- NFT sale with an configurable price.
- Reserve function for the contract owner to mint free NFTs.
- Fixed maximum supply.

```solidity
constructor(string name_, string symbol_, uint256 startTokenId_, string baseURI_, uint256 price, uint256 maxSupply_) public
```

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| name_ | string | NFT Name |
| symbol_ | string | NFT Symbol |
| startTokenId_ | uint256 | the starting number of tokenId |
| baseURI_ | string | basement of URI concatinating with tokenId |
| price | uint256 | the price to sale NFT in Ethereum| precision:18 |
| maxSupply_ | uint256 | the maximum supply of all NFTs |