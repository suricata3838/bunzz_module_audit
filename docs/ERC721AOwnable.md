## ERC721AOwnable

ERC721 contract which the following features

### constructor

```solidity
constructor(string name_, string symbol_, uint256 startTokenId_) public
```

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| name_ | string | NFT Name |
| symbol_ | string | NFT Symbol |
| startTokenId_ | uint256 | the first tokenId of NFT |

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

### _baseURI

```solidity
function _baseURI() internal view virtual returns (string)
```

Orverride baseURI which will be concatiated with tokenIndex to get the tokenURI.

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| [0] | string | _baseURIextended baseURI stored inside this contract. |

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

### totalMinted

```solidity
function totalMinted() public view returns (uint256)
```

reutrn the number of all minted tokens without considering burned tokens.

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