# How To Use

## Deployment
1. Deploy this contract though Bunzz application deploy button.

2. Input the `name`, `symbol` of your NFT token as a module parameter.


## (Ideal) Operation

1. Owner will decide following NFT features before starting NFT sale.

- baseURI

- maxAmount

- totalAmount


2. anyone can mint up to the maximum amount of token by `mint()` function.

3. Only Owner can mint any arbitrary amount of NFTs from `ownerMint()` function.

4. After the NFT sale is finished, only owner can withdraw the ethereum stored on contact by `withdraw()` function.


## Operation Diagram