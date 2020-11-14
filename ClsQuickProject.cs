using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;
using System.Net;

namespace Benchkart
{
    public class ClsQuickProject
    {
        public int PartnerPackageId { get; set; }
        public int PartnerId { get; set; }
        public int CategoryId { get; set; }
        public int SubCategoryId { get; set; }
        public int PackageType { get; set; }
        public string  PackageName { get; set; }
        public string PackageDescription { get; set; }
        public int BasicPackageCost { get; set; }
        public string BasicPackageCostFormatted { get; set; }
        public int StandardPackageCost { get; set; }
        public int PremiumPackageCost { get; set; }
        public int IsActive { get; set; }
        public DateTime CreateDate { get; set; }
        public DateTime ModificationDate { get; set; }

        public int CreatePartnerPackage()
        {
            int partnerPackageId;
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_CreatePartnerPackage", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add("@partnerId", SqlDbType.Int).Value = PartnerId;
                command.Parameters.Add("@categoryId", SqlDbType.Int).Value = CategoryId;
                command.Parameters.Add("@subCategoryId", SqlDbType.Int).Value = SubCategoryId;
                command.Parameters.Add("@packageType", SqlDbType.Int).Value = PackageType;
                command.Parameters.Add("@packageName", SqlDbType.VarChar).Value = PackageName;
                command.Parameters.Add("@packageDescription", SqlDbType.VarChar).Value = PackageDescription;
                command.Parameters.Add("@basicPackageCost", SqlDbType.Int).Value = BasicPackageCost;
                command.Parameters.Add("@standardPackageCost", SqlDbType.Int).Value = StandardPackageCost;
                command.Parameters.Add("@premiumPackageCost", SqlDbType.Int).Value = PremiumPackageCost;
                command.Parameters.Add("@partnerPackageId", SqlDbType.Int);
                command.Parameters["@partnerPackageId"].Direction = ParameterDirection.Output;
                sqlConnection.Open();
                command.ExecuteNonQuery();
                partnerPackageId = Convert.ToInt32(command.Parameters["@partnerPackageId"].Value);
                sqlConnection.Close();



            }
            return partnerPackageId;
        }
        public void UpdatePartnerPackage()
        {
           
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_UpdatePartnerPackage", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add("@partnerPackageId", SqlDbType.Int).Value = PartnerPackageId;
                command.Parameters.Add("@categoryId", SqlDbType.Int).Value = CategoryId;
                command.Parameters.Add("@subCategoryId", SqlDbType.Int).Value = SubCategoryId;
                command.Parameters.Add("@packageType", SqlDbType.Int).Value = PackageType;
                command.Parameters.Add("@packageName", SqlDbType.VarChar).Value = PackageName;
                command.Parameters.Add("@packageDescription", SqlDbType.VarChar).Value = PackageDescription;
                command.Parameters.Add("@basicPackageCost", SqlDbType.Int).Value = BasicPackageCost;
                command.Parameters.Add("@standardPackageCost", SqlDbType.Int).Value = StandardPackageCost;
                command.Parameters.Add("@premiumPackageCost", SqlDbType.Int).Value = PremiumPackageCost;
                
                sqlConnection.Open();
                command.ExecuteNonQuery();
                
                sqlConnection.Close();



            }
        
        }
        public void UpdatePartnerPackageByAdmin()
        {
            string partneremail = string.Empty;
            int isActive;
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_UpdatePartnerPackageByAdmin", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add("@partnerPackageId", SqlDbType.Int).Value = PartnerPackageId;
                command.Parameters.Add("@categoryId", SqlDbType.Int).Value = CategoryId;
                command.Parameters.Add("@subCategoryId", SqlDbType.Int).Value = SubCategoryId;
                command.Parameters.Add("@packageType", SqlDbType.Int).Value = PackageType;
                command.Parameters.Add("@packageName", SqlDbType.VarChar).Value = PackageName;
                command.Parameters.Add("@packageDescription", SqlDbType.VarChar).Value = PackageDescription;
                command.Parameters.Add("@basicPackageCost", SqlDbType.Int).Value = BasicPackageCost;
                command.Parameters.Add("@standardPackageCost", SqlDbType.Int).Value = StandardPackageCost;
                command.Parameters.Add("@premiumPackageCost", SqlDbType.Int).Value = PremiumPackageCost;
                command.Parameters.Add("@isactive", SqlDbType.Int).Value = IsActive;
                command.Parameters.Add("@partnerEmail", SqlDbType.VarChar, 255);
                command.Parameters["@partnerEmail"].Direction = ParameterDirection.Output;

                sqlConnection.Open();
                command.ExecuteNonQuery();
                partneremail= command.Parameters["@partnerEmail"].Value.ToString();
                isActive = Convert.ToInt32(command.Parameters.Add("@isactive", SqlDbType.Int).Value = IsActive);
                sqlConnection.Close();


                
            }

            //Email
            if (isActive == 1)
            {
                System.Threading.Thread email = new System.Threading.Thread(delegate ()
                {
                    string subject = "All good to go!";

                    string body = "We have reviewed your proposal and would be happy to have you on-board as a partner! Please note that there may be some details that may still be required before you can bid for projects. Do keep your profile & bank details updated in the dashboard, if not done already.";

                    ClsMail.SendEmail(string.Empty, "shrikrishan537@gmail.com", subject, body);
                });
                email.IsBackground = true;
                email.Start();

            }
            else if(isActive == 2)
            {
                System.Threading.Thread email = new System.Threading.Thread(delegate ()
                {
                    string subject = "We cant accept your proposal right now";
                    string body = "We have reviewed your proposal and are unable to accept the same. If you need more details, please contact your Relationship Manager.";

                    ClsMail.SendEmail(string.Empty, "shrikrishan537@gmail.com", subject, body);
                });
                email.IsBackground = true;
                email.Start();
            }

        }
        public DataTable GetPartnerPackage()
        {
            DataTable dtCustomerProfile = new DataTable();

            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_GetPartnerPackage", sqlConnection);
                //command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("@partnerId", SqlDbType.Int).Value = PartnerId;

                using (var da = new SqlDataAdapter(command))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    da.Fill(dtCustomerProfile);
                }
            }

            return dtCustomerProfile;
        }
        public DataTable GetPartnerPackageActive()
        {
            DataTable dtCustomerProfile = new DataTable();

            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_GetPartnerPackageActive", sqlConnection);
                //command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("@partnerId", SqlDbType.Int).Value = PartnerId;

                using (var da = new SqlDataAdapter(command))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    da.Fill(dtCustomerProfile);
                }
            }

            return dtCustomerProfile;
        }
        public DataTable GetPartnerPackageInActive()
        {
            DataTable dtCustomerProfile = new DataTable();

            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_GetPartnerPackageInActive", sqlConnection);
                //command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("@partnerId", SqlDbType.Int).Value = PartnerId;

                using (var da = new SqlDataAdapter(command))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    da.Fill(dtCustomerProfile);
                }
            }

            return dtCustomerProfile;
        }
        public DataTable GetPartnerPackageReject()
        {
            DataTable dtCustomerProfile = new DataTable();

            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_GetPartnerPackageReject", sqlConnection);
                //command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("@partnerId", SqlDbType.Int).Value = PartnerId;
               
                using (var da = new SqlDataAdapter(command))
                {
                command.CommandType = CommandType.StoredProcedure;
                    da.Fill(dtCustomerProfile);
                }
            }

            return dtCustomerProfile;
        }
        public DataTable GetPartnerPackageByPartnerPackageId()
        {
            DataTable dtCustomerProfile = new DataTable();

            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_GetPartnerPackageByPartnerPackageId", sqlConnection);
                //command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("@partnerPackageId", SqlDbType.Int).Value = PartnerPackageId;

                using (var da = new SqlDataAdapter(command))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    da.Fill(dtCustomerProfile);
                }
            }

            return dtCustomerProfile;
        }


        //customer method
        public DataTable GetPartnerPackageAll()
        {
            DataTable dtCustomerProfile = new DataTable();

            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_GetPartnerPackageAll", sqlConnection);
                //command.CommandType = CommandType.StoredProcedure;

                // command.Parameters.Add("@partnerId", SqlDbType.Int).Value = PartnerId;

                using (var da = new SqlDataAdapter(command))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    da.Fill(dtCustomerProfile);
                }
            }

            return dtCustomerProfile;
        }

        //customer method
        public DataTable GetPartnerPackageSearchor(string Category, string subCategory, String packageTypeName)
        {
            DataTable dtPartnerPackage = new DataTable();

            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {

                // string str = "select * from PartnerPackage  where (PartnerId " + PartnerId + ")and (CategoryId " + CategoryId + ") and (SubCategoryId " + SubCategoryId + ") and (PackageName " + PackageName + ") and(p.PackageType " + PackageType + ")  and IsActive=1";

                SqlCommand command = new SqlCommand("proc_GetPartnerPackageSearch", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("@categoryId", SqlDbType.VarChar).Value = Category;
                command.Parameters.Add("@subCategoryId", SqlDbType.VarChar).Value = subCategory;
                command.Parameters.Add("@packageType", SqlDbType.VarChar).Value = packageTypeName;

                using (var da = new SqlDataAdapter(command))
                {
                    //command.CommandType = CommandType.StoredProcedure;
                    da.Fill(dtPartnerPackage);
                }

            }
            return dtPartnerPackage;

        }

        //customer method
        public DataTable GetPartnerPackageSearchand()
        {
            DataTable dtPartnerPackage = new DataTable();

            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {

                // string str = "select * from PartnerPackage  where (PartnerId " + PartnerId + ")and (CategoryId " + CategoryId + ") and (SubCategoryId " + SubCategoryId + ") and (PackageName " + PackageName + ") and(p.PackageType " + PackageType + ")  and IsActive=1";

                SqlCommand command = new SqlCommand("proc_GetPartnerPackageSearchand", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("@categoryId", SqlDbType.Int).Value = CategoryId;
                command.Parameters.Add("@subCategoryId", SqlDbType.Int).Value = SubCategoryId;
                command.Parameters.Add("@packageType", SqlDbType.Int).Value = PackageType;

                using (var da = new SqlDataAdapter(command))
                {
                    //command.CommandType = CommandType.StoredProcedure;
                    da.Fill(dtPartnerPackage);
                }

            }
            return dtPartnerPackage;

        }

        //customer method
        public DataTable GetPartnerPackageByCustomer()
        {
            DataTable dtCustomerProfile = new DataTable();

            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_GetPartnerPackageByCustomer", sqlConnection);
                //command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("@partnerPackageId", SqlDbType.Int).Value = PartnerPackageId;

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