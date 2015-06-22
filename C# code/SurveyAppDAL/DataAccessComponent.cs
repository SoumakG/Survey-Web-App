using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace SurveyAppDAL
{
    public abstract class DataAccessComponent
    {
        protected T GetDataValue<T>(IDataReader dr, string columnName)
        {
            int i = dr.GetOrdinal(columnName);

            if (!dr.IsDBNull(i))
                return (T)dr.GetValue(i);
            else
                return default(T);
        }
    }
}
 