# Solidity API

## ERC721AOwnable

ERC721 contract which the following features
-

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

## IERC721ABase

Interface of an ERC721ABase compliant contract.

### ApprovalCallerNotOwnerNorApproved

```solidity
error ApprovalCallerNotOwnerNorApproved()
```

The caller must own the token or be an approved operator.

### ApprovalQueryForNonexistentToken

```solidity
error ApprovalQueryForNonexistentToken()
```

The token does not exist.

### ApproveToCaller

```solidity
error ApproveToCaller()
```

The caller cannot approve to their own address.

### ApprovalToCurrentOwner

```solidity
error ApprovalToCurrentOwner()
```

The caller cannot approve to the current owner.

### BalanceQueryForZeroAddress

```solidity
error BalanceQueryForZeroAddress()
```

Cannot query the balance for the zero address.

### MintToZeroAddress

```solidity
error MintToZeroAddress()
```

Cannot mint to the zero address.

### MintZeroQuantity

```solidity
error MintZeroQuantity()
```

The quantity of tokens minted must be more than zero.

### OwnerQueryForNonexistentToken

```solidity
error OwnerQueryForNonexistentToken()
```

The token does not exist.

### TransferCallerNotOwnerNorApproved

```solidity
error TransferCallerNotOwnerNorApproved()
```

The caller must own the token or be an approved operator.

### TransferFromIncorrectOwner

```solidity
error TransferFromIncorrectOwner()
```

The token must be owned by `from`.

### TransferToNonERC721ReceiverImplementer

```solidity
error TransferToNonERC721ReceiverImplementer()
```

Cannot safely transfer to a contract that does not implement the ERC721Receiver interface.

### TransferToZeroAddress

```solidity
error TransferToZeroAddress()
```

Cannot transfer to the zero address.

### URIQueryForNonexistentToken

```solidity
error URIQueryForNonexistentToken()
```

The token does not exist.

### TokenOwnership

```solidity
struct TokenOwnership {
  address addr;
  uint64 startTimestamp;
  bool burned;
}
```

### AddressData

```solidity
struct AddressData {
  uint64 balance;
  uint64 numberMinted;
  uint64 numberBurned;
  uint64 aux;
}
```

### totalSupply

```solidity
function totalSupply() external view returns (uint256)
```

Returns the total amount of tokens stored by the contract.

Burned tokens are calculated here, use `_totalMinted()` if you want to count just minted tokens.

## ApprovalCallerNotOwnerNorApproved

```solidity
error ApprovalCallerNotOwnerNorApproved()
```

## ApprovalQueryForNonexistentToken

```solidity
error ApprovalQueryForNonexistentToken()
```

## ApproveToCaller

```solidity
error ApproveToCaller()
```

## ApprovalToCurrentOwner

```solidity
error ApprovalToCurrentOwner()
```

## BalanceQueryForZeroAddress

```solidity
error BalanceQueryForZeroAddress()
```

## MintToZeroAddress

```solidity
error MintToZeroAddress()
```

## MintZeroQuantity

```solidity
error MintZeroQuantity()
```

## OwnerQueryForNonexistentToken

```solidity
error OwnerQueryForNonexistentToken()
```

## TransferCallerNotOwnerNorApproved

```solidity
error TransferCallerNotOwnerNorApproved()
```

## TransferFromIncorrectOwner

```solidity
error TransferFromIncorrectOwner()
```

## TransferToNonERC721ReceiverImplementer

```solidity
error TransferToNonERC721ReceiverImplementer()
```

## TransferToZeroAddress

```solidity
error TransferToZeroAddress()
```

## URIQueryForNonexistentToken

```solidity
error URIQueryForNonexistentToken()
```

## ERC721A

Implementation of https://eips.ethereum.org/EIPS/eip-721[ERC721] Non-Fungible Token Standard, including
the Metadata extension. Built to optimize for lower gas during batch mints.

Assumes serials are sequentially minted starting at _startTokenId() (defaults to 0, e.g. 0, 1, 2, 3..).

Assumes that an owner cannot have more than 2**64 - 1 (max value of uint64) of supply.

Assumes that the maximum token id cannot exceed 2**256 - 1 (max value of uint256).

### TokenOwnership

```solidity
struct TokenOwnership {
  address addr;
  uint64 startTimestamp;
  bool burned;
}
```

### AddressData

```solidity
struct AddressData {
  uint64 balance;
  uint64 numberMinted;
  uint64 numberBurned;
  uint64 aux;
}
```

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
mapping(uint256 => struct ERC721A.TokenOwnership) _ownerships
```

### constructor

```solidity
constructor(string name_, string symbol_) public
```

### _startTokenId

```solidity
function _startTokenId() internal view virtual returns (uint256)
```

To change the starting tokenId, please override this function.

### totalSupply

```solidity
function totalSupply() public view returns (uint256)
```

Burned tokens are calculated here, use _totalMinted() if you want to count just minted tokens.

### _totalMinted

```solidity
function _totalMinted() internal view returns (uint256)
```

Returns the total amount of tokens minted in the contract.

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

### _numberBurned

```solidity
function _numberBurned(address owner) internal view returns (uint256)
```

Returns the number of tokens burned by or on behalf of `owner`.

### _getAux

```solidity
function _getAux(address owner) internal view returns (uint64)
```

Returns the auxillary data for `owner`. (e.g. number of whitelist mint slots used).

### _setAux

```solidity
function _setAux(address owner, uint64 aux) internal
```

Sets the auxillary data for `owner`. (e.g. number of whitelist mint slots used).
If there are multiple variables, please pack them into a uint64.

### _ownershipOf

```solidity
function _ownershipOf(uint256 tokenId) internal view returns (struct ERC721A.TokenOwnership)
```

Gas spent here starts off proportional to the maximum mint batch size.
It gradually moves to O(1) as tokens get transferred around in the collection over time.

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

Tokens start existing when they are minted (`_mint`),

### _safeMint

```solidity
function _safeMint(address to, uint256 quantity) internal
```

### _safeMint

```solidity
function _safeMint(address to, uint256 quantity, bytes _data) internal
```

Safely mints `quantity` tokens and transfers them to `to`.

Requirements:

- If `to` refers to a smart contract, it must implement {IERC721Receiver-onERC721Received}, which is called for each safe transfer.
- `quantity` must be greater than 0.

Emits a {Transfer} event.

### _mint

```solidity
function _mint(address to, uint256 quantity, bytes _data, bool safe) internal
```

Mints `quantity` tokens and transfers them to `to`.

Requirements:

- `to` cannot be the zero address.
- `quantity` must be greater than 0.

Emits a {Transfer} event.

### _burn

```solidity
function _burn(uint256 tokenId) internal virtual
```

This is equivalent to _burn(tokenId, false)

### _burn

```solidity
function _burn(uint256 tokenId, bool approvalCheck) internal virtual
```

Destroys `tokenId`.
The approval is cleared when the token is burned.

Requirements:

- `tokenId` must exist.

Emits a {Transfer} event.

### _beforeTokenTransfers

```solidity
function _beforeTokenTransfers(address from, address to, uint256 startTokenId, uint256 quantity) internal virtual
```

Hook that is called before a set of serially-ordered token ids are about to be transferred. This includes minting.
And also called before burning one token.

startTokenId - the first token id to be transferred
quantity - the amount to be transferred

Calling conditions:

- When `from` and `to` are both non-zero, `from`'s `tokenId` will be
transferred to `to`.
- When `from` is zero, `tokenId` will be minted for `to`.
- When `to` is zero, `tokenId` will be burned by `from`.
- `from` and `to` are never both zero.

### _afterTokenTransfers

```solidity
function _afterTokenTransfers(address from, address to, uint256 startTokenId, uint256 quantity) internal virtual
```

Hook that is called after a set of serially-ordered token ids have been transferred. This includes
minting.
And also called after one token has been burned.

startTokenId - the first token id to be transferred
quantity - the amount to be transferred

Calling conditions:

- When `from` and `to` are both non-zero, `from`'s `tokenId` has been
transferred to `to`.
- When `from` is zero, `tokenId` has been minted for `to`.
- When `to` is zero, `tokenId` has been burned by `from`.
- `from` and `to` are never both zero.

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

## ApprovalCallerNotOwnerNorApproved

```solidity
error ApprovalCallerNotOwnerNorApproved()
```

## ApprovalQueryForNonexistentToken

```solidity
error ApprovalQueryForNonexistentToken()
```

## ApproveToCaller

```solidity
error ApproveToCaller()
```

## ApprovalToCurrentOwner

```solidity
error ApprovalToCurrentOwner()
```

## BalanceQueryForZeroAddress

```solidity
error BalanceQueryForZeroAddress()
```

## MintToZeroAddress

```solidity
error MintToZeroAddress()
```

## MintZeroQuantity

```solidity
error MintZeroQuantity()
```

## OwnerQueryForNonexistentToken

```solidity
error OwnerQueryForNonexistentToken()
```

## TransferCallerNotOwnerNorApproved

```solidity
error TransferCallerNotOwnerNorApproved()
```

## TransferFromIncorrectOwner

```solidity
error TransferFromIncorrectOwner()
```

## TransferToNonERC721ReceiverImplementer

```solidity
error TransferToNonERC721ReceiverImplementer()
```

## TransferToZeroAddress

```solidity
error TransferToZeroAddress()
```

## URIQueryForNonexistentToken

```solidity
error URIQueryForNonexistentToken()
```

## ERC721A

Implementation of https://eips.ethereum.org/EIPS/eip-721[ERC721] Non-Fungible Token Standard, including
the Metadata extension. Built to optimize for lower gas during batch mints.

Assumes serials are sequentially minted starting at _startTokenId() (defaults to 0, e.g. 0, 1, 2, 3..).

Assumes that an owner cannot have more than 2**64 - 1 (max value of uint64) of supply.

Assumes that the maximum token id cannot exceed 2**256 - 1 (max value of uint256).

### TokenOwnership

```solidity
struct TokenOwnership {
  address addr;
  uint64 startTimestamp;
  bool burned;
}
```

### AddressData

```solidity
struct AddressData {
  uint64 balance;
  uint64 numberMinted;
  uint64 numberBurned;
  uint64 aux;
}
```

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
mapping(uint256 => struct ERC721A.TokenOwnership) _ownerships
```

### constructor

```solidity
constructor(string name_, string symbol_) public
```

### _startTokenId

```solidity
function _startTokenId() internal view virtual returns (uint256)
```

To change the starting tokenId, please override this function.

### totalSupply

```solidity
function totalSupply() public view returns (uint256)
```

Burned tokens are calculated here, use _totalMinted() if you want to count just minted tokens.

### _totalMinted

```solidity
function _totalMinted() internal view returns (uint256)
```

Returns the total amount of tokens minted in the contract.

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

### _numberBurned

```solidity
function _numberBurned(address owner) internal view returns (uint256)
```

Returns the number of tokens burned by or on behalf of `owner`.

### _getAux

```solidity
function _getAux(address owner) internal view returns (uint64)
```

Returns the auxillary data for `owner`. (e.g. number of whitelist mint slots used).

### _setAux

```solidity
function _setAux(address owner, uint64 aux) internal
```

Sets the auxillary data for `owner`. (e.g. number of whitelist mint slots used).
If there are multiple variables, please pack them into a uint64.

### _ownershipOf

```solidity
function _ownershipOf(uint256 tokenId) internal view returns (struct ERC721A.TokenOwnership)
```

Gas spent here starts off proportional to the maximum mint batch size.
It gradually moves to O(1) as tokens get transferred around in the collection over time.

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

Tokens start existing when they are minted (`_mint`),

### _safeMint

```solidity
function _safeMint(address to, uint256 quantity) internal
```

### _safeMint

```solidity
function _safeMint(address to, uint256 quantity, bytes _data) internal
```

Safely mints `quantity` tokens and transfers them to `to`.

Requirements:

- If `to` refers to a smart contract, it must implement {IERC721Receiver-onERC721Received}, which is called for each safe transfer.
- `quantity` must be greater than 0.

Emits a {Transfer} event.

### _mint

```solidity
function _mint(address to, uint256 quantity, bytes _data, bool safe) internal
```

Mints `quantity` tokens and transfers them to `to`.

Requirements:

- `to` cannot be the zero address.
- `quantity` must be greater than 0.

Emits a {Transfer} event.

### _burn

```solidity
function _burn(uint256 tokenId) internal virtual
```

This is equivalent to _burn(tokenId, false)

### _burn

```solidity
function _burn(uint256 tokenId, bool approvalCheck) internal virtual
```

Destroys `tokenId`.
The approval is cleared when the token is burned.

Requirements:

- `tokenId` must exist.

Emits a {Transfer} event.

### _beforeTokenTransfers

```solidity
function _beforeTokenTransfers(address from, address to, uint256 startTokenId, uint256 quantity) internal virtual
```

Hook that is called before a set of serially-ordered token ids are about to be transferred. This includes minting.
And also called before burning one token.

startTokenId - the first token id to be transferred
quantity - the amount to be transferred

Calling conditions:

- When `from` and `to` are both non-zero, `from`'s `tokenId` will be
transferred to `to`.
- When `from` is zero, `tokenId` will be minted for `to`.
- When `to` is zero, `tokenId` will be burned by `from`.
- `from` and `to` are never both zero.

### _afterTokenTransfers

```solidity
function _afterTokenTransfers(address from, address to, uint256 startTokenId, uint256 quantity) internal virtual
```

Hook that is called after a set of serially-ordered token ids have been transferred. This includes
minting.
And also called after one token has been burned.

startTokenId - the first token id to be transferred
quantity - the amount to be transferred

Calling conditions:

- When `from` and `to` are both non-zero, `from`'s `tokenId` has been
transferred to `to`.
- When `from` is zero, `tokenId` has been minted for `to`.
- When `to` is zero, `tokenId` has been burned by `from`.
- `from` and `to` are never both zero.

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

## ERC721ReceiverMock

### Error

```solidity
enum Error {
  None,
  RevertWithMessage,
  RevertWithoutMessage,
  Panic
}
```

### Received

```solidity
event Received(address operator, address from, uint256 tokenId, bytes data, uint256 gas)
```

### constructor

```solidity
constructor(bytes4 retval) public
```

### onERC721Received

```solidity
function onERC721Received(address operator, address from, uint256 tokenId, bytes data) public returns (bytes4)
```

Whenever an {IERC721} `tokenId` token is transferred to this contract via {IERC721-safeTransferFrom}
by `operator` from `from`, this function is called.

It must return its Solidity selector to confirm the token transfer.
If any other value is returned or the interface is not implemented by the recipient, the transfer will be reverted.

The selector can be obtained in Solidity with `IERC721Receiver.onERC721Received.selector`.

## ReflectionToke

ERC20 token which has reflection system internally.  
- On transfer funcion, the fee mount of the token is deducted from the amount tarnsferred, 
and added to 4 recipients; ecoSystem, UniswapV2liquidity, tax vault, owner

### FeeTier

```solidity
struct FeeTier {
  uint256 ecoSystemFee;
  uint256 liquidityFee;
  uint256 taxFee;
  uint256 ownerFee;
  uint256 burnFee;
  address ecoSystem;
  address owner;
}
```

### FeeValues

```solidity
struct FeeValues {
  uint256 rAmount;
  uint256 rTransferAmount;
  uint256 rFee;
  uint256 tTransferAmount;
  uint256 tEchoSystem;
  uint256 tLiquidity;
  uint256 tFee;
  uint256 tOwner;
  uint256 tBurn;
}
```

### tFeeValues

```solidity
struct tFeeValues {
  uint256 tTransferAmount;
  uint256 tEchoSystem;
  uint256 tLiquidity;
  uint256 tFee;
  uint256 tOwner;
  uint256 tBurn;
}
```

### maxFee

```solidity
uint256 maxFee
```

### defaultFees

```solidity
struct ReflectionToke.FeeTier defaultFees
```

### uniswapV2Router

```solidity
contract IUniswapV2Router02 uniswapV2Router
```

### uniswapV2Pair

```solidity
address uniswapV2Pair
```

### WETH

```solidity
address WETH
```

### migration

```solidity
address migration
```

### burnAddress

```solidity
address burnAddress
```

### numTokensToCollectETH

```solidity
uint256 numTokensToCollectETH
```

### amountOfETHToSwapAndEvolve

```solidity
uint256 amountOfETHToSwapAndEvolve
```

### maxTxAmount

```solidity
uint256 maxTxAmount
```

### inSwapAndLiquify

```solidity
bool inSwapAndLiquify
```

### swapAndEvolveEnabled

```solidity
bool swapAndEvolveEnabled
```

### MinTokensBeforeSwapUpdated

```solidity
event MinTokensBeforeSwapUpdated(uint256 minTokensBeforeSwap)
```

### lockTheSwap

```solidity
modifier lockTheSwap()
```

### lockUpgrade

```solidity
modifier lockUpgrade()
```

### checkTierIndex

```solidity
modifier checkTierIndex(uint256 _index)
```

### preventBlacklisted

```solidity
modifier preventBlacklisted(address _account, string errorMsg)
```

### isRouter

```solidity
modifier isRouter(address _sender)
```

### SwapAndEvolveEnabledUpdated

```solidity
event SwapAndEvolveEnabledUpdated(bool enabled)
```

### SwapAndEvolve

```solidity
event SwapAndEvolve(uint256 ethSwapped, uint256 tokenReceived, uint256 ethIntoLiquidity)
```

### constructor

```solidity
constructor(address _router, string __name, string __symbol) public
```

rBalance

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| _router | address | Uniswap V2 router address |
| __name | string | the name of token |
| __symbol | string | the symbol of token |

### name

```solidity
function name() public view returns (string)
```

IERC20 functions

### symbol

```solidity
function symbol() public view returns (string)
```

### decimals

```solidity
function decimals() public view returns (uint8)
```

### totalSupply

```solidity
function totalSupply() public view returns (uint256)
```

Returns the amount of tokens in existence.

### balanceOf

```solidity
function balanceOf(address account) public view returns (uint256)
```

Returns the amount of tokens owned by `account`.

### transfer

```solidity
function transfer(address recipient, uint256 amount) public returns (bool)
```

Moves `amount` tokens from the caller's account to `recipient`.

Returns a boolean value indicating whether the operation succeeded.

Emits a {Transfer} event.

### allowance

```solidity
function allowance(address owner, address spender) public view returns (uint256)
```

Returns the remaining number of tokens that `spender` will be
allowed to spend on behalf of `owner` through {transferFrom}. This is
zero by default.

This value changes when {approve} or {transferFrom} are called.

### approve

```solidity
function approve(address spender, uint256 amount) public returns (bool)
```

Sets `amount` as the allowance of `spender` over the caller's tokens.

Returns a boolean value indicating whether the operation succeeded.

IMPORTANT: Beware that changing an allowance with this method brings the risk
that someone may use both the old and the new allowance by unfortunate
transaction ordering. One possible solution to mitigate this race
condition is to first reduce the spender's allowance to 0 and set the
desired value afterwards:
https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729

Emits an {Approval} event.

### transferFrom

```solidity
function transferFrom(address sender, address recipient, uint256 amount) public returns (bool)
```

Moves `amount` tokens from `sender` to `recipient` using the
allowance mechanism. `amount` is then deducted from the caller's
allowance.

Returns a boolean value indicating whether the operation succeeded.

Emits a {Transfer} event.

### increaseAllowance

```solidity
function increaseAllowance(address spender, uint256 addedValue) public virtual returns (bool)
```

### decreaseAllowance

```solidity
function decreaseAllowance(address spender, uint256 subtractedValue) public virtual returns (bool)
```

### migrate

```solidity
function migrate(address account, uint256 amount) external
```

Reflection functions

### excludeFromReward

```solidity
function excludeFromReward(address account) external
```

onlyOwner configuration functions

### includeInReward

```solidity
function includeInReward(address account) external
```

### excludeFromFee

```solidity
function excludeFromFee(address account) public
```

### includeInFee

```solidity
function includeInFee(address account) public
```

### whitelistAddress

```solidity
function whitelistAddress(address _account, uint256 _tierIndex) public
```

### excludeWhitelistedAddress

```solidity
function excludeWhitelistedAddress(address _account) public
```

### blacklistAddress

```solidity
function blacklistAddress(address account) public
```

### unBlacklistAddress

```solidity
function unBlacklistAddress(address account) public
```

### setEcoSystemFeePercent

```solidity
function setEcoSystemFeePercent(uint256 _tierIndex, uint256 _ecoSystemFee) external
```

Setter functions for fee configurations

### setLiquidityFeePercent

```solidity
function setLiquidityFeePercent(uint256 _tierIndex, uint256 _liquidityFee) external
```

### setTaxFeePercent

```solidity
function setTaxFeePercent(uint256 _tierIndex, uint256 _taxFee) external
```

### setOwnerFeePercent

```solidity
function setOwnerFeePercent(uint256 _tierIndex, uint256 _ownerFee) external
```

### setBurnFeePercent

```solidity
function setBurnFeePercent(uint256 _tierIndex, uint256 _burnFee) external
```

### setEcoSystemFeeAddress

```solidity
function setEcoSystemFeeAddress(uint256 _tierIndex, address _ecoSystem) external
```

### setOwnerFeeAddress

```solidity
function setOwnerFeeAddress(uint256 _tierIndex, address _owner) external
```

### addTier

```solidity
function addTier(uint256 _ecoSystemFee, uint256 _liquidityFee, uint256 _taxFee, uint256 _ownerFee, uint256 _burnFee, address _ecoSystem, address _owner) public
```

addTier is used for configuration of fee Tier.

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| _ecoSystemFee | uint256 | TBD |
| _liquidityFee | uint256 | TBD |
| _taxFee | uint256 | TBD |
| _ownerFee | uint256 | TBD |
| _burnFee | uint256 | TBD |
| _ecoSystem | address | TBD |
| _owner | address | TBD |

### setMaxTxPercent

```solidity
function setMaxTxPercent(uint256 maxTxPercent) external
```

Setter functions related to Uniswap

### setDefaultSettings

```solidity
function setDefaultSettings() external
```

### setSwapAndEvolveEnabled

```solidity
function setSwapAndEvolveEnabled(bool _enabled) public
```

### updateRouterAndPair

```solidity
function updateRouterAndPair(address _uniswapV2Router, address _uniswapV2Pair) public
```

### swapAndEvolve

```solidity
function swapAndEvolve() public
```

### setMigrationAddress

```solidity
function setMigrationAddress(address _migration) public
```

Set functions of addresses and the number of tokens

### updateBurnAddress

```solidity
function updateBurnAddress(address _newBurnAddress) external
```

### setNumberOfTokenToCollectETH

```solidity
function setNumberOfTokenToCollectETH(uint256 _numToken) public
```

### setNumOfETHToSwapAndEvolve

```solidity
function setNumOfETHToSwapAndEvolve(uint256 _numETH) public
```

### withdrawToken

```solidity
function withdrawToken(address _token, uint256 _amount) public
```

Withdraw functions

### withdrawETH

```solidity
function withdrawETH(uint256 _amount) public
```

### _addTier

```solidity
function _addTier(uint256 _ecoSystemFee, uint256 _liquidityFee, uint256 _taxFee, uint256 _ownerFee, uint256 _burnFee, address _ecoSystem, address _owner) internal returns (struct ReflectionToke.FeeTier)
```

Iternal/Private functions

### isExcludedFromReward

```solidity
function isExcludedFromReward(address account) public view returns (bool)
```

### reflectionFromTokenInTiers

```solidity
function reflectionFromTokenInTiers(uint256 tAmount, uint256 _tierIndex, bool deductTransferFee) public view returns (uint256)
```

### reflectionFromToken

```solidity
function reflectionFromToken(uint256 tAmount, bool deductTransferFee) public view returns (uint256)
```

### getTotalAmountFromReflection

```solidity
function getTotalAmountFromReflection(uint256 rAmount) public view returns (uint256)
```

get `total amount` calculated from `reflection Amount`

### totalFees

```solidity
function totalFees() public view returns (uint256)
```

### accountTier

```solidity
function accountTier(address _account) public view returns (struct ReflectionToke.FeeTier)
```

### feeTier

```solidity
function feeTier(uint256 _tierIndex) public view returns (struct ReflectionToke.FeeTier)
```

### feeTiersLength

```solidity
function feeTiersLength() public view returns (uint256)
```

### isExcludedFromFee

```solidity
function isExcludedFromFee(address account) public view returns (bool)
```

### isWhitelisted

```solidity
function isWhitelisted(address _account) public view returns (bool)
```

### isBlacklisted

```solidity
function isBlacklisted(address account) public view returns (bool)
```

### isMigrationStarted

```solidity
function isMigrationStarted() external view returns (bool)
```

### getContractBalance

```solidity
function getContractBalance() public view returns (uint256)
```

### getETHBalance

```solidity
function getETHBalance() public view returns (uint256)
```

### _checkFees

```solidity
function _checkFees(struct ReflectionToke.FeeTier _tier) internal view returns (struct ReflectionToke.FeeTier)
```

### _checkFeesChanged

```solidity
function _checkFeesChanged(struct ReflectionToke.FeeTier _tier, uint256 _oldFee, uint256 _newFee) internal view
```

### receive

```solidity
receive() external payable
```

## IReflectionToken

### totalSupply

```solidity
function totalSupply() external view returns (uint256)
```

Returns the amount of tokens in existence.

### balanceOf

```solidity
function balanceOf(address account) external view returns (uint256)
```

Returns the amount of tokens owned by `account`.

### transfer

```solidity
function transfer(address recipient, uint256 amount) external returns (bool)
```

Moves `amount` tokens from the caller's account to `recipient`.

Returns a boolean value indicating whether the operation succeeded.

Emits a {Transfer} event.

### allowance

```solidity
function allowance(address owner, address spender) external view returns (uint256)
```

Returns the remaining number of tokens that `spender` will be
allowed to spend on behalf of `owner` through {transferFrom}. This is
zero by default.

This value changes when {approve} or {transferFrom} are called.

### approve

```solidity
function approve(address spender, uint256 amount) external returns (bool)
```

Sets `amount` as the allowance of `spender` over the caller's tokens.

Returns a boolean value indicating whether the operation succeeded.

IMPORTANT: Beware that changing an allowance with this method brings the risk
that someone may use both the old and the new allowance by unfortunate
transaction ordering. One possible solution to mitigate this race
condition is to first reduce the spender's allowance to 0 and set the
desired value afterwards:
https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729

Emits an {Approval} event.

### transferFrom

```solidity
function transferFrom(address sender, address recipient, uint256 amount) external returns (bool)
```

Moves `amount` tokens from `sender` to `recipient` using the
allowance mechanism. `amount` is then deducted from the caller's
allowance.

Returns a boolean value indicating whether the operation succeeded.

Emits a {Transfer} event.

### migrate

```solidity
function migrate(address account, uint256 amount) external
```

Creates `amount` tokens and assigns them to `account`, increasing
the total supply.

Emits a {Transfer} event with `from` set to the zero address.

Requirements:

- `account` cannot be the zero address.

### isMigrationStarted

```solidity
function isMigrationStarted() external view returns (bool)
```

### Transfer

```solidity
event Transfer(address from, address to, uint256 value)
```

Emitted when `value` tokens are moved from one account (`from`) to
another (`to`).

Note that `value` may be zero.

### Approval

```solidity
event Approval(address owner, address spender, uint256 value)
```

Emitted when the allowance of a `spender` for an `owner` is set by
a call to {approve}. `value` is the new allowance.

## IUniswapV2Factory

### PairCreated

```solidity
event PairCreated(address token0, address token1, address pair, uint256)
```

### feeTo

```solidity
function feeTo() external view returns (address)
```

### feeToSetter

```solidity
function feeToSetter() external view returns (address)
```

### getPair

```solidity
function getPair(address tokenA, address tokenB) external view returns (address pair)
```

### allPairs

```solidity
function allPairs(uint256) external view returns (address pair)
```

### allPairsLength

```solidity
function allPairsLength() external view returns (uint256)
```

### createPair

```solidity
function createPair(address tokenA, address tokenB) external returns (address pair)
```

### setFeeTo

```solidity
function setFeeTo(address) external
```

### setFeeToSetter

```solidity
function setFeeToSetter(address) external
```

## IUniswapV2Pair

### Approval

```solidity
event Approval(address owner, address spender, uint256 value)
```

### Transfer

```solidity
event Transfer(address from, address to, uint256 value)
```

### name

```solidity
function name() external pure returns (string)
```

### symbol

```solidity
function symbol() external pure returns (string)
```

### decimals

```solidity
function decimals() external pure returns (uint8)
```

### totalSupply

```solidity
function totalSupply() external view returns (uint256)
```

### balanceOf

```solidity
function balanceOf(address owner) external view returns (uint256)
```

### allowance

```solidity
function allowance(address owner, address spender) external view returns (uint256)
```

### approve

```solidity
function approve(address spender, uint256 value) external returns (bool)
```

### transfer

```solidity
function transfer(address to, uint256 value) external returns (bool)
```

### transferFrom

```solidity
function transferFrom(address from, address to, uint256 value) external returns (bool)
```

### DOMAIN_SEPARATOR

```solidity
function DOMAIN_SEPARATOR() external view returns (bytes32)
```

### PERMIT_TYPEHASH

```solidity
function PERMIT_TYPEHASH() external pure returns (bytes32)
```

### nonces

```solidity
function nonces(address owner) external view returns (uint256)
```

### permit

```solidity
function permit(address owner, address spender, uint256 value, uint256 deadline, uint8 v, bytes32 r, bytes32 s) external
```

### Mint

```solidity
event Mint(address sender, uint256 amount0, uint256 amount1)
```

### Burn

```solidity
event Burn(address sender, uint256 amount0, uint256 amount1, address to)
```

### Swap

```solidity
event Swap(address sender, uint256 amount0In, uint256 amount1In, uint256 amount0Out, uint256 amount1Out, address to)
```

### Sync

```solidity
event Sync(uint112 reserve0, uint112 reserve1)
```

### MINIMUM_LIQUIDITY

```solidity
function MINIMUM_LIQUIDITY() external pure returns (uint256)
```

### factory

```solidity
function factory() external view returns (address)
```

### token0

```solidity
function token0() external view returns (address)
```

### token1

```solidity
function token1() external view returns (address)
```

### getReserves

```solidity
function getReserves() external view returns (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast)
```

### price0CumulativeLast

```solidity
function price0CumulativeLast() external view returns (uint256)
```

### price1CumulativeLast

```solidity
function price1CumulativeLast() external view returns (uint256)
```

### kLast

```solidity
function kLast() external view returns (uint256)
```

### mint

```solidity
function mint(address to) external returns (uint256 liquidity)
```

### burn

```solidity
function burn(address to) external returns (uint256 amount0, uint256 amount1)
```

### swap

```solidity
function swap(uint256 amount0Out, uint256 amount1Out, address to, bytes data) external
```

### skim

```solidity
function skim(address to) external
```

### sync

```solidity
function sync() external
```

### initialize

```solidity
function initialize(address, address) external
```

## IUniswapV2Router01

### factory

```solidity
function factory() external pure returns (address)
```

### WETH

```solidity
function WETH() external pure returns (address)
```

### addLiquidity

```solidity
function addLiquidity(address tokenA, address tokenB, uint256 amountADesired, uint256 amountBDesired, uint256 amountAMin, uint256 amountBMin, address to, uint256 deadline) external returns (uint256 amountA, uint256 amountB, uint256 liquidity)
```

### addLiquidityETH

```solidity
function addLiquidityETH(address token, uint256 amountTokenDesired, uint256 amountTokenMin, uint256 amountETHMin, address to, uint256 deadline) external payable returns (uint256 amountToken, uint256 amountETH, uint256 liquidity)
```

### removeLiquidity

```solidity
function removeLiquidity(address tokenA, address tokenB, uint256 liquidity, uint256 amountAMin, uint256 amountBMin, address to, uint256 deadline) external returns (uint256 amountA, uint256 amountB)
```

### removeLiquidityETH

```solidity
function removeLiquidityETH(address token, uint256 liquidity, uint256 amountTokenMin, uint256 amountETHMin, address to, uint256 deadline) external returns (uint256 amountToken, uint256 amountETH)
```

### removeLiquidityWithPermit

```solidity
function removeLiquidityWithPermit(address tokenA, address tokenB, uint256 liquidity, uint256 amountAMin, uint256 amountBMin, address to, uint256 deadline, bool approveMax, uint8 v, bytes32 r, bytes32 s) external returns (uint256 amountA, uint256 amountB)
```

### removeLiquidityETHWithPermit

```solidity
function removeLiquidityETHWithPermit(address token, uint256 liquidity, uint256 amountTokenMin, uint256 amountETHMin, address to, uint256 deadline, bool approveMax, uint8 v, bytes32 r, bytes32 s) external returns (uint256 amountToken, uint256 amountETH)
```

### swapExactTokensForTokens

```solidity
function swapExactTokensForTokens(uint256 amountIn, uint256 amountOutMin, address[] path, address to, uint256 deadline) external returns (uint256[] amounts)
```

### swapTokensForExactTokens

```solidity
function swapTokensForExactTokens(uint256 amountOut, uint256 amountInMax, address[] path, address to, uint256 deadline) external returns (uint256[] amounts)
```

### swapExactETHForTokens

```solidity
function swapExactETHForTokens(uint256 amountOutMin, address[] path, address to, uint256 deadline) external payable returns (uint256[] amounts)
```

### swapTokensForExactETH

```solidity
function swapTokensForExactETH(uint256 amountOut, uint256 amountInMax, address[] path, address to, uint256 deadline) external returns (uint256[] amounts)
```

### swapExactTokensForETH

```solidity
function swapExactTokensForETH(uint256 amountIn, uint256 amountOutMin, address[] path, address to, uint256 deadline) external returns (uint256[] amounts)
```

### swapETHForExactTokens

```solidity
function swapETHForExactTokens(uint256 amountOut, address[] path, address to, uint256 deadline) external payable returns (uint256[] amounts)
```

### quote

```solidity
function quote(uint256 amountA, uint256 reserveA, uint256 reserveB) external pure returns (uint256 amountB)
```

### getAmountOut

```solidity
function getAmountOut(uint256 amountIn, uint256 reserveIn, uint256 reserveOut) external pure returns (uint256 amountOut)
```

### getAmountIn

```solidity
function getAmountIn(uint256 amountOut, uint256 reserveIn, uint256 reserveOut) external pure returns (uint256 amountIn)
```

### getAmountsOut

```solidity
function getAmountsOut(uint256 amountIn, address[] path) external view returns (uint256[] amounts)
```

### getAmountsIn

```solidity
function getAmountsIn(uint256 amountOut, address[] path) external view returns (uint256[] amounts)
```

## IUniswapV2Router02

### removeLiquidityETHSupportingFeeOnTransferTokens

```solidity
function removeLiquidityETHSupportingFeeOnTransferTokens(address token, uint256 liquidity, uint256 amountTokenMin, uint256 amountETHMin, address to, uint256 deadline) external returns (uint256 amountETH)
```

### removeLiquidityETHWithPermitSupportingFeeOnTransferTokens

```solidity
function removeLiquidityETHWithPermitSupportingFeeOnTransferTokens(address token, uint256 liquidity, uint256 amountTokenMin, uint256 amountETHMin, address to, uint256 deadline, bool approveMax, uint8 v, bytes32 r, bytes32 s) external returns (uint256 amountETH)
```

### swapExactTokensForTokensSupportingFeeOnTransferTokens

```solidity
function swapExactTokensForTokensSupportingFeeOnTransferTokens(uint256 amountIn, uint256 amountOutMin, address[] path, address to, uint256 deadline) external
```

### swapExactETHForTokensSupportingFeeOnTransferTokens

```solidity
function swapExactETHForTokensSupportingFeeOnTransferTokens(uint256 amountOutMin, address[] path, address to, uint256 deadline) external payable
```

### swapExactTokensForETHSupportingFeeOnTransferTokens

```solidity
function swapExactTokensForETHSupportingFeeOnTransferTokens(uint256 amountIn, uint256 amountOutMin, address[] path, address to, uint256 deadline) external
```

