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

       

        public string FinalComment { get; set; }

        public DateTime? CreationDate { get; set; }

        public DateTime? ModificatioinDate { get; set; }

        public string Experience { get; set; }

        public int? RejectionCode { get; set; }

        public string RejectionReason { get; set; }
       
        public string ConsultantComment { get; set; }

        public void SubmitBidbyPartner()
        {
            //int authenticate;
            DataTable dtProjectDetail = new DataTable();
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_SubmitBidbyPartner", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add("@partnerId", SqlDbType.Int).Value = PartnerId;
                command.Parameters.Add("@projectId", SqlDbType.Int).Value = ProjectId;

                command.Parameters.Add("@bidAmount", SqlDbType.Int).Value = BidAmount;
                command.Parameters.Add("@execution", SqlDbType.NVarChar).Value = ExecutionRemarks;
                command.Parameters.Add("@experience", SqlDbType.NVarChar).Value = Experience;

                sqlConnection.Open();
                command.ExecuteNonQuery();
                sqlConnection.Close();
                //using (var da = new SqlDataAdapter(command))
                //{
                //    command.CommandType = CommandType.StoredProcedure;
                //    da.Fill(dtProjectDetail);
                //}

            }
            //return dtProjectDetail;
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


		public DataTable GetBidDetailsforProject(int ProjectId)
        {
            DataTable dtBids = new DataTable();
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_GetBidDetailsforProject", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add("@ProjectId", SqlDbType.Int).Value = ProjectId;

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
        public DataTable GetBidDetails()
        {
            DataTable dtBidDetails = new DataTable();

            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_GetBidDetails", sqlConnection);
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
            //Email
            string projectTitle = string.Empty;
            string partnerName = string.Empty;
            string partnerEmail = string.Empty;
            //End Email

            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_SendMessageAgainstBid", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("@bidId", SqlDbType.Int).Value = BidId;

                //command.Parameters.Add("@preferTimetoContact", SqlDbType.NVarChar).Value = PreferTimetoContact;
                command.Parameters.Add("@parentMessageId", SqlDbType.Int).Value = 0;

                command.Parameters.Add("@message", SqlDbType.NVarChar).Value = message;

                //Email
                command.Parameters.Add("@projectTitle", SqlDbType.NVarChar, 1000);
                command.Parameters["@projectTitle"].Direction = ParameterDirection.Output;

                command.Parameters.Add("@partnerName", SqlDbType.VarChar, 100);
                command.Parameters.Add("@partnerEmail", SqlDbType.VarChar, 100);
                command.Parameters["@partnerName"].Direction = ParameterDirection.Output;
                command.Parameters["@partnerEmail"].Direction = ParameterDirection.Output;

                //End - Email

                command.CommandType = CommandType.StoredProcedure;

                sqlConnection.Open();
                command.ExecuteNonQuery();

                //Email
                projectTitle = command.Parameters["@projectTitle"].Value.ToString();
                partnerName = command.Parameters["@partnerName"].Value.ToString();
                partnerEmail = command.Parameters["@partnerEmail"].Value.ToString();
                //End - Email

                sqlConnection.Close();
            }

            //Email
            System.Threading.Thread email = new System.Threading.Thread(delegate ()
            {
                string partnerSubject = "Message Received from Customer";

                string partnerBody = "<p>Project Title - " + projectTitle + "</p><p>A message has been received from the customer.</p><p>Please login to your benchkart dashboard to view and respond.</p>";

                ClsMail.SendEmail(partnerName, partnerEmail, partnerSubject, partnerBody);
            });

            email.IsBackground = true;
            email.Start();
            //End - Email
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

        //krishan create method 26-02-2020
        //start
        public void UpdateBidApprovaleStatus()
        {
            DataTable dtBids = new DataTable();

            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_UpdateBidApprovaleStatus", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add("@BidId", SqlDbType.Int).Value = BidId;
                command.Parameters.Add("@ApprovaleStatus", SqlDbType.Int).Value = BidStatus;
                command.Parameters.Add("@ConsultantComment", SqlDbType.VarChar).Value = ConsultantComment;
                sqlConnection.Open();
                command.ExecuteNonQuery();
                sqlConnection.Close();

            }

        }
        public void BiddingAcceptedTrue()
        {
            //Email
            string projectTitle = string.Empty;
            string partnerName = string.Empty;
            string partnerEmail = string.Empty;
            //End Email

            DataTable dtBids = new DataTable();
           // string partnerEmail = string.Empty; string customerEmail = string.Empty;
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_BiddingAcceptedTrue", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add("@BidId", SqlDbType.Int).Value = BidId;

                //Email
                command.Parameters.Add("@projectTitle", SqlDbType.NVarChar, 1000);
                command.Parameters["@projectTitle"].Direction = ParameterDirection.Output;

                command.Parameters.Add("@partnerName", SqlDbType.VarChar, 100);
                command.Parameters.Add("@partnerEmail", SqlDbType.VarChar, 100);
                command.Parameters["@partnerName"].Direction = ParameterDirection.Output;
                command.Parameters["@partnerEmail"].Direction = ParameterDirection.Output;

                //End - Email

                sqlConnection.Open();
                command.ExecuteNonQuery();

                //Email
                projectTitle = command.Parameters["@projectTitle"].Value.ToString();
                partnerName = command.Parameters["@partnerName"].Value.ToString();
                partnerEmail = command.Parameters["@partnerEmail"].Value.ToString();
               
                //End - Email

                sqlConnection.Close();                

            }
            System.Threading.Thread email = new System.Threading.Thread(delegate ()
            {
                string subject = "Great! Your Bid is Accepted by Customer";
                string body = "<p>Project Title - " + projectTitle + "</p><p>Great! Your bid is accepted by customer.</p><p>Now the next steps is to login into benchkart, go to PROJECTS tab and reach out to customer for finalization of project and send a final CONTRACT to customer after the discussion.</p><p>Please discuss with customer as early as possible as customer has the right to select another bid and override yours. In that case this project will no longer be available in your projects list. Do let us know if we can be of any help.</p>";

                ClsMail.SendEmail(partnerName, partnerEmail, subject, body);
            });
            email.IsBackground = true;
            email.Start();

            //End - Email

        }

        // start  krishan create method 30-06-2020

        public void BiddingGetCallBack()
        {
            //Email
            string fullName = string.Empty;
            string companyName = string.Empty;
            string contactNumber = string.Empty;
            string partnerName = string.Empty;
            string partnerEmail = string.Empty;

            string projectTitle = string.Empty;
            //End Email

            DataTable dtBids = new DataTable();
            // string partnerEmail = string.Empty; string customerEmail = string.Empty;
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_BiddingGetCallBack", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add("@BidId", SqlDbType.Int).Value = BidId;

                //Email
                command.Parameters.Add("@customerName", SqlDbType.NVarChar, 50);
                command.Parameters["@customerName"].Direction = ParameterDirection.Output;

                command.Parameters.Add("@companyName", SqlDbType.VarChar, 50);
                command.Parameters.Add("@contactNumber", SqlDbType.VarChar, 50);
                command.Parameters["@companyName"].Direction = ParameterDirection.Output;
                command.Parameters["@contactNumber"].Direction = ParameterDirection.Output;
                
                command.Parameters.Add("@partnerName", SqlDbType.VarChar, 100);
                command.Parameters.Add("@partnerEmail", SqlDbType.VarChar, 100);
                command.Parameters["@partnerName"].Direction = ParameterDirection.Output;
                command.Parameters["@partnerEmail"].Direction = ParameterDirection.Output;

                command.Parameters.Add("@projectTitle", SqlDbType.NVarChar, 1000);
                command.Parameters["@projectTitle"].Direction = ParameterDirection.Output;

                //End - Email

                sqlConnection.Open();
                command.ExecuteNonQuery();

                //Email
                fullName = command.Parameters["@customerName"].Value.ToString();
                companyName = command.Parameters["@companyName"].Value.ToString();
                contactNumber = command.Parameters["@contactNumber"].Value.ToString();
                partnerName = command.Parameters["@partnerName"].Value.ToString();
                partnerEmail = command.Parameters["@partnerEmail"].Value.ToString();

                projectTitle = command.Parameters["@projectTitle"].Value.ToString();

                //End - Email

                sqlConnection.Close();

            }
            System.Threading.Thread email = new System.Threading.Thread(delegate ()
            {
                string subject = "Customer Requested for Call Back";
                string body = "<p>Project Title - " + projectTitle + "</p><p>The Customer has requested for a CALL. Please reach out to the customer. Here are the contact details. </p><p>Customer Name : " + fullName + "</p><p>Customer Company Name : "+ companyName + "</p><p>Customer Contact Number : "+ contactNumber + "</p>";

                ClsMail.SendEmail(partnerName, partnerEmail, subject, body);
            });
            email.IsBackground = true;
            email.Start();

            //End - Email

        }
        // end

        // start krishan create method 30-06-2020
        public void BiddingContactGetCallBack()
        {

            DataTable dtBids = new DataTable();
           
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_BiddingContactGetCallBack", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add("@BidId", SqlDbType.Int).Value = BidId;
                
                sqlConnection.Open();
                command.ExecuteNonQuery();

                sqlConnection.Close();

            }


            //return getcallback;
        }
        // end
    }
}