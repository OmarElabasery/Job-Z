--CREATE DATABASE Job_Z --Run this line alone first then comment it

CREATE TABLE Applicant(
	ID INT PRIMARY KEY,
	FName VARCHAR(15) NOT NULL,
	LName VARCHAR(15) NOT NULL,
	Gender CHAR(1) NOT NULL,
	Username NVARCHAR(20) NOT NULL UNIQUE,
	Email NVARCHAR(35) NOT NULL UNIQUE,
	App_Password NVARCHAR(15) NOT NULL,
	Phone_Number VARCHAR(11) UNIQUE,
	CHECK(Gender = 'M' OR Gender = 'F' OR Gender = 'N')
);

CREATE TABLE Company (
	ID INT PRIMARY KEY,
	Company_Name VARCHAR(40) NOT NULL UNIQUE,
	Username NVARCHAR(20) NOT NULL UNIQUE,
	Email NVARCHAR(35) NOT NULL UNIQUE,
	Com_Password NVARCHAR(15) NOT NULL,
	Domain VARCHAR (15) NOT NULL
);

CREATE TABLE [Event] (
	ID INT PRIMARY KEY,
	Event_Name VARCHAR(30) NOT NULL,
	Domain VARCHAR (15) NOT NULL,
	[Date] DATE NOT NULL,
	[Description] NVARCHAR(200) NOT NULL,
	Max_Attendance INT NOT NULL,
	Tickets_Sold INT NOT NULL
);

CREATE TABLE [Admin] (
	ID INT PRIMARY KEY,
	Username NVARCHAR(20) NOT NULL UNIQUE,
	Ad_Password NVARCHAR(15) NOT NULL UNIQUE,
	FName VARCHAR(15) NOT NULL,
	LName VARCHAR(15) NOT NULL,
);

CREATE TABLE Attend (
	ApplicantID INT NOT NULL,
	EventID INT NOT NULL,
	PRIMARY KEY(ApplicantID, EventID),
	FOREIGN KEY (ApplicantID) REFERENCES Applicant(ID),
	FOREIGN KEY (EventID) REFERENCES [Event](ID)
);

CREATE TABLE Participate (
	CompanyID INT NOT NULL,
	EventID INT NOT NULL,
	PRIMARY KEY(CompanyID, EventID),
	FOREIGN KEY (CompanyID) REFERENCES Company(ID),
	FOREIGN KEY (EventID) REFERENCES [Event](ID)
);

CREATE TABLE Booth (
	ID INT PRIMARY KEY,
	Design_NO TINYINT NOT NULL,
	Flyer_NO TINYINT,
	Video_NO TINYINT,
	CompanyID INT NOT NULL,
	FOREIGN KEY (CompanyID) REFERENCES Company(ID)
)

CREATE TABLE Interaction (
	ID INT PRIMARY KEY,
	ApplicantID INT NOT NULL,
	BoothID INT NOT NULL,
	EventID INT NOT NULL,
	JoiningTime TIME NOT NULL,
	Duration TIME NOT NULL,
	Read_Flyer BIT,
	Watched_Video BIT
)
