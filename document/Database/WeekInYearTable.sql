DROP TABLE WeekInYear
CREATE TABLE WeekInYear(
	[Year] INT NOT NULL,
	[Week] INT NOT NULL,
	[From] DATE NOT NULL,
	[To] DATE NOT NULL,
	PRIMARY KEY ([Year], [Week])
)
-- 2022
DECLARE @date DATE
SET @date = '2022-01-03'
DECLARE @week INT
SET @week = 1
WHILE @week < 53
BEGIN
	INSERT INTO WeekInYear
	VALUES (2022, @week, @date, DATEADD(DAY, 6, @date))
	SET @date = DATEADD(DAY, 7, @date)
	SET @week = @week + 1
END
-- 2023
SET @week = 1
WHILE @week < 53
BEGIN
	INSERT INTO WeekInYear
	VALUES (2023, @week, @date, DATEADD(DAY, 6, @date))
	SET @date = DATEADD(DAY, 7, @date)
	SET @week = @week + 1
END