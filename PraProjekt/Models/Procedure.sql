-- baza podataka
create database DBQuizard
go

use DBQuizard
go

create table UserAcc (
	IDUserAcc int primary key identity,
	Email nvarchar(100) not null,
	Pass nvarchar (100) not null,
	Username nvarchar (100) not null unique,
	IsActive int default 1

)

create table Quiz (
	IDQuiz int primary key identity,
	Title nvarchar(100) not null,
	IsActive int default 1,
	UserAccID int foreign key references UserAcc(IDUserAcc)
)

create table Question (
	IDQuestion int primary key identity,
	Question nvarchar(100) not null,
	Duration int not null,
	IsActive int default 1,
	QuizID int foreign key references Quiz(IDQuiz)
)

create table Answer (
	IDAnswer int primary key identity,
	Answer nvarchar(100) not null,
	RightAnswer int default 0,
	IsActive int default 1,
	QuestionID int foreign key references Question(IDQuestion)
)
go

-- CRUD procedure
use DBQuizard
go

create proc CreateUserAcc
	@Email nvarchar(100),
	@Pass nvarchar(100),
	@Username nvarchar(100),
	@IsActive int
as
	insert into UserAcc(Email, Pass, Username, IsActive)
		values (@Email, @Pass, @Username, @IsActive)
go

create proc GetEmails
as
	select Email
	from UserAcc
go

create proc GetEmail
	@email nvarchar(100)
as
	select Email
	from UserAcc
	where Email = @email
go

create proc LoginUser
	@Email nvarchar(100),
	@Pass nvarchar(100)
	--@Succes int output
as
	select *
	from UserAcc
	where Email = @Email and Pass = @Pass and IsActive = 1
go

create proc UpdateUserAcc
	@IDUserAcc int,
	@Pass nvarchar(100),
	@Username nvarchar(100)
as
	update UserAcc
	set
	Pass = @Pass,
	Username = @Username
	where IDUserAcc = @IDUserAcc
go

create proc DeleteUserAcc
	@IDUserAcc int
as
	update UserAcc
	set
	IsActive = 0
	where IDUserAcc = @IDUserAcc
go

create proc CreateQuiz
	@IDQuiz int output,
	@Title nvarchar(100),
	@UserAccID int
as
	insert into Quiz(Title, IsActive, UserAccID)
		values (@Title, 1, @UserAccID)
	set @IDQuiz = SCOPE_IDENTITY()
go

create proc GetQuiz
	@IDQuiz int
as
	select *
	from Quiz
	where IDQuiz = @IDQuiz
go

create proc StartQuiz
	@IDQuiz int
as
	select *
	from Quiz
	where IsActive = 1 and IDQuiz = @IDQuiz
go

create proc DeleteQuiz
	@IDQuiz int
as
	update Quiz
	set
	IsActive = 0
	where IDQuiz = @IDQuiz
go

create proc QuizesFromUser
	@IDUserAcc int
as
	select *
	from Quiz
	where UserAccID = @IDUserAcc
go

create proc CreateQuestion
	@IDQuestion int output,
	@Question nvarchar(100),
	@Duration int,
	@QuizID int
as
	insert into Question(Question, Duration, IsActive, QuizID)
		values (@Question, @Duration, 1, @QuizID)
	set @IDQuestion = SCOPE_IDENTITY()
go

create proc GetQuestion
	@IDQuestion int
as
	select *
	from Question
	where IDQuestion = @IDQuestion
go

create proc GetAllQuestionsForQuiz
	@IDQuiz int
as
	select * 
	from Question
	where QuizID = @IDQuiz
go

create proc UpdateOrDeleteQuestion
	@IDQuestion int,
	@Question nvarchar(100),
	@Duration int,
	@IsActive int
as
	update Question
	set
	Question = @Question,
	Duration = @Duration,
	IsActive = @IsActive
	where IDQuestion = @IDQuestion
go

create proc CreateAnswer
	@IDAnswer int output,
	@Answer nvarchar(100),
	@RightAnswer int,
	@QuestionID int
as
	insert into Answer(Answer, RightAnswer, IsActive, QuestionID)
		values (@Answer, @RightAnswer, 1, @QuestionID)
	set @IDAnswer = SCOPE_IDENTITY()
go

create proc GetAnswer
	@IDAnswer int
as
	select *
	from Answer
	where IDAnswer = @IDAnswer
go

create proc GetAllAnswersForQuestion
	@QuestionID int
as
	select *
	from Answer
	where IsActive = 1 and QuestionID = @QuestionID
go

create proc GetAnswersCount
	@QuestionID int,
	@AnswersCount int output
as
	select
	@AnswersCount = COUNT(*) 
					from Answer 
					where QuestionID = @QuestionID
go

create proc UpdateOrDeleteAnswer
	@IDAnswer int,
	@Answer nvarchar(100),
	@RightAnswer int,
	@IsActive int
as
	update Answer
	set
	Answer = @Answer,
	RightAnswer = @RightAnswer,
	IsActive = @IsActive
	where IDAnswer = @IDAnswer
go