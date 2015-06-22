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
    public partial class EndUser : System.Web.UI.Page
    {
        static List<SurveyOptions> surveyOptionsList = new List<SurveyOptions>();
        SurveyMaster surveyMaster = new SurveyMaster();
        SurveyOptions surveyOptions = new SurveyOptions();
        UserSummary userSummary = new UserSummary();
        SurveyMasterComponent surveyMasterComponent = new SurveyMasterComponent();
        SurveyOptionsComponent surveyOptionsComponent = new SurveyOptionsComponent();
        UserSummaryComponent userSummaryComponent = new UserSummaryComponent();
        public static int surveyID;
        public static int userID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                surveyID = Convert.ToInt32(Request.QueryString["field1"]);
                userID = Convert.ToInt32(Request.QueryString["field2"]);
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
                lblSurveyID.Text = Convert.ToString(surveyMaster.ID);
                hdnFldSurveyType.Value = surveyMaster.Question_Type;
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

        protected void btnSave_Click(object sender, EventArgs e)
        {
            userSummary.User_ID = userID;
            userSummary.Question_ID = surveyID;

            surveyOptions.Description = Request.Form["options"].ToString();
            foreach (SurveyOptions surveyOptions1 in surveyOptionsList)
            {
                if (surveyOptions1.Equals(surveyOptions))
                {
                    if (!userSummaryComponent.CheckUserStatus(userSummary))
                    {
                        if (!surveyOptionsComponent.AddOptionsCount(surveyOptions1) )
                        {
                            userSummaryComponent.ChangeUserStatus(userSummary);
                            Response.Redirect("EndUserFinish.aspx"); }
                        
                    }
                    else Response.Redirect("EndUserError.aspx");
                }

            }
        }
    }
}