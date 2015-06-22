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
  public partial class UserSummary
    {
        /// <summary>
        /// Gets or sets a int value for the int column.
        /// </summary>       
        [DataMember]
        public int User_ID { get; set; }

        /// <summary>
        /// Gets or sets a int value for the int column.
        /// </summary>       
        [DataMember]
        public int Question_ID { get; set; }

        /// <summary>
        /// Gets or sets a int value for the int column.
        /// </summary>       
        [DataMember]
        public int ID { get; set; }
        /// <summary>
        /// Gets or sets a int value for the int column.
        /// </summary>       
        [DataMember]
        public int Status { get; set; } 
    }
}
