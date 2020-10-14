using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Benchkart
{
    public class ClsConsultant
    {
        public int ConsultantId { get; set; }

        public string FullName { get; set; }

        public string ContactNumber { get; set; }

        public string Email { get; set; }

        public int? EmployeeLevel { get; set; }

        public string Password { get; set; }

        public DateTime? CreationDate { get; set; }

        public int? IsActive { get; set; }

        public int LoginConsultant()
        {
            int authenticate;
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_LoginConsultant", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("@email", SqlDbType.NVarChar).Value = Email;

                command.Parameters.Add("@password", SqlDbType.NVarChar).Value = Password;

                command.Parameters.Add("@exist", SqlDbType.Int);
                command.Parameters["@exist"].Direction = ParameterDirection.Output;

                command.CommandType = CommandType.StoredProcedure;

                sqlConnection.Open();
                command.ExecuteNonQuery();
                authenticate = Convert.ToInt32(command.Parameters["@exist"].Value);
            }
            return authenticate;
        }

        public DataTable GetRequestDetails(int requestId)
        {
            DataTable dtRequest = new DataTable();

            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_GetRequestDetails", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("@requestId", SqlDbType.NVarChar).Value = requestId;

                using (var da = new SqlDataAdapter(command))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    da.Fill(dtRequest);
                }
            }

            return dtRequest;
        }
    }
}