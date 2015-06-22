using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SurveyAppBE;
using System.Data.SqlClient;
using System.Data;

namespace SurveyAppDAL
{
    public class UserSummaryDAC : DBConnection
    {
        public bool CheckUserStatus(UserSummary userSummary)
        {

            DBConnection dbCon = new DBConnection();
            SqlConnection Conn = dbCon.GetConnection();
            SqlCommand cmd = new SqlCommand(Constants.USP_CheckUserStatus, Conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter[] sqlParam = new SqlParameter[3];

            sqlParam[0] = new SqlParameter("@UserID", SqlDbType.Int);
            sqlParam[0].Value = userSummary.User_ID;

            sqlParam[1] = new SqlParameter("@QuestionID", SqlDbType.Int);
            sqlParam[1].Value = userSummary.Question_ID;
            sqlParam[2] = new SqlParameter("@Status", SqlDbType.Int);
            sqlParam[2].Direction = ParameterDirection.Output;
          int o =  dbCon.ExecuteNonQueryCheckStatus(Conn, Constants.USP_CheckUserStatus, sqlParam);
 
            
            return Convert.ToBoolean( o);
        }
        private UserSummary GetUserSummaryData(IDataReader dr)
        {
            UserSummary userSummary = new UserSummary();
            userSummary.Status = base.GetDataValue<int>(dr, "Status");
            return userSummary;
        }

        public void ChangeUserStatus(UserSummary userSummary)
        {
            DBConnection dbCon = new DBConnection();
            SqlConnection Conn = dbCon.GetConnection();
            SqlCommand cmd = new SqlCommand(Constants.USP_ChangeUserStatus, Conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter[] sqlParam = new SqlParameter[2];

            sqlParam[0] = new SqlParameter("@UserID", SqlDbType.Int);
            sqlParam[0].Value = userSummary.User_ID;

            sqlParam[1] = new SqlParameter("@QuestionID", SqlDbType.Int);
            sqlParam[1].Value = userSummary.Question_ID;
            
            dbCon.ExecuteNonQuery(Conn, Constants.USP_ChangeUserStatus, sqlParam);


            
        }
    }
}
