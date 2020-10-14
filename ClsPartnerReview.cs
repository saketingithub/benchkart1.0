using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Benchkart
{
    public class ClsPartnerReview
    {
        public int ReviewId { get; set; }

        public int ProjectId { get; set; }

        public int PartnerId { get; set; }

        public DateTime? CreationDate { get; set; }

        public int Overall { get; set; }

        public string Comments { get; set; }

        public void ReviewProjectbyPartner()
        {
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_ReviewProjectbyPartner", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add("@ProjectId", SqlDbType.Int).Value = ProjectId;
                command.Parameters.Add("@PartnerId", SqlDbType.Int).Value = PartnerId;

                command.Parameters.Add("@Overall", SqlDbType.Int).Value = Overall;
                 command.Parameters.Add("@Comments", SqlDbType.VarChar).Value = Comments;
                sqlConnection.Open();
                command.ExecuteNonQuery();
                sqlConnection.Close();



            }
        }
    }

}