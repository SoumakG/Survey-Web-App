using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;
using SurveyAppBE;

namespace SurveyAppDAL
{
    public class DBConnection : DataAccessComponent
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter adpt;
        DataSet ds;

        public SqlConnection GetConnection()
        {
            string conString = Convert.ToString(ConfigurationManager.ConnectionStrings["IonSurveyConnectionString"]);
            con = new SqlConnection(conString);
            return con;
        }

        public int ExecuteNonQuery(SqlConnection con, string spName, SqlParameter[] parm)
        {
            cmd = new SqlCommand();
            con.Open();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd = AddParameters(cmd, spName, parm);
            int result = cmd.ExecuteNonQuery();
            if (con.State == ConnectionState.Open)
                con.Close();
            return result;
        }
        public int ExecuteNonQueryCheckStatus(SqlConnection con, string spName, SqlParameter[] parm)
        {
            cmd = new SqlCommand();
            con.Open();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd = AddParameters(cmd, spName, parm);
            cmd.ExecuteNonQuery();
            if (con.State == ConnectionState.Open)
                con.Close();
            int result = (int)cmd.Parameters["@Status"].Value;
            return result;
        }
        private SqlCommand AddParameters(SqlCommand cmd, string spName, SqlParameter[] parm)
        {
            cmd.CommandText = spName;
            if (parm != null)
            {
                foreach (SqlParameter p in parm)
                {
                    if (p.Value == null)
                    {
                        p.Value = DBNull.Value;
                    }
                    cmd.Parameters.Add(p);
                }
            }
            return cmd;
        }

        public DataSet FillDataSet(SqlConnection con, string spName, SqlParameter[] parm)
        {
            con.Open();
            cmd = new SqlCommand();
            adpt = new SqlDataAdapter();
            ds = new DataSet();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd = AddParameters(cmd, spName, parm);
            adpt.SelectCommand = cmd;
            adpt.Fill(ds);
            if (con.State == ConnectionState.Open)
                con.Close();
            return ds;
        }

        public SqlDataReader DataReader(SqlConnection con, string spName, SqlParameter[] parm)
        {
            con.Open();
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd = AddParameters(cmd, spName, parm);
            SqlDataReader reader = cmd.ExecuteReader();
            return reader;
        }
       
        public void ExecuteNonQueryAddOptions(SqlConnection con, string spName, SqlParameter parm,int SurveyID)
        {
            cmd = new SqlCommand();
            cmd.CommandText = spName;
            con.Open();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter surveyID = new SqlParameter("@SurveyID", SqlDbType.Int);
            surveyID.Value = SurveyID;
            cmd.Parameters.Add(surveyID);
            cmd.Parameters.Add(parm);
            cmd.ExecuteNonQuery();
            if (con.State == ConnectionState.Open)
                con.Close();
            
        }

        public SqlDataReader DataReader(SqlConnection con, string query)
        {
            con.Open();
            cmd = new SqlCommand(query, con);
            SqlDataReader reader = cmd.ExecuteReader();
            return reader;
        }

        public object ExecuteScalar(SqlConnection con, string spName, SqlParameter[] parm)
        {
            cmd = new SqlCommand();
            con.Open();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd = AddParameters(cmd, spName, parm);
            object result = cmd.ExecuteScalar();
            if (con.State == ConnectionState.Open)
                con.Close();
            return result;
        }

        public object ExecuteScalar(SqlConnection con, string spName)
        {
            cmd = new SqlCommand();
            con.Open();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = spName;
            object result = cmd.ExecuteScalar();
            if (con.State == ConnectionState.Open)
                con.Close();
            return result;
        }



        internal void ExecuteNonQueryAddUserSummary(SqlConnection Conn, string spName, SqlParameter sqlParam, int SurveyID)
        {
            cmd = new SqlCommand();
            cmd.CommandText = spName;
            con.Open();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter surveyID = new SqlParameter("@SurveyID", SqlDbType.Int);
            surveyID.Value = SurveyID;
            cmd.Parameters.Add(surveyID);
            cmd.Parameters.Add(sqlParam);
            cmd.ExecuteNonQuery();
            if (con.State == ConnectionState.Open)
                con.Close();
            
        }
       
    }
}
 