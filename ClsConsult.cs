using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace Benchkart
{
    public class ClsConsult
    {
        public int ConsultId { get; set; }

        public int Status { get; set; }

        public string Name { get; set; }

        public string Email { get; set; }

        public string ContactNumber { get; set; }

        public string CompanyName { get; set; }

        public int PreferredContactMethod { get; set; }

        public string Query { get; set; }

        public void BookFreeConsultation()
        {
            string connectionstring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionstring))
            {
                SqlCommand cmd = new SqlCommand("proc_BookFreeConsultation", con);
                cmd.CommandType = CommandType.StoredProcedure;
                //cmd.Parameters.Add("@CustomerId", SqlDbType.Int).Value = CustomerId;
                cmd.Parameters.Add("@name", SqlDbType.VarChar).Value = Name;
                cmd.Parameters.Add("@email", SqlDbType.VarChar).Value = Email;
                cmd.Parameters.Add("@contactNumber", SqlDbType.VarChar).Value = ContactNumber;
                cmd.Parameters.Add("@companyName", SqlDbType.VarChar).Value = CompanyName;

                cmd.Parameters.Add("@preferredContactMethod", SqlDbType.Int).Value = PreferredContactMethod;
                cmd.Parameters.Add("@query", SqlDbType.VarChar).Value = Query;
                
                //cmd.Parameters.Add("@consultId", SqlDbType.Int);
                //cmd.Parameters["@consultId"].Direction = ParameterDirection.Output;
                con.Open();
                cmd.ExecuteNonQuery();
                //consultId = Convert.ToInt32(cmd.Parameters["@RequestId"].Value);

                con.Close();

            }
            
        }

        public void UpdateConsultStatusbyConsultant()
        {
            string connectionstring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionstring))
            {
                SqlCommand cmd = new SqlCommand("proc_UpdateConsultStatusbyConsultant", con);
                cmd.CommandType = CommandType.StoredProcedure;
                //cmd.Parameters.Add("@CustomerId", SqlDbType.Int).Value = CustomerId;
                cmd.Parameters.Add("@status", SqlDbType.Int).Value = Status;
                cmd.Parameters.Add("@consultId", SqlDbType.Int).Value = ConsultId;
               
                con.Open();
                cmd.ExecuteNonQuery();
                
                con.Close();
            }

        }

        public DataTable GetConsultList(int status)
        {
            DataTable dtConsultList = new DataTable();
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_GetConsultList", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("@status", SqlDbType.Int).Value = status;

                using (var da = new SqlDataAdapter(command))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    da.Fill(dtConsultList);
                }
                sqlConnection.Close();
            }
            return dtConsultList;
        }


    }
}