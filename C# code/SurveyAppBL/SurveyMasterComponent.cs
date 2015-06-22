using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SurveyAppBE;
using SurveyAppDAL;
 
namespace SurveyAppBL
{
    public class SurveyMasterComponent
    {
        /// <summary>
        /// Returns list of Surveys 
        /// </summary>
        /// <returns></returns>
        public List<SurveyMaster> GetSurveyMaster()
        {
            SurveyMasterDAC surveyMasterDAC = new SurveyMasterDAC();
            List<SurveyMaster> surveyList = new List<SurveyMaster>();

            surveyList = surveyMasterDAC.GetSurveyMaster();

            return surveyList;
        }
        public void AddNewSurvey(SurveyMaster surveyMaster, List<SurveyOptions> surveyOptionsList)
        {
            SurveyMasterDAC surveyMasterDAC = new SurveyMasterDAC();
            surveyMasterDAC.AddNewSurvey(surveyMaster, surveyOptionsList);
        }
        public SurveyMaster GetSurveyMasterByID(SurveyMaster surveyMaster)
        {
            SurveyMasterDAC surveyMasterDAC = new SurveyMasterDAC();
            surveyMaster = surveyMasterDAC.GetSurveyMasterByID(surveyMaster);
            return surveyMaster;

        }
        
    }
}
