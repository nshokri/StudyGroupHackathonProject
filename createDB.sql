Create Table dbo.States(
	StateID int Not Null Identity,
	StateName varchar(100) Not Null,
	Constraint pkStates Primary Key (StateID),
	Constraint uqStateName Unique (StateName)
);
Go

Create Table dbo.Schools(
	SchoolID int Not Null Identity,
	SchoolName varchar(100) Not Null,
	StateID int Not Null,
	Constraint pkSchools Primary Key (SchoolID),
	Constraint uqSchoolName Unique (SchoolName),
	Constraint fkStateID Foreign Key (StateID) References dbo.States(StateID)
);
Go

Create Table dbo.Courses(
	CourseID int Not Null Identity,
	CourseCode varchar(100) Not Null,
	SchoolID int Not Null,
	Constraint pkCourseID Primary Key (CourseID),
	Constraint uqCourseCode Unique (CourseCode),
	Constraint fkSchoolID Foreign Key (SchoolID) References dbo.Schools(SchoolID)
);
Go

Create Table dbo.Groups(
	GroupID int Not Null Identity,
	GroupMax int Not Null,
	CourseID int Not Null,
	Constraint pkGroups Primary Key (GroupID),
	Constraint fkCourseID Foreign Key (CourseID) References dbo.Courses(CourseID)
);
Go

Create Table dbo.[Days](
	[DayOfWeek] int Not Null,
	GroupID int Not Null,
	Constraint pkDays Primary Key ([DayOfWeek], GroupID),
	Constraint fkGroupID Foreign Key (GroupID) References dbo.Groups(GroupID)
);
Go

Create Table dbo.Times(
	[DayOfWeek] int Not Null,
	GroupID int Not Null,
	TimeStart time Not Null,
	TimeEnd time Not Null,
	Constraint pkTimes Primary Key ([DayOfWeek], GroupID),
	Constraint fkDayOfWeek Foreign Key ([DayOfWeek]) References dbo.[Days]([DayOfWeek])
);
Go

Create Table dbo.Members(
	MemberID int Not Null Identity,
	GroupID int Not Null,
	MemberName varchar(100) Not Null,
	MemberEmail varchar(100) Not Null,
	MemberPhone varchar(100) Not Null,
	Constraint pkMembers Primary Key (MemberID, GroupID),
	Constraint fkGroupID Foreign Key (GroupID) References dbo.Groups(GroupID),
	Constraint ckMemberEmail Check (MemberEmail like '%@%.%'),
	Constraint uqMemberEmail Unique (MemberEmail),
	Constraint ckMemberPhone Check (MemberPhone like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
);
Go