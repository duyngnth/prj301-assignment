-- View all sessions in a single day of a lecture
SELECT * FROM [Session]
WHERE LecturerID = 'sonnt5'
AND [Date] = '2022-06-29'
-- View all sessions in a single week of a lecture
SELECT * FROM [Session]
WHERE LecturerID = 'sonnt5' 
AND [Date] BETWEEN '2022-06-27' AND '2022-07-03'
-- View attendance report of a student group in a session
SELECT * FROM Attendance
WHERE SessionID = 
(SELECT SessionID FROM [Session] 
WHERE LecturerID = 'sonnt5'
AND [Date] = '2022-06-29'
AND TimeSlotID = 'Slot 4')
-- View attendance report of all students in the course
SELECT * FROM Attendance
WHERE SessionID IN
(SELECT SessionID FROM [Session]
WHERE GroupID = 1)
-- View list of students in a group
SELECT * FROM Student
WHERE StudentID IN
(SELECT StudentID FROM StudentGroup
WHERE GroupID = 1)
-- Add attendance values
DECLARE @time DATETIME = SYSDATETIME()
INSERT INTO Attendance VALUES
('HE140155', 25, 'Attended', @time, ''),
('HE140777', 25, 'Attended', @time, ''),
('HE150167', 25, 'Attended', @time, ''),
('HE150798', 25, 'Attended', @time, ''),
('HE150819', 25, 'Attended', @time, ''),
('HE150915', 25, 'Attended', @time, ''),
('HE151210', 25, 'Attended', @time, ''),
('HE151282', 25, 'Attended', @time, ''),
('HE151356', 25, 'Absent', @time, ''),
('HE151431', 25, 'Absent', @time, ''),
('HE153012', 25, 'Attended', @time, ''),
('HE153276', 25, 'Attended', @time, ''),
('HE153603', 25, 'Attended', @time, ''),
('HE153622', 25, 'Attended', @time, ''),
('HE153773', 25, 'Attended', @time, ''),
('HE160328', 25, 'Attended', @time, ''),
('HE161149', 25, 'Attended', @time, ''),
('HE161499', 25, 'Absent', @time, ''),
('HE161574', 25, 'Attended', @time, ''),
('HE161699', 25, 'Attended', @time, ''),
('HE161701', 25, 'Attended', @time, ''),
('HE161888', 25, 'Attended', @time, ''),
('HE161928', 25, 'Absent', @time, ''),
('HE162004', 25, 'Attended', @time, ''),
('HE163366', 25, 'Attended', @time, ''),
('HE163585', 25, 'Attended', @time, ''),
('HE163884', 25, 'Attended', @time, ''),
('HE163937', 25, 'Attended', @time, ''),
('HE164001', 25, 'Attended', @time, ''),
('HE164016', 25, 'Attended', @time, '')

SELECT [StudentID], [MemberCode], [Surname],
[MiddleName], [GivenName] FROM [Student]
WHERE [StudentID] IN
(SELECT [StudentID] FROM [StudentGroup]
WHERE [GroupID] IN 
(SELECT [GroupID] FROM [Group]
WHERE [GroupName] = 'SE1623'
AND [CourseID] = 'PRJ301'))

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