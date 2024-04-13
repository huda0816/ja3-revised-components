-- Original author: Tobias from abandoned "Custom Settings" mod.
UndefineClass("REV_CustomSettingsUtils")
DefineClass.REV_CustomSettingsUtils = {}

-- create a new table from multiple tables or values in args
function REV_CustomSettingsUtils.make_table(...)
	local result = {}
	for _, v in ipairs(table.pack(...)) do
		if type(v) == "table" then
			for _, v2 in ipairs(v) do
				result[#result + 1] = v2
			end
		else
			result[#result + 1] = v
		end
	end

	return result
end

-- finds sub-elements in an XTemplate by matching on property name/value
-- multi = nil (first)
-- multi = "first_on_branch" (first on each branch)
-- multi = "all" (all in tree)
-- returns:
-- {
--     {
--         ["element"] = <match_element>,
--         ["ancestors"] = { <ancestor_1>, ... },
--         ["indices"] = { <match_element_index_in_ancestor_1>, ... }
--     },
--     <match_2>,
--     ...
-- }
function REV_CustomSettingsUtils.XTemplate_FindElementsByProp(curr, prop, value, multi, ancestors, indices)
	local results = {}

	if type(curr) ~= "table" then
		return false
	end

	if curr[prop] and curr[prop] == value then
		local r = { ["element"] = curr, ["ancestors"] = ancestors, ["indices"] = indices }
		if multi == "all" then
			results = { r }
		else
			return multi == "first_on_branch" and { r } or r
		end
	end

	if curr[1] then
		local new_ancestors = REV_CustomSettingsUtils.make_table({ curr }, ancestors and ancestors or nil)
		for i, v in ipairs(curr) do
			local new_indices = REV_CustomSettingsUtils.make_table({ i }, indices and indices or nil)
			local result = REV_CustomSettingsUtils.XTemplate_FindElementsByProp(v, prop, value, multi, new_ancestors,
				new_indices)
			if result ~= false then
				if multi then
					for i, r in ipairs(result) do
						table.insert(results, r)
					end
				else
					return result
				end
			end
		end
	end

	return multi and #results > 0 and results or false
end
