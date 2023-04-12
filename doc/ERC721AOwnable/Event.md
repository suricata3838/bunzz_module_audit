### Transfer
Emitted when `tokenId` token is transferred from `from` to `to`.

``` solidity
event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);
```

### Approval
Emitted when `owner` enables `approved` to manage the `tokenId` token.

``` solidity
event Approval(address indexed owner, address indexed approved, uint256 indexed tokenId);
```

### ApprovalForAll
Emitted when `owner` enables or disables (`approved`) `operator` to manage all of its assets.

``` solidity
event ApprovalForAll(address indexed owner, address indexed operator, bool approved);
```

### OwnershipTransferred