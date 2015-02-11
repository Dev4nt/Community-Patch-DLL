-- LAND PROMOTIONS

	-- Delete hangovers
	DELETE FROM Unit_FreePromotions
	WHERE PromotionType = 'PROMOTION_SHOCK_1' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	DELETE FROM Unit_FreePromotions
	WHERE PromotionType = 'PROMOTION_AIR_AMBUSH_1' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	DELETE FROM Unit_FreePromotions
	WHERE PromotionType = 'PROMOTION_AIR_AMBUSH_2' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	DELETE FROM UnitPromotions_Domains 
	WHERE PromotionType = 'PROMOTION_BOMBARDMENT_1' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	DELETE FROM UnitPromotions_Domains 
	WHERE PromotionType = 'PROMOTION_BOMBARDMENT_2' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	DELETE FROM UnitPromotions_Domains 
	WHERE PromotionType = 'PROMOTION_BOMBARDMENT_3' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	DELETE FROM UnitPromotions_Domains
	WHERE PromotionType = 'PROMOTION_AIR_AMBUSH_1' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	DELETE FROM UnitPromotions_Domains
	WHERE PromotionType = 'PROMOTION_AIR_AMBUSH_2' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	DELETE FROM UnitPromotions_UnitCombats 
	WHERE PromotionType = 'PROMOTION_INSTA_HEAL' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	DELETE FROM UnitPromotions_UnitCombats 
	WHERE PromotionType = 'PROMOTION_SHOCK_1' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	DELETE FROM UnitPromotions_UnitCombats 
	WHERE PromotionType = 'PROMOTION_SHOCK_2' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	DELETE FROM UnitPromotions_UnitCombats 
	WHERE PromotionType = 'PROMOTION_SHOCK_3' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	DELETE FROM UnitPromotions_UnitCombats 
	WHERE PromotionType = 'PROMOTION_BARRAGE_1' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	DELETE FROM UnitPromotions_UnitCombats 
	WHERE PromotionType = 'PROMOTION_BARRAGE_2' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	DELETE FROM UnitPromotions_UnitCombats 
	WHERE PromotionType = 'PROMOTION_BARRAGE_3' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	DELETE FROM UnitPromotions_UnitCombats 
	WHERE PromotionType = 'PROMOTION_BOMBARDMENT_1' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	DELETE FROM UnitPromotions_UnitCombats 
	WHERE PromotionType = 'PROMOTION_BOMBARDMENT_2' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	DELETE FROM UnitPromotions_UnitCombats 
	WHERE PromotionType = 'PROMOTION_BOMBARDMENT_3' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	DELETE FROM UnitPromotions_UnitCombats
	WHERE PromotionType = 'PROMOTION_AIR_AMBUSH_1' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	DELETE FROM UnitPromotions_UnitCombats
	WHERE PromotionType = 'PROMOTION_AIR_AMBUSH_2' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	DELETE FROM UnitPromotions_UnitCombatMods
	WHERE PromotionType = 'PROMOTION_AIR_AMBUSH_1' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	DELETE FROM UnitPromotions_UnitCombatMods
	WHERE PromotionType = 'PROMOTION_AIR_AMBUSH_2' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );
	
-- Replace Drill with +10% Combat Strength everywhere.

	UPDATE Language_en_US
	SET Text = '+10% [ICON_STRENGTH] Combat Strength, +15% vs Cities.'
	WHERE Tag = 'TXT_KEY_PROMOTION_DRILL_1_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	UPDATE Language_en_US
	SET Text = '+10% [ICON_STRENGTH] Combat Strength, +20% vs Cities.'
	WHERE Tag = 'TXT_KEY_PROMOTION_DRILL_2_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	UPDATE Language_en_US
	SET Text = '+10% [ICON_STRENGTH] Combat Strength, +25% vs Cities.'
	WHERE Tag = 'TXT_KEY_PROMOTION_DRILL_3_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

-- Replace Barrage and Accuracy with +10% Ranged Combat Strength everywhere.

	UPDATE Language_en_US
	SET Text = '+10% Ranged [ICON_RANGE_STRENGTH] Combat Strength, +10% vs Cities.'
	WHERE Tag = 'TXT_KEY_PROMOTION_ACCURACY_1_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	UPDATE Language_en_US
	SET Text = '+10% Ranged [ICON_RANGE_STRENGTH] Combat Strength, +10% vs Cities.'
	WHERE Tag = 'TXT_KEY_PROMOTION_ACCURACY_2_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	UPDATE Language_en_US
	SET Text = '+10% Ranged [ICON_RANGE_STRENGTH] Combat Strength, +10% vs Cities.'
	WHERE Tag = 'TXT_KEY_PROMOTION_ACCURACY_3_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

-- Make Discipline a double-mod, weaken a bit.

	UPDATE UnitPromotions
	SET CombatPercent = '5'
	WHERE Type = 'PROMOTION_ADJACENT_BONUS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	UPDATE UnitPromotions
	SET AdjacentMod = '5'
	WHERE Type = 'PROMOTION_ADJACENT_BONUS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	UPDATE Language_en_US
	SET Text = '+5% [ICON_STRENGTH] Combat Strength, and +5% additional [ICON_STRENGTH] Combat Strength when adjacent to a friendly Unit.'
	WHERE Tag = 'TXT_KEY_PROMOTION_DISCIPLINE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

-- NAVAL PROMOTIONS

-- Replace Targeting with +10% Combat Strength versus land and sea units.
	UPDATE UnitPromotions_Domains
	SET Modifier = '10'
	WHERE PromotionType = 'PROMOTION_TARGETING_1' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	UPDATE UnitPromotions_Domains
	SET Modifier = '10'
	WHERE PromotionType = 'PROMOTION_TARGETING_2' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	UPDATE UnitPromotions_Domains
	SET Modifier = '10'
	WHERE PromotionType = 'PROMOTION_TARGETING_3' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	UPDATE Language_en_US
	SET Text = '+10% [ICON_STRENGTH] Combat Strength versus Naval and Land Units, +10% versus Cities.'
	WHERE Tag = 'TXT_KEY_PROMOTION_TARGETING_1_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	UPDATE Language_en_US
	SET Text = '+10% [ICON_STRENGTH] Combat Strength versus Naval and Land Units, +10% versus Cities.'
	WHERE Tag = 'TXT_KEY_PROMOTION_TARGETING_2_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	UPDATE Language_en_US
	SET Text = '+10% [ICON_STRENGTH] Combat Strength versus Naval and Land Units, +10% versus Cities.'
	WHERE Tag = 'TXT_KEY_PROMOTION_TARGETING_3_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

-- Melee Ship promotions a little too high - let's tone down
	UPDATE UnitPromotions_Domains
	SET Modifier = '10'
	WHERE PromotionType = 'PROMOTION_BOARDING_PARTY_1' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	UPDATE UnitPromotions_Domains
	SET Modifier = '10'
	WHERE PromotionType = 'PROMOTION_BOARDING_PARTY_2' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	UPDATE UnitPromotions_Domains
	SET Modifier = '10'
	WHERE PromotionType = 'PROMOTION_BOARDING_PARTY_3' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	UPDATE Language_en_US
	SET Text = '+10% [ICON_STRENGTH] Combat Strength in melee attacks against [COLOR_POSITIVE_TEXT]Naval Units[ENDCOLOR] and [COLOR_POSITIVE_TEXT]Cities[ENDCOLOR]'
	WHERE Tag = 'TXT_KEY_PROMOTION_BOARDING_PARTY_1_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	UPDATE Language_en_US
	SET Text = '+10% [ICON_STRENGTH] Combat Strength in melee attacks against [COLOR_POSITIVE_TEXT]Naval Units[ENDCOLOR] and [COLOR_POSITIVE_TEXT]Cities[ENDCOLOR]'
	WHERE Tag = 'TXT_KEY_PROMOTION_BOARDING_PARTY_2_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	UPDATE Language_en_US
	SET Text = '+10% [ICON_STRENGTH] Combat Strength in melee attacks against [COLOR_POSITIVE_TEXT]Naval Units[ENDCOLOR] and [COLOR_POSITIVE_TEXT]Cities[ENDCOLOR]'
	WHERE Tag = 'TXT_KEY_PROMOTION_BOARDING_PARTY_3_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	UPDATE Language_en_US
	SET Text = '+15% [ICON_STRENGTH] Combat Strength when attacking [COLOR_POSITIVE_TEXT]Cities[ENDCOLOR]. Steal gold equal to 33% of the damage inflicted on a city.'
	WHERE Tag = 'TXT_KEY_PROMOTION_COASTAL_RAIDER_1_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	UPDATE Language_en_US
	SET Text = '+15% [ICON_STRENGTH] Combat Strength when attacking [COLOR_POSITIVE_TEXT]Cities[ENDCOLOR]. Steal gold equal to 33% of the damage inflicted on a city.'
	WHERE Tag = 'TXT_KEY_PROMOTION_COASTAL_RAIDER_2_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	UPDATE Language_en_US
	SET Text = '+15% [ICON_STRENGTH] Combat Strength when attacking [COLOR_POSITIVE_TEXT]Cities[ENDCOLOR]. Steal gold equal to 34% of the damage inflicted on a city.'
	WHERE Tag = 'TXT_KEY_PROMOTION_COASTAL_RAIDER_3_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

-- Wolfpack extremely strong

	UPDATE Language_en_US
	SET Text = '+15% Combat Bonus when attacking.'
	WHERE Tag = 'TXT_KEY_PROMOTION_WOLFPACK_1_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	UPDATE Language_en_US
	SET Text = '+15% Combat Bonus when attacking.'
	WHERE Tag = 'TXT_KEY_PROMOTION_WOLFPACK_2_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	UPDATE Language_en_US
	SET Text = '+15% Combat Bonus when attacking.'
	WHERE Tag = 'TXT_KEY_PROMOTION_WOLFPACK_3_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

-- Air Promotions -- Update Air Targeting to Hit all Domains
	UPDATE UnitPromotions_Domains
	SET Modifier = '15'
	WHERE PromotionType = 'PROMOTION_AIR_TARGETING_1' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	UPDATE UnitPromotions_Domains
	SET Modifier = '15'
	WHERE PromotionType = 'PROMOTION_AIR_TARGETING_2' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	UPDATE Language_en_US
	SET Text = '+15% [ICON_STRENGTH] Combat Strength versus Naval and Land Units.'
	WHERE Tag = 'TXT_KEY_PROMOTION_AIR_TARGETING_1_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	UPDATE Language_en_US
	SET Text = '+15% [ICON_STRENGTH] Combat Strength versus Naval and Land Units.'
	WHERE Tag = 'TXT_KEY_PROMOTION_AIR_TARGETING_2_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

-- Siege Promotions -- Weaken them slightly

	UPDATE UnitPromotions
	SET CityAttack = '100'
	WHERE Type = 'PROMOTION_CITY_SIEGE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	UPDATE Language_en_US
	SET Text = '+100% Bonus vs Cities.'
	WHERE Tag = 'TXT_KEY_PROMOTION_CITY_SIEGE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	UPDATE Language_en_US
	SET Text = 'Bonus vs Cities (100)'
	WHERE Tag = 'TXT_KEY_PROMOTION_CITY_SIEGE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	UPDATE UnitPromotions
	SET CityAttack = '100'
	WHERE Type = 'PROMOTION_CITY_SIEGE_II' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	UPDATE Language_en_US
	SET Text = '+100% Bonus vs Cities.'
	WHERE Tag = 'TXT_KEY_PROMOTION_CITY_SIEGE_II_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	UPDATE Language_en_US
	SET Text = 'Bonus vs Cities (100)'
	WHERE Tag = 'TXT_KEY_PROMOTION_CITY_SIEGE_II' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	UPDATE UnitPromotions
	SET CityAttack = '150'
	WHERE Type = 'PROMOTION_CITY_ASSAULT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	UPDATE Language_en_US
	SET Text = 'Bonus vs Cities (150)'
	WHERE Tag = 'TXT_KEY_PROMOTION_CITY_ASSUALT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	UPDATE Language_en_US
	SET Text = '+150% Bonus vs Cities.'
	WHERE Tag = 'TXT_KEY_PROMOTION_CITY_ASSUALT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	-- Amphibious Change

	UPDATE Language_en_US
	SET Text = 'Eliminates combat penalties for attacking from the sea or over a river, and grants a movement bonus when moving along rivers.'
	WHERE Tag = 'TXT_KEY_PROMOTION_AMPHIBIOUS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	-- Medic I/II
	UPDATE Language_en_US
	SET Text = 'This unit and all units in adjacent tiles [COLOR_POSITIVE_TEXT]Heal 5 Additional HP[ENDCOLOR] per turn.'
	WHERE Tag = 'TXT_KEY_PROMOTION_MEDIC_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	UPDATE Language_en_US
	SET Text = 'This unit and all units in adjacent tiles [COLOR_POSITIVE_TEXT]Heal 5 Additional HP[ENDCOLOR] per turn. This unit [COLOR_POSITIVE_TEXT]Heals 5 Additional HP[ENDCOLOR] per turn when [COLOR_POSITIVE_TEXT]Outside of Friendly Territory[ENDCOLOR].'
	WHERE Tag = 'TXT_KEY_PROMOTION_MEDIC_II_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	INSERT INTO UnitPromotions(Type, Description, Help, Sound, ReconChange, LostWithUpgrade, PortraitIndex, IconAtlas, PediaType, PediaEntry)
	VALUES('PROMOTION_RECON_SHORT_RANGE', 'TXT_KEY_PROMOTION_RECON_SHORT_RANGE', 'TXT_KEY_PROMOTION_RECON_SHORT_RANGE_HELP', 'AS2D_IF_LEVELUP', -2, 1, 59, 'ABILITY_ATLAS', 'PEDIA_ATTRIBUTES', 'TXT_KEY_PEDIA_PROMOTION_RECON_SHORT_RANGE');

	INSERT INTO UnitPromotions(Type, Description, Help, Sound, ReconChange, LostWithUpgrade, PortraitIndex, IconAtlas, PediaType, PediaEntry)
	VALUES('PROMOTION_RECON_LONG_RANGE', 'TXT_KEY_PROMOTION_RECON_LONG_RANGE', 'TXT_KEY_PROMOTION_RECON_LONG_RANGE_HELP', 'AS2D_IF_LEVELUP', 2, 1, 59, 'ABILITY_ATLAS', 'PEDIA_ATTRIBUTES', 'TXT_KEY_PEDIA_PROMOTION_RECON_LONG_RANGE');

	-- Buffalo Loins/Chest

	UPDATE Language_en_US
	SET Text = '+10% [ICON_STRENGTH] Combat Strength. Flank attack bonus increased by 25%. +10% [COLOR_POSITIVE_TEXT]Defense[ENDCOLOR] against all [COLOR_POSITIVE_TEXT]Ranged Attacks[ENDCOLOR].'
	WHERE Tag = 'TXT_KEY_PROMOTION_BUFFALO_CHEST_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

	UPDATE Language_en_US
	SET Text = '+15% [ICON_STRENGTH] Combat Strength. Flank attack bonus increased by 50%. +15% [COLOR_POSITIVE_TEXT]Defense[ENDCOLOR] against all [COLOR_POSITIVE_TEXT]Ranged Attacks[ENDCOLOR].'
	WHERE Tag = 'TXT_KEY_PROMOTION_BUFFALO_LOINS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );
