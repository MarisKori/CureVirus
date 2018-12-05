require "Items/SuburbsDistributions"
require "Items/ItemPicker"


local sd = SuburbsDistributions;
local function AddLoot(room_name,cat_name,item_name,chance,rolls)
	local r = sd[room_name];
	if not r then
		r = {};
		sd[room_name] = r;
	end
	local c = r[cat_name];
	if not c then
		c = {
			rolls = rolls or 3,
			items = {},
		}
		r[cat_name] = c;
	end
	table.insert(c.items, item_name);
	table.insert(c.items, chance);
end

AddLoot('medclinic','officedrawers','CureVirus.CVMag1',2);
AddLoot('medclinic','desk','CureVirus.CVMag1',2);
AddLoot('medclinic','counter','CureVirus.CVMag1',2);
AddLoot('medclinic','bin','CureVirus.CVMag1',2);

AddLoot('medicaloffice','officedrawers','CureVirus.CVMag1',2);
AddLoot('medicaloffice','desk','CureVirus.CVMag1',2);
AddLoot('medicaloffice','counter','CureVirus.CVMag1',2);
AddLoot('medicaloffice','bin','CureVirus.CVMag1',2);

AddLoot('medical','officedrawers','CureVirus.CVMag1',2);
AddLoot('medical','desk','CureVirus.CVMag1',2);
AddLoot('medical','counter','CureVirus.CVMag1',2);


table.insert(sd.pharmacy.shelves.items, "CureVirus.CVMag1");
table.insert(sd.pharmacy.shelves.items, 3);

table.insert(sd.pharmacystorage.counter.items, "CureVirus.CVMag1");
table.insert(sd.pharmacystorage.counter.items, 3);

table.insert(sd.library.counter.items, "CureVirus.CVMag1");
table.insert(sd.library.counter.items, 3);

-----------------------------2

table.insert(sd.medical.counter.items, "CureVirus.CVMag2");
table.insert(sd.medical.counter.items, 3);

table.insert(sd.medicalstorage.all.items, "CureVirus.CVMag2");
table.insert(sd.medicalstorage.all.items, 3);

table.insert(sd.all.medicine.items, "CureVirus.CVMag2");
table.insert(sd.all.medicine.items, 3);

table.insert(sd.pharmacy.shelves.items, "CureVirus.CVMag2");
table.insert(sd.pharmacy.shelves.items, 3);

table.insert(sd.pharmacystorage.counter.items, "CureVirus.CVMag2");
table.insert(sd.pharmacystorage.counter.items, 3);

table.insert(sd.medicaloffice.counter.items, "CureVirus.CVMag2");
table.insert(sd.medicaloffice.counter.items, 3);

table.insert(sd.Nurse.medicine.items, "CureVirus.CVMag2");
table.insert(sd.Nurse.medicine.items, 3);

table.insert(sd.Nurse.counter.items, "CureVirus.CVMag2");
table.insert(sd.Nurse.counter.items, 3);

table.insert(sd.library.counter.items, "CureVirus.CVMag2");
table.insert(sd.library.counter.items, 3);

table.insert(sd.bookstore.all.items, "CureVirus.CVMag2");
table.insert(sd.bookstore.all.items, 1);

------------------------------3

table.insert(sd.grocerystorage.bin.items, "CureVirus.CVMag3");
table.insert(sd.grocerystorage.bin.items, 1);

table.insert(sd.grocery.counter.items, "CureVirus.CVMag3");
table.insert(sd.grocery.counter.items, 1);

table.insert(sd.grocery.shelvesmag.items, "CureVirus.CVMag3");
table.insert(sd.grocery.shelvesmag.items, 1);

table.insert(sd.grocery.crate.items, "CureVirus.CVMag3");
table.insert(sd.grocery.crate.items, 1);

table.insert(sd.all.desk.items, "CureVirus.CVMag3");
table.insert(sd.all.desk.items, 0.2);

table.insert(sd.all.filingcabinet.items, "CureVirus.CVMag3");
table.insert(sd.all.filingcabinet.items, 0.2);

--------------------------------4

table.insert(sd.bathroom.all.items, "CureVirus.CVMag4");
table.insert(sd.bathroom.all.items, 0.2);

----------------------------------- 6

table.insert(sd.bar.shelves.items, "CureVirus.CVMag6");
table.insert(sd.bar.shelves.items, 3);

table.insert(sd.bar.counter.items, "CureVirus.CVMag6");
table.insert(sd.bar.counter.items, 3);

table.insert(sd.bar.bin.items, "CureVirus.CVMag6");
table.insert(sd.bar.bin.items, 3);

table.insert(sd.barkitchen.shelves.items, "CureVirus.CVMag6");
table.insert(sd.barkitchen.shelves.items, 3);

table.insert(sd.restaurant.shelves.items, "CureVirus.CVMag6");
table.insert(sd.restaurant.shelves.items, 3);

AddLoot("barstorage","all", "CureVirus.CVMag6", 2);

table.insert(sd.restaurant.shelves.items, "CureVirus.CVMag6");
table.insert(sd.restaurant.shelves.items, 3);

-----------------------------------------

table.insert(sd.burgerkitchen.counter.items, "CureVirus.CVPropyleneGlycol");
table.insert(sd.burgerkitchen.counter.items, 0.5);

table.insert(sd.spiffoskitchen.counter.items, "CureVirus.CVPropyleneGlycol");
table.insert(sd.spiffoskitchen.counter.items, 0.5);

table.insert(sd.kitchen_crepe.counter.items, "CureVirus.CVPropyleneGlycol");
table.insert(sd.kitchen_crepe.counter.items, 0.5);

table.insert(sd.cafe.counter.items, "CureVirus.CVPropyleneGlycol");
table.insert(sd.cafe.counter.items, 0.5);

table.insert(sd.cafe.bin.items, "CureVirus.CVPropyleneGlycol");
table.insert(sd.cafe.bin.items, 0.5);

table.insert(sd.pizzakitchen.counter.items, "CureVirus.CVPropyleneGlycol");
table.insert(sd.pizzakitchen.counter.items, 0.5);

table.insert(sd.restaurant.shelves.items, "CureVirus.CVPropyleneGlycol");
table.insert(sd.restaurant.shelves.items, 0.5);

table.insert(sd.restaurantkitchen.counter.items, "CureVirus.CVPropyleneGlycol");
table.insert(sd.restaurantkitchen.counter.items, 0.5);

table.insert(sd.theatrekitchen.counter.items, "CureVirus.CVPropyleneGlycol");
table.insert(sd.theatrekitchen.counter.items, 0.5);

AddLoot('cafeteria','all','CureVirus.CVPropyleneGlycol',0.5);

AddLoot('closet','all','CureVirus.CVPropyleneGlycol',0.2);

AddLoot('generalstore','all','CureVirus.CVPropyleneGlycol',0.05);
AddLoot('generalstorestorage','all','CureVirus.CVPropyleneGlycol',0.05);


--CVPropyleneGlycol раскидать


--office

--[[
local input = getFileInput("CVWorldGen.dat");
if input ~= nil then
	virusType1 = input:readInt();
	endFileInput();
else
	virusType1 = ZombRand(99);
	local data = getFileOutput("CVWorldGen.dat");
	data:writeInt(virusType1);
	endFileOutput();
end
--]]


CVRand = {}

function InitCVRand()
	if CVRand.CVMag6 then
		return
	end
	local gameTime = GameTime:getInstance();
	local data = gameTime:getModData();
	if not data.CVMag6 then
		return print("ERROR: No CV Info!");
	end
	local function MakeCVName(str,num)
		if num == 0 then
			return str;
		end
		return str .. " " .. tostring(num);
	end
	CVRand = {
		CVVirusBook = {
			MakeCVName("Blend Antiviral Drug",data.CVVirusBook),
			MakeCVName("Extract Special Liver", data.CVMag1),
			MakeCVName("Grind Up Pills", data.CVMag2),
			MakeCVName("Prepare Secret Ingredient",data.CVMag3), 
			MakeCVName("Get Allergic Extract",data.CVExtract),
			MakeCVName("Produce Detergent", data.CVMag4),
			MakeCVName("Pickle Herbs", data.CVMag6),
		},
		CVMag1 = {MakeCVName("Extract Special Liver", data.CVMag1)},
		CVMag2 = {MakeCVName("Grind Up Pills", data.CVMag2)},
		CVMag3 = {MakeCVName("Prepare Secret Ingredient",data.CVMag3), MakeCVName("Get Allergic Extract",data.CVExtract)},
		CVMag4 = {MakeCVName("Produce Detergent", data.CVMag4)},
		CVMag6 = {MakeCVName("Pickle Herbs", data.CVMag6)},
	}
end


Events.OnGameTimeLoaded.Add(function(playerID)
	if isClient() then return end
	--print("SUPER_TEST SERVER OnGameTimeLoaded");
	local gameTime = GameTime:getInstance();
	local data = gameTime:getModData();
	if not data.CVMag6 then
		data.CVVirusBook = ZombRand(4);
		data.CVMag1 = ZombRand(3);
		data.CVMag2 = ZombRand(20);
		data.CVMag3 = ZombRand(42); --allergic
		data.CVMag4 = ZombRand(20);
		data.CVMag6 = ZombRand(49);
		if data.CVMag3 > 20 then
			data.CVExtract = data.CVMag3 - 21;
		else
			data.CVExtract = data.CVMag3;
		end
	end
	--TestEnv();
	if not isServer() then
		InitCVRand()
	end
end)


--[[
local room_now;
local fillContainer = function(room, containerType, container)
	if room ~= room_now then
		room_now = room;
		print("ENTER ROOM:",room);
	end
	local cnt = container:getItems():size();
    print("Container = "..tostring(containerType)..", Size = "..tostring(cnt));
	--print("Array:",tostring(container:getItems():toArray()));
	if not cnt then return end
	for i=0,cnt-1 do
		local item = container:getItems():get(i);
		if instanceof(item, "InventoryItem") then
			print("\t"..tostring(item));
		end
	end
end
Events.OnFillContainer.Add(fillContainer);
--]]

local MUST_BE_FRESH = {Broccoli=1,Cabbage=1,Carrots=1,Potato=1,RedRadish=1,Strewberrie=1,Tomato=1,
	CVAnimalLiver=1,CVZombieBlood=1,DeadMouse=1,DeadRat=1,DeadSquirrel=1,DeadRabbit=1,DeadBird=1,
	Apple=1,Banana=1,Cherry=1,Grapes=1,Peach=1,Pineapple=1,Avocado=1,Lettuce=1,Zucchini=1,
	Lemon=1,Orange=1,Watermelon=1,WatermelonSliced=1,WatermelonSmashed=1,
	BellPepper=1,CannedBellPepper=1,Corn=1,CannedCornOpen=1,Eggplant=1,CannedEggplant=1,
	Leek=1,CannedLeek=1,Onion=1,CannedChiliOpen=1,Peas=1,CannedPeasOpen=1,
	Tofu=1,DogfoodOpen=1,Cheese=1,Milk=1,Icecream=1,Egg=1,WildEggs=1,
}
function isFresh_OnTest(item)
	local tip = tostring(item:getType());
	if MUST_BE_FRESH[tip] then
		if item:isRotten() then
			return false;
		end
	end
	return true;
end

function ExtractSpecialLiver_OnTest(item)
	if item:getType() == 'CVZombieBlood' then
		if item:isCooked() or item:isBurnt() then
			return false;
		end
	end
	return isFresh_OnTest(item);
end

function MakeCustomResearch_OnTest(item)
	if item:getType() == 'CVZombieBlood' then
		if not item:isCooked() then
			return false;
		end
	end
	return true;
end


function CVAnimalLiver_OnCreate(items, result, player, selectedItem)
	player:getInventory():AddItems("Pot", 1);
end

function CVAntivirus_OnCreate(items, result, player)
	--player:getInventory():AddItems("Pot", 1);
end

function CVSecretIngredient_OnCreate(items, result, player)
	local cnt = items:size()-1;
    for i=0,cnt do
		if items:get(i):getType() == "CVAllergicExtract" then
			local inv = player:getInventory();
			inv:AddItem("Base.EmptyJar");
			inv:AddItem("Base.JarLid");
		end
    end
end


--------------- DEBUG ----------
function debug_items(player, square)
--	just for testing
	player:getInventory():AddItem("CureVirus.CVMag0");
	player:getInventory():AddItem("CureVirus.CVMag00");
	player:getInventory():AddItem("CureVirus.CVVirusBook");
	player:getInventory():AddItem("CureVirus.CVMag1");
	player:getInventory():AddItem("CureVirus.CVMag2");
	player:getInventory():AddItem("CureVirus.CVMag3");
	player:getInventory():AddItem("CureVirus.CVMag4");
	player:getInventory():AddItem("CureVirus.CVMag6");
end

--Events.OnNewGame.Add(debug_items);


local debugContainer = function(room, containerType, container)
    print("-----> "..tostring(room).." / "..tostring(containerType));
end
Events.OnFillContainer.Add(debugContainer);







