ALTER TABLE Improvements
  ADD MakesPassable INTEGER DEFAULT 0;

INSERT INTO CustomModDbUpdates(Name, Value) VALUES('GLOBAL_PASSABLE_FORTS', 1);