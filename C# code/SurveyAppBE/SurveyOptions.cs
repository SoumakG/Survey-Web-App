using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Runtime.Serialization;

namespace SurveyAppBE
{
    [Serializable]
    [DataContract]
 public partial class SurveyOptions
    {
        /// <summary>
        /// Gets or sets a string value for the string column.
        /// </summary>       
        [DataMember]
        public int QuestionID { get; set; }
        /// <summary>
        /// Gets or sets a int value for the int column.
        /// </summary>       
        [DataMember]
        public int ID { get; set; }
        /// <summary>
        /// Gets or sets a int value for the int column.
        /// </summary>       
        [DataMember]
        public int Count { get; set; }
        /// <summary>
        /// Gets or sets a string value for the string column.
        /// </summary>       
        [DataMember]
        public string Description { get; set; }


        public override bool Equals(object obj)
        {
            if (!(obj is SurveyOptions))
            {
                return false;
            }
            SurveyOptions surveyOptions = (SurveyOptions)obj;
            return (surveyOptions.Description == this.Description);
        }
    }
}
 