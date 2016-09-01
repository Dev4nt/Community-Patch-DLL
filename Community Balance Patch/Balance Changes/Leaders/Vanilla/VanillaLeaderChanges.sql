-- America -- MOMA

UPDATE Traits
SET BuyOwnedTiles = '1'
WHERE Type = 'TRAIT_RIVER_EXPANSION' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

-- Arabia -- Trade Route distance mod Instead of Luxury Doubling from Bazaar -- Units move faster in Desert -- Bonus yields from TR/Connections over desert.
UPDATE Buildings
SET ExtraLuxuries = '0'
WHERE Type = 'BUILDING_BAZAAR' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Buildings
SET TradeRouteLandDistanceModifier = '50'
WHERE Type = 'BUILDING_BAZAAR' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Building_YieldChanges
SET Yield = '3'
WHERE BuildingType = 'BUILDING_BAZAAR' AND YieldType = 'YIELD_GOLD' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

DELETE FROM Building_ResourceYieldChanges
WHERE ResourceType = 'RESOURCE_OIL' AND BuildingType = 'BUILDING_BAZAAR' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

DELETE FROM Building_FeatureYieldChanges
WHERE FeatureType = 'FEATURE_OASIS' AND BuildingType = 'BUILDING_BAZAAR' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Buildings
SET FinishLandTRTourism = '4'
WHERE Type = 'BUILDING_BAZAAR' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_BUILDINGS' AND Value= 1 );

UPDATE Buildings
SET FinishSeaTRTourism = '4'
WHERE Type = 'BUILDING_BAZAAR' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_BUILDINGS' AND Value= 1 );

UPDATE Traits
SET EventTourismBoost = '1'
WHERE Type = 'TRAIT_LAND_TRADE_GOLD' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Traits
SET EventGP = '20'
WHERE Type = 'TRAIT_LAND_TRADE_GOLD' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Traits
SET TradeReligionModifier = '0'
WHERE Type = 'TRAIT_LAND_TRADE_GOLD' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Traits
SET LandTradeRouteRangeBonus = '0'
WHERE Type = 'TRAIT_LAND_TRADE_GOLD' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

DELETE FROM Trait_ResourceQuantityModifiers
WHERE TraitType = 'TRAIT_LAND_TRADE_GOLD' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Traits
SET TradeRouteOnly = '1'
WHERE Type = 'TRAIT_LAND_TRADE_GOLD' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

-- Aztec -- Set Floating Garden to +1 Food per 3 citizens instead of +15%

UPDATE Buildings
SET MutuallyExclusiveGroup = '3'
WHERE Type = 'BUILDING_FLOATING_GARDENS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_BUILDINGS' AND Value= 1 );

UPDATE Buildings
SET FreshWater = '0'
WHERE Type = 'BUILDING_FLOATING_GARDENS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_BUILDINGS' AND Value= 1 );

UPDATE Buildings
SET PrereqTech = 'TECH_CONSTRUCTION'
WHERE Type = 'BUILDING_FLOATING_GARDENS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Traits
SET GoldenAgeFromVictory = '10'
WHERE Type = 'TRAIT_CULTURE_FROM_KILLS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Traits
SET CultureFromKills = '0'
WHERE Type = 'TRAIT_CULTURE_FROM_KILLS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Building_YieldChanges
SET Yield = '3'
WHERE BuildingType = 'BUILDING_FLOATING_GARDENS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

-- Askia -- Boost Mosque
DELETE FROM Building_YieldChanges
WHERE BuildingType = 'BUILDING_MUD_PYRAMID_MOSQUE' AND YieldType = 'YIELD_FAITH' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

DELETE FROM Building_YieldChanges
WHERE BuildingType = 'BUILDING_MUD_PYRAMID_MOSQUE' AND YieldType = 'YIELD_CULTURE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Buildings
SET PrereqTech = 'TECH_MASONRY'
WHERE Type = 'BUILDING_MUD_PYRAMID_MOSQUE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Buildings
SET BuildingProductionModifier = '10'
WHERE Type = 'BUILDING_MUD_PYRAMID_MOSQUE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Buildings
SET AllowsProductionTradeRoutes = '1'
WHERE Type = 'BUILDING_MUD_PYRAMID_MOSQUE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

DELETE FROM Building_ClassesNeededInCity
WHERE BuildingType = 'BUILDING_MUD_PYRAMID_MOSQUE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Buildings
SET BuildingClass = 'BUILDINGCLASS_STONE_WORKS'
WHERE Type = 'BUILDING_MUD_PYRAMID_MOSQUE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Civilization_BuildingClassOverrides
SET BuildingClassType = 'BUILDINGCLASS_STONE_WORKS'
WHERE BuildingType = 'BUILDING_MUD_PYRAMID_MOSQUE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Traits
SET RiverTradeRoad = '1'
WHERE Type = 'TRAIT_AMPHIB_WARLORD' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Traits
SET FasterAlongRiver = '1'
WHERE Type = 'TRAIT_AMPHIB_WARLORD' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

-- Catherine -- Move Krepost, give bonus
DELETE FROM Building_DomainFreeExperiences
WHERE BuildingType = 'BUILDING_KREPOST' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_BUILDINGS' AND Value= 1 );

UPDATE Buildings
SET PrereqTech = 'TECH_RIFLING'
WHERE Type = 'BUILDING_KREPOST' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_BUILDINGS' AND Value= 1 );

UPDATE Buildings
SET ExtraCityHitPoints = '200'
WHERE Type = 'BUILDING_KREPOST' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_BUILDINGS' AND Value= 1 );

UPDATE Buildings
SET BorderObstacleCity = '1'
WHERE Type = 'BUILDING_KREPOST' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_BUILDINGS' AND Value= 1 );

UPDATE Buildings
SET Defense = '2500'
WHERE Type = 'BUILDING_KREPOST' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_BUILDINGS' AND Value= 1 );

UPDATE Buildings
SET BuildingClass = 'BUILDINGCLASS_ARSENAL'
WHERE Type = 'BUILDING_KREPOST' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Civilization_BuildingClassOverrides
SET BuildingClassType = 'BUILDINGCLASS_ARSENAL'
WHERE BuildingType = 'BUILDING_KREPOST' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Trait_YieldChangesStrategicResources
SET YieldType = 'YIELD_SCIENCE'
WHERE TraitType = 'TRAIT_STRATEGIC_RICHES' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

-- Adjusted startbias out of tundra

DELETE FROM Civilization_Start_Region_Priority
WHERE CivilizationType = 'CIVILIZATION_RUSSIA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

-- Darius -- Adjust Satrap
UPDATE Civilization_BuildingClassOverrides
SET BuildingClassType = 'BUILDINGCLASS_COURTHOUSE'
WHERE BuildingType = 'BUILDING_SATRAPS_COURT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Buildings
SET BuildingClass = 'BUILDINGCLASS_COURTHOUSE'
WHERE Type = 'BUILDING_SATRAPS_COURT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Buildings
SET BuildAnywhere = '1'
WHERE Type = 'BUILDING_SATRAPS_COURT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Buildings
SET NeverCapture = '1'
WHERE Type = 'BUILDING_SATRAPS_COURT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Buildings
SET PrereqTech = 'TECH_PHILOSOPHY'
WHERE Type = 'BUILDING_SATRAPS_COURT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Buildings
SET HurryCostModifier = '66'
WHERE Type = 'BUILDING_SATRAPS_COURT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_BUILDINGS' AND Value= 1 );

UPDATE Buildings
SET NumCityCostMod = '5'
WHERE Type = 'BUILDING_SATRAPS_COURT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_BUILDINGS' AND Value= 1 );

UPDATE Buildings
SET NoOccupiedUnhappiness = '1'
WHERE Type = 'BUILDING_SATRAPS_COURT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

DELETE FROM Building_ClassesNeededInCity
WHERE BuildingType = 'BUILDING_SATRAPS_COURT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Buildings
SET TradeRouteRecipientBonus = '0'
WHERE Type = 'BUILDING_SATRAPS_COURT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Buildings
SET TradeRouteTargetBonus = '0'
WHERE Type = 'BUILDING_SATRAPS_COURT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Buildings
SET Happiness = '1'
WHERE Type = 'BUILDING_SATRAPS_COURT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Building_YieldChanges
SET Yield = '1'
WHERE BuildingType = 'BUILDING_SATRAPS_COURT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

-- Darius -- Stronger Units during Golden Ages

UPDATE Traits
SET GoldenAgeCombatModifier = '15'
WHERE Type = 'TRAIT_ENHANCED_GOLDEN_AGES' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Traits
SET TourismToGAP = '10'
WHERE Type = 'TRAIT_ENHANCED_GOLDEN_AGES' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

-- Egypt -- Buff Burial Tomb, +1 Production in all cities.
UPDATE Civilization_BuildingClassOverrides
SET BuildingClassType = 'BUILDINGCLASS_CARAVANSARY'
WHERE BuildingType = 'BUILDING_BURIAL_TOMB' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Buildings
SET BuildingClass = 'BUILDINGCLASS_CARAVANSARY'
WHERE Type = 'BUILDING_BURIAL_TOMB' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

DELETE FROM Building_ClassesNeededInCity
WHERE BuildingType = 'BUILDING_BURIAL_TOMB' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Buildings
SET PrereqTech = 'TECH_CURRENCY'
WHERE Type = 'BUILDING_BURIAL_TOMB' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Buildings
SET TradeRouteLandGoldBonus = '200'
WHERE Type = 'BUILDING_BURIAL_TOMB' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_BUILDINGS' AND Value= 1 );

UPDATE Buildings
SET TradeRouteLandDistanceModifier = '50'
WHERE Type = 'BUILDING_BURIAL_TOMB' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_BUILDINGS' AND Value= 1 );

UPDATE Buildings
SET CapturePlunderModifier = '0'
WHERE Type = 'BUILDING_BURIAL_TOMB' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_BUILDINGS' AND Value= 1 );

UPDATE Buildings
SET FinishLandTRTourism = '4'
WHERE Type = 'BUILDING_BURIAL_TOMB' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_BUILDINGS' AND Value= 1 );

UPDATE Buildings
SET Happiness = '0'
WHERE Type = 'BUILDING_BURIAL_TOMB' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Buildings
SET FreeArtifacts = '1'
WHERE Type = 'BUILDING_BURIAL_TOMB' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Buildings
SET GreatWorkCount = '1'
WHERE Type = 'BUILDING_BURIAL_TOMB' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Buildings
SET GreatWorkSlotType = 'GREAT_WORK_SLOT_ART_ARTIFACT'
WHERE Type = 'BUILDING_BURIAL_TOMB' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_BUILDINGS' AND Value= 1 );

UPDATE Traits
SET WonderProductionModGA = '20'
WHERE Type = 'TRAIT_WONDER_BUILDER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

-- England

DELETE FROM Civilization_UnitClassOverrides
WHERE UnitType = 'UNIT_ENGLISH_LONGBOWMAN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Traits
Set NavalUnitMaintenanceModifier = '-25'
WHERE Type = 'TRAIT_OCEAN_MOVEMENT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Traits
Set StartingSpies = '1'
WHERE Type = 'TRAIT_OCEAN_MOVEMENT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Traits
Set StartingSpyRank = '1'
WHERE Type = 'TRAIT_OCEAN_MOVEMENT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Traits
Set ExtraEmbarkMoves = '1'
WHERE Type = 'TRAIT_OCEAN_MOVEMENT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

-- Germany -- New UA

-- Bismarck -- Hanse Yield Per Pop

UPDATE Buildings
SET FinishLandTRTourism = '4'
WHERE Type = 'BUILDING_HANSE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_BUILDINGS' AND Value= 1 );

UPDATE Buildings
SET FinishSeaTRTourism = '4'
WHERE Type = 'BUILDING_HANSE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_BUILDINGS' AND Value= 1 );

UPDATE Buildings
SET TradeRouteRecipientBonus = '2'
WHERE Type = 'BUILDING_HANSE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_BUILDINGS' AND Value= 1 );

UPDATE Buildings
SET TradeRouteTargetBonus = '2'
WHERE Type = 'BUILDING_HANSE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_BUILDINGS' AND Value= 1 );

UPDATE Buildings
SET PrereqTech = 'TECH_GUILDS'
WHERE Type = 'BUILDING_HANSE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_BUILDINGS' AND Value= 1 );

UPDATE Building_YieldChanges
SET Yield = '5'
WHERE BuildingType = 'BUILDING_HANSE' AND YieldType = 'YIELD_GOLD' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_BUILDINGS' AND Value= 1 );

UPDATE Buildings
SET SpecialistCount = '2'
WHERE Type = 'BUILDING_HANSE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Traits
SET VotePerXCSAlliance = '2'
WHERE Type = 'TRAIT_CONVERTS_LAND_BARBARIANS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Traits
SET LandBarbarianConversionPercent = '0'
WHERE Type = 'TRAIT_CONVERTS_LAND_BARBARIANS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Traits
SET LandUnitMaintenanceModifier = '0'
WHERE Type = 'TRAIT_CONVERTS_LAND_BARBARIANS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Civilization_BuildingClassOverrides
SET BuildingClassType = 'BUILDINGCLASS_MINT'
WHERE BuildingType = 'BUILDING_HANSE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Buildings
SET BuildingClass = 'BUILDINGCLASS_MINT'
WHERE Type = 'BUILDING_HANSE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

-- Greece -- CS Alliances boost CS -- Odeon

UPDATE Traits
SET AllianceCSStrength = '4'
WHERE Type = 'TRAIT_CITY_STATE_FRIENDSHIP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

-- India -- Indus Sanitation (replace Mughal Fort) -- Unhappiness from Poverty and Illiteracy reduced by 25% 
DELETE FROM Buildings
WHERE Type = 'BUILDING_MUGHAL_FORT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

DELETE FROM Civilization_BuildingClassOverrides
WHERE BuildingType = 'BUILDING_MUGHAL_FORT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

DELETE FROM Building_ClassesNeededInCity
WHERE BuildingType = 'BUILDING_MUGHAL_FORT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

DELETE FROM Building_Flavors
WHERE BuildingType = 'BUILDING_MUGHAL_FORT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

DELETE FROM Building_YieldChanges
WHERE BuildingType = 'BUILDING_MUGHAL_FORT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

DELETE FROM Building_TechEnhancedYieldChanges
WHERE BuildingType = 'BUILDING_MUGHAL_FORT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Traits
SET PopulationUnhappinessModifier = '0'
WHERE Type = 'TRAIT_POPULATION_GROWTH' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Traits
SET CityUnhappinessModifier = '0'
WHERE Type = 'TRAIT_POPULATION_GROWTH' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Traits
SET PopulationBoostReligion = '1'
WHERE Type = 'TRAIT_POPULATION_GROWTH' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Traits
SET IsNoReligiousStrife = '1'
WHERE Type = 'TRAIT_POPULATION_GROWTH' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Defines
Set Value = '2'
WHERE Name = 'BALANCE_FOLLOWER_GROWTH_BONUS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

-- Iroquois -- All units receive Woodsman promotion

DELETE FROM Building_YieldChanges
WHERE BuildingType = 'BUILDING_LONGHOUSE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Civilization_BuildingClassOverrides
SET BuildingClassType = 'BUILDINGCLASS_HERBALIST'
WHERE BuildingType = 'BUILDING_LONGHOUSE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Buildings
SET BuildingClass = 'BUILDINGCLASS_HERBALIST'
WHERE Type = 'BUILDING_LONGHOUSE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Buildings
SET SpecialistCount = '0'
WHERE Type = 'BUILDING_LONGHOUSE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Buildings
SET PrereqTech = 'TECH_CALENDAR'
WHERE Type = 'BUILDING_LONGHOUSE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

DELETE FROM Building_ClassesNeededInCity
WHERE BuildingType = 'BUILDING_LONGHOUSE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Buildings
SET AllowsProductionTradeRoutes = '0'
WHERE Type = 'BUILDING_LONGHOUSE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

DELETE FROM Building_FeatureYieldChanges
WHERE BuildingType = 'BUILDING_LONGHOUSE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

-- Japan -- Dojo (culture from strategic resources) -- Boost UA

UPDATE Trait_ImprovementYieldChanges
SET Yield = '2'
WHERE TraitType = 'TRAIT_FIGHT_WELL_DAMAGED' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

-- Napoleon -- Plunders artwork!
UPDATE Traits
SET FreeGreatWorkOnConquest = '1'
WHERE Type = 'TRAIT_ENHANCED_CULTURE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Traits
SET CapitalThemingBonusModifier = '0'
WHERE Type = 'TRAIT_ENHANCED_CULTURE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Traits
SET TourismGABonus = '50'
WHERE Type = 'TRAIT_ENHANCED_CULTURE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

-- Ottomans -- Receive a free Caravansary in all cities, and Trade Routes generate yields when finishing a Trade Route. 

UPDATE Traits
SET NavalUnitMaintenanceModifier = '0'
WHERE Type = 'TRAIT_CONVERTS_SEA_BARBARIANS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

DELETE FROM Trait_FreePromotionUnitCombats
WHERE TraitType = 'TRAIT_CONVERTS_SEA_BARBARIANS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

-- Rome -- Unique Monument (Flavian Amphitheater) -- Receive Culture boost when you conquer a City.

UPDATE Traits
SET CapitalBuildingModifier = '15'
WHERE Type = 'TRAIT_CAPITAL_BUILDINGS_CHEAPER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Traits
SET ExtraConqueredCityTerritoryClaimRange = '4'
WHERE Type = 'TRAIT_CAPITAL_BUILDINGS_CHEAPER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Traits
SET KeepConqueredBuildings = '1'
WHERE Type = 'TRAIT_CAPITAL_BUILDINGS_CHEAPER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

-- Siam -- adjust Wat
DELETE FROM Building_FeatureYieldChanges
WHERE BuildingType = 'BUILDING_WAT' AND YieldType = 'YIELD_SCIENCE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Buildings
SET EspionageModifier = '-50'
WHERE Type = 'BUILDING_WAT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Buildings
SET SpecialistCount = '1'
WHERE Type = 'BUILDING_WAT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Buildings
SET Espionage = '1'
WHERE Type = 'BUILDING_WAT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Buildings
SET SpecialistCount = '1'
WHERE Type = 'BUILDING_WAT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Buildings
SET PrereqTech = 'TECH_THEOLOGY'
WHERE Type = 'BUILDING_WAT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

DELETE FROM Building_ClassesNeededInCity
WHERE BuildingType = 'BUILDING_WAT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Civilization_BuildingClassOverrides
SET BuildingClassType = 'BUILDINGCLASS_CONSTABLE'
WHERE BuildingType = 'BUILDING_WAT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Buildings
SET BuildingClass = 'BUILDINGCLASS_CONSTABLE'
WHERE Type = 'BUILDING_WAT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

-- Boost UA

UPDATE Traits
SET CityStateBonusModifier = '75'
WHERE Type = 'TRAIT_CITY_STATE_BONUSES' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Traits
SET AllianceCSDefense = '25'
WHERE Type = 'TRAIT_CITY_STATE_BONUSES' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

-- China
UPDATE Building_YieldChangesPerPop
SET Yield = '25'
WHERE BuildingType = 'BUILDING_PAPER_MAKER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );
 
DELETE FROM Building_YieldChanges
WHERE BuildingType = 'BUILDING_PAPER_MAKER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Buildings
SET SpecialistCount = '1'
WHERE Type = 'BUILDING_PAPER_MAKER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Buildings
SET SpecialistCount = '1'
WHERE Type = 'BUILDING_PAPER_MAKER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Buildings
SET SpecialistType = 'SPECIALIST_SCIENTIST'
WHERE Type = 'BUILDING_PAPER_MAKER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_BUILDINGS' AND Value= 1 );

UPDATE Traits
SET GreatGeneralRateModifier = '0'
WHERE Type = 'TRAIT_ART_OF_WAR' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Traits
SET GreatGeneralExtraBonus = '0'
WHERE Type = 'TRAIT_ART_OF_WAR' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Traits
SET GPWLTKD = '1'
WHERE Type = 'TRAIT_ART_OF_WAR' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Traits
SET GrowthBoon = '50'
WHERE Type = 'TRAIT_ART_OF_WAR' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

-- New Vanilla Leader Data and Yields

INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_INDUS_CANAL', 'YIELD_PRODUCTION', 2),
	('BUILDING_INDUS_CANAL', 'YIELD_FOOD', 3),
	('BUILDING_ODEON', 'YIELD_CULTURE', 3),
	('BUILDING_FLAVIAN_COLOSSEUM', 'YIELD_PRODUCTION', 3),
	('BUILDING_FLAVIAN_COLOSSEUM', 'YIELD_CULTURE', 3),
	('BUILDING_STEAM_MILL', 'YIELD_PRODUCTION', 3),
	('BUILDING_SIEGE_WORKSHOP', 'YIELD_PRODUCTION', 3),
	('BUILDING_MOMA', 'YIELD_CULTURE', 5),
	('BUILDING_MUD_PYRAMID_MOSQUE', 'YIELD_PRODUCTION', 3),
	('BUILDING_BURIAL_TOMB', 'YIELD_FAITH', 1),
	('BUILDING_LONGHOUSE', 'YIELD_FOOD', 2),
	('BUILDING_LONGHOUSE', 'YIELD_CULTURE', 1),
	('BUILDING_HANSE', 'YIELD_CULTURE', 3),
	('BUILDING_WAT', 'YIELD_SCIENCE', 2),
	('BUILDING_WAT', 'YIELD_FAITH', 1),
	('BUILDING_WAT', 'YIELD_CULTURE', 1),
	('BUILDING_KREPOST', 'YIELD_PRODUCTION', 3),
	('BUILDING_BAZAAR', 'YIELD_FAITH', 1),
	('BUILDING_SIEGE_WORKSHOP', 'YIELD_SCIENCE', 1),
	('BUILDING_PAPER_MAKER', 'YIELD_CULTURE', 1),
	('BUILDING_PAPER_MAKER', 'YIELD_SCIENCE', 1),
	('BUILDING_DOJO', 'YIELD_SCIENCE', 3),
	('BUILDING_DOJO', 'YIELD_CULTURE', 1);

INSERT INTO Building_YieldFromUnitLevelUp
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_DOJO', 'YIELD_CULTURE', 15);

INSERT INTO Building_SpecialistYieldChangesLocal
	(BuildingType, SpecialistType, YieldType, Yield)
VALUES
	('BUILDING_STEAM_MILL', 'SPECIALIST_ENGINEER', 'YIELD_GOLD', 2),
	('BUILDING_STEAM_MILL', 'SPECIALIST_MERCHANT', 'YIELD_PRODUCTION', 2);

INSERT INTO Building_YieldFromUnitProduction
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_SIEGE_WORKSHOP', 'YIELD_SCIENCE', 15);
	

INSERT INTO Building_LakePlotYieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_INDUS_CANAL', 'YIELD_FOOD', 1);

INSERT INTO Building_Flavors
	(BuildingType, FlavorType, Flavor)
VALUES
	('BUILDING_INDUS_CANAL', 'FLAVOR_GROWTH', 50),
	('BUILDING_INDUS_CANAL', 'FLAVOR_SCIENCE', 15),
	('BUILDING_INDUS_CANAL', 'FLAVOR_PRODUCTION', 5),
	('BUILDING_INDUS_CANAL', 'FLAVOR_HAPPINESS', 15),
	('BUILDING_DOJO', 'FLAVOR_MILITARY_TRAINING', 25),
	('BUILDING_DOJO', 'FLAVOR_CULTURE', 15),
	('BUILDING_DOJO', 'FLAVOR_HAPPINESS', 15),
	('BUILDING_ODEON', 'FLAVOR_CULTURE', 20),
	('BUILDING_ODEON', 'FLAVOR_HAPPINESS', 15),
	('BUILDING_FLAVIAN_COLOSSEUM', 'FLAVOR_CULTURE', 20),
	('BUILDING_FLAVIAN_COLOSSEUM', 'FLAVOR_PRODUCTION', 20),
	('BUILDING_STEAM_MILL', 'FLAVOR_PRODUCTION', 50),
	('BUILDING_STEAM_MILL', 'FLAVOR_SCIENCE', 15),
	('BUILDING_STEAM_MILL', 'FLAVOR_PRODUCTION', 10),
	('BUILDING_SIEGE_WORKSHOP', 'FLAVOR_MILITARY_TRAINING', 40),
	('BUILDING_SIEGE_WORKSHOP', 'FLAVOR_PRODUCTION', 20),
	('BUILDING_SIEGE_WORKSHOP', 'FLAVOR_CITY_DEFENSE', 10),
	('BUILDING_SIEGE_WORKSHOP', 'FLAVOR_HAPPINESS', 25),
	('BUILDING_MOMA', 'FLAVOR_CULTURE', 100);

INSERT INTO Civilization_BuildingClassOverrides
	(CivilizationType, BuildingClassType, BuildingType)
VALUES
	('CIVILIZATION_INDIA', 'BUILDINGCLASS_AQUEDUCT', 'BUILDING_INDUS_CANAL'),
	('CIVILIZATION_JAPAN', 'BUILDINGCLASS_ARMORY', 'BUILDING_DOJO'),
	('CIVILIZATION_GREECE', 'BUILDINGCLASS_AMPHITHEATER', 'BUILDING_ODEON'),
	('CIVILIZATION_ROME', 'BUILDINGCLASS_COLOSSEUM', 'BUILDING_FLAVIAN_COLOSSEUM'),
	('CIVILIZATION_ENGLAND', 'BUILDINGCLASS_FACTORY', 'BUILDING_STEAM_MILL'),
	('CIVILIZATION_OTTOMAN', 'BUILDINGCLASS_FORGE', 'BUILDING_SIEGE_WORKSHOP'),
	('CIVILIZATION_AMERICA', 'BUILDINGCLASS_HERMITAGE', 'BUILDING_MOMA');

INSERT INTO Building_ClassesNeededInCity
	(BuildingType, BuildingClassType)
VALUES
	('BUILDING_ODEON', 'BUILDINGCLASS_MONUMENT'),
	('BUILDING_STEAM_MILL', 'BUILDINGCLASS_WORKSHOP');

INSERT INTO Building_YieldChangesPerPop
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_FLOATING_GARDENS', 'YIELD_FOOD', 50),
	('BUILDING_FLOATING_GARDENS', 'YIELD_PRODUCTION', 50),
	('BUILDING_SATRAPS_COURT', 'YIELD_GOLD', 20),
	('BUILDING_STEAM_MILL', 'YIELD_PRODUCTION', 50),
	('BUILDING_SATRAPS_COURT', 'YIELD_GOLDEN_AGE_POINTS', 20);

INSERT INTO Building_ScienceFromYield
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_HANSE', 'YIELD_GOLD', 10);

INSERT INTO Building_ImprovementYieldChanges
	(BuildingType, ImprovementType, YieldType, Yield)
VALUES
	('BUILDING_SIEGE_WORKSHOP', 'IMPROVEMENT_MINE', 'YIELD_PRODUCTION', 1);

INSERT INTO Building_ResourceYieldChanges
	(BuildingType, ResourceType, YieldType, Yield)
VALUES
	('BUILDING_BAZAAR', 'RESOURCE_SPICES', 'YIELD_FOOD', 1),
	('BUILDING_BAZAAR', 'RESOURCE_SPICES', 'YIELD_PRODUCTION', 1),
	('BUILDING_BAZAAR', 'RESOURCE_SUGAR', 'YIELD_FOOD', 1),
	('BUILDING_BAZAAR', 'RESOURCE_SUGAR', 'YIELD_GOLD', 1),
	('BUILDING_ODEON', 'RESOURCE_DYE', 'YIELD_CULTURE', 1),
	('BUILDING_ODEON', 'RESOURCE_DYE', 'YIELD_GOLD', 1),
	('BUILDING_ODEON', 'RESOURCE_SILK', 'YIELD_CULTURE', 1),
	('BUILDING_ODEON', 'RESOURCE_SILK', 'YIELD_GOLD', 1),
	('BUILDING_ODEON', 'RESOURCE_DYE', 'YIELD_CULTURE', 1),
	('BUILDING_ODEON', 'RESOURCE_DYE', 'YIELD_GOLD', 1),
	('BUILDING_ODEON', 'RESOURCE_SILK', 'YIELD_CULTURE', 1),
	('BUILDING_ODEON', 'RESOURCE_SILK', 'YIELD_GOLD', 1),
	('BUILDING_STEAM_MILL', 'RESOURCE_COAL', 'YIELD_PRODUCTION', 3),
	('BUILDING_SIEGE_WORKSHOP', 'RESOURCE_COPPER', 'YIELD_PRODUCTION', 1),
	('BUILDING_SIEGE_WORKSHOP', 'RESOURCE_COPPER', 'YIELD_GOLD', 1),
	('BUILDING_SIEGE_WORKSHOP', 'RESOURCE_IRON', 'YIELD_PRODUCTION', 1),
	('BUILDING_SIEGE_WORKSHOP', 'RESOURCE_IRON', 'YIELD_GOLD', 1),
	('BUILDING_MUD_PYRAMID_MOSQUE', 'RESOURCE_STONE', 'YIELD_PRODUCTION', 2),
	('BUILDING_MUD_PYRAMID_MOSQUE', 'RESOURCE_MARBLE', 'YIELD_PRODUCTION', 1),
	('BUILDING_MUD_PYRAMID_MOSQUE', 'RESOURCE_MARBLE', 'YIELD_GOLD', 1),
	('BUILDING_MUD_PYRAMID_MOSQUE', 'RESOURCE_SALT', 'YIELD_PRODUCTION', 1),
	('BUILDING_MUD_PYRAMID_MOSQUE', 'RESOURCE_SALT', 'YIELD_GOLD', 1),
	('BUILDING_BURIAL_TOMB', 'RESOURCE_TRUFFLES', 'YIELD_GOLD', 2),
	('BUILDING_BURIAL_TOMB', 'RESOURCE_COTTON', 'YIELD_CULTURE', 1),
	('BUILDING_BURIAL_TOMB', 'RESOURCE_COTTON', 'YIELD_PRODUCTION', 1),
	('BUILDING_BURIAL_TOMB', 'RESOURCE_FUR', 'YIELD_GOLD', 1),
	('BUILDING_BURIAL_TOMB', 'RESOURCE_FUR', 'YIELD_PRODUCTION', 1);

INSERT INTO Building_FeatureYieldChanges
	(BuildingType, FeatureType, YieldType, Yield)
VALUES
	('BUILDING_INDUS_CANAL', 'FEATURE_FLOOD_PLAINS', 'YIELD_PRODUCTION', 1);

INSERT INTO Building_ImprovementYieldChanges
	(BuildingType, ImprovementType, YieldType, Yield)
VALUES
	('BUILDING_INDUS_CANAL', 'IMPROVEMENT_FARM', 'YIELD_FOOD', 1),
	('BUILDING_KREPOST', 'IMPROVEMENT_LUMBERMILL', 'YIELD_PRODUCTION', 1),
	('BUILDING_KREPOST', 'IMPROVEMENT_LUMBERMILL_JUNGLE', 'YIELD_PRODUCTION', 1),
	('BUILDING_KREPOST', 'IMPROVEMENT_MINE', 'YIELD_PRODUCTION', 1),
	('BUILDING_KREPOST', 'IMPROVEMENT_CAMP', 'YIELD_PRODUCTION', 1);

INSERT INTO Building_DomainFreeExperiences
	(BuildingType, DomainType, Experience)
VALUES
	('BUILDING_DOJO', 'DOMAIN_LAND', 25),
	('BUILDING_DOJO', 'DOMAIN_SEA', 25),
	('BUILDING_DOJO', 'DOMAIN_AIR', 25);

INSERT INTO Building_YieldFromVictory
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_ODEON', 'YIELD_CULTURE', 5),
	('BUILDING_FLAVIAN_COLOSSEUM', 'YIELD_GREAT_GENERAL_POINTS', 3),
	('BUILDING_FLAVIAN_COLOSSEUM', 'YIELD_GREAT_ADMIRAL_POINTS', 3),
	('BUILDING_FLAVIAN_COLOSSEUM', 'YIELD_GOLDEN_AGE_POINTS', 3);

INSERT INTO Building_SpecificGreatPersonRateModifier
	(BuildingType, SpecialistType, Modifier)
VALUES
	('BUILDING_ODEON', 'SPECIALIST_WRITER', 33);

INSERT INTO Building_BuildingClassLocalYieldChanges
	(BuildingType, BuildingClassType, YieldType, YieldChange)
VALUES
	('BUILDING_FLAVIAN_COLOSSEUM', 'BUILDINGCLASS_BARRACKS', 'YIELD_PRODUCTION', 2),
	('BUILDING_FLAVIAN_COLOSSEUM', 'BUILDINGCLASS_FORGE', 'YIELD_PRODUCTION', 2),
	('BUILDING_FLAVIAN_COLOSSEUM', 'BUILDINGCLASS_ARMORY', 'YIELD_PRODUCTION', 2);

INSERT INTO Building_UnitCombatProductionModifiers
	(BuildingType, UnitCombatType, Modifier)
VALUES
	('BUILDING_SIEGE_WORKSHOP', 'UNITCOMBAT_SIEGE', 50);

INSERT INTO Building_ThemingBonuses
	(BuildingType, Description, Bonus, UniqueEras, MustBeArt, RequiresUniquePlayers, AIPriority)
VALUES
	('BUILDING_MOMA', 'TXT_KEY_THEMING_BONUS_MOMA', 10, 1, 1, 1, 8);

INSERT INTO Building_ThemingYieldBonus
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_MOMA', 'YIELD_CULTURE', 5),
	('BUILDING_MOMA', 'YIELD_SCIENCE', 5);

INSERT INTO Trait_YieldFromHistoricEvent
	(TraitType, YieldType, Yield)
VALUES
	('TRAIT_LAND_TRADE_GOLD', 'YIELD_CULTURE', 1),
	('TRAIT_LAND_TRADE_GOLD', 'YIELD_SCIENCE', 1);

INSERT INTO Building_RiverPlotYieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_FLOATING_GARDENS', 'YIELD_FOOD', 1),
	('BUILDING_MUD_PYRAMID_MOSQUE', 'YIELD_CULTURE', 1);

INSERT INTO Trait_YieldFromKills
	(TraitType, YieldType, Yield)
VALUES
	('TRAIT_CULTURE_FROM_KILLS', 'YIELD_FAITH', 150),
	('TRAIT_CULTURE_FROM_KILLS', 'YIELD_GOLD', 150);

INSERT INTO Trait_ArtifactYieldChanges
	(TraitType, YieldType, Yield)
VALUES
	('TRAIT_WONDER_BUILDER', 'YIELD_CULTURE', 5),
	('TRAIT_WONDER_BUILDER', 'YIELD_SCIENCE', 5);

INSERT INTO Trait_ImprovementYieldChanges
	(TraitType, ImprovementType, YieldType, Yield)
VALUES
	('TRAIT_WONDER_BUILDER', 'IMPROVEMENT_LANDMARK', 'YIELD_TOURISM', 5),
	('TRAIT_WONDER_BUILDER', 'IMPROVEMENT_LANDMARK', 'YIELD_GOLD', 5),
	('TRAIT_FIGHT_WELL_DAMAGED', 'IMPROVEMENT_FISHING_BOATS', 'YIELD_FOOD', 1);

INSERT INTO Trait_TradeRouteEndYield
	(TraitType, YieldType, Yield)
VALUES
	('TRAIT_CONVERTS_SEA_BARBARIANS', 'YIELD_PRODUCTION', 100),
	('TRAIT_CONVERTS_SEA_BARBARIANS', 'YIELD_SCIENCE', 100),
	('TRAIT_CONVERTS_SEA_BARBARIANS', 'YIELD_FOOD', 100),
	('TRAIT_CONVERTS_SEA_BARBARIANS', 'YIELD_CULTURE', 100),
	('TRAIT_CONVERTS_SEA_BARBARIANS', 'YIELD_GOLD', 100);

INSERT INTO Trait_YieldFromCSAlly
	(TraitType, YieldType, Yield)
VALUES
	('TRAIT_CONVERTS_LAND_BARBARIANS', 'YIELD_SCIENCE', 3),
	('TRAIT_CONVERTS_LAND_BARBARIANS', 'YIELD_GOLDEN_AGE_POINTS', 3),
	('TRAIT_CONVERTS_LAND_BARBARIANS', 'YIELD_CULTURE', 3);

INSERT INTO Trait_YieldFromCSFriend
	(TraitType, YieldType, Yield)
VALUES
	('TRAIT_CONVERTS_LAND_BARBARIANS', 'YIELD_SCIENCE', 1),
	('TRAIT_CONVERTS_LAND_BARBARIANS', 'YIELD_GOLDEN_AGE_POINTS', 1),
	('TRAIT_CONVERTS_LAND_BARBARIANS', 'YIELD_CULTURE', 1);

INSERT INTO Trait_UnimprovedFeatureYieldChanges
	(TraitType, FeatureType, YieldType, Yield)
VALUES
	('TRAIT_FIGHT_WELL_DAMAGED', 'FEATURE_ATOLL', 'YIELD_FOOD', 1);

INSERT INTO Building_BuildingClassLocalYieldChanges
	(BuildingType, BuildingClassType, YieldType, YieldChange)
VALUES
	('BUILDING_WAT', 'BUILDINGCLASS_TEMPLE', 'YIELD_SCIENCE', 2),
	('BUILDING_WAT', 'BUILDINGCLASS_SHRINE', 'YIELD_SCIENCE', 2);

INSERT INTO Building_FeatureYieldChanges
	(BuildingType, FeatureType, YieldType, Yield)
VALUES
	('BUILDING_LONGHOUSE', 'FEATURE_JUNGLE', 'YIELD_PRODUCTION', 1),
	('BUILDING_LONGHOUSE', 'FEATURE_JUNGLE', 'YIELD_FOOD', 1),
	('BUILDING_LONGHOUSE', 'FEATURE_FOREST', 'YIELD_PRODUCTION', 1),
	('BUILDING_LONGHOUSE', 'FEATURE_FOREST', 'YIELD_FOOD', 1),
	('BUILDING_WAT', 'FEATURE_FOREST', 'YIELD_CULTURE', 1),
	('BUILDING_WAT', 'FEATURE_JUNGLE', 'YIELD_CULTURE', 1);

INSERT INTO Civilization_Start_Along_River
	(CivilizationType, StartAlongRiver)
VALUES
	('CIVILIZATION_SONGHAI', 1);

INSERT INTO Building_Flavors
	(BuildingType, FlavorType, Flavor)
VALUES
	('BUILDING_HANSE', 'FLAVOR_CULTURE', 40),
	('BUILDING_BURIAL_TOMB', 'FLAVOR_CULTURE', 30);

INSERT INTO Building_BuildingClassYieldChanges
	(BuildingType, BuildingClassType, YieldType, YieldChange)
VALUES
	('BUILDING_ODEON', 'BUILDINGCLASS_WRITERS_GUILD', 'YIELD_GOLD', 1),
	('BUILDING_MOMA', 'BUILDINGCLASS_BROADCAST_TOWER', 'YIELD_CULTURE', 5),
	('BUILDING_MOMA', 'BUILDINGCLASS_BROADCAST_TOWER', 'YIELD_SCIENCE', 5),
	('BUILDING_MOMA', 'BUILDINGCLASS_MUSEUM', 'YIELD_CULTURE', 5),
	('BUILDING_MOMA', 'BUILDINGCLASS_MUSEUM', 'YIELD_SCIENCE', 5);

INSERT INTO Building_ClassesNeededInCity
	(BuildingType, BuildingClassType)
VALUES
	('BUILDING_PAPER_MAKER', 'BUILDINGCLASS_GROVE');

INSERT INTO Trait_GreatPersonBornYield
	(TraitType, GreatPersonType, YieldType, Yield)
VALUES
	('TRAIT_ART_OF_WAR', 'GREATPERSON_SCIENTIST', 'YIELD_GOLDEN_AGE_POINTS', 50),
	('TRAIT_ART_OF_WAR', 'GREATPERSON_ENGINEER', 'YIELD_GOLDEN_AGE_POINTS', 50),
	('TRAIT_ART_OF_WAR', 'GREATPERSON_PROPHET', 'YIELD_GOLDEN_AGE_POINTS', 50),
	('TRAIT_ART_OF_WAR', 'GREATPERSON_GENERAL', 'YIELD_GOLDEN_AGE_POINTS', 50),
	('TRAIT_ART_OF_WAR', 'GREATPERSON_ADMIRAL', 'YIELD_GOLDEN_AGE_POINTS', 50),
	('TRAIT_ART_OF_WAR', 'GREATPERSON_MERCHANT', 'YIELD_GOLDEN_AGE_POINTS', 50),
	('TRAIT_ART_OF_WAR', 'GREATPERSON_ARTIST', 'YIELD_GOLDEN_AGE_POINTS', 50),
	('TRAIT_ART_OF_WAR', 'GREATPERSON_MUSICIAN', 'YIELD_GOLDEN_AGE_POINTS', 50),
	('TRAIT_ART_OF_WAR', 'GREATPERSON_WRITER', 'YIELD_GOLDEN_AGE_POINTS', 50);

INSERT INTO Trait_YieldFromTilePurchase
	(TraitType, YieldType, Yield)
VALUES
	('TRAIT_STRATEGIC_RICHES', 'YIELD_SCIENCE', 15);

INSERT INTO Trait_YieldFromTileEarn
	(TraitType, YieldType, Yield)
VALUES
	('TRAIT_STRATEGIC_RICHES', 'YIELD_SCIENCE', 15);

INSERT INTO Trait_ResourceQuantityModifiers
	(TraitType, ResourceType, ResourceQuantityModifier)
VALUES
	('TRAIT_STRATEGIC_RICHES', 'RESOURCE_OIL', 100),
	('TRAIT_STRATEGIC_RICHES', 'RESOURCE_COAL', 100),
	('TRAIT_STRATEGIC_RICHES', 'RESOURCE_ALUMINUM', 100);