using Microsoft.ApplicationBlocks.Data;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;

namespace PraProjekt.Models
{
    public class Repository
    {
        private static string cs = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;

        // USER
        public static int CreateUserAcc(UserAcc user)
            => SqlHelper.ExecuteNonQuery(cs, "CreateUserAcc", user.Email, user.Pass, user.Username, user.IsActive);

        public static int LoginUser(string email, string pass)
            => SqlHelper.ExecuteNonQuery(cs, "LoginUser", email, pass);

        public static void UpdateUserAcc(UserAcc u)
            => SqlHelper.ExecuteNonQuery(cs, "UpdateUserAcc", u.IDUserAcc, u.Pass, u.Username);

        public static void DeleteUserAcc(int idUserAcc)
            => SqlHelper.ExecuteNonQuery(cs, "DeleteUserAcc", idUserAcc);

        // QUIZ
        public static void CreateQuiz(Quiz q)
            => SqlHelper.ExecuteNonQuery(cs, "CreateQuiz", q.Title, q.UserAccID);

        public static Quiz GetQuiz(int idQuiz)
        {
            var tblQuiz = SqlHelper.ExecuteDataset(cs, "GetQuiz", idQuiz).Tables[0].Rows;
            return specQuiz(tblQuiz);
        }

        public static Quiz StartQuiz(int idQuiz)
        {
            var tblQuiz = SqlHelper.ExecuteDataset(cs, "StartQuiz", idQuiz).Tables[0].Rows;
            return specQuiz(tblQuiz);
        }

        private static Quiz specQuiz(DataRowCollection tblQuiz)
        {
            DataRow row = tblQuiz[0];

            return tblQuiz.Count == 0 ? null : new Quiz()
            {
                IDQuiz = (int)row["IDQuiz"],
                Title = row["Title"].ToString(),
                IsActive = (int)row["IsActive"],
                UserAccID = (int)row["UserAccID"]
            };
        }

        public static int DeleteQuiz(int idQuiz)
            => SqlHelper.ExecuteNonQuery(cs, "DeleteQuiz", idQuiz);

        public IEnumerable<Quiz> QuizesFromUser(int userAccId)
        {
            var tblQuiz = SqlHelper.ExecuteDataset(cs, "QuizesFromUser", userAccId).Tables[0];

            foreach (DataRow row in tblQuiz.Rows)
            {
                yield return new Quiz()
                {
                    IDQuiz = (int)row["IDQuiz"],
                    Title = row["Title"].ToString(),
                    IsActive = (int)row["IsActive"],
                    UserAccID = userAccId
                };
            }
        }

        //QUESTION
        public static void CreateQuestion(Question q)
            => SqlHelper.ExecuteNonQuery(cs, "CreateQuestion", q.QuestionText, q.Duration, q.QuizID);

        public static Question GetQuestion(int idQuestion)
        {
            var tblQuestion = SqlHelper.ExecuteDataset(cs, "GetQuestion", idQuestion).Tables[0].Rows;
            DataRow row = tblQuestion[0];

            return tblQuestion.Count == 0 ? null : new Question()
            {
                IDQuestion = idQuestion,
                QuestionText = row["Question"].ToString(),
                Duration = (int)row["Duration"],
                IsActive = (int)row["IsActive"],
                QuizID = (int)row["QuizID"]
            };
        }

        public static IEnumerable<Question> GetAllQuestionsForQuiz(int quizId)
        {
            var tblQuestions = SqlHelper.ExecuteDataset(cs, "GetAllQuestionsForQuiz", quizId).Tables[0];

            foreach (DataRow row in tblQuestions.Rows)
            {
                yield return new Question()
                {
                    IDQuestion = (int)row["IDQuestion"],
                    QuestionText = row["Question"].ToString(),
                    Duration = (int)row["Duration"],
                    IsActive = (int)row["IsActive"],
                    QuizID = quizId
                };
            }
        }

        public static void UpdateOrDeleteQuestion(Question q)
            => SqlHelper.ExecuteNonQuery(cs, "UpdateOrDeleteQuestion", q.IDQuestion, q.QuestionText, q.Duration, q.IsActive);

        // ANSWER
        public static void CreateAnswer(Answer a)
            => SqlHelper.ExecuteNonQuery(cs, "CreateAnswer", a.AnswerText, a.RightAnswer, a.QuestionID);

        public static Answer GetAnswer(int idAnswer)
        {
            var tblAnswer = SqlHelper.ExecuteDataset(cs, "GetAnswer", idAnswer).Tables[0].Rows;
            DataRow row = tblAnswer[0];

            return tblAnswer.Count == 0 ? null : new Answer()
            {
                IDAnswer = idAnswer,
                AnswerText = row["Answer"].ToString(),
                RightAnswer = (int)row["RightAnswer"],
                IsActive = (int)row["IsActive"],
                QuestionID = (int)row["QuestionID"]
            };
        }

        public static IEnumerable<Answer> GetAllAnswersForQuestion(int questionId)
        {
            var tblAnswers = SqlHelper.ExecuteDataset(cs, "GetAllAnswersForQuestion", questionId).Tables[0];

            foreach (DataRow row in tblAnswers.Rows)
            {
                yield return new Answer()
                {
                    IDAnswer = (int)row["IDAnswer"],
                    AnswerText = row["Answer"].ToString(),
                    RightAnswer = (int)row["RightAnswer"],
                    IsActive = (int)row["IsActive"],
                    QuestionID = questionId
                };
            }
        }

        public static int GetAnswersCount(int questionId)
            => SqlHelper.ExecuteDataset(cs, "GetAllAnswersForQuestion", questionId).Tables[0].Rows.Count;

        public static void UpdateOrDeleteAnswer(Answer a)
            => SqlHelper.ExecuteNonQuery(cs, "UpdateOrDeleteAnswer", a.IDAnswer, a.AnswerText, a.RightAnswer, a.IsActive);
    }
}