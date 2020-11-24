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

        public string CompanyType { get; set; }

        public string CompanyLink { get; set; }
        public int? IsActive { get; set; }
        public string PreferDateTime { get; set; }
        public int ContactNumberReference { get; set; }  //krishan create line 25-04-2020

        //krishan method 23-12-2019

        public int SubmitCustomerdetails()
        {
            
                int authenticate;
                string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
                {
                    SqlCommand command = new SqlCommand("proc_SubmitCustomerdetails", sqlConnection);
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add("@fullName", SqlDbType.NVarChar).Value = FullName;

                    command.Parameters.Add("@email", SqlDbType.NVarChar).Value = Email;

                command.Parameters.Add("@contactNumber", SqlDbType.NVarChar).Value = ContactNumber;

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

       
        public int SubmitCustomer()
        {
            //try
            //{
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
            //}
            //catch (Exception ex)
            //{
            //    return 0;
            //}

        }

        // krishan create method 15-01-2020
        public void SubmitCustomerProfile()
        {
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand cmd = new SqlCommand("proc_SubmitCustomerProfile", sqlConnection);
                cmd.CommandType = CommandType.StoredProcedure;
                sqlConnection.Open();
                cmd.Parameters.Add("@CustomerId", SqlDbType.Int).Value = CustomerId;
                cmd.Parameters.Add("@FullName", SqlDbType.VarChar).Value = FullName;
                cmd.Parameters.Add("@email", SqlDbType.VarChar).Value = Email;
                cmd.Parameters.Add("@ContactNumber", SqlDbType.VarChar).Value = ContactNumber;
               /// cmd.Parameters.Add("@Password", SqlDbType.VarChar).Value = Password;
                cmd.Parameters.Add("@CompanyName", SqlDbType.NVarChar).Value = CompanyName;
                cmd.Parameters.Add("@CompanyIndustry", SqlDbType.NVarChar).Value = CompanyIndustry;
                cmd.Parameters.Add("@CompanyProfile", SqlDbType.VarChar).Value = CompanyProfile;
               // cmd.Parameters.Add("@CompanyAddress", SqlDbType.NVarChar).Value = CompanyAddress;
                cmd.Parameters.Add("@CompanyGStNumber", SqlDbType.VarChar).Value = CompanyGSTNumber;
                cmd.Parameters.Add("@EmployeeCount", SqlDbType.VarChar).Value = EmployeeCount;
                cmd.Parameters.Add("@Website", SqlDbType.VarChar).Value = Website;
                //cmd.Parameters.Add("@LogoName", SqlDbType.VarChar).Value = LogoName;
               // cmd.Parameters.Add("@ModificationDate", SqlDbType.DateTime).Value = ModificationDate;
                cmd.Parameters.Add("@CompanyType", SqlDbType.VarChar).Value = CompanyType;
                cmd.Parameters.Add("@CompanyLink", SqlDbType.VarChar).Value = CompanyLink;
                cmd.ExecuteNonQuery();
                sqlConnection.Close();
            }
        }
        
        // method update LoginCustomer =proc_LoginCustomerPartner  02-06-2020
        public int LoginCustomerPartner(ref int checkn )
        {
            //try
            //{
                int authenticate;
                string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
                {
                    SqlCommand command = new SqlCommand("proc_LoginCustomerPartner", sqlConnection);
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add("@email", SqlDbType.NVarChar).Value = Email;

                    command.Parameters.Add("@password", SqlDbType.NVarChar).Value = Password;

                    command.Parameters.Add("@exist", SqlDbType.Int);
                    command.Parameters["@exist"].Direction = ParameterDirection.Output;
                    command.Parameters.Add("@checkname", SqlDbType.Int);
                    command.Parameters["@checkname"].Direction = ParameterDirection.Output;

                    //command.Parameters.Add("@id", SqlDbType.Int).Direction = ParameterDirection.Output; 

                    command.CommandType = CommandType.StoredProcedure;

                    sqlConnection.Open();
                    command.ExecuteNonQuery();
                    checkn = Convert.ToInt32(command.Parameters["@checkname"].Value);
                    authenticate = Convert.ToInt32(command.Parameters["@exist"].Value);
                   
                    //int authenticate = (int)command.ExecuteScalar();
                    //string id = command.Parameters["@id"].Value.ToString();
                    sqlConnection.Close();

                }
                return authenticate;
            //}
            //catch (Exception ex)
            //{
            //    return 0;
            //}

        }

        // end method

        //krishan create method 18-11-2020
        public int LoginCustomer()
        {
            //try
            //{
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
                

                
                command.CommandType = CommandType.StoredProcedure;

                sqlConnection.Open();
                command.ExecuteNonQuery();
               
                authenticate = Convert.ToInt32(command.Parameters["@exist"].Value);

                
                sqlConnection.Close();

            }
            return authenticate;
           

        }
        //end method
        //krishan create method 02-06-2020

        public int CustomerPartnerSetPassword()
        {
            //try
            //{
                int authenticate;
                string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
                {
                    SqlCommand command = new SqlCommand("proc_CustomerPartnerSetPassword", sqlConnection);
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
            //}
            //catch (Exception ex)
            //{
            //    return 0;
            //}

        }
        // end method

        
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

        //krishan create method 27-01-2020
        public int CustomerPartnerEmailVerify()
        {
            //try
            //{
                int authenticate;
                string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
                {
                    SqlCommand command = new SqlCommand("proc_CustomerPartnerEmailVerify", sqlConnection);
                    command.CommandType = CommandType.StoredProcedure;

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
            //}
            //catch (Exception ex)
            //{
           //     return 0;
            //}

        }
        public DataTable GetCustomerProfileForAdminSearch()
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
        public DataTable GetCustomerProfileForAdminSearchByContactNumber()
        {
            DataTable dtCustomerProfile = new DataTable();

            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_GetCustomerProfileForAdminSearchByContactNumber", sqlConnection);
                //command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("@ContactNumber", SqlDbType.NVarChar).Value = ContactNumber;

                using (var da = new SqlDataAdapter(command))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    da.Fill(dtCustomerProfile);
                }
            }

            return dtCustomerProfile;
        }
        public DataTable GetCustomerProfileForAdminSearchByCompanyType()
        {
            DataTable dtCustomerProfile = new DataTable();

            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_GetCustomerProfileForAdminSearchByCompanyType", sqlConnection);
                //command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("@CompanyType", SqlDbType.VarChar).Value = CompanyType;

                using (var da = new SqlDataAdapter(command))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    da.Fill(dtCustomerProfile);
                }
            }

            return dtCustomerProfile;
        }
        public DataTable GetCustomerProfileForAdmin()
        {
            DataTable dtCustomerProfile = new DataTable();

            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_GetCustomerProfileForAdmin", sqlConnection);
                //command.CommandType = CommandType.StoredProcedure;

               

                using (var da = new SqlDataAdapter(command))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    da.Fill(dtCustomerProfile);
                }
            }

            return dtCustomerProfile;
        }

        public void GetAdminDashboard(ref int requestCount, ref int projectCount, ref int partnerCount, ref int  customerCount)
        {
            
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_GetAdminDashboard", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("@requestCount", SqlDbType.Int, 5);
                command.Parameters["@requestCount"].Direction = ParameterDirection.Output;
                command.Parameters.Add("@projectCount", SqlDbType.Int, 5);
                command.Parameters["@projectCount"].Direction = ParameterDirection.Output;
                command.Parameters.Add("@partnerCount", SqlDbType.Int, 5);
                command.Parameters["@partnerCount"].Direction = ParameterDirection.Output;
                command.Parameters.Add("@customerCount", SqlDbType.Int, 5);
                command.Parameters["@customerCount"].Direction = ParameterDirection.Output;
                sqlConnection.Open();
                int i = command.ExecuteNonQuery();
                requestCount = Convert.ToInt32(command.Parameters["@requestCount"].Value);
                projectCount = Convert.ToInt32(command.Parameters["@projectCount"].Value);
                partnerCount = Convert.ToInt32(command.Parameters["@partnerCount"].Value);
                customerCount = Convert.ToInt32(command.Parameters["@customerCount"].Value);
                sqlConnection.Close();
            }      
            


        }
        public   void SupportSubmitCustomer(string query)
        {
            string customerEmail = string.Empty;
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_SupportSubmitCustomer", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add("@CustomerId", SqlDbType.Int).Value = CustomerId;
                command.Parameters.Add("@Query", SqlDbType.VarChar).Value = query;

                command.Parameters.Add("@customerEmail", SqlDbType.VarChar, 100);
                command.Parameters["@customerEmail"].Direction = ParameterDirection.Output;

                sqlConnection.Open();
                command.ExecuteNonQuery();

                customerEmail = command.Parameters["@customerEmail"].Value.ToString();

                sqlConnection.Close();

            }

            //Email
            System.Threading.Thread email = new System.Threading.Thread(delegate ()
            {
                string subject = "Customer support request";
                string body = "<p>Customer Email - " + customerEmail + "</p><p>Customer Query - " + query + "</p>";
                ClsMail.SendEmail(string.Empty, "outsource@benchkart.com", subject, body);
            });

            email.IsBackground = true;
            email.Start();
        }

      
        public DataTable GetSetCustomerCompanyDetails()
        {
            DataTable dtCustomerProfile = new DataTable();

            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_GetSetCustomerCompanyDetails", sqlConnection);
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

        public int CustomerReSetPassword(string newPassword)
        {
            //try
            //{
                int authenticate;
                string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
                {

                    SqlCommand command = new SqlCommand("proc_CustomerReSetPassword", sqlConnection);
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add("@customerId", SqlDbType.NVarChar).Value = CustomerId;

                    command.Parameters.Add("@password", SqlDbType.NVarChar).Value = Password;

                    command.Parameters.Add("@newPassword", SqlDbType.NVarChar).Value = newPassword;

                    command.Parameters.Add("@exist", SqlDbType.Int);
                    command.Parameters["@exist"].Direction = ParameterDirection.Output;

                    command.CommandType = CommandType.StoredProcedure;

                    sqlConnection.Open();
                    command.ExecuteNonQuery();

                    authenticate = Convert.ToInt32(command.Parameters["@exist"].Value);
                    sqlConnection.Close();

                }
                return authenticate;
            //}
            //catch (Exception ex)
            //{
            //    return 0;
            //}

        }

        public void GetCustomerDashboard(int customerId, ref int msgCount, ref int notifCount, ref string companyName)
        {
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_GetCustomerDashboard", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("@customerId", SqlDbType.Int).Value = customerId;

                command.Parameters.Add("@companyName", SqlDbType.VarChar, 255);
                command.Parameters["@companyName"].Direction = ParameterDirection.Output;

                command.Parameters.Add("@msgCount", SqlDbType.Int);
                command.Parameters["@msgCount"].Direction = ParameterDirection.Output;

                command.Parameters.Add("@notifCount", SqlDbType.Int);
                command.Parameters["@notifCount"].Direction = ParameterDirection.Output;

                command.CommandType = CommandType.StoredProcedure;

                sqlConnection.Open();
                command.ExecuteNonQuery();
                msgCount = Convert.ToInt32(command.Parameters["@msgCount"].Value);
                notifCount = Convert.ToInt32(command.Parameters["@notifCount"].Value);
                companyName = command.Parameters["@companyName"].Value.ToString();
                sqlConnection.Close();
            }
        }

        // krishan create method 13-04-2020 signup customer 
        public int New_SignupCustomer()
        {

            int authenticate;
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_New_SignupCustomer", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add("@FullName", SqlDbType.VarChar).Value = FullName;

                command.Parameters.Add("@email", SqlDbType.NVarChar).Value = Email;
                command.Parameters.Add("@Password", SqlDbType.VarChar).Value = Password;
                command.Parameters.Add("@CompanyName", SqlDbType.VarChar).Value = CompanyName;
                command.Parameters.Add("@ContactNumber", SqlDbType.VarChar).Value = ContactNumber;

                command.Parameters.Add("@exist", SqlDbType.Int);
                command.Parameters["@exist"].Direction = ParameterDirection.Output;

                command.CommandType = CommandType.StoredProcedure;

                sqlConnection.Open();
                command.ExecuteNonQuery();

                authenticate = Convert.ToInt32(command.Parameters["@exist"].Value);

            }

            //Email
            if (authenticate >2)
            {
                System.Threading.Thread email = new System.Threading.Thread(delegate ()
                {
                    string subject = "Thanks for Registering With Us";
                    string body = "<p>If you are looking for any digital solution for your business then Benchkart is a one stop solution for it.</p><p>Now you can Post a Project and Benchkart will invite multiple Digital agencies across India to bid on your project.</p><p><b>This way you can control budget, time and quality for your project.</b></p>";
                    ClsMail.SendEmail(string.Empty, Email, subject, body);
                });

                email.IsBackground = true;
                email.Start();
            }
            return authenticate;
        }

        //customer method
        public int New_QuickCustomer()
        {

            int authenticate;
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_New_QuickCustomer", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add("@FullName", SqlDbType.VarChar).Value = FullName;

                command.Parameters.Add("@email", SqlDbType.NVarChar).Value = Email;
                command.Parameters.Add("@Password", SqlDbType.VarChar).Value = Password;
                command.Parameters.Add("@CompanyName", SqlDbType.VarChar).Value = CompanyName;
                command.Parameters.Add("@ContactNumber", SqlDbType.VarChar).Value = ContactNumber;

                command.Parameters.Add("@exist", SqlDbType.Int);
                command.Parameters["@exist"].Direction = ParameterDirection.Output;

                command.CommandType = CommandType.StoredProcedure;

                sqlConnection.Open();
                command.ExecuteNonQuery();

                authenticate = Convert.ToInt32(command.Parameters["@exist"].Value);

            }

            //Email
            //if (authenticate != 0)
            //{
            //    System.Threading.Thread email = new System.Threading.Thread(delegate ()
            //    {
            //        string subject = "Thanks for Registering With Us";
            //        string body = "<p>If you are looking for any digital solution for your business then Benchkart is a one stop solution for it.</p><p>Now you can Post a Project and Benchkart will invite multiple Digital agencies across India to bid on your project.</p><p><b>This way you can control budget, time and quality for your project.</b></p>";
            //        ClsMail.SendEmail(string.Empty, Email, subject, body);
            //    });

            //    email.IsBackground = true;
            //    email.Start();
            //}
            return authenticate;
        }

    }
}