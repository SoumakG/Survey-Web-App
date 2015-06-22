using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SurveyAppBE;
using SurveyAppDAL;
 
namespace SurveyAppBL
{
    public class SurveyOptionsComponent
    {
        SurveyOptionsDAC surveyOptionsDAC = new SurveyOptionsDAC();
        public List<SurveyOptions> GetOptionsBySurveyID(SurveyMaster surveyMaster)
        {
            
            List<SurveyOptions> surveyOptionList = surveyOptionsDAC.GetOptionsBySurveyID(surveyMaster);
            return surveyOptionList;

        }

        public bool AddOptionsCount(SurveyOptions surveyOptions)
        {
            return surveyOptionsDAC.AddOptionsCount(surveyOptions);
        }
    }
}
