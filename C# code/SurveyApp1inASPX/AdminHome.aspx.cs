using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using SurveyAppBE;
using SurveyAppBL;

 

namespace SurveyApp1inASPX
{
    //[Serializable]
    public partial class AdminHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        
        [System.Web.Services.WebMethod()]
        [System.Web.Script.Services.ScriptMethod()]
        public static List<SurveyMaster> getData()
        {
            List<SurveyMaster> surveyMasterList = new List<SurveyMaster>();
            SurveyMasterComponent surveyMasterComponent = new SurveyMasterComponent();
          surveyMasterList=  surveyMasterComponent.GetSurveyMaster();
            return surveyMasterList;
            
        }
    }
}