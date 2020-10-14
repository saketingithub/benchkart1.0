using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Benchkart
{
    public class ClsCustomer
    {
        public int CustomerId { get; set; }

        public string FullName { get; set; }

        public string Email { get; set; }

        public string ContactNumber { get; set; }

        public string Password { get; set; }

        public string CompanyName { get; set; }

        public string CompanyIndustry { get; set; }

        public string CompanyProfile { get; set; }

        public string CompanyAddress { get; set; }

        public string CompanyGSTNumber { get; set; }

        public string EmployeeCount { get; set; }

        public string Website { get; set; }

        public string LogoName { get; set; }

        public DateTime? CreationDate { get; set; }

        public DateTime? ModificationDate { get; set; }

        public int? IsActive { get; set; }

        //krishan method 23-12-2019

        public int submitCustomerdetails()
        {
            try
            {
                int authenticate;
                string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
                {
                    SqlCommand command = new SqlCommand("proc_submitCustomerdetails", sqlConnection);
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add("@fullName", SqlDbType.NVarChar).Value = FullName;

                    command.Parameters.Add("@email", SqlDbType.NVarChar).Value = Email;

                 

                    command.Parameters.Add("@exist", SqlDbType.Int);
                    command.Parameters["@exist"].Direction = ParameterDirection.Output;

                    //command.Parameters.Add("@id", SqlDbType.Int).Direction = ParameterDirection.Output; 

                    command.CommandType = CommandType.StoredProcedure;

                    sqlConnection.Open();
                    command.ExecuteNonQuery();
                    authenticate = Convert.ToInt32(command.Parameters["@exist"].Value);
                    //int authenticate = (int)command.ExecuteScalar();
                    //string id = command.Parameters["@id"].Value.ToString();
                    sqlConnection.Close();

                }
                return authenticate;
            }
            catch (Exception ex)
            {
                return 0;
            }

        
        }

        // krishan method 24-12-2019

        public void customerupdatebyemail()
        {
            //int cust_id;
            string connection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connection))
            {
                SqlCommand cmd = new SqlCommand("proc_customerupdatebyemail", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@email", SqlDbType.NVarChar).Value = Email;
                cmd.Parameters.Add("@CompanyName", SqlDbType.NVarChar).Value = CompanyName;
                cmd.Parameters.Add("@CompanyIndustry", SqlDbType.NVarChar).Value = CompanyIndustry;
              
                //cmd.Parameters.Add("@CustomerId", SqlDbType.Int);
              //  cmd.Parameters["@CustomerId"].Direction = ParameterDirection.Output;
                con.Open();
                cmd.ExecuteNonQuery();
               // cust_id = Convert.ToInt32(cmd.Parameters["@CustomerId"].Value);
                con.Close();
            }
           // return cust_id;
        }

        // krishan mathod 30-12-2019

        public int customertalentupdatebyemail()
        {
            int customerid;
            string connection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connection))
            {
                SqlCommand cmd = new SqlCommand("proc_customergetbyemail", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Email", SqlDbType.NVarChar).Value = Email;
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    customerid = Convert.ToInt32(dr["CoustomerId"]);
                }
                else
                {
                    dr.Close();
                    SqlCommand cmd1 = new SqlCommand("proc_customertalentupdatebyemail", con);
                    cmd1.CommandType = CommandType.StoredProcedure;
                    cmd1.Parameters.AddWithValue("@FullName", SqlDbType.NVarChar).Value = FullName;
                    cmd1.Parameters.AddWithValue("@Email", SqlDbType.NVarChar).Value = Email;
                    cmd1.Parameters.AddWithValue("@CustomerId", SqlDbType.Int);
                    cmd1.Parameters["CustomerId"].Direction = ParameterDirection.Output;
                    cmd1.ExecuteNonQuery();
                    customerid = Convert.ToInt32(cmd1.Parameters["CustomerId"].Value);
                    con.Close();
                }
                return customerid;
            }
        }
        public int SubmitCustomer()
        {
            try
            {
                int authenticate;
                string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
                {
                    SqlCommand command = new SqlCommand("proc_SubmitCustomer", sqlConnection);
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add("@fullName", SqlDbType.NVarChar).Value = FullName;

                    command.Parameters.Add("@email", SqlDbType.NVarChar).Value = Email;

                    command.Parameters.Add("@contactNumber", SqlDbType.NVarChar).Value = ContactNumber;

                    command.Parameters.Add("@industry", SqlDbType.NVarChar).Value = string.Empty;

                    command.Parameters.Add("@exist", SqlDbType.Int);
                    command.Parameters["@exist"].Direction = ParameterDirection.Output;

                    //command.Parameters.Add("@id", SqlDbType.Int).Direction = ParameterDirection.Output; 

                    command.CommandType = CommandType.StoredProcedure;

                    sqlConnection.Open();
                    command.ExecuteNonQuery();
                    authenticate = Convert.ToInt32(command.Parameters["@exist"].Value);
                    //int authenticate = (int)command.ExecuteScalar();
                    //string id = command.Parameters["@id"].Value.ToString();
                    sqlConnection.Close();

                }
                return authenticate;
            }
            catch (Exception ex)
            {
                return 0;
            }

        }

        public int SignupCustomer()
        {
            try
            {
                int authenticate;
                string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
                {
                    SqlCommand command = new SqlCommand("proc_SignupCustomer", sqlConnection);
                    command.CommandType = CommandType.StoredProcedure;

                    //command.Parameters.Add("@fullName", SqlDbType.NVarChar).Value = FullName;

                    command.Parameters.Add("@email", SqlDbType.NVarChar).Value = Email;

                    command.Parameters.Add("@contactNumber", SqlDbType.NVarChar).Value = ContactNumber;

                    command.Parameters.Add("@password", SqlDbType.NVarChar).Value = Password;

                    //command.Parameters.Add("@companyName", SqlDbType.NVarChar).Value = CompanyName;

                    //command.Parameters.Add("@requestPosted", SqlDbType.Int).Value = requestPosted;

                    command.Parameters.Add("@exist", SqlDbType.Int);
                    command.Parameters["@exist"].Direction = ParameterDirection.Output;

                    //command.Parameters.Add("@id", SqlDbType.Int).Direction = ParameterDirection.Output; 

                    command.CommandType = CommandType.StoredProcedure;

                    sqlConnection.Open();
                    command.ExecuteNonQuery();
                    authenticate = Convert.ToInt32(command.Parameters["@exist"].Value);
                    //int authenticate = (int)command.ExecuteScalar();
                    //string id = command.Parameters["@id"].Value.ToString();
                    sqlConnection.Close();

                }
                return authenticate;
            }
            catch (Exception ex)
            {
                return 0;
            }

        }

        public int LoginCustomer()
        {
            try
            {
                int authenticate;
                string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
                {
                    SqlCommand command = new SqlCommand("proc_LoginCustomer", sqlConnection);
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add("@email", SqlDbType.NVarChar).Value = Email;

                    command.Parameters.Add("@password", SqlDbType.NVarChar).Value = Password;

                    command.Parameters.Add("@exist", SqlDbType.Int);
                    command.Parameters["@exist"].Direction = ParameterDirection.Output;

                    //command.Parameters.Add("@id", SqlDbType.Int).Direction = ParameterDirection.Output; 

                    command.CommandType = CommandType.StoredProcedure;

                    sqlConnection.Open();
                    command.ExecuteNonQuery();
                    authenticate = Convert.ToInt32(command.Parameters["@exist"].Value);
                    //int authenticate = (int)command.ExecuteScalar();
                    //string id = command.Parameters["@id"].Value.ToString();
                    sqlConnection.Close();

                }
                return authenticate;
            }
            catch (Exception ex)
            {
                return 0;
            }

        }

        public void SetPassword()
        {
            try
            {
                string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
                {
                    SqlCommand command = new SqlCommand("proc_SetPassword", sqlConnection);
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add("@email", SqlDbType.NVarChar).Value = Email;

                    command.Parameters.Add("@password", SqlDbType.NVarChar).Value = Password;

                    command.CommandType = CommandType.StoredProcedure;

                    sqlConnection.Open();
                    command.ExecuteNonQuery();

                    sqlConnection.Close();

                }
            }
            catch (Exception ex)
            {

            }

        }

        public DataTable GetCustomerProfile()
        {
            DataTable dtCustomerProfile = new DataTable();

            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_GetCustomerProfile", sqlConnection);
                //command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("@customerId", SqlDbType.NVarChar).Value = CustomerId;

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