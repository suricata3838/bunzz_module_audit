# Function

## WRITE
### safeMint

```solidity
function safeMint(address to, uint256 quantity) public virtual
```

only contact owner can mint a `quantity` of NFT.
Requirements: no

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| to | address | the receiver's wallet address |
| quantity | uint256 | the quantity of minting NFT |

### mint

```solidity
function mint(address to, uint256 quantity) public virtual
```

Only contact owner can mint a `quantity` of NFT.
Requirements: no.

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

### burnWithApprovalCheck

```solidity
function burnWithApprovalCheck(uint256 tokenId, bool approvalCheck) public virtual
```

see ERC721ABase-_burn()

### setBaseURI

```solidity
function setBaseURI(string baseURI_) public
```

Updates the baseURI that will be used to retrieve NFT metadata.

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| baseURI_ | string | The baseURI to be used. |

### totalMinted

```solidity
function totalMinted() public view returns (uint256)
```

reutrn the number of all minted tokens without considering burned tokens.

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| [0] | string | (string memory) Base URI |

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