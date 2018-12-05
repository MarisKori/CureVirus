



Events.OnGameTimeLoaded.Add(function(playerID)
	if not isClient() then
		return
	end
	print("Initializing CVRand...")
	InitCVRand();
	print("CV CODE: "
		..tostring(CVRand.CVMag1[1])..", "
		..tostring(CVRand.CVMag2[1])..", "
		..tostring(CVRand.CVMag3[1])..", "
		..tostring(CVRand.CVMag4[1])..", "
		..tostring(CVRand.CVMag6[1])..", "
		..tostring(CVRand.CVVirusBook[1])
	);
end)


local PART_NAMES = {'Hand_R','Hand_L','Foot_R','Foot_L','Head','Torso_Upper','Torso_Lower',
	'UpperArm_L','UpperArm_R','ForeArm_L','ForeArm_R','LowerLeg_L','LowerLeg_R','UpperLeg_L','UpperLeg_R',
	'Neck','Groin',}

local function HealPlayer(player,arg)
	do
		local s = 'HealPlayer: ';
		for k,v in pairs(arg) do
			s = s .. k .. '=' .. tostring(v) .. ', ';
		end
		print(s);
	end
	local stats = player:getStats()
	local bd = player:getBodyDamage()
	if bd:isInf() then
		print("is infected!");
		
		local CatchACold = bd:getCatchACold();
		local getColdProgressionRate = bd:getColdProgressionRate();
		local getColdStrength = bd:getColdStrength();
		local getDrunkIncreaseValue = bd:getDrunkIncreaseValue();
		local getDrunkReductionValue = bd:getDrunkReductionValue();
		local getFoodSicknessLevel = bd:getFoodSicknessLevel();
		local getPainReductionFromMeds = bd:getPainReductionFromMeds();
		local getPoisonLevel = bd:getPoisonLevel();
		local getTemperature = bd:getTemperature();
		local getUnhappynessLevel = bd:getUnhappynessLevel();
		local getWetness = bd:getWetness();
		local isHasACold = bd:isHasACold();
		local boredom = bd:getBoredomLevel();
		
		--stats
		local Pain = stats:getPain();
		local drunk = stats:getDrunkenness();
		
		local save_parts = {}
		for i,k in pairs(PART_NAMES) do
			--bd:getBodyPart(BodyPartType[k]):SetInfected(false);
			local v = bd:getBodyPart(BodyPartType[k]);
			save_parts[k] = {
				health = v:getHealth(),
				--pain = v:getPain(),
				infection = v:getWoundInfectionLevel(),
				alcohol = v:getAlcoholLevel(),
				bandaged = v:bandaged(),
				bandageTime = v:getBandageLife(),
				biteTime = v:getBiteTime(),
				scratchTime = v:getScratchTime(),
				bleedTime = v:getBleedingTime(),
				burnTime = v:getBurnTime(),
				deepWoundTime = v:getDeepWoundTime(),
				fractureTime = v:getFractureTime(),
				stitchTime = v:getStitchTime(),
				haveBullet = v:haveBullet(),
				haveGlass = v:haveGlass(),
				isCortorised = v:IsCortorised(),
				needWash = v:isNeedBurnWash(),
				splint = v:getSplintFactor(),
				splintItem = v:getSplintItem(),
				stemmed = v:IsBleedingStemmed(),
				inf = v:IsInfected(),
				add_pain = v:getAdditionalPain(),
				ban_type = v:getBandageType(),
				--undocumented
				garlic = v:getGarlicFactor(),
				plantain = v:getPlantainFactor(),
				comfrey = v:getComfreyFactor(),
			};
			--v:SetInfected(false);
		end
		local infection_level = bd:getInfectionLevel()
		local fake = bd:getFakeInfectionLevel();
		local fake_reduce = bd:isReduceFakeInfection();
		--bd:setInf(false);
		--bd:setInfectionLevel(0);
		
		if arg.cure then
			bd:RestoreToFullHealth()
		end
		if arg.virus then
			print("Set infection!");
			bd:setInf(true);
		end

		if arg.fake then
			if arg.fake == 0 then
				bd:setIsFakeInfected(false)
				bd:setFakeInfectionLevel(0);
			else
				local new_fake = (infection_level > fake) and infection_level or fake;
				bd:setIsFakeInfected(true)
				bd:setFakeInfectionLevel(new_fake);
				bd:setReduceFakeInfection(false);
			end
		elseif fake > 0 then
			bd:setIsFakeInfected(true);
			bd:setFakeInfectionLevel(fake);
			if fake_reduce then
				bd:setReduceFakeInfection(true);
			end
		end

		--Restore
		bd:setCatchACold(CatchACold);
		bd:setColdProgressionRate(getColdProgressionRate);
		bd:setColdStrength(getColdStrength);
		bd:setDrunkIncreaseValue(getDrunkIncreaseValue);
		bd:setDrunkReductionValue(getDrunkReductionValue);
		bd:setFoodSicknessLevel(getFoodSicknessLevel);
		bd:setHasACold(isHasACold);
		bd:setPainReductionFromMeds(getPainReductionFromMeds);
		bd:setPoisonLevel(getPoisonLevel);
		bd:setTemperature(getTemperature);
		bd:setUnhappynessLevel(getUnhappynessLevel);
		bd:setWetness(getWetness);
		bd:setBoredomLevel(boredom);
		
		stats:setPain(Pain);
		stats:setDrunkenness(drunk);
		
		local cnt_infected_parts = 0;
		for i,k in pairs(PART_NAMES) do
			local data = save_parts[k];
			local v = bd:getBodyPart(BodyPartType[k]);
			if data.scratchTime > 0 then
				v:setScratched(true);
				v:setScratchTime(data.scratchTime);
			end
			if data.biteTime > 0 then
				v:SetBitten(true,false);
				v:setBiteTime(data.biteTime);
			end
			if data.burnTime > 0 then
				v:setBurned();
				v:setBurnTime(data.burnTime);
			end
			if data.fractureTime > 0 then
				v:setFractureTime(fractureTime);
			end
			if data.deepWoundTime > 0 then
				v:setDeepWounded(true);
				v:setDeepWoundTime(data.deepWoundTime);
			end
			if data.bleedTime > 0 then
				v:setBleeding(true);
				v:setBleedingTime(data.bleedTime);
			end
			if data.stemmed then
				v:SetBleedingStemmed(true);
			end
			if data.isCortorised then v:SetCortorised(true) end
			v:SetHealth(data.health);
			v:setAlcoholLevel(data.alcohol);
			if data.infection > 0 then
				v:setInfectedWound(true);
				v:setWoundInfectionLevel(data.infection);
			end
			if data.bandaged then
				v:setBandaged(true, data.bandageTime);
			end
			if data.stitchTime > 0 then
				v:setStitched(true);
				v:setStitchTime(data.stitchTime);
			end
			if data.haveBullet then
				v:setHaveBullet(true,0);
			end
			if data.haveGlass then
				v:setHaveGlass(true);
			end
			if data.needWash then
				v:setNeedBurnWash(true);
			end
			if data.splint > 0 then
				v:setSplint(true, data.splint);
				v:setSplintItem(data.splintItem);
			end
			if arg.virus and data.inf then --if bodypart was infected
				v:SetInfected(true);
				print("Set infected "..tostring(k));
				cnt_infected_parts = cnt_infected_parts + 1;
			elseif v:IsInfected() then --keep clear bites, cure new scratches
				print("Clear infection "..tostring(k));
				v:SetInfected(false);
			end
			if data.add_pain > 0 then
				v:setAdditionalPain(data.add_pain);
			end
			if data.ban_type and data.ban_type ~= "" then
				v:setBandageType(data.ban_type);
			end
			if data.garlic > 0 then
				v:setGarlicFactor(data.garlic);
			end
			if data.plantain > 0 then
				v:setPlantainFactor(data.plantain);
			end
			if data.comfrey > 0 then
				v:getComfreyFactor(data.comfrey);
			end
		end
	end
	--bd:RestoreToFullHealth()
	if arg.virus and cnt_infected_parts == 0 then
		bd:getBodyPart(BodyPartType.Head):SetInfected(true);
		print("Set infected on the HEAD");
	end

	--stats:setAnger(1)
	local d = stats:getDrunkenness() + 150
	if (d > 200) then d = 200 end
	--stats:setDrunkenness(d)
	
	local e = stats:getEndurance()
	if (e > 0.3) then
		e = e - 0.55
		if e < 0.3 then e = 0.3 end
		--stats:setEndurance(e)
	end
	
	--local p = stats:getPain()
	--if p < 100 then
	--	stats:setPain(100)
	--end
	
	local poison = bd:getPoisonLevel()
	--poison = poison + 20
	--bd:setPoisonLevel(poison)
end

-- CureVirus.CVAntivirus
function CVAntivirusEat(food, player)
	if food:isCooked() or food:isBurnt() then
		return
	end
	local bd = player:getBodyDamage();
	if not bd:isInf() then --nothing to cure
		return
	end
	if food:isFresh() then
		HealPlayer(player,{cure=true, fake=true});
	elseif not food:isRotten() then
		if ZombRand(100) < 30 then
			HealPlayer(player,{cure=true, fake=true});
		end
	end
end


function CVDrinkBlood(food, player)
	if food:isCooked() or food:isBurnt() then --cooked is safe
		print("Cooked="..tostring(food:isCooked())..", Burnt="..tostring(food:isBurnt()));
		return
	end
	local bd = player:getBodyDamage();
	--if not bd:isInf() then
		--local infection_level = bd:getInfectionLevel()
		--local fake = bd:getFakeInfectionLevel()
		--if infection_level < fake  then  infection_level = fake; end
		--if infection_level < 1 then infection_level = 1; end
		--bd:setInfectionLevel(infection_level);
		bd:setInf(true);
		bd:getBodyPart(BodyPartType.Head):SetInfected(true)
		--bd:setInfectionLevel(0.01);
		--if bd:IsFakeInfected() then
			--bd:setReduceFakeInfection(false);
		--end
	--end
end

-- additem CureVirus.TestItem
function CVOnEatTestItem(food, player)
	local bd = player:getBodyDamage();
	bd:setIsFakeInfected(false);

end

-- additem CureVirus.TestItem2
function CVOnEatTestItem2(food, player)
	local bd = player:getBodyDamage();
	bd:setIsFakeInfected(true);
	bd:setFakeInfectionLevel(35);
end

function CVWhitePowder_OnEat(food, player)
	local bd = player:getBodyDamage();
	bd:getBodyPart(BodyPartType.Head):setAdditionalPain(100);
	local data = player:getModData();
	data.CVWhitePowderTime = 35; -- ~6 hours
end


--[[
local worldContextMenu = function(player, context, worldobjects, test)
	print('worldContextMenu',player,context,worldobjects,test)
	for k,v in pairs(worldobjects) do
		print("\t"..k,tostring(v))
		if type(v) == "table" then
			for kk,vv in pairs(v) do
				print("\t\t"..kk,tostring(vv))
				if type(vv) == "table" then
					for kkk,vvv in pairs(vv) do
						print("\t\t\t"..kkk,tostring(vvv))
					end
				end
			end
		end
	end
end
Events.OnFillWorldObjectContextMenu.Add(worldContextMenu);
--]]

--[[
local invContextMenu = function(player, context, worldobjects, test)
	do
		return;
	end
	print('invContextMenu',player,context,worldobjects,test)
	for k,v in pairs(worldobjects) do
		print("\t"..k,tostring(v))
		if type(v) == "table" then
			for kk,vv in pairs(v) do
				print("\t\t"..kk,tostring(vv))
				if type(vv) == "table" then
					for kkk,vvv in pairs(vv) do
						print("\t\t\t"..kkk,tostring(vvv))
					end
				end
			end
		end
	end
end
Events.OnFillInventoryObjectContextMenu.Add(invContextMenu);


local doOverlaySprite = function(sq)
	--print("doOverlaySprite");
	do
		return;
	end
    if isClient() then return print("\tclient"); end
    if not sq then return; end
	local arr = sq:getObjects();
	local cnt = arr:size()-1;
    for j=0,cnt do
        local obj = arr:get(j);
        if obj then
			local name = obj:getName();
			local oname = obj:getObjectName();
			local tip = obj:getType();
			if not (name == nil or name == "Grass" or tip == "tree" or oname == "Tree" or name == "Generic") then
				print("LOOK: "
					..tostring(name).."; "
					..tostring(oname).."; "
					..tostring(tip)
					);
			end
        end
    end
end
Events.LoadGridsquare.Add(doOverlaySprite);
--]]


local GUI_INFO_ITEMS = {
	CVMag0 = { name = 'IGUI_ItemName_CVMag0', info = 'IGUI_ItemName_CVMag0_Ann', },
	CVMag00 = { name = 'IGUI_ItemName_CVMag00', info = 'IGUI_ItemName_CVMag00_Ann', },
	CVVirusBook = { name = 'IGUI_ItemName_CVVirusBook', info = 'IGUI_ItemName_CVVirusBook_Ann', },
	CVMag1 = { name = 'IGUI_ItemName_CVMag1', info = 'IGUI_ItemName_CVMag1_Ann', },
	CVMag2 = { name = 'IGUI_ItemName_CVMag2', info = 'IGUI_ItemName_CVMag2_Ann', },
	CVMag3 = { name = 'IGUI_ItemName_CVMag3', info = 'IGUI_ItemName_CVMag3_Ann', },
	CVMag4 = { name = 'IGUI_ItemName_CVMag4', info = 'IGUI_ItemName_CVMag4_Ann', },
	CVMag6 = { name = 'IGUI_ItemName_CVMag6', info = 'IGUI_ItemName_CVMag6_Ann', },
}


require('ISUI/ISPanel');
require('ISUI/ISRichTextPanel');
require('ISUI/ISCollapsableWindow');

UIStoryPanel = {};

function UIStoryPanel.new(title, text)
    title = title or 'title';
    text  = text or 'text';

    local self = {};
    self.tut = ISRichTextPanel:new(0, 0, 300, 200);
    self.tut:initialise();
    self.tut:setAnchorBottom(true);
    self.tut:setAnchorRight(true);
    self.moreinfo = self.tut:wrapInCollapsableWindow();
    self.moreinfo:setX((getCore():getScreenWidth() * 0.5) - (self.tut.width * 0.5));
    self.moreinfo:setY((getCore():getScreenHeight() * 0.5) - (self.tut.height * 0.5));
    self.moreinfo:setTitle(title);

    self.moreinfo:addToUIManager();
    self.tut:setWidth(self.moreinfo:getWidth());
    self.tut:setHeight(self.moreinfo:getHeight() - 16);
    self.tut:setY(16);
    self.tut.autosetheight = false;
    self.tut.clip = true;
    self.tut:addScrollBars();

    self.tut.textDirty = true;
    self.tut.text = text;
    self.tut:paginate();
    return self;
end

local function checkInvItem(player, context, worldobjects, item)
	local name = item:getType();
	if name == 'CVWhitePowder' then
		--context:addOption(ann, getText(data.name), UIStoryPanel.new, getText(data.info));
	end
	if not item:IsLiterature() then
		return --print("not literature");
	end
	--print("name",tostring(item:getName()),tostring(item:getBookName()),tostring(item:getType()),tostring(item:getFullType()));
	if CVRand[name] then
		local recs = CVRand[name];
		local list = item:getTeachedRecipes();
		for i=1,#recs do
			list:set(i-1,recs[i]);
		end
	end
	if GUI_INFO_ITEMS[name] then
		local data = GUI_INFO_ITEMS[name];
		local ann = getText("ContextMenu_Annotation")
		--ann = 'Аннотация';
		context:addOption(ann, getText(data.name), UIStoryPanel.new, getText(data.info));
	end
end


local invContextMenu1 = function(_player, context, worldobjects, test)
	local playerObj = getSpecificPlayer(_player);
	
	for i,k in pairs(worldobjects) do
	-- inventory item list
		if instanceof(k, "InventoryItem") then
			checkInvItem(playerObj, context, worldobjects, k);			
		elseif not instanceof(k, "InventoryItem") and k.items and #k.items > 1 then
			checkInvItem(playerObj, context, worldobjects, k.items[1]);
		end
	end
end
Events.OnFillInventoryObjectContextMenu.Add(invContextMenu1);


--Check character injuries
local PART_DATA = {}
for i,k in pairs(PART_NAMES) do
	PART_DATA[k] = {
		DamageName = k .. "_Damage",
	}
end

local function fnEveryTenMinutes()
	print("[ OnTimer ]");
	local player = getPlayer();
	local bd = player:getBodyDamage()
	local save = player:getModData();
	local count_infected = 0;
	local InfectionLevel = bd:getInfectionLevel();
	if InfectionLevel > 3 and not save.BloodInfected then
		save.BloodInfected = 1;
	end
	for i,k in pairs(PART_NAMES) do
		--bd:getBodyPart(BodyPartType[k]):SetInfected(false);
		local v = bd:getBodyPart(BodyPartType[k]);
		local data = PART_DATA[k];
		local strength = save[data.DamageName];
		if v:IsInfected() then
			if not strength then
				strength = ZombRand(1000);
				save[data.DamageName] = strength;
			end
			--try cure
			local sum = 1000
			local alcohol = v:getAlcoholLevel();
			if alcohol > 18.5 then
				sum = sum - 200;
			elseif alcohol > 1 then
				sum = sum - 100;
			end;
			if v:getGarlicFactor() > 0 then
				sum = sum - 200;
			end
			if v:getBandageType() == "Base.ToxicRippedSheets" then
				sum = sum - 200;
			end
			print("try heal "..k..": sum="..sum..", strength="..strength);
			if sum < strength and InfectionLevel < 15 then
				v:SetInfected(false);
				print("Success!");
			else
				count_infected = count_infected + 1;
			end
		else
			if strength then
				save[data.DamageName] = nil;
			end
		end
	end
	if count_infected == 0 and bd:isInf() then
		HealPlayer(player,{cure=true});
	end
	
	--drunkness
	local stats = player:getStats();
	local d = stats:getDrunkenness();
	local a = stats:getAnger();
	local save = player:getModData();
	if save.CVWhitePowderTime then
		if save.CVWhitePowderTime <= 0 then
			save.CVWhitePowderTime = nil;
		else
			save.CVWhitePowderTime = save.CVWhitePowderTime - 1;
			if a < 0.24 then
				a = 0.24;
				stats:setAnger(a);
			end
		end
	end
	if d > 0 or a > 0 then
		if bd:isInf() then
			local lvl = bd:getInfectionLevel();
			if lvl < 10 then
				--bd:setInfectionGrowthRate(0);
				--bd:setInfectionLevel(10);
				--print("setinfection ZERO");
				HealPlayer(player,{cure=true,virus=true});
			end
		end
		if bd:IsFakeInfected() and not bd:isReduceFakeInfection() then
			local lvl = bd:getFakeInfectionLevel();
			if lvl < 50 then
				lvl = lvl - 5;
				if lvl < 25 and lvl > 23 then
					lvl = 23;
				end
				if lvl < 0 then
					lvl = 0;
				end
				bd:setFakeInfectionLevel(lvl);
			end
		end
	end
end
Events.EveryTenMinutes.Add(fnEveryTenMinutes);


