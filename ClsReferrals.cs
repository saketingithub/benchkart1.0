using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Benchkart
{
    public class ClsReferrals
    {
        public int ReferralId { get; set; }

        public int ProjectId { get; set; }

        public int CustomerId { get; set; }

        public string PersonName { get; set; }

        public string CompanyName { get; set; }

        public string Email { get; set; }

        public string Phone { get; set; }

        public DateTime? CreationDate { get; set; }

        public void CustomerReferrals()
        {
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_CustomerReferrals", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add("@ProjectId", SqlDbType.Int).Value = ProjectId;
                command.Parameters.Add("@CustomerId", SqlDbType.Int).Value = CustomerId;
                command.Parameters.Add("@PersonName", SqlDbType.VarChar).Value = PersonName;
                command.Parameters.Add("@CompanyName", SqlDbType.VarChar).Value = CompanyName;
                command.Parameters.Add("@Email", SqlDbType.VarChar).Value = Email;
                command.Parameters.Add("@Phone", SqlDbType.NVarChar).Value = Phone;
                //  command.Parameters.Add("@Status", SqlDbType.VarChar).Value = Status;
                sqlConnection.Open();
                command.ExecuteNonQuery();
                sqlConnection.Close();



            }
        }

    }

}