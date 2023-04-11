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