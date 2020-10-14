using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Benchkart
{
    public class ClsPartner
    {
        public int PartnerId { get; set; }

        public string PocFullName { get; set; }

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

        public string OtherServices { get; set; }

        public string OtherTechnologies { get; set; }

        public string BenchTalent { get; set; }

        public int? Reviewed { get; set; }

        public string CompanyTitle { get; set; }

        public int? IsTalentAvailable { get; set; }

        public int? IsActive { get; set; }

        public int AuthenticatePartner()
        {
            int authenticate;
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_AuthenticatePartner", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("@email", SqlDbType.NVarChar).Value = Email;

                command.Parameters.Add("@contactNumber", SqlDbType.NVarChar).Value = ContactNumber;

                command.Parameters.Add("@password", SqlDbType.NVarChar).Value = Password;

                command.Parameters.Add("@companyName", SqlDbType.NVarChar).Value = CompanyName;

                command.Parameters.Add("@exist", SqlDbType.Int);
                command.Parameters["@exist"].Direction = ParameterDirection.Output;

                command.CommandType = CommandType.StoredProcedure;

                sqlConnection.Open();
                command.ExecuteNonQuery();
                authenticate = Convert.ToInt32(command.Parameters["@exist"].Value);
            }
            return authenticate;
        }

        public int LoginPartner()
        {
            try
            {
                int authenticate;
                string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
                {
                    SqlCommand command = new SqlCommand("proc_LoginPartner", sqlConnection);
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
        public void SubmitPartner(string serviceidList)
        {
            try
            {
                //int authenticate;
                string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
                {
                    SqlCommand command = new SqlCommand("proc_RegisterPartner", sqlConnection);
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add("@partnerId", SqlDbType.NVarChar).Value = PartnerId;
                    command.Parameters.Add("@fullName", SqlDbType.NVarChar).Value = PocFullName;

                    command.Parameters.Add("@companyProfile", SqlDbType.NVarChar).Value = CompanyProfile;
                    command.Parameters.Add("@companyAddress", SqlDbType.NVarChar).Value = CompanyAddress;
                    //command.Parameters.Add("@companyGSTNumber", SqlDbType.NVarChar).Value = CompanyGSTNumber;
                    command.Parameters.Add("@employeeCount", SqlDbType.NVarChar).Value = EmployeeCount;
                    command.Parameters.Add("@website", SqlDbType.NVarChar).Value = Website;
                    command.Parameters.Add("@otherServices", SqlDbType.NVarChar).Value = OtherServices;
                    command.Parameters.Add("@otherTechnologies", SqlDbType.NVarChar).Value = OtherTechnologies;
                    //command.Parameters.Add("@logoName", SqlDbType.NVarChar).Value = LogoName;
                    command.Parameters.Add("@servicesOffered", SqlDbType.NVarChar).Value = serviceidList;
                    //command.Parameters.Add("@otherServices", SqlDbType.NVarChar).Value = OtherServices;
                    //command.Parameters.Add("@technologyOffered", SqlDbType.NVarChar).Value = TechnologyOffered;
                    //command.Parameters.Add("@otherTechnologies", SqlDbType.NVarChar).Value = OtherTechnologies;

                    //command.Parameters.Add("@benchTalent", SqlDbType.NVarChar).Value = BenchTalent;                    

                    //command.Parameters.Add("@exist", SqlDbType.Int);
                    //command.Parameters["@exist"].Direction = ParameterDirection.Output;

                    //command.Parameters.Add("@id", SqlDbType.Int).Direction = ParameterDirection.Output; 

                    command.CommandType = CommandType.StoredProcedure;

                    sqlConnection.Open();
                    command.ExecuteNonQuery();
                    //authenticate = Convert.ToInt32(command.Parameters["@exist"].Value);
                    //int authenticate = (int)command.ExecuteScalar();
                    //string id = command.Parameters["@id"].Value.ToString();
                    sqlConnection.Close();

                }
                //return authenticate;
            }
            catch (Exception ex)
            {

            }

        }

        public DataTable GetPartnerProfile()
        {
            DataTable dtPartnerProfile = new DataTable();

            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_GetPartnerProfile", sqlConnection);
                //command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("@partnerId", SqlDbType.NVarChar).Value = PartnerId;

                using (var da = new SqlDataAdapter(command))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    da.Fill(dtPartnerProfile);
                }
            }

            return dtPartnerProfile;
        }

    }
}