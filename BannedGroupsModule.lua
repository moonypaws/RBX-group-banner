local forbiddenGroups = {
	--[[[34999790] = { -- testing reasons
		IgnoreRoleLevel1 = true,
		reason = "Testing.",
		banAscnAfterKick = true
	},]]
	
	[7765801] = { -- faeki's group 1 (mainly know for making the game: Transfur Outbreak)
		IgnoreRoleLevel1 = true,
		reason = "This group/community has a dark past or shady developers. Known for stealing assests from other games",
		banAscnAfterKick = true
	},

	[34804169] = { -- faeki's group 2 (generally supporters)
		IgnoreRoleLevel1 = false,
		reason = "Same reason as group ID [' 7765801 '].",
		banAscnAfterKick = true
	},

	[33022518] = {-- faeki's group 3 (generally supporters)
		IgnoreRoleLevel1 = false,
		reason = "Same reason as group ID [' 7765801 '].",
		banAscnAfterKick = true
	},

	[15630224] = { -- group named "Sharkiiea's lounge"
		IgnoreRoleLevel1 = false,
		reason = "Suspicious owner.",
		banAscnAfterKick = true
	},

	[15278613] = { -- group named "Unusual Assets"
		IgnoreRoleLevel1 = true,
		reason = "Suspicious owner.",
		banAscnAfterKick = true
	},
}

return forbiddenGroups
