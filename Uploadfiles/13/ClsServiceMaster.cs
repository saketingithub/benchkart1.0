using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Benchkart
{
    public class ClsServiceMaster
    {
        public int ServiceId { get; set; }

        public int ParentId { get; set; }

        public string Title { get; set; }

        public DateTime? CreationDate { get; set; }

        public DataTable GetSubCategory(int ServiceId)
        {
            DataTable dtSubCategory = new DataTable();

            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_GetSubCategory", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("@serviceId", SqlDbType.NVarChar).Value = ServiceId;

                using (var da = new SqlDataAdapter(command))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    da.Fill(dtSubCategory);
                }
            }

            return dtSubCategory;
        }
    }
}