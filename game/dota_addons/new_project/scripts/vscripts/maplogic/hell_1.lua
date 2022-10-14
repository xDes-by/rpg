if hell_1 == nil then
	hell_1 = class({})
end

function hell_1:Init()
	hell_1:start_quest()
	hell_1:start_fire()
end

function hell_1:start_quest()
	Timers:CreateTimer(3.5, function()
		local hRelay = Entities:FindByName( nil, "hell_1_logic" )
		hRelay:Trigger(nil,nil)	
		Quest:MapActivate('hell_1')
	end)
end

function hell_1:start_fire()
	for i =1, 5 do
		local point = Entities:FindByName( nil, "fire_"..i):GetAbsOrigin()
		local trees = GridNav:GetAllTreesAroundPoint(point, 2600, false)
		for _,t in pairs(trees) do
			local effect_cast = ParticleManager:CreateParticle("particles/flame.vpcf", PATTACH_WORLDORIGIN, nil)
			cps = {0, 1, 2, 3, 4}
			point = t:GetAbsOrigin()
			for i = 1, #cps do
				ParticleManager:SetParticleControl(effect_cast, cps[i], point)
			end
		end
	end
end
