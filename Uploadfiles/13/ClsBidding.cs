using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace Benchkart
{
    public class ClsBidding
    {
        public int BidId { get; set; }

        public int? ProjectId { get; set; }

        public int? PartnerId { get; set; }

        public int? BidAmount { get; set; }

        public int? BidStatus { get; set; }

        public string ExecutionRemarks { get; set; }

        public int? BidAccepted { get; set; }

        public string FinalComment { get; set; }

        public DateTime? CreationDate { get; set; }

        public DateTime? ModificatioinDate { get; set; }

        public string Experience { get; set; }

        public int? RejectionCode { get; set; }

        public string RejectionReason { get; set; }

        public DataTable PostBidGetNextProject()
        {
            //int authenticate;
            DataTable dtProjectDetail = new DataTable();
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_PostBidGetNextProject", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add("@partnerId", SqlDbType.Int).Value = PartnerId;
                command.Parameters.Add("@projectId", SqlDbType.Int).Value = ProjectId;

                command.Parameters.Add("@bidAmount", SqlDbType.Int).Value = BidAmount;
                command.Parameters.Add("@execution", SqlDbType.NVarChar).Value = ExecutionRemarks;
                command.Parameters.Add("@experience", SqlDbType.NVarChar).Value = Experience;

                using (var da = new SqlDataAdapter(command))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    da.Fill(dtProjectDetail);
                }

            }
            return dtProjectDetail;
        }

        public DataTable SkipProjectbyPartner()
        {
            //int authenticate;
            DataTable dtProjectDetail = new DataTable();
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_SkipProjectbyPartner", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add("@partnerId", SqlDbType.Int).Value = PartnerId;
                command.Parameters.Add("@projectId", SqlDbType.Int).Value = ProjectId;

                command.Parameters.Add("@rejectionCode", SqlDbType.Int).Value = RejectionCode;
                command.Parameters.Add("@rejectionReason", SqlDbType.NVarChar).Value = RejectionReason;

                using (var da = new SqlDataAdapter(command))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    da.Fill(dtProjectDetail);
                }

            }
            return dtProjectDetail;
        }


        public DataTable GetBidsforCustomer(int customerId)
        {
            DataTable dtBids = new DataTable();
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_GetBidsforCustomer", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add("@customerId", SqlDbType.Int).Value = customerId;

                using (var da = new SqlDataAdapter(command))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    da.Fill(dtBids);
                }

            }
            return dtBids;

        }

        public DataTable GetBidDetailsforCustomer()
        {
            DataTable dtBidDetails = new DataTable();

            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_GetBidDetailsforCustomer", sqlConnection);
                //command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("@bidId", SqlDbType.NVarChar).Value = BidId;

                using (var da = new SqlDataAdapter(command))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    da.Fill(dtBidDetails);
                }
            }

            return dtBidDetails;
        }

        public DataTable GetBidDetailsForPartner()
        {
            DataTable dtBidDetails = new DataTable();

            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_GetBidDetailsForPartner", sqlConnection);
                //command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("@bidId", SqlDbType.NVarChar).Value = BidId;

                using (var da = new SqlDataAdapter(command))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    da.Fill(dtBidDetails);
                }
            }

            return dtBidDetails;
        }

        public void SendMessageAgainstBid(string message)
        {
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_SendMessageAgainstBid", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("@bidId", SqlDbType.Int).Value = BidId;

                //command.Parameters.Add("@preferTimetoContact", SqlDbType.NVarChar).Value = PreferTimetoContact;
                command.Parameters.Add("@parentMessageId", SqlDbType.Int).Value = 0;

                command.Parameters.Add("@message", SqlDbType.NVarChar).Value = message;

                command.CommandType = CommandType.StoredProcedure;

                sqlConnection.Open();
                command.ExecuteNonQuery();
                sqlConnection.Close();
            }
        }

        public DataTable GetMessagesforCustomer(int customerId)
        {
            DataTable dtMessages = new DataTable();
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_GetMessagesforCustomer", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add("@customerId", SqlDbType.Int).Value = customerId;

                using (var da = new SqlDataAdapter(command))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    da.Fill(dtMessages);
                }

            }
            return dtMessages;

        }

        public DataTable GetMessagesforPartner(int partnerId)
        {
            DataTable dtMessages = new DataTable();
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_GetMessagesforPartner", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add("@partnerId", SqlDbType.Int).Value = partnerId;

                using (var da = new SqlDataAdapter(command))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    da.Fill(dtMessages);
                }

            }
            return dtMessages;

        }
        public DataTable GetBidsbyPartner(int PartnerId)
        {
            DataTable dtBids = new DataTable();

            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_GetBidsbyPartner", sqlConnection);
                //command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("@partnerId", SqlDbType.NVarChar).Value = PartnerId;

                using (var da = new SqlDataAdapter(command))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    da.Fill(dtBids);
                }
            }

            return dtBids;
        }

    }
}