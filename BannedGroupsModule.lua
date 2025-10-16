local forbiddenGroups = {
	[7765801] = { -- faeki's group 1
		IgnoreRoleLevel1 = true,
		reason = "This group/community has a dark past or shady developers.",
		banAscnAfterKick = true
	},

	[34804169] = { -- faeki's group 2
		IgnoreRoleLevel1 = false,
		reason = "Same reason as group ID [' 7765801 '].",
		banAscnAfterKick = true
	},

	[33022518] = {-- faeki's group 3
		IgnoreRoleLevel1 = false,
		reason = "Same reason as group ID [' 7765801 '].",
		banAscnAfterKick = true
	},

	[15630224] = {
		IgnoreRoleLevel1 = false,
		reason = "Suspicious owner.",
		banAscnAfterKick = true
	},

	[15278613] = {
		IgnoreRoleLevel1 = true,
		reason = "Suspicious owner.",
		banAscnAfterKick = true
	},

	[34999790] = { --test
		IgnoreRoleLevel1 = true,
		reason = "Testing.",
		banAscnAfterKick = true
	},

}

return forbiddenGroups
