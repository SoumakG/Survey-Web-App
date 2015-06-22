using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SurveyAppBE;
using System.Data;
using System.Data.SqlClient;

namespace SurveyAppDAL
{
   public class SurveyOptionsDAC : DBConnection
    {
        public List<SurveyOptions> GetOptionsBySurveyID(SurveyMaster surveyMaster)
        {
            List<SurveyOptions> surveyOptionList = new List<SurveyOptions>();
            DBConnection dbCon = new DBConnection();
            SqlConnection Conn = dbCon.GetConnection();
            SqlCommand cmd = new SqlCommand(Constants.USP_GetSurveyOption, Conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter[] sqlParam = new SqlParameter[1];

            sqlParam[0] = new SqlParameter("@SurveyID", SqlDbType.Int);
            sqlParam[0].Value = surveyMaster.ID;
             
            using (IDataReader dr = dbCon.DataReader(Conn, Constants.USP_GetSurveyOption, sqlParam))
            {
                while (dr.Read())
                {
                    SurveyOptions surveyOptions1 = null;
                    surveyOptions1 = GetSurveyOptionData(dr);
                    if (surveyMaster != null)
                        surveyOptionList.Add(surveyOptions1);
                }
            }
            return surveyOptionList;

        }
        /// <summary>
        /// Assignes value to object
        /// </summary>
        /// <param name="dr"></param>
        /// <returns></returns>
        private SurveyOptions GetSurveyOptionData(IDataReader dr)
        {
            SurveyOptions surveyOptions = new SurveyOptions();
            surveyOptions.ID = base.GetDataValue<int>(dr, "ID");
            surveyOptions.QuestionID = base.GetDataValue<int>(dr, "QuestionID");
            surveyOptions.Description = base.GetDataValue<string>(dr, "Description");
            surveyOptions.Count = Convert.ToInt32( base.GetDataValue<int>(dr, "Count"));

            return surveyOptions;
        }

        public bool AddOptionsCount(SurveyOptions surveyOptions)
        {
            int i = 1;
            if (!(surveyOptions.Count == null))
            {
                i = surveyOptions.Count;
                i = i + 1;
            }
            DBConnection dbCon = new DBConnection();
            SqlConnection Conn = dbCon.GetConnection();
            SqlCommand cmd = new SqlCommand(Constants.USP_AddOptionCount, Conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter[] sqlParam = new SqlParameter[2];
            sqlParam[0] = new SqlParameter("@OptionID", SqlDbType.Int);
            sqlParam[0].Value = surveyOptions.ID;

            sqlParam[1] = new SqlParameter("@OptionCount", SqlDbType.Int);
            sqlParam[1].Value = i;
           int j= dbCon.ExecuteNonQuery(Conn, Constants.USP_AddOptionCount, sqlParam);
           if (j == 1)
               return true;
           else return false;
        }
    }
}
