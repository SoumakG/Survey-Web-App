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
 public   class SurveyUser
    {
         /// <summary>
        /// Gets or sets a string value for the string column.
        /// </summary>       
        [DataMember]
        public string Email_ID { get; set; }

        /// <summary>
        /// Gets or sets a int value for the int column.
        /// </summary>       
        [DataMember]
        public int ID { get; set; }
        /// <summary>
        /// Gets or sets a string value for the string column.
        /// </summary>       
        [DataMember]
        public string User_Type { get; set; }
    }
}
