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

-- Update attendance record time
DECLARE @i INT = 33
WHILE @i < 53
BEGIN
	DECLARE @date DATE = (SELECT [Date] FROM [Session] WHERE SessionID = @i)
	DECLARE @time TIME = (SELECT [End] FROM [TimeSlot] WHERE TimeSlotID = (SELECT [TimeSlotID] FROM [Session] WHERE [SessionID] = @i))
	DECLARE @str NVARCHAR(30) = CAST (@date AS NVARCHAR) + 'T' + CONVERT(NVARCHAR, @time, 8)
	UPDATE Attendance
	SET RecordTime = CAST (@str AS DATETIME)
	WHERE [SessionID] = @i
	SET @i = @i + 1
END

SELECT * FROM [Student]

-- Add students to group SE1623 - IOT102
INSERT INTO [StudentGroup] VALUES
('HE140954', 2),
('HE141491', 2),
('HE141683', 2),
('HE151297', 2),
('HE151321', 2),
('HE151366', 2),
('HE151407', 2),
('HE153263', 2),
('HE153306', 2),
('HE153330', 2),
('HE153602', 2),
('HE153711', 2),
('HE161149', 2),
('HE161499', 2),
('HE161574', 2),
('HE161637', 2),
('HE161697', 2),
('HE161699', 2),
('HE161701', 2),
('HE161722', 2),
('HE161827', 2),
('HE161888', 2),
('HE161928', 2),
('HE163390', 2),
('HE163519', 2),
('HE163585', 2),
('HE163884', 2),
('HE163937', 2),
('HE164001', 2),
('HE164016', 2)

-- Add students to group SE1630 - MAS291
INSERT INTO [StudentGroup] VALUES
('HE141083', 3),
('HE150469', 3),
('HE151297', 3),
('HE151366', 3),
('HE151407', 3),
('HE160085', 3),
('HE160531', 3),
('HE160537', 3),
('HE160770', 3),
('HE161318', 3),
('HE163168', 3),
('HE163229', 3),
('HE163350', 3),
('HE163411', 3),
('HE163419', 3),
('HE163428', 3),
('HE163444', 3),
('HE163538', 3),
('HE163585', 3),
('HE163614', 3),
('HE163615', 3),
('HE163678', 3),
('HE163751', 3),
('HE163937', 3),
('HE163971', 3),
('HE164001', 3),
('HE164016', 3),
('HE169003', 3)

-- Add students to group GD1611 - JPD123
INSERT INTO [StudentGroup] VALUES
('HA160009', 4),
('HE151158', 4),
('HE153257', 4),
('HE153527', 4),
('HE160099', 4),
('HE160152', 4),
('HE160473', 4),
('HE161082', 4),
('HE161300', 4),
('HE161371', 4),
('HE161530', 4),
('HE161575', 4),
('HE161581', 4),
('HE161637', 4),
('HE161697', 4),
('HE161880', 4),
('HE161943', 4),
('HE163340', 4),
('HE163488', 4),
('HE163585', 4),
('HE163594', 4),
('HE163777', 4),
('HE163781', 4),
('HE163937', 4),
('HE164001', 4),
('HE164016', 4),
('HS150072', 4),
('HS150447', 4),
('HS153184', 4),
('HS160522', 4)

SELECT [GroupID], [GroupName], 
[LecturerID], [CourseID] FROM [Group]
WHERE [GroupID] IN 
(SELECT GroupID FROM [StudentGroup]
WHERE [StudentID] = 'HE161149')

SELECT [GroupID], [GroupName], [LecturerID], [CourseID] FROM [Group]
WHERE [GroupID] = (SELECT [GroupID] FROM [Session]
WHERE [SessionID] = 4)

SELECT [SessionID], [LecturerID], [SessionNumber],
[SessionDescription], [RoomID], [Date], 
[TimeSlotID], [GroupID], [Semester] FROM [Session]
WHERE [LecturerID] = 'sonnt5'
AND [Date] BETWEEN '2022-07-11' AND '2022-07-17'

SELECT [DisplayName] FROM [Account]
WHERE [Username] = 'sonnt5'
AND [Password] = '123'

DECLARE @sID INT = 33
WHILE @sID < 53
BEGIN
	INSERT INTO [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES 
	(N'HE141428', @sID, N'Attended', CAST(N'2022-06-24T09:00:00.000' AS DateTime), NULL, N'sonnt5'),
	(N'HE141476', @sID, N'Attended', CAST(N'2022-06-24T09:00:00.000' AS DateTime), NULL, N'sonnt5'),
	(N'HE150076', @sID, N'Attended', CAST(N'2022-06-24T09:00:00.000' AS DateTime), NULL, N'sonnt5'),
	(N'HE150811', @sID, N'Attended', CAST(N'2022-06-24T09:00:00.000' AS DateTime), NULL, N'sonnt5'),
	(N'HE150963', @sID, N'Attended', CAST(N'2022-06-24T09:00:00.000' AS DateTime), NULL, N'sonnt5'),
	(N'HE151052', @sID, N'Attended', CAST(N'2022-06-24T09:00:00.000' AS DateTime), NULL, N'sonnt5'),
	(N'HE151058', @sID, N'Attended', CAST(N'2022-06-24T09:00:00.000' AS DateTime), NULL, N'sonnt5'),
	(N'HE151358', @sID, N'Attended', CAST(N'2022-06-24T09:00:00.000' AS DateTime), NULL, N'sonnt5'),
	(N'HE153050', @sID, N'Attended', CAST(N'2022-06-24T09:00:00.000' AS DateTime), NULL, N'sonnt5'),
	(N'HE153093', @sID, N'Attended', CAST(N'2022-06-24T09:00:00.000' AS DateTime), NULL, N'sonnt5'),
	(N'HE153381', @sID, N'Attended', CAST(N'2022-06-24T09:00:00.000' AS DateTime), NULL, N'sonnt5'),
	(N'HE153487', @sID, N'Attended', CAST(N'2022-06-24T09:00:00.000' AS DateTime), NULL, N'sonnt5'),
	(N'HE153560', @sID, N'Attended', CAST(N'2022-06-24T09:00:00.000' AS DateTime), NULL, N'sonnt5'),
	(N'HE153602', @sID, N'Attended', CAST(N'2022-06-24T09:00:00.000' AS DateTime), NULL, N'sonnt5'),
	(N'HE160167', @sID, N'Attended', CAST(N'2022-06-24T09:00:00.000' AS DateTime), NULL, N'sonnt5'),
	(N'HE160491', @sID, N'Attended', CAST(N'2022-06-24T09:00:00.000' AS DateTime), NULL, N'sonnt5'),
	(N'HE161541', @sID, N'Attended', CAST(N'2022-06-24T09:00:00.000' AS DateTime), NULL, N'sonnt5'),
	(N'HE161543', @sID, N'Attended', CAST(N'2022-06-24T09:00:00.000' AS DateTime), NULL, N'sonnt5'),
	(N'HE161551', @sID, N'Attended', CAST(N'2022-06-24T09:00:00.000' AS DateTime), NULL, N'sonnt5'),
	(N'HE161645', @sID, N'Attended', CAST(N'2022-06-24T09:00:00.000' AS DateTime), NULL, N'sonnt5'),
	(N'HE161811', @sID, N'Attended', CAST(N'2022-06-24T09:00:00.000' AS DateTime), NULL, N'sonnt5'),
	(N'HE163004', @sID, N'Attended', CAST(N'2022-06-24T09:00:00.000' AS DateTime), NULL, N'sonnt5'),
	(N'HE163491', @sID, N'Attended', CAST(N'2022-06-24T09:00:00.000' AS DateTime), NULL, N'sonnt5'),
	(N'HE163567', @sID, N'Attended', CAST(N'2022-06-24T09:00:00.000' AS DateTime), NULL, N'sonnt5'),
	(N'HE163630', @sID, N'Attended', CAST(N'2022-06-24T09:00:00.000' AS DateTime), NULL, N'sonnt5'),
	(N'HE163677', @sID, N'Attended', CAST(N'2022-06-24T09:00:00.000' AS DateTime), NULL, N'sonnt5'),
	(N'HE163697', @sID, N'Attended', CAST(N'2022-06-24T09:00:00.000' AS DateTime), NULL, N'sonnt5'),
	(N'HE163818', @sID, N'Attended', CAST(N'2022-06-24T09:00:00.000' AS DateTime), NULL, N'sonnt5'),
	(N'HE163849', @sID, N'Attended', CAST(N'2022-06-24T09:00:00.000' AS DateTime), NULL, N'sonnt5'),
	(N'HE163997', @sID, N'Attended', CAST(N'2022-06-24T09:00:00.000' AS DateTime), NULL, N'sonnt5')
	SET @sID = @sID + 1
END

DELETE FROM [Attendance]
WHERE SessionID = 60