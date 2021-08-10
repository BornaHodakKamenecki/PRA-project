-- baza podataka
use DBQuizard
go

drop table if exists Answer;
drop table if exists NewGuest;
drop table if exists Guest;
drop table if exists Question;
drop table if exists Quiz;
drop table if exists UserAcc;
go

create table UserAcc (
	IDUserAcc int primary key identity,
	Email nvarchar(100) not null,
	Pass nvarchar (100) not null,
	Username nvarchar (100) not null unique,
	IsActive int default 1

)

go
create table Quiz (
	IDQuiz int primary key identity,
	Title nvarchar(100) not null,
	IsActive int default 1,
	UserAccID int foreign key references UserAcc(IDUserAcc)
)

go
create table Question (
	IDQuestion int primary key identity,
	Question nvarchar(100) not null,
	Duration int not null,
	IsActive int default 1,
	QuizID int foreign key references Quiz(IDQuiz)
)

go
create table Answer (
	IDAnswer int primary key identity,
	Answer nvarchar(100) not null,
	RightAnswer int default 0,
	IsActive int default 1,
	QuestionID int foreign key references Question(IDQuestion)
)


go
create table NewGuest(
	ID int primary key identity not null,
	Nickname nvarchar(50) not null,
	DateOfCreation DATETIME NOT NULL DEFAULT (GETDATE())
)

go
create table Guest (
	IDGuest int primary key identity,
	Nickname nvarchar(20)
)

go

-- CRUD procedure
use DBQuizard
go

drop proc if exists CreateUserAcc;
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

drop proc if exists GetEmails;
go
create proc GetEmails
as
	select Email
	from UserAcc
go

drop proc if exists GetEmail;
go
create proc GetEmail
	@email nvarchar(100)
as
	select Email
	from UserAcc
	where Email = @email
go

drop proc if exists LoginUser;
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

drop proc if exists UpdateUserAcc;
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

drop proc if exists DeleteUserAcc;
go
create proc DeleteUserAcc
	@IDUserAcc int
as
	update UserAcc
	set
	IsActive = 0
	where IDUserAcc = @IDUserAcc
go

drop proc if exists CreateQuiz;
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

drop proc if exists GetQuiz;
go
create proc GetQuiz
	@IDQuiz int
as
	select *
	from Quiz
	where IDQuiz = @IDQuiz
go

drop proc if exists StartQuiz;
go
create proc StartQuiz
	@IDQuiz int
as
	select *
	from Quiz
	where IsActive = 1 and IDQuiz = @IDQuiz
go

drop proc if exists DeleteQuiz;
go
create proc DeleteQuiz
	@IDQuiz int
as
	update Quiz
	set
	IsActive = 0
	where IDQuiz = @IDQuiz
go

drop proc if exists QuizesFromUser;
go
create proc QuizesFromUser
	@IDUserAcc int
as
	select *
	from Quiz
	where UserAccID = @IDUserAcc
go

drop proc if exists CreateQuestion;
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

drop proc if exists GetQuestion;
go
create proc GetQuestion
	@IDQuestion int
as
	select *
	from Question
	where IDQuestion = @IDQuestion
go

drop proc if exists GetAllQuestionsForQuiz;
go
create proc GetAllQuestionsForQuiz
	@IDQuiz int
as
	select * 
	from Question
	where QuizID = @IDQuiz
go

drop proc if exists UpdateOrDeleteQuestion;
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

drop proc if exists CreateAnswer;
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

drop proc if exists GetAnswer;
go
create proc GetAnswer
	@IDAnswer int
as
	select *
	from Answer
	where IDAnswer = @IDAnswer
go

drop proc if exists GetAllAnswersForQuestion;
go
create proc GetAllAnswersForQuestion
	@QuestionID int
as
	select *
	from Answer
	where IsActive = 1 and QuestionID = @QuestionID
go

drop proc if exists GetAnswersCount;
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

drop proc if exists UpdateOrDeleteAnswer;
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


drop proc if exists DeleteFromGuest;
go
create proc DeleteFromGuest
as
begin
	delete from NewGuest
	where DateOfCreation < DATEADD(MINUTE, 30, GETDATE())
end
go


drop proc if exists CreateNewGuest;
go
create proc CreateNewGuest
	@Nickname nvarchar(20)
as
begin
	insert into NewGuest(Nickname, DateOfCreation)
	values(@Nickname, GETDATE())
end
go