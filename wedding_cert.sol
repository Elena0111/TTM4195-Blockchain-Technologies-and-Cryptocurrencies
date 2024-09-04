// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract WeddingCertificate is ERC721 {

    // some information we want to store in the NFT
    struct CertificateDetails {
        address partner1;
        address partner2;
        uint256 weddingDate;
    }

    mapping(uint256 => CertificateDetails) public certificateDetails;

    constructor() ERC721("WeddingCertificate", "WEDCERT") {}

    function mintCertificate(address to, uint256 tokenId, address partner1, address partner2, uint256 weddingDate) 
        public
    {
        _mint(to, tokenId);

        // set details
        certificateDetails[tokenId] = CertificateDetails({
            partner1: partner1,
            partner2: partner2,
            weddingDate: weddingDate
        });
    }

    function burnCertificate(uint256 tokenId) public {
        _burn(tokenId);

        // Clean up information
        delete certificateDetails[tokenId];
    }

    // Override transfer functions to disable it
    function _safeTransfer(address from, address to, uint256 tokenId, bytes memory data) internal pure override {
        revert("Transfer of WeddingCertificates not allowed");
    }

    function _transfer(address from, address to, uint256 tokenId) internal pure override {
        revert("Transfer of WeddingCertificates not allowed");
    }

    function safeTransferFrom(address from, address to, uint256 tokenId, bytes memory data) public pure override {
        revert("Transfer of WeddingCertificates not allowed");
    }

    function transferFrom(address from, address to, uint256 tokenId) public pure override {
        revert("Transfer of WeddingCertificates not allowed");
    }
}
