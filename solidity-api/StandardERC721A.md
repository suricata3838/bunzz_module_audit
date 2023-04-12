## StandardERC721A

NFT, Sale, ERC721, ERC721A

ERC721A NFT with the following features:

 - Built-in sale with an adjustable price.
 - Reserve function for the owner to mint free NFTs.
 - Fixed maximum supply.
 - Reduced Gas costs when minting many NFTs at the same time.

### saleIsActive

```solidity
bool saleIsActive
```

### MAX_SUPPLY

```solidity
uint256 MAX_SUPPLY
```

### currentPrice

```solidity
uint256 currentPrice
```

### walletLimit

```solidity
uint256 walletLimit
```

### constructor

```solidity
constructor(string _name, string _symbol, string _uri, uint256 price, uint256 maxSupply) public payable
```

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| _name | string | NFT Name |
| _symbol | string | NFT Symbol |
| _uri | string | Token URI used for metadata |
| price | uint256 | Initial Price | precision:18 |
| maxSupply | uint256 | Maximum # of NFTs |

### mint

```solidity
function mint(uint256 amount) external payable
```

An external method for users to purchase and mint NFTs. Requires that the sale
is active, that the minted NFTs will not exceed the `MAX_SUPPLY`, and that a
sufficient payable value is sent.

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| amount | uint256 | The number of NFTs to mint. |

### reserve

```solidity
function reserve(address to, uint256 amount) external
```

A way for the owner to reserve a specifc number of NFTs without having to
interact with the sale.

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| to | address | The address to send reserved NFTs to. |
| amount | uint256 | The number of NFTs to reserve. |

### withdraw

```solidity
function withdraw() external
```

A way for the owner to withdraw all proceeds from the sale.

### setSaleIsActive

```solidity
function setSaleIsActive(bool isActive) external
```

Sets whether or not the NFT sale is active.

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| isActive | bool | Whether or not the sale will be active. |

### setCurrentPrice

```solidity
function setCurrentPrice(uint256 price) external
```

Sets the price of each NFT during the initial sale.

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| price | uint256 | The price of each NFT during the initial sale | precision:18 |

### setBaseURI

```solidity
function setBaseURI(string baseURI_) external
```

Updates the baseURI that will be used to retrieve NFT metadata.

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| baseURI_ | string | The baseURI to be used. |

### _baseURI

```solidity
function _baseURI() internal view virtual returns (string)
```

Base URI for computing {tokenURI}. If set, the resulting URI for each
token will be the concatenation of the `baseURI` and the `tokenId`. Empty
by default, can be overriden in child contracts.



NFT, Sale, ERC721, ERC721A

ERC721A NFT with the following features:

 - Built-in sale with an adjustable price.
 - Reserve function for the owner to mint free NFTs.
 - Fixed maximum supply.
 - Reduced Gas costs when minting many NFTs at the same time.

### saleIsActive

```solidity
bool saleIsActive
```

### MAX_SUPPLY

```solidity
uint256 MAX_SUPPLY
```

### currentPrice

```solidity
uint256 currentPrice
```

### walletLimit

```solidity
uint256 walletLimit
```

### constructor

```solidity
constructor(string _name, string _symbol, string _uri, uint256 price, uint256 maxSupply) public payable
```

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| _name | string | NFT Name |
| _symbol | string | NFT Symbol |
| _uri | string | Token URI used for metadata |
| price | uint256 | Initial Price | precision:18 |
| maxSupply | uint256 | Maximum # of NFTs |

### mint

```solidity
function mint(uint256 amount) external payable
```

An external method for users to purchase and mint NFTs. Requires that the sale
is active, that the minted NFTs will not exceed the `MAX_SUPPLY`, and that a
sufficient payable value is sent.

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| amount | uint256 | The number of NFTs to mint. |

### reserve

```solidity
function reserve(address to, uint256 amount) external
```

A way for the owner to reserve a specifc number of NFTs without having to
interact with the sale.

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| to | address | The address to send reserved NFTs to. |
| amount | uint256 | The number of NFTs to reserve. |

### withdraw

```solidity
function withdraw() external
```

A way for the owner to withdraw all proceeds from the sale.

### setSaleIsActive

```solidity
function setSaleIsActive(bool isActive) external
```

Sets whether or not the NFT sale is active.

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| isActive | bool | Whether or not the sale will be active. |

### setCurrentPrice

```solidity
function setCurrentPrice(uint256 price) external
```

Sets the price of each NFT during the initial sale.

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| price | uint256 | The price of each NFT during the initial sale | precision:18 |

### setBaseURI

```solidity
function setBaseURI(string baseURI_) external
```

Updates the baseURI that will be used to retrieve NFT metadata.

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| baseURI_ | string | The baseURI to be used. |

### _baseURI

```solidity
function _baseURI() internal view virtual returns (string)
```

Base URI for computing {tokenURI}. If set, the resulting URI for each
token will be the concatenation of the `baseURI` and the `tokenId`. Empty
by default, can be overriden in child contracts.