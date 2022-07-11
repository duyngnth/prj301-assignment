DECLARE @i INT = 3
WHILE @i < 25
BEGIN
	DECLARE @date DATE = (SELECT [Date] FROM [Session] WHERE SessionID = @i)
	DECLARE @time TIME = (SELECT [End] FROM [TimeSlot] WHERE TimeSlotID = (SELECT [TimeSlotID] FROM [Session] WHERE [SessionID] = @i))
	DECLARE @str NVARCHAR(30) = CAST (@date AS NVARCHAR) + 'T' + CONVERT(NVARCHAR, @time, 8)
	UPDATE Attendance
	SET RecordTime = CAST (@str AS DATETIME)
	WHERE [SessionID] = @i
	SET @i = @i + 1
END