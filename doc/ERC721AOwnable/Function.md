# Function

## WRITE
### mint

```solidity
function mint(uint256 quantity) public payable
```

anyone can mint the `quantity` of NFT up to `maxMintQuantity`.
Requirements:
- the max mintable qunatitiy for one user is `maxMintQuantity`.
- total quantity of NFT will not be exceed the `maxSupply`.
- sender should pay the exact amount of price * quantity.

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| quantity | uint256 | the quantity of minting NFT |

### ownerMint

```solidity
function ownerMint(address to, uint256 quantity) public
```

only contact owner can mint a `quantity` of NFT for free.
Requirements:
- total quantity of NFT will not be exceed the maxSupply.

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| to | address | the receiver's wallet address |
| quantity | uint256 | the quantity of minting NFT |


#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| to | address | the receiver address |
| quantity | uint256 | the quantity of minting NFT |

### burn

```solidity
function burn(uint256 tokenId) public virtual
```

Only contact owner can burn the NFT token by specifing the tokenId.

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| tokenId | uint256 | the tokenId of NFT |

### withdraw

```solidity
function withdraw() external
```

A way for the owner to withdraw all proceeds from the sale.

### setBaseURI

```solidity
function setBaseURI(string baseURI_) public
```

Updates the baseURI that will be used to retrieve NFT metadata.

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| baseURI_ | string | The baseURI to be used. |

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| [0] | string | (string memory) Base URI |

### setMaxSupply

```solidity
function setMaxSupply(uint256 _maxSupply) public
```

Only contract owner can update the total supply of NFTs.

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| _maxSupply | uint256 | the quantity of total amount |

### setCurrentPrice

```solidity
function setCurrentPrice(uint256 price) external
```

Sets the price of each NFT during the initial sale.

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| price | uint256 | The price of each NFT during the initial sale | precision:18 |


### setMaxMintQuantity

```solidity
function setMaxMintQuantity(uint256 _maxMintQuantity) public
```

Only contract owner can update the maximum quantity for one user to mint NFT.
The default is 3 for one wallet address.

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| _maxMintQuantity | uint256 | the maximum quantity of NFTs |

### approve

```solidity
function approve(address to, uint256 tokenId) public
```

See {IERC721-approve}.

### setApprovalForAll

```solidity
function setApprovalForAll(address operator, bool approved) public virtual
```

See {IERC721-setApprovalForAll}.


### transferFrom

```solidity
function transferFrom(address from, address to, uint256 tokenId) public virtual
```

See {IERC721-transferFrom}.

### safeTransferFrom

```solidity
function safeTransferFrom(address from, address to, uint256 tokenId) public virtual
```

See {IERC721-safeTransferFrom}.

## READ
### numberMinted

```solidity
function numberMinted(address owner) public view returns (uint256)
```

return the number of NFT which the owner has minted so far.

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| owner | address | the address of NFT owner |

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| [0] | uint256 | numberMinted |

### numberBurned

```solidity
function numberBurned(address owner) public view returns (uint256)
```

return the number of NFT which the owner has burned so far.

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| owner | address | the address of NFT owner |

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| [0] | uint256 | numberBurned |


### getApproved

```solidity
function getApproved(uint256 tokenId) public view returns (address)
```

See {IERC721-getApproved}.

### name

```solidity
function name() public view virtual returns (string)
```

See {IERC721Metadata-name}.

### symbol

```solidity
function symbol() public view virtual returns (string)
```

See {IERC721Metadata-symbol}.

### tokenURI

```solidity
function tokenURI(uint256 tokenId) public view virtual returns (string)
```

See {IERC721Metadata-tokenURI}.

### balanceOf

```solidity
function balanceOf(address owner) public view returns (uint256)
```

See {IERC721-balanceOf}.

### ownerOf

```solidity
function ownerOf(uint256 tokenId) public view returns (address)
```

See {IERC721-ownerOf}.

### baseURI

```solidity
function baseURI() public view returns (string)
```

getter of _baseURI

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| [0] | string | _baseURI |

### exists

```solidity
function exists(uint256 tokenId) public view returns (bool)
```

check if the tokenId exists or not.

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| tokenId | uint256 | the tokenId of NFT |

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| [0] | bool | boolean |

### startTokenId

```solidity
function startTokenId() public view returns (uint256)
```

To change the starting tokenId, please override this function.

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| [0] | uint256 | (uint256) Start Token ID |

### totalSupply

```solidity
function totalSupply() public view returns (uint256)
```

Burned tokens are calculated here, use `_totalMinted()` if you want to count just minted tokens.

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| [0] | uint256 | (uint256) Total supply |

### supportsInterface

```solidity
function supportsInterface(bytes4 interfaceId) public view virtual returns (bool)
```

See {IERC165-supportsInterface}.

### isApprovedForAll

```solidity
function isApprovedForAll(address owner, address operator) public view virtual returns (bool)
```

See {IERC721-isApprovedForAll}.

### totalMinted

```solidity
function totalMinted() public view returns (uint256)
```

reutrn the number of all minted tokens without considering burned tokens.