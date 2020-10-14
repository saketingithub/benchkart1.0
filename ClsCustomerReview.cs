using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Benchkart
{
    public class ClsCustomerReview
    {
        public int ReviewId { get; set; }

        public int? ProjectId { get; set; }

        public DateTime? CreationDate { get; set; }

        public int Quality { get; set; }

        public int TimeLiness { get; set; }

        public int Value { get; set; }

        public string Comments { get; set; }

        public void CustomerReviewSubmit()
        {
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_CustomerReviewSubmit", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add("@ProjectId", SqlDbType.Int).Value = ProjectId;
                command.Parameters.Add("@Quality", SqlDbType.Int).Value = Quality;
                command.Parameters.Add("@TimeLiness", SqlDbType.Int).Value = TimeLiness;
                command.Parameters.Add("@Value", SqlDbType.Int).Value = Value;
                command.Parameters.Add("@Comments", SqlDbType.NVarChar).Value = Comments;
                //  command.Parameters.Add("@Status", SqlDbType.VarChar).Value = Status;
                sqlConnection.Open();
                command.ExecuteNonQuery();
                sqlConnection.Close();



            }
        }

    }

}