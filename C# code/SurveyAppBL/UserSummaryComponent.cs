using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SurveyAppBE;
using SurveyAppDAL;

namespace SurveyAppBL
{
   public class UserSummaryComponent
    {
       UserSummaryDAC userSummaryDAC = new UserSummaryDAC();
        public bool CheckUserStatus(UserSummary userSummary)
        {
            
            bool i = userSummaryDAC.CheckUserStatus(userSummary);
           return i;
        }

        public void ChangeUserStatus(UserSummary userSummary)
        {
            userSummaryDAC.ChangeUserStatus(userSummary);
        }
    }
}
 