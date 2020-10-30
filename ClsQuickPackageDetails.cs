using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Benchkart
{
    public class ClsQuickPackageDetails
    {
        public int PartnerPackageDetailsId { get; set; }
        public int PartnerPackageId { get; set; }
        public string Parameter { get; set; }
        public string BasicDisplayText { get; set; }
        public string StandardDisplayText { get; set; }
        public string PremiumDisplayText { get; set; }
        public DateTime CreateDate { get; set; }
        public DateTime ModificationData { get; set; }

        public void CreatePartnerPackageDetails()
        {
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_CreatePartnerPackageDetails", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add("@partnerPackageId", SqlDbType.Int).Value = PartnerPackageId;
                command.Parameters.Add("@parameter", SqlDbType.VarChar).Value = Parameter;
                command.Parameters.Add("@basicDisplayText", SqlDbType.VarChar).Value = BasicDisplayText;
                command.Parameters.Add("@standardDisplayText", SqlDbType.VarChar).Value = StandardDisplayText;
                command.Parameters.Add("@premiumDisplayText", SqlDbType.VarChar).Value = PremiumDisplayText;
               
                sqlConnection.Open();
                command.ExecuteNonQuery();
                sqlConnection.Close();



            }
        }
        public void UpdatePartnerPackageDetails()
        {
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_UpdatePartnerPackageDetails", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add("@partnerPackageDetailsId", SqlDbType.Int).Value = PartnerPackageDetailsId;
                command.Parameters.Add("@parameter", SqlDbType.VarChar).Value = Parameter;
                command.Parameters.Add("@basicDisplayText", SqlDbType.VarChar).Value = BasicDisplayText;
                command.Parameters.Add("@standardDisplayText", SqlDbType.VarChar).Value = StandardDisplayText;
                command.Parameters.Add("@premiumDisplayText", SqlDbType.VarChar).Value = PremiumDisplayText;

                sqlConnection.Open();
                command.ExecuteNonQuery();
                sqlConnection.Close();



            }
        }
        public DataTable GetPartnerPackageDetailsByPartnerPackageId()
        {
            DataTable dtCustomerProfile = new DataTable();

            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_GetPartnerPackageDetailsByPartnerPackageId", sqlConnection);
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