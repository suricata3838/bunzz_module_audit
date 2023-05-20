// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Openzeppelin
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/IERC721Metadata.sol";

/**
* @title IERC721ABase
 * 
 * @dev Interface of an ERC721ABase compliant contract.
 */
interface IERC721ABase is IERC721, IERC721Metadata {
    /**
     * @dev The caller must own the token or be an approved operator.
     */
    error ApprovalCallerNotOwnerNorApproved();

    /**
     * @dev The token does not exist.
     */
    error ApprovalQueryForNonexistentToken();

    /**
     * @dev The caller cannot approve to their own address.
     */
    error ApproveToCaller();

    /**
     * @dev The caller cannot approve to the current owner.
     */
    error ApprovalToCurrentOwner();

    /**
     * @dev Cannot query the balance for the zero address.
     */
    error BalanceQueryForZeroAddress();

    /**
     * @dev Cannot mint to the zero address.
     */
    error MintToZeroAddress();

    /**
     * @dev The quantity of tokens minted must be more than zero.
     */
    error MintZeroQuantity();

    /**
     * @dev The token does not exist.
     */
    error OwnerQueryForNonexistentToken();

    /**
     * @dev The caller must own the token or be an approved operator.
     */
    error TransferCallerNotOwnerNorApproved();

    /**
     * @dev The token must be owned by `from`.
     */
    error TransferFromIncorrectOwner();

    /**
     * @dev Cannot safely transfer to a contract that does not implement the ERC721Receiver interface.
     */
    error TransferToNonERC721ReceiverImplementer();

    /**
     * @dev Cannot transfer to the zero address.
     */
    error TransferToZeroAddress();

    /**
     * @dev The token does not exist.
     */
    error URIQueryForNonexistentToken();

    // Compiler will pack this into a single 256bit word.
    struct TokenOwnership {
        // The address of the owner.
        address addr;
        // Keeps track of the start time of ownership with minimal overhead for tokenomics.
        uint64 startTimestamp;
        // Whether the token has been burned.
        bool burned;
    }

    // Review: the optimization point ERC721A did is to use Bitshift operator.
    // Cf. https://github.com/chiru-labs/ERC721A/blob/main/contracts/ERC721A.sol#L242
    // If you store data in the struct as follows and no bit-shift operation,
    // no gas optimazation. No point to name "ERC721A".

    // Compiler will pack this into a single 256bit word.
    struct AddressData {
        // Realistically, 2**64-1 is more than enough.
        uint64 balance;
        // Keeps track of mint count with minimal overhead for tokenomics.
        uint64 numberMinted;
        // Keeps track of burn count with minimal overhead for tokenomics.
        uint64 numberBurned;
        // For miscellaneous variable(s) pertaining to the address
        // (e.g. number of whitelist mint slots used).
        // If there are multiple variables, please pack them into a uint64.
        uint64 aux;
    }

    /**
     * @dev Returns the total amount of tokens stored by the contract.
     *
     * Burned tokens are calculated here, use `_totalMinted()` if you want to count just minted tokens.
     */
    function totalSupply() external view returns (uint256);
}