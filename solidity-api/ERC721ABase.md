## ERC721ABase

Implementation of [ERC721](https://eips.ethereum.org/EIPS/eip-721) Non-Fungible Token Standard, including
the Metadata extension. Built to optimize for lower gas during batch mints.

Assumes serials are sequentially minted starting at _startTokenId (defaults to 0, e.g. 0, 1, 2, 3..).
Assumes that an owner cannot have more than 2^64 - 1 (max value of uint64) of supply.
Assumes that the maximum token id cannot exceed 2^256 - 1 (max value of uint256).

### _currentIndex

```solidity
uint256 _currentIndex
```

### _burnCounter

```solidity
uint256 _burnCounter
```

### _ownerships

```solidity
mapping(uint256 => struct IERC721ABase.TokenOwnership) _ownerships
```

### constructor

```solidity
constructor(string name_, string symbol_, uint256 startTokenId_) public
```

Constructor

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| name_ | string | (string memory) Token name |
| symbol_ | string | (string memory) Token symbol |
| startTokenId_ | uint256 |  |

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

Burned tokens are calculated here, use _totalMinted() if you want to count just minted tokens.

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| [0] | uint256 | (uint256) Total supply |

### _totalMinted

```solidity
function _totalMinted() internal view returns (uint256)
```

Returns the total amount of tokens minted in the contract.

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| [0] | uint256 | (uint256) Total minted count |

### supportsInterface

```solidity
function supportsInterface(bytes4 interfaceId) public view virtual returns (bool)
```

See {IERC165-supportsInterface}.

### balanceOf

```solidity
function balanceOf(address owner) public view returns (uint256)
```

See {IERC721-balanceOf}.

### _numberMinted

```solidity
function _numberMinted(address owner) internal view returns (uint256)
```

Returns the number of tokens minted by `owner`.

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| owner | address | (address) Owner address |

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| [0] | uint256 | (uint256) Number of tokens minted |

### _numberBurned

```solidity
function _numberBurned(address owner) internal view returns (uint256)
```

Returns the number of tokens burned by or on behalf of `owner`.

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| owner | address | (address) Owner address |

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| [0] | uint256 | (uint256) Number of tokens burned |

### _getAux

```solidity
function _getAux(address owner) internal view returns (uint64)
```

Returns the auxillary data for `owner`. (e.g. number of whitelist mint slots used).

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| owner | address | (address) Owner address |

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| [0] | uint64 | (uint64) Auxillary data slots |

### _setAux

```solidity
function _setAux(address owner, uint64 aux) internal
```

Sets the auxillary data for `owner`. (e.g. number of whitelist mint slots used).
If there are multiple variables, please pack them into a uint64.

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| owner | address | (address) Owner address |
| aux | uint64 | (uint64) Auxillary data slots |

### _ownershipOf

```solidity
function _ownershipOf(uint256 tokenId) internal view returns (struct IERC721ABase.TokenOwnership)
```

Gas spent here starts off proportional to the maximum mint batch size.
It gradually moves to O(1) as tokens get transferred around in the collection over time.

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| tokenId | uint256 | (uint256) Token ID |

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| [0] | struct IERC721ABase.TokenOwnership | (TokenOwnership memory) TokenOwnership data |

### ownerOf

```solidity
function ownerOf(uint256 tokenId) public view returns (address)
```

See {IERC721-ownerOf}.

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

### _baseURI

```solidity
function _baseURI() internal view virtual returns (string)
```

Base URI for computing {tokenURI}. If set, the resulting URI for each
token will be the concatenation of the `baseURI` and the `tokenId`. Empty
by default, can be overriden in child contracts.

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| [0] | string | (string memory) Base URI |

### approve

```solidity
function approve(address to, uint256 tokenId) public
```

See {IERC721-approve}.

### getApproved

```solidity
function getApproved(uint256 tokenId) public view returns (address)
```

See {IERC721-getApproved}.

### setApprovalForAll

```solidity
function setApprovalForAll(address operator, bool approved) public virtual
```

See {IERC721-setApprovalForAll}.

### isApprovedForAll

```solidity
function isApprovedForAll(address owner, address operator) public view virtual returns (bool)
```

See {IERC721-isApprovedForAll}.

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

### safeTransferFrom

```solidity
function safeTransferFrom(address from, address to, uint256 tokenId, bytes _data) public virtual
```

See {IERC721-safeTransferFrom}.

### _exists

```solidity
function _exists(uint256 tokenId) internal view returns (bool)
```

Returns whether `tokenId` exists.
Tokens can be managed by their owner or approved accounts via {approve} or {setApprovalForAll}.
Tokens start existing when they are minted (`_mint`),\

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| tokenId | uint256 | (uint256) Token ID |

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| [0] | bool | (bool) True for token exists |

### _safeMint

```solidity
function _safeMint(address to, uint256 quantity) internal
```

Equivalent to `_safeMint(to, quantity, '')`.

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| to | address | (address) Mint to address |
| quantity | uint256 | (uint256) Mint quantity |

### _safeMint

```solidity
function _safeMint(address to, uint256 quantity, bytes _data) internal
```

Safely mints `quantity` tokens and transfers them to `to`.

Requirements:

- If `to` refers to a smart contract, it must implement
  {IERC721Receiver-onERC721Received}, which is called for each safe transfer.
- `quantity` must be greater than 0.

Emits a {Transfer} event.

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| to | address | (address) Mint to address |
| quantity | uint256 | (uint256) Mint quantity |
| _data | bytes | (bytes memory) Safe mint data |

### _mint

```solidity
function _mint(address to, uint256 quantity) internal
```

Mints `quantity` tokens and transfers them to `to`.

Requirements:

- `to` cannot be the zero address.
- `quantity` must be greater than 0.

Emits a {Transfer} event.

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| to | address | (address) Mint to address |
| quantity | uint256 | (uint256) Mint quantity |

### _burn

```solidity
function _burn(uint256 tokenId) internal virtual
```

Equivalent to `_burn(tokenId, false)`.

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| tokenId | uint256 | (uint256) Token ID |

### _burn

```solidity
function _burn(uint256 tokenId, bool approvalCheck) internal virtual
```

Destroys `tokenId`.
The approval is cleared when the token is burned.

Requirements:

- `tokenId` must exist.

Emits a {Transfer} event.

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| tokenId | uint256 | (uint256) Token ID |
| approvalCheck | bool | (bool) True for approved |

### _beforeTokenTransfers

```solidity
function _beforeTokenTransfers(address from, address to, uint256 startTokenId_, uint256 quantity) internal virtual
```

Hook that is called before a set of serially-ordered token ids are about to be transferred. This includes minting.
And also called before burning one token.

startTokenId_ - the first token id to be transferred
quantity - the amount to be transferred

Calling conditions:

- When `from` and `to` are both non-zero, `from`'s `tokenId` will be
transferred to `to`.
- When `from` is zero, `tokenId` will be minted for `to`.
- When `to` is zero, `tokenId` will be burned by `from`.
- `from` and `to` are never both zero.

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| from | address | (address) Transfer from address |
| to | address | (address) Transfer to address |
| startTokenId_ | uint256 | (uint256) Start Token ID |
| quantity | uint256 | (uint256) Transfer quantity |

### _afterTokenTransfers

```solidity
function _afterTokenTransfers(address from, address to, uint256 startTokenId_, uint256 quantity) internal virtual
```

Hook that is called after a set of serially-ordered token ids have been transferred. This includes
minting.
And also called after one token has been burned.

startTokenId_ - the first token id to be transferred
quantity - the amount to be transferred

Calling conditions:

- When `from` and `to` are both non-zero, `from`'s `tokenId` has been
transferred to `to`.
- When `from` is zero, `tokenId` has been minted for `to`.
- When `to` is zero, `tokenId` has been burned by `from`.
- `from` and `to` are never both zero.

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| from | address | (address) Transfer from address |
| to | address | (address) Transfer to address |
| startTokenId_ | uint256 | (uint256) Start Token ID |
| quantity | uint256 | (uint256) Transfer quantity |