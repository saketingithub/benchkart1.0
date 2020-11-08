using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Benchkart
{
    public class ClsPackageType
    {
        public int PackageTypeId { get; set; }
        public int SubCategoryId { get; set; }
        public string PackageTypeName { get; set; }

        public DataTable GetPackageData()
        {
            DataTable dtCustomerProfile = new DataTable();

            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_GetPackageData", sqlConnection);
                //command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("@subCategoryId", SqlDbType.Int).Value = SubCategoryId;

                using (var da = new SqlDataAdapter(command))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    da.Fill(dtCustomerProfile);
                }
            }

            return dtCustomerProfile;
        }
    }
}