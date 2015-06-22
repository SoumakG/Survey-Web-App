using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SurveyAppBE;
using System.Data;
using System.Data.SqlClient;

namespace SurveyAppDAL
{
    public class SurveyMasterDAC : DBConnection
    {
        /// <summary>
        /// Retuns List of Survey
        /// </summary>
        /// <returns></returns>

        public List<SurveyMaster> GetSurveyMaster()
        {
            //retrievs data from table and stores it in dataTable
            List<SurveyMaster> surveyMasterList = new List<SurveyMaster>();
            DBConnection dbCon = new DBConnection();
            SqlConnection Conn = dbCon.GetConnection();
            SqlCommand cmd = new SqlCommand(Constants.USP_GetSurveyMaster, Conn);
            cmd.CommandType = CommandType.StoredProcedure;

            using (IDataReader dr = dbCon.DataReader(Conn, Constants.USP_GetSurveyMaster, null))
            {
                while (dr.Read())
                {
                    SurveyMaster surveyMaster = null;
                    surveyMaster = GetSurveyMasterData(dr);
                    if (surveyMaster != null)
                        surveyMasterList.Add(surveyMaster);
                }
            }
            return surveyMasterList;
        }
        /// <summary>
        /// inserts new survey details 
        /// </summary>
        /// <param name="surveyMaster"></param>
        /// <returns></returns>
        public void AddNewSurvey(SurveyMaster surveyMaster, List<SurveyOptions> surveyOptionsList)
        {
            DBConnection dbCon = new DBConnection();
            SqlConnection Conn = dbCon.GetConnection();
            SqlCommand cmd = new SqlCommand(Constants.USP_AddNewSurvey, Conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter[] sqlParam = new SqlParameter[6];

            sqlParam[0] = new SqlParameter("@QuestionDetail", SqlDbType.VarChar);
            sqlParam[0].Value = surveyMaster.Question_Detail;

            sqlParam[1] = new SqlParameter("@QuestionType", SqlDbType.VarChar);
            sqlParam[1].Value = surveyMaster.Question_Type;

            sqlParam[2] = new SqlParameter("@StartDate", SqlDbType.DateTime);
            sqlParam[2].Value = surveyMaster.Start_Date;

            sqlParam[3] = new SqlParameter("@EndDate", SqlDbType.DateTime);
            sqlParam[3].Value = surveyMaster.End_Date;

            sqlParam[4] = new SqlParameter("@CreatedBy", SqlDbType.VarChar);
            sqlParam[4].Value = null;

            sqlParam[5] = new SqlParameter("@ModifiedBy", SqlDbType.VarChar);
            sqlParam[5].Value = null;

            int surveyMasteridentity = Convert.ToInt32(dbCon.ExecuteScalar(Conn, Constants.USP_AddNewSurvey, sqlParam));
            
            
            SqlParameter sqlParam1 = new SqlParameter();
            foreach (SurveyOptions a in surveyOptionsList)
            {
                sqlParam1 = new SqlParameter("@OptionDetails", SqlDbType.VarChar);
                sqlParam1.Value = a.Description;
                dbCon.ExecuteNonQueryAddOptions(Conn, Constants.USP_AddOptionDetails, sqlParam1, surveyMasteridentity);
            }
            // adding survey Users for the survey into UserSummary Table
            List<SurveyUser> surveyUserList = new List<SurveyUser>();
            surveyUserList = GetSurveyUser();
            foreach (SurveyUser a in surveyUserList)
            {
                sqlParam1 = new SqlParameter("@UserID", SqlDbType.Int);
                sqlParam1.Value = a.ID;
                dbCon.ExecuteNonQueryAddUserSummary(Conn, Constants.USP_AddUserSummary, sqlParam1, surveyMasteridentity);
                ///sends email to every user with surveylink
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("http://localhost:51641/EndUser.aspx?field1=");
            sb.Append(surveyMasteridentity);
            sb.Append("&field2=");
            sb.Append(a.ID);
            SendSmtpEmail.SendMailMessage("soumak.survey.test@gmail.com", a.Email_ID, "", "", "IonSurvey Link", sb.ToString());
                
            }

        }

        /// <summary>
        /// Assignes value to object
        /// </summary>
        /// <param name="dr"></param>
        /// <returns></returns>
        private SurveyMaster GetSurveyMasterData(IDataReader dr)
        {
            SurveyMaster surveyMaster = new SurveyMaster();
            surveyMaster.ID = base.GetDataValue<int>(dr, "ID");
            surveyMaster.Question_Detail = base.GetDataValue<string>(dr, "Question_Detail");
            surveyMaster.Question_Type = base.GetDataValue<string>(dr, "Question_Type");
            surveyMaster.Created_By = base.GetDataValue<string>(dr, "Created_By");
            surveyMaster.Start_Date = base.GetDataValue<DateTime>(dr, "Start_Date");
            surveyMaster.End_Date = base.GetDataValue<DateTime>(dr, "End_Date");
            surveyMaster.Modified_By = base.GetDataValue<string>(dr, "Modified_By");

            return surveyMaster;
        }
        /// <summary>
        /// returns surveymaster details for the given ID
        /// </summary>
        /// <param name="surveyMaster"></param>
        /// <returns></returns>
        public SurveyMaster GetSurveyMasterByID(SurveyMaster surveyMaster)
        {
            DBConnection dbCon = new DBConnection();
            SqlConnection Conn = dbCon.GetConnection();
            SqlCommand cmd = new SqlCommand(Constants.USP_GetSurveyMasterByID, Conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter[] sqlParam = new SqlParameter[1];

            sqlParam[0] = new SqlParameter("@SurveyID", SqlDbType.Int);
            sqlParam[0].Value = surveyMaster.ID;
            SurveyMaster surveyMaster1 = null;
            using (IDataReader dr = dbCon.DataReader(Conn, Constants.USP_GetSurveyMasterByID,sqlParam))
            {
                while (dr.Read())
                {
                   
                    surveyMaster1 = GetSurveyMasterData(dr);
                   }
            }
            return surveyMaster1;
        }
        /// <summary>
        /// Retuns List of Survey Users
        /// </summary>
        /// <returns></returns>

        public List<SurveyUser> GetSurveyUser()
        {
            //retrievs data from table and stores it in dataTable
            List<SurveyUser> surveyUserList = new List<SurveyUser>();
            DBConnection dbCon = new DBConnection();
            SqlConnection Conn = dbCon.GetConnection();
            SqlCommand cmd = new SqlCommand(Constants.USP_GetSurveyUser, Conn);
            cmd.CommandType = CommandType.StoredProcedure;

            using (IDataReader dr = dbCon.DataReader(Conn, Constants.USP_GetSurveyUser, null))
            {
                while (dr.Read())
                {
                    SurveyUser surveyUser = null;
                    surveyUser = GetSurveyUserData(dr);
                    if (surveyUser != null)
                        surveyUserList.Add(surveyUser);
                }
            }
            return surveyUserList;
        }
        /// <summary>
        /// Assignes value to object
        /// </summary>
        /// <param name="dr"></param>
        /// <returns></returns>
        private SurveyUser GetSurveyUserData(IDataReader dr)
        {
            SurveyUser surveyUser = new SurveyUser();
            surveyUser.ID = base.GetDataValue<int>(dr, "ID");
            surveyUser.User_Type = base.GetDataValue<string>(dr, "User_Type");
            surveyUser.Email_ID = base.GetDataValue<string>(dr, "Email_ID");
            return surveyUser;
        }
    }
}
