using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using SurveyAppBL;
using SurveyAppBE;
 
namespace SurveyApp1inASPX
{
    public partial class AddNewSurvey : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }


        protected void btnSave_Click(object sender, EventArgs e)
        {
            SurveyMaster surveyMaster = new SurveyMaster();
            surveyMaster.Question_Detail=Request.Form["txtQuestionDetails"].ToString();
            surveyMaster.Start_Date = Convert.ToDateTime(Request.Form["dtpStartDate"].ToString());
            surveyMaster.End_Date = Convert.ToDateTime(Request.Form["dtpEndDate"].ToString());
            surveyMaster.Question_Type = Request.Form["cmbQuestionType"].ToString();
            int numberOfOptions = Convert.ToInt32(Request.Form["hdnOptionCount"].ToString());
            SurveyOptions[] surveyOptions = new SurveyOptions[numberOfOptions];
           List< SurveyOptions> surveyOptionsList = new List<SurveyOptions>();
           
             for (int i = 0; i < numberOfOptions; i++)
            {
                
                surveyOptions[i] = new SurveyOptions();
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append("options");
                sb.Append(i+1);
                string txtBoxName = sb.ToString();

                surveyOptions[i].Description = Request.Form[txtBoxName].ToString();
                surveyOptionsList.Add(surveyOptions[i]);
                
                
                //surveyOptions[i].Description = Request.Form[sb.ToString()].ToString();
            }

            SurveyMasterComponent surveyMasterComponent = new SurveyMasterComponent();
            surveyMasterComponent.AddNewSurvey(surveyMaster, surveyOptionsList);

           
        }
    }
}
