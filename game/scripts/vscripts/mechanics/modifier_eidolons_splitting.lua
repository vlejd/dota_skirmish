modifier_eidolons_splitting = class({})

function modifier_eidolons_splitting:IsPurgable( ... )
	return false
end

function modifier_eidolons_splitting:IsHidden( ... )
	return true
end

function modifier_eidolons_splitting:OnCreated(kv)
	if not IsServer() then return end
	self.attack_limit = 6
	self.attack_performed = 0
end

function modifier_eidolons_splitting:DeclareFunctions()
	local funcs = {
		MODIFIER_EVENT_ON_ATTACK_LANDED,
	}
	return funcs
end

function modifier_eidolons_splitting:OnAttackLanded(params)
	if not IsServer() then return end 

	if params.attacker ~= self:GetParent() then return end
	
	self.attack_performed = self.attack_performed + 1

	if self.attack_performed == self.attack_limit then

		print("duration")
		print(self:GetDuration())
		local ability = nil
		local caster  = self:GetCaster()
		local parent  = self:GetParent()

		local eidolon = CreateUnitByName(parent:GetUnitName(), parent:GetOrigin() + RandomVector(50),true,caster,nil,caster:GetTeam())
		eidolon:SetControllableByPlayer(caster:GetPlayerID(),true)
		eidolon:SetOwner(caster)
		eidolon:AddNewModifier(caster,ability,"modifier_demonic_conversion",{duration = self:GetDuration()+2})
		FindClearSpaceForUnit(eidolon,eidolon:GetOrigin(), true)
		--refresh old eidolon
		parent:AddNewModifier(caster,ability,"modifier_demonic_conversion",{duration = self:GetDuration()})
		parent:SetHealth(99999)
		self:Destroy()
	end
end