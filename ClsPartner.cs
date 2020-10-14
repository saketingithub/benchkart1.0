using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Data.SqlTypes;

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

        public string Landline { get; set; }

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

        public int? IsTalentShared { get; set; }

        public int? IsActive { get; set; }

        public string CompanyStarted { get; set; }
        public string CompanyDescribedAs { get; set; }
        public string CompanyType { get; set; }
        public string CompanyClientFrom { get; set; }
        public string CompanyPricePositioning { get; set; }
        public string CompanyCustomerSegment { get; set; }
        public string CompanyPrimarySourceOfRevenue { get; set; }

        public string CompanyState { get; set; }

        public string CompanyCity { get; set; }
        public int Pincode { get; set; }

        public int CompanyMinimumProjectValue { get; set; }
        public string CompanyRepresentativeName { get; set; }
        public string CompanyRepresentativeContact { get; set; }
        public string CompanyRepresentativeLoginEmail { get; set; }

        public string Skills { get; set; }

        public string Awards { get; set; }

        public string AccountHolderName { get; set; }
        public string AccountNumber { get; set; }

        public int AccountType { get; set; }
        public string BeneficiaryBank { get; set; }
        public string SwiftCode { get; set; }
        public string IfscCode { get; set; }

        //Krishan
        public string StatusComments { get; set; }

        public int IsTrialOffered { get; set; }

        public int IsBenchShared { get; set; }
        public string State { get; set; }

        public string OtherLocations { get; set; }
        public int PartnerType { get; set; }

        //krishan create line
        public string ManualType { get; set; }
        public int VerifyPartner()
        {
            int authenticate;
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_VerifyPartner", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("@email", SqlDbType.NVarChar).Value = Email;

                command.Parameters.Add("@website", SqlDbType.NVarChar).Value = Website;

                command.Parameters.Add("@contactNumber", SqlDbType.NVarChar).Value = ContactNumber;

                command.Parameters.Add("@PocFullName", SqlDbType.NVarChar).Value = PocFullName;

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

        // krishan create method 25-05-2020 --proc_CustomerSignupPartner 

        public int CustomerSignupPartner()
        {
            int authenticate;
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_CustomerSignupPartner", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;


                command.Parameters.Add("@PocFullName", SqlDbType.NVarChar).Value = PocFullName;

                command.Parameters.Add("@email", SqlDbType.NVarChar).Value = Email;

                //command.Parameters.Add("@Password", SqlDbType.VarChar).Value = Password;

                command.Parameters.Add("@companyName", SqlDbType.NVarChar).Value = CompanyName;

                command.Parameters.Add("@contactNumber", SqlDbType.NVarChar).Value = ContactNumber;

               

                command.Parameters.Add("@exist", SqlDbType.Int);
                command.Parameters["@exist"].Direction = ParameterDirection.Output;

                command.CommandType = CommandType.StoredProcedure;

                sqlConnection.Open();
                command.ExecuteNonQuery();
                authenticate = Convert.ToInt32(command.Parameters["@exist"].Value);
            }
            return authenticate;
        }
       

        // krishan create method 22-01-2020
        public void UpdatePartnerProfileByPartnerId( )
        {
            DataTable dtNewProject = new DataTable();

            //int requestId;
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_UpdatePartnerProfileByPartnerId", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("@PartnerId", SqlDbType.Int).Value = PartnerId;
                // command.Parameters.Add("@consultantEmail", SqlDbType.Int).Value = consultantEmail;
                command.Parameters.Add("@IsActive", SqlDbType.Int).Value = IsActive;
                command.Parameters.Add("@services", SqlDbType.NVarChar).Value = OtherServices;
                command.Parameters.Add("@statusComments", SqlDbType.NVarChar).Value = StatusComments;
                command.Parameters.Add("@PartnerType", SqlDbType.Int).Value = PartnerType;
                
                sqlConnection.Open();
                command.ExecuteNonQuery();
                sqlConnection.Close();
            }



        }

        public void RejactPartnerProfileByPartnerId()
        {
            DataTable dtNewProject = new DataTable();

            //int requestId;
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_RejactPartnerProfileByPartnerId", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("@PartnerId", SqlDbType.Int).Value = PartnerId;
                // command.Parameters.Add("@consultantEmail", SqlDbType.Int).Value = consultantEmail;
                command.Parameters.Add("@IsActive", SqlDbType.Int).Value = IsActive;
                command.Parameters.Add("@statusComments", SqlDbType.NVarChar).Value = StatusComments;

                sqlConnection.Open();
                command.ExecuteNonQuery();
                sqlConnection.Close();
            }
        }
       
        public int LoginPartner()
        {
            //try
            //{
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
            //}
            //catch (Exception ex)
            //{
            //    return 0;
            //}

        }
        public int RegisterPartner(string serviceidList)
        {
            int authenticate;
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            //try
            //{
                using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
                {
                    SqlCommand command = new SqlCommand("proc_RegisterPartnerNew", sqlConnection);
                    command.CommandType = CommandType.StoredProcedure;
                    //command.Parameters.Add("@partnerId", SqlDbType.Int).Value = PartnerId;
                    command.Parameters.Add("@email", SqlDbType.NVarChar).Value = Email;
                    command.Parameters.Add("@website", SqlDbType.NVarChar).Value = Website;
                    command.Parameters.Add("@contactNumber", SqlDbType.NVarChar).Value = ContactNumber;
                    command.Parameters.Add("@pocFullName", SqlDbType.NVarChar).Value = PocFullName;
                    command.Parameters.Add("@companyName", SqlDbType.NVarChar).Value = CompanyName;
                    command.Parameters.Add("@password", SqlDbType.NVarChar).Value = Password;
                    command.Parameters.Add("@exist", SqlDbType.Int);
                    command.Parameters["@exist"].Direction = ParameterDirection.Output;


                    command.Parameters.Add("@started", SqlDbType.NVarChar).Value = CompanyStarted;
                    command.Parameters.Add("@employeeCount", SqlDbType.NVarChar).Value = EmployeeCount;
                    command.Parameters.Add("@describedAs", SqlDbType.NVarChar).Value = CompanyDescribedAs;
                    command.Parameters.Add("@companyType", SqlDbType.NVarChar).Value = CompanyType;
                    command.Parameters.Add("@companyClientsFrom", SqlDbType.NVarChar).Value = CompanyClientFrom;
                    command.Parameters.Add("@companyPrice", SqlDbType.NVarChar).Value = CompanyPricePositioning;
                    command.Parameters.Add("@companyCustomerSegment", SqlDbType.NVarChar).Value = CompanyCustomerSegment;

                    command.Parameters.Add("@companyProfile", SqlDbType.NVarChar).Value = CompanyProfile;
                    command.Parameters.Add("@companyPrimaryRevenueSource", SqlDbType.NVarChar).Value = CompanyPrimarySourceOfRevenue;
                    command.Parameters.Add("@companyAddress", SqlDbType.NVarChar).Value = CompanyAddress;

                    command.Parameters.Add("@state", SqlDbType.NVarChar).Value = CompanyState;
                    command.Parameters.Add("@city", SqlDbType.NVarChar).Value = CompanyCity;
                    command.Parameters.Add("@pinCode", SqlDbType.Int).Value = Pincode;
                    command.Parameters.Add("@landline", SqlDbType.NVarChar).Value = Landline;
                    command.Parameters.Add("@awards", SqlDbType.NVarChar).Value = Awards;
                    command.Parameters.Add("@otherLocations", SqlDbType.NVarChar).Value = OtherLocations;
                    //command.Parameters.Add("@companyGSTNumber", SqlDbType.NVarChar).Value = CompanyGSTNumber;

                    command.Parameters.Add("@minimumProjectValue", SqlDbType.Int).Value = CompanyMinimumProjectValue;
                    //command.Parameters.Add("@logoName", SqlDbType.NVarChar).Value = LogoName;
                    command.Parameters.Add("@servicesOffered", SqlDbType.NVarChar).Value = serviceidList;

                    command.Parameters.Add("@skillsOffered", SqlDbType.NVarChar).Value = Skills;
                    command.Parameters.Add("@isTalentShared", SqlDbType.Int).Value = IsTalentShared;

                    command.Parameters.Add("@accountName", SqlDbType.NVarChar).Value = AccountHolderName;
                    command.Parameters.Add("@accountNumber", SqlDbType.NVarChar).Value = AccountNumber;
                    command.Parameters.Add("@bank", SqlDbType.NVarChar).Value = BeneficiaryBank;

                    command.Parameters.Add("@accountType", SqlDbType.NVarChar).Value = AccountType;
                    command.Parameters.Add("@swift", SqlDbType.NVarChar).Value = SwiftCode;
                    command.Parameters.Add("@ifsc", SqlDbType.NVarChar).Value = IfscCode;

                    command.Parameters.Add("@gst", SqlDbType.NVarChar).Value = CompanyGSTNumber;

                    command.Parameters.Add("@representativeName", SqlDbType.NVarChar).Value = CompanyRepresentativeName;
                    command.Parameters.Add("@representativeContact", SqlDbType.NVarChar).Value = CompanyRepresentativeContact;
                    command.Parameters.Add("@representativeEmail", SqlDbType.NVarChar).Value = CompanyRepresentativeLoginEmail;

                    command.Parameters.Add("@isTrialOffered", SqlDbType.Int).Value = IsTrialOffered;
                    command.Parameters.Add("@isBenchShared", SqlDbType.Int).Value = IsBenchShared;
                    //command.Parameters.Add("@password", SqlDbType.NVarChar).Value = Password;

                    command.CommandType = CommandType.StoredProcedure;

                    sqlConnection.Open();
                    command.ExecuteNonQuery();
                    //authenticate = Convert.ToInt32(command.Parameters["@exist"].Value);
                    //int authenticate = (int)command.ExecuteScalar();
                    //string id = command.Parameters["@id"].Value.ToString();
                    sqlConnection.Close();

                    authenticate = Convert.ToInt32(command.Parameters["@exist"].Value);
                }
                return authenticate;

            //}            
            //catch (Exception ex)
            //{
            //    return 0;
            //}    


        }

       
        public void UpdatePartnerOtherServicesOffers(int category1, string strSubCategory1, string strSubCategoryDesc1, int category2, string strSubCategory2, 
            string strSubCategoryDesc2, int category3, string strSubCategory3, string strSubCategoryDesc3, int isBenchShared, int isTrialOffered)
        {
            //int authenticate;
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            //try
            //{
                using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
                {
                    SqlCommand command = new SqlCommand("proc_UpdatePartnerOtherServicesOffers", sqlConnection);
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add("@partnerId", SqlDbType.Int).Value = PartnerId;

                    command.Parameters.Add("@category1", SqlDbType.Int).Value = category1;
                    command.Parameters.Add("@strSubCategory1", SqlDbType.NVarChar).Value = strSubCategory1;
                    command.Parameters.Add("@strSubCategoryDesc1", SqlDbType.NVarChar).Value = strSubCategoryDesc1;

                    command.Parameters.Add("@category2", SqlDbType.Int).Value = category2;
                    command.Parameters.Add("@strSubCategory2", SqlDbType.NVarChar).Value = strSubCategory2;
                    command.Parameters.Add("@strSubCategoryDesc2", SqlDbType.NVarChar).Value = strSubCategoryDesc2;

                    command.Parameters.Add("@category3", SqlDbType.Int).Value = category3;
                    command.Parameters.Add("@strSubCategory3", SqlDbType.NVarChar).Value = strSubCategory3;
                    command.Parameters.Add("@strSubCategoryDesc3", SqlDbType.NVarChar).Value = strSubCategoryDesc3;

                    command.Parameters.Add("@isBenchShared", SqlDbType.Int).Value = isBenchShared;

                    command.Parameters.Add("@isTrialOffered", SqlDbType.Int).Value = isTrialOffered;

                    command.CommandType = CommandType.StoredProcedure;

                    sqlConnection.Open();
                    command.ExecuteNonQuery();
                    sqlConnection.Close();

                }
            //}
            //catch (Exception ex)
            //{
            //}
            //return authenticate;      


        }

       
        //Start - krishan create method 22-01-2020
        public void PartnerSetPassword()
        {
            //try
            //{
                string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
                {
                    SqlCommand command = new SqlCommand("proc_PartnerSetPassword", sqlConnection);
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add("@email", SqlDbType.NVarChar).Value = Email;

                    command.Parameters.Add("@password", SqlDbType.NVarChar).Value = Password;

                    command.CommandType = CommandType.StoredProcedure;

                    sqlConnection.Open();
                    command.ExecuteNonQuery();

                    sqlConnection.Close();

                }
            //}
            //catch (Exception ex)
            //{

            //}

        }
        public DataTable GetPartnerProfileSearchByContactNumber()
        {
            DataTable dtPartnerProfile = new DataTable();

            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_GetPartnerProfileSearchByContactNumber", sqlConnection);
                //command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("@ContactNumber", SqlDbType.NVarChar).Value = ContactNumber;

                using (var da = new SqlDataAdapter(command))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    da.Fill(dtPartnerProfile);
                }
            }
            return dtPartnerProfile;
        }
        public int PartnerEmailVerify ()
        {
            //try
            //{
                int authenticate;
                string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
                {
                    SqlCommand command = new SqlCommand("proc_PartnerEmailVerify", sqlConnection);
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add("@email", SqlDbType.NVarChar).Value = Email;

                    //command.Parameters.Add("@password", SqlDbType.NVarChar).Value = Password;

                    command.Parameters.Add("@exist", SqlDbType.Int);
                    command.Parameters["@exist"].Direction = ParameterDirection.Output;

                    //command.Parameters.Add("@id", SqlDbType.Int).Direction = ParameterDirection.Output; 

                    command.CommandType = CommandType.StoredProcedure;

                    sqlConnection.Open();
                    command.ExecuteNonQuery();

                    if (command.Parameters["@exist"].Value == DBNull.Value)
                    {
                        authenticate = 0;
                    }
                    else
                    {
                        authenticate = Convert.ToInt32(command.Parameters["@exist"].Value);
                    }
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
        public DataTable GetPartnerProfileSearchByIsActive()
        {
            DataTable dtPartnerProfile = new DataTable();

            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_GetPartnerProfileSearchByIsActive", sqlConnection);
                //command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("@IsActive", SqlDbType.Int).Value = IsActive;

                using (var da = new SqlDataAdapter(command))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    da.Fill(dtPartnerProfile);
                }
            }
            return dtPartnerProfile;
        }
        public DataTable GetPartnerProfileAll()
        {
            DataTable dtPartnerProfile = new DataTable();

            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_GetPartnerProfileAll", sqlConnection);
                //command.CommandType = CommandType.StoredProcedure;



                using (var da = new SqlDataAdapter(command))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    da.Fill(dtPartnerProfile);
                }
            }
            return dtPartnerProfile;
        }
        public DataTable GetPartnerProfileList()
        {
            DataTable dtPartnerProfile = new DataTable();

            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_GetPartnerProfileList", sqlConnection);
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
        public DataTable GetPartnerProfileListBasic()
        {
            DataTable dtPartnerProfile = new DataTable();

            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_GetPartnerProfileListBasic", sqlConnection);
                //command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("@partnerId", SqlDbType.Int).Value = PartnerId;

                using (var da = new SqlDataAdapter(command))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    da.Fill(dtPartnerProfile);
                }
            }

            return dtPartnerProfile;
        }
        public void GetPartnerProfileListBasicUpdate()
        {
            
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            //try
            //{
                using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
                {
                    SqlCommand command = new SqlCommand("proc_GetPartnerProfileListBasicUpdate", sqlConnection);
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add("@partnerId", SqlDbType.Int).Value = PartnerId;
                    command.Parameters.Add("@CompanyName", SqlDbType.NVarChar).Value = CompanyName;
                    command.Parameters.Add("@Website", SqlDbType.NVarChar).Value = Website;
                    command.Parameters.Add("@PocFullName", SqlDbType.NVarChar).Value = PocFullName;
                    //command.Parameters.Add("@Email", SqlDbType.NVarChar).Value = Email;
                    command.Parameters.Add("@ContactNumber", SqlDbType.NVarChar).Value = ContactNumber;

                    command.Parameters.Add("@CompanyStarted", SqlDbType.NVarChar).Value = CompanyStarted;
                    command.Parameters.Add("@DescribedAs", SqlDbType.NVarChar).Value = CompanyDescribedAs;
                    command.Parameters.Add("@EmployeeCount", SqlDbType.NVarChar).Value = EmployeeCount;
                    
                    command.Parameters.Add("@CompanyType", SqlDbType.NVarChar).Value = CompanyType;
                    command.Parameters.Add("@ClientFrom", SqlDbType.NVarChar).Value = CompanyClientFrom;
                    command.Parameters.Add("@PricePositioning", SqlDbType.NVarChar).Value = CompanyPricePositioning;
                    command.Parameters.Add("@CustomerSegment", SqlDbType.NVarChar).Value = CompanyCustomerSegment;
                    command.Parameters.Add("@PrimarySourceOfRevenue", SqlDbType.NVarChar).Value = CompanyPrimarySourceOfRevenue;
                    command.Parameters.Add("@CompanyProfile", SqlDbType.NVarChar).Value = CompanyProfile;

                    command.Parameters.Add("@CompanyAddress", SqlDbType.NVarChar).Value = CompanyAddress;
                    command.Parameters.Add("@CompanyGSTNumber", SqlDbType.NVarChar).Value = CompanyGSTNumber;

                    command.Parameters.Add("@MinimumProjectValue", SqlDbType.Int).Value = CompanyMinimumProjectValue;
                  
                    command.Parameters.Add("@RepresentativeName", SqlDbType.NVarChar).Value = CompanyRepresentativeName;
                    command.Parameters.Add("@RepresentativeContact", SqlDbType.NVarChar).Value = CompanyRepresentativeContact;
                    command.Parameters.Add("@RepresentativeEmail", SqlDbType.NVarChar).Value = CompanyRepresentativeLoginEmail;

                   

                    command.CommandType = CommandType.StoredProcedure;

                    sqlConnection.Open();
                    command.ExecuteNonQuery();
                   
                    sqlConnection.Close();

                }
            //}
            //catch (Exception ex)
            //{
            //}
               


        }
        //End - Krishan

        public void GetPartnerDashboard(int partnerId, ref int msgCount, ref int notifCount, ref string companyName)
        {
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_GetPartnerDashboard", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("@partnerId", SqlDbType.Int).Value = partnerId;

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

        public DataTable GetPartnerBankDetails()
        {
            DataTable dtPartnerBankDetails = new DataTable();

            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_GetPartnerBankDetails", sqlConnection);
                //command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("@partnerId", SqlDbType.NVarChar).Value = PartnerId;

                using (var da = new SqlDataAdapter(command))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    da.Fill(dtPartnerBankDetails);
                }
            }

            return dtPartnerBankDetails;
        }

        public void UpdatePartnerBankDetails()
        {
            //int authenticate;
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            //try
            //{
                using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
                {
                    SqlCommand command = new SqlCommand("proc_UpdatePartnerBankDetails", sqlConnection);
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add("@partnerId", SqlDbType.Int).Value = PartnerId;

                    command.Parameters.Add("@accountName", SqlDbType.NVarChar).Value = AccountHolderName;
                    command.Parameters.Add("@accountNumber", SqlDbType.NVarChar).Value = AccountNumber;
                    command.Parameters.Add("@accountType", SqlDbType.NVarChar).Value = AccountType;
                    command.Parameters.Add("@bank", SqlDbType.NVarChar).Value = BeneficiaryBank;
                    command.Parameters.Add("@swift", SqlDbType.NVarChar).Value = SwiftCode;
                    command.Parameters.Add("@ifsc", SqlDbType.NVarChar).Value = IfscCode;

                    command.CommandType = CommandType.StoredProcedure;

                    sqlConnection.Open();
                    command.ExecuteNonQuery();
                    sqlConnection.Close();

                }
            //}
            //catch (Exception ex)
            //{
            //}
            //return authenticate;      


        }

        public void SupportSubmitPartner(string query)
        {
            string partnerEmail = string.Empty;

            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_SupportSubmitPartner", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add("@PartnerId", SqlDbType.Int).Value = PartnerId;
                command.Parameters.Add("@Query", SqlDbType.VarChar).Value = query;

                command.Parameters.Add("@partnerEmail", SqlDbType.VarChar, 100);
                command.Parameters["@partnerEmail"].Direction = ParameterDirection.Output;

                sqlConnection.Open();
                command.ExecuteNonQuery();

                partnerEmail = command.Parameters["@partnerEmail"].Value.ToString();

                sqlConnection.Close();

            }
            //Email
            System.Threading.Thread email = new System.Threading.Thread(delegate ()
            {
                string subject = "Partner support request";
                string body = "<p>Partner Email - " + partnerEmail + "</p><p>Partner Query - " + query + "</p>";
                ClsMail.SendEmail(string.Empty, "partnership@benchkart.com", subject, body);
            });

            email.IsBackground = true;
            email.Start();
        }


        public int PartnerReSetPassword(string newPassword)
        {
            //try
            //{
                int authenticate;
                string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
                {
                   
                    SqlCommand command = new SqlCommand("proc_PartnerReSetPassword", sqlConnection);
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add("@partnerId", SqlDbType.NVarChar).Value = PartnerId; 

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

        //krishan create method 20-08-2020 14:00
        public DataTable GetPartnerManual(   string partnertype,  string Talent, string services)
        {
            DataTable dtPartnerManual = new DataTable();

            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
               
                string str = "select * from Partner where (PartnerType "+partnertype+")and (PrimarySourceOfRevenue " + CompanyPrimarySourceOfRevenue+") and (EmployeeCount "+EmployeeCount+") and (IsTalentShared "+ Talent + ") and(CompanyCity "+CompanyCity+") and IsActive=2 and Services="+services+ "";

                SqlCommand command = new SqlCommand(str, sqlConnection);
                //command.CommandType = CommandType.StoredProcedure;

                //command.Parameters.Add("@PartnerType", SqlDbType.Int).Value = PartnerType;
                //command.Parameters.Add("@EmployeeCount", SqlDbType.NVarChar).Value = EmployeeCount;
               // command.Parameters.Add("@isTalentShared", SqlDbType.Int).Value = IsTalentShared;
                //command.Parameters.Add("@CompanyCity", SqlDbType.NVarChar).Value = OtherLocations;

               //command.Parameters.Add("@PrimarySourceofRevenue", SqlDbType.VarChar).Value = CompanyPrimarySourceOfRevenue;

                using (var da = new SqlDataAdapter(command))
                {
                    //command.CommandType = CommandType.StoredProcedure;
                    da.Fill(dtPartnerManual);
                }
            }

            return dtPartnerManual;
        }

        //end

        //krishan create method 01-09-2020 11:00 
        public void UpdateManualTypePatner(int projectid)
        {
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                string str ="update Project set ManualType='"+ManualType+"' where ProjectId="+projectid+"";
               
                string strg = " Update Partner set ManualType = case when Temp1.ManualType='' then '"+ ManualType +"' else  Temp1.ManualType + ','+'"+ ManualType +"' end From Partner Part inner join ( Select PartnerId, ManualType from Partner where Email in ("+Email+")) as Temp1 on Part.PartnerId = Temp1.PartnerId";
               
                SqlCommand command = new SqlCommand(strg, sqlConnection);
                SqlCommand cmd = new SqlCommand(str, sqlConnection);
                //command.CommandType = CommandType.StoredProcedure;
                //command.Parameters.Add("@email", SqlDbType.VarChar).Value = Email;
                //command.Parameters.Add("@manualType", SqlDbType.VarChar).Value = ManualType;
               // command.Parameters.Add("@manualProject", SqlDbType.VarChar).Value = manualproject;
               // command.Parameters.Add("@projectId", SqlDbType.Int).Value = projectId;

                sqlConnection.Open();
                command.ExecuteNonQuery();
               cmd.ExecuteNonQuery();

              
                sqlConnection.Close();

            }

        }

        //end

    }
}