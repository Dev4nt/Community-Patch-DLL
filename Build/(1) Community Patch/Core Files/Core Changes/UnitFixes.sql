-- Update Hover Units to obey coast/ocean tiles

INSERT INTO Unit_FreePromotions (UnitType, PromotionType)
SELECT 'UNIT_HELICOPTER_GUNSHIP' , 'PROMOTION_EMBARKATION';

INSERT INTO Unit_FreePromotions (UnitType, PromotionType)
SELECT 'UNIT_HELICOPTER_GUNSHIP' , 'PROMOTION_DEFENSIVE_EMBARKATION';

INSERT INTO Unit_FreePromotions (UnitType, PromotionType)
SELECT 'UNIT_HELICOPTER_GUNSHIP' , 'PROMOTION_ALLWATER_EMBARKATION';
