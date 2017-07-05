pragma solidity ^0.4.11;

import "../zeppelin-solidity/contracts/ownership/Ownable.sol";

contract ADXAdvertiserRegistry is Ownable {
	// Structure:
	// Advertisers
	// 		Campaigns - particular advertising campaigns
	//		Ad Units - particular ad units 
	// Advertisers are linked to Campaigns
	// Advertisers are linked to Ad Units
	// Campaigns are linked to Ad units, and one ad unit can be re-used in many campaigns
	// Ad units are linked to Campaigns, and one campaign can be linked to multiple ad units

	mapping (address => Advertiser) public advertisers;
	mapping (bytes32 => Campaign) public campaigns;
	mapping (bytes32 => AdUnit) public adunits;

	struct Advertiser {		
		address advertiserAddr;
		string name;
		address walletAddr;
	
		mapping (bytes32 => Campaign) campaigns;
		mapping (bytes32 => AdUnit) adunits;
	}

	struct Campaign {
		bytes32 id;
		string name;
		mapping (bytes32 => AdUnit) adunits;
	}

	struct AdUnit {
		bytes32 id;
		bytes32 metaIpfsAddr; // ipfs addr of meta for this ad unit

		mapping (bytes32 => Campaign) campaigns;
	}

	modifier onlyRegisteredAdvertiser() {
		var adv = advertisers[msg.sender];
		if (adv.advertiserAddr == 0) throw;
		_;
	}

	function isRegistered(address who) external returns (bool) {
		var adv = advertisers[who];
		return adv.advertiserAddr != 0;
	}

	function registerAsAdvertiser() {

	}

	function registerCampaign() onlyRegisteredAdvertiser {

	}

	function unregisterCampaign() onlyRegisteredAdvertiser {

	}

	function registerAdUnit() onlyRegisteredAdvertiser {

	}

	function unregisterAdUnit() onlyRegisteredAdvertiser {

	}


	// event AdvertiserRegistered();
	// event CampaignRegistered();
	// event AdUnitRegistered();
}
