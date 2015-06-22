using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SurveyAppBE;
using SurveyAppBL;

namespace SurveyApp1inASPX
{
    public partial class SurveyReport2 : System.Web.UI.Page
    {
        public static int surveyID;
        public static int userID;
        static List<SurveyOptions> surveyOptionsList = new List<SurveyOptions>();
        SurveyMaster surveyMaster = new SurveyMaster();
        SurveyOptions surveyOptions = new SurveyOptions();
        SurveyMasterComponent surveyMasterComponent = new SurveyMasterComponent();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                surveyID = Convert.ToInt32(Request.QueryString["field1"]);
                surveyMaster.ID = surveyID;
                surveyMaster = surveyMasterComponent.GetSurveyMasterByID(surveyMaster);
                lblSurveyQues.Text = surveyMaster.Question_Detail;
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(surveyMaster.Start_Date.Day);
                sb.Append("/");
                sb.Append(surveyMaster.Start_Date.Month);
                sb.Append("/");
                sb.Append(surveyMaster.Start_Date.Year);
                sb.Append(" To ");
                sb.Append(surveyMaster.End_Date.Day);
                sb.Append("/");
                sb.Append(surveyMaster.End_Date.Month);
                sb.Append("/");
                sb.Append(surveyMaster.End_Date.Year);
                lblSurveyDate.Text = sb.ToString();
                
            }

        }
        [System.Web.Services.WebMethod()]
        [System.Web.Script.Services.ScriptMethod()]
        public static List<SurveyOptions> getOptions()
        {
            SurveyMaster surveyMaster = new SurveyMaster();
            SurveyOptionsComponent surveyOptionsComponent = new SurveyOptionsComponent();
            surveyMaster.ID = surveyID;
            //SurveyMasterComponent surveyMasterComponent = new SurveyMasterComponent();
            //surveyMaster = surveyMasterComponent.GetSurveyMasterByID(surveyMaster);
            surveyOptionsList = surveyOptionsComponent.GetOptionsBySurveyID(surveyMaster);
            return surveyOptionsList;
        }
    }
} 