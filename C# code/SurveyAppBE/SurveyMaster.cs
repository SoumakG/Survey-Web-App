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
    public partial class SurveyMaster
    {
        /// <summary>
        /// Gets or sets a int value for the int column.
        /// </summary>       
        [DataMember]
        public int ID { get; set; }

        /// <summary>
        /// Gets or sets a string value for the string column.
        /// </summary>        
        [DataMember]
        public string Question_Detail { get; set; }

        /// <summary>
        /// Gets or sets a string value for the string column.
        /// </summary>        
        [DataMember]
        public string Created_By { get; set; }

        /// <summary>
        /// Gets or sets a string value for the string column.
        /// </summary>        
        [DataMember]
        public string Modified_By { get; set; }

        /// <summary>
        /// Gets or sets a string value for the string column.
        /// </summary>        
        [DataMember]
        public string Question_Type { get; set; }

        /// <summary>
        /// Gets or sets a DateTime value for the DateTime column.
        /// </summary>        
        [DataMember]
        public DateTime Start_Date { get; set; }

        /// <summary>
        /// Gets or sets a DateTime value for the DateTime column.
        /// </summary>        
        [DataMember]
        public DateTime End_Date { get; set; }

       
    }
}
