using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Benchkart
{
    public class ClsContract
    {
        public int ContractId { get; set; }

        public int? CustomerId { get; set; }

        public int? PartnerId { get; set; }

        public int? ProjectId { get; set; }

        public int? BidId { get; set; }


        public int? ProjectValue { get; set; }

        public string ValueCurrency { get; set; }

        public int? Duration { get; set; }

        public int? DurationType { get; set; }

        public DateTime? StartDate { get; set; }

        public DateTime? EndDate { get; set; }

        public string Description { get; set; }

        public DateTime? CreationDate { get; set; }

        public int? ApprovedByCustomer { get; set; }

        public string CustomerRemarks { get; set; }

        public DateTime? CustomerRemarksDate { get; set; }

        public int SendContracttoCustomer()
        {
            //Email
            string projectTitle = string.Empty;
           
            string customerName = string.Empty;
            string customerEmail = string.Empty;
            //End Email

            int contractId;
            string connection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connection))
            {
                SqlCommand cmd = new SqlCommand("proc_SendContracttoCustomer", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@bidId", SqlDbType.Int).Value = BidId;
                cmd.Parameters.Add("@projectValue", SqlDbType.Int).Value = ProjectValue;
                cmd.Parameters.Add("@duration", SqlDbType.Int).Value = Duration;
                cmd.Parameters.Add("@durationType", SqlDbType.Int).Value = DurationType;

                cmd.Parameters.Add("@startDate", SqlDbType.DateTime).Value = StartDate;
                cmd.Parameters.Add("@endDate", SqlDbType.DateTime).Value = EndDate;                

                cmd.Parameters.Add("@contractId", SqlDbType.Int);
                cmd.Parameters["@contractId"].Direction = ParameterDirection.Output;


                //Email
                cmd.Parameters.Add("@projectTitle", SqlDbType.NVarChar, 1000);
                cmd.Parameters["@projectTitle"].Direction = ParameterDirection.Output;

                cmd.Parameters.Add("@customerName", SqlDbType.VarChar, 100);
                cmd.Parameters.Add("@customerEmail", SqlDbType.VarChar, 100);
                cmd.Parameters["@customerName"].Direction = ParameterDirection.Output;
                cmd.Parameters["@customerEmail"].Direction = ParameterDirection.Output;
                //End - Email

                con.Open();
                cmd.ExecuteNonQuery();
                contractId = Convert.ToInt32(cmd.Parameters["@contractId"].Value);

                //Email
                projectTitle = cmd.Parameters["@projectTitle"].Value.ToString();
               
                customerName = cmd.Parameters["@customerName"].Value.ToString();
                customerEmail = cmd.Parameters["@customerEmail"].Value.ToString();

                //End - Email

                con.Close();
            }

            //Email
            System.Threading.Thread email = new System.Threading.Thread(delegate ()
            {
                string subject = "Contract Received from Agency";
                string body = "<p>Project Title - " + projectTitle + "</p><p>The Agency has now sent you the contract as well as the agreed project value etc.. Request you to review & approve the same to move ahead with your project.</p><p>You can log in to your dashboard and view CONTRACT from here <a href=\"https://benchkart.com/Customer/Signin\">Signin</a></p>";
                ClsMail.SendEmail(customerName, customerEmail, subject, body);
              
            });

            email.IsBackground = true;
            email.Start();

            //End - Email

            return contractId;
        }

        //Email
               //End - Email
        public void ApproveContract()
        {
            //Email
            string projectTitle = string.Empty;
            string partnerName = string.Empty;
            string partnerEmail = string.Empty;
            
            //End Email

            //int cust_id;
            string connection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connection))
            {
                SqlCommand cmd = new SqlCommand("proc_ApproveContract", con);
                cmd.CommandType = CommandType.StoredProcedure;
                
                cmd.Parameters.Add("@contractId", SqlDbType.Int).Value = ContractId;
                cmd.Parameters.Add("@approvedByCustomer", SqlDbType.Int).Value = ApprovedByCustomer;

                //Email
                cmd.Parameters.Add("@projectTitle", SqlDbType.NVarChar, 1000);
                cmd.Parameters["@projectTitle"].Direction = ParameterDirection.Output;

                cmd.Parameters.Add("@partnerName", SqlDbType.VarChar, 100);
                cmd.Parameters.Add("@partnerEmail", SqlDbType.VarChar, 100);
                cmd.Parameters["@partnerName"].Direction = ParameterDirection.Output;
                cmd.Parameters["@partnerEmail"].Direction = ParameterDirection.Output;

                //End - Email

                con.Open();
                cmd.ExecuteNonQuery();

                //Email
                projectTitle = cmd.Parameters["@projectTitle"].Value.ToString();
                partnerName = cmd.Parameters["@partnerName"].Value.ToString();
                partnerEmail = cmd.Parameters["@partnerEmail"].Value.ToString();
                //End - Email

                con.Close();
            }

            //Email
            System.Threading.Thread email = new System.Threading.Thread(delegate ()
            {
                if (ApprovedByCustomer == 30)
                {
                    string partnerSubject = "Congratulations! Your Contract is Approved by Customer";

                    string body = "<p>Project Title - " + projectTitle + "</p><p>Congratulations! Your contract is approved by Customer.</p><p>Please start working on delivering the project and use CREATE PAYMENT REQUEST under DELIVERY tab for payment requests. You can raise multiple payment request during project delivery.</p>";

                    ClsMail.SendEmail(partnerName, partnerEmail, partnerSubject, body);
                }
                else if (ApprovedByCustomer == 10)
                {

                    string partnerSubject = "Customer has Rejected Your Contract";

                    string body = "<p>Project Title - " + projectTitle + "</p><p>Customer has rejected your contract.</p><p>Please login to benchkart and rediscuss this with customer and then re-send a new contract.</p>";
                    //string partnerBody = "<p>Customer has rejected your contract. </p><p>Please rediscuss this with customer and re-send a new contract.</p>";

                    ClsMail.SendEmail(partnerName, partnerEmail, partnerSubject, body);
                }

            });

            email.IsBackground = true;
            email.Start();
            //End - Email


        }




    }

}