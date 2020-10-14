using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Benchkart
{
    public class ClsPayment
    {
        public int PaymentRequestId { get; set; }

        public int? CustomerId { get; set; }

        public int? PartnerId { get; set; }

        public int? ProjectId { get; set; }

        public int? ContractId { get; set; }

        public int? MilestoneId { get; set; }

        public int? PaymentAmount { get; set; }

        public string Currency { get; set; }


        public DateTime? PotentialPaybyDate { get; set; }


        public int? PaymentStatus { get; set; }

        
        public string RazorpayPaymentId { get; set; }

        public string RazorpayOrderId { get; set; }

       
        public int? IsFinalDelivery { get; set; }

        public string RazorpayRespnse { get; set; }

        public string LastRemark { get; set; }

        public string StatusUpdateDate { get; set; }


        public int CreatePaymentRequest()
        {
            //Email
            string projectTitle = string.Empty;
           
            string customerName = string.Empty;
            string customerEmail = string.Empty;
            //End Email

            int paymentRequestId;
            string connection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connection))
            {
                SqlCommand cmd = new SqlCommand("proc_CreatePaymentRequest", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@projectId", SqlDbType.Int).Value = ProjectId;
                cmd.Parameters.Add("@paymentAmount", SqlDbType.Int).Value = PaymentAmount;

                cmd.Parameters.Add("@partnerRequestRemarks", SqlDbType.NVarChar).Value = LastRemark;
                //cmd.Parameters.Add("@potentialPaybyDate", SqlDbType.DateTime).Value = PotentialPaybyDate;
                //cmd.Parameters.Add("@isFinalDelivery", SqlDbType.Int).Value = IsFinalDelivery;
                cmd.Parameters.Add("@paymentRequestId", SqlDbType.Int);
                cmd.Parameters["@paymentRequestId"].Direction = ParameterDirection.Output;

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
                paymentRequestId = Convert.ToInt32(cmd.Parameters["@paymentRequestId"].Value);

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
                string customerSubject = "Agency has Requested for Payment Pre Funding!";

                string customerBody = "<p>Project Title - " + projectTitle + "</p><p>The Agency has requested you to fund the project. Please note that this payment will remain in the nodal account and released to the agency basis your timely approval.</p><p>You can log in to your dashboard from here: <a href=\"https://benchkart.com/Customer/Signin\">Signin</a></p>";

                ClsMail.SendEmail(customerName, customerEmail, customerSubject, customerBody);
            });

            email.IsBackground = true;
            email.Start();
            //End - Email

            return paymentRequestId;
        }

       
       
        public DataTable GetSinglePaymentDetails()
        {
            DataTable dtPayment = new DataTable();

            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_GetSinglePaymentDetails", sqlConnection);
                //command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("@paymentRequestId", SqlDbType.Int).Value = PaymentRequestId;

                using (var da = new SqlDataAdapter(command))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    da.Fill(dtPayment);
                }
            }

            return dtPayment;
        }

        public DataTable GetPaymentDetailsforCustomer()
        {
            DataTable dtPayment = new DataTable();

            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_GetPaymentDetailsforCustomer", sqlConnection);
                //command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("@paymentRequestId", SqlDbType.Int).Value = PaymentRequestId;

                using (var da = new SqlDataAdapter(command))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    da.Fill(dtPayment);
                }
            }

            return dtPayment;
        }

        public DataTable GetPaymentDetailsforPartner()
        {
            DataTable dtPayment = new DataTable();

            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_GetPaymentDetailsforPartner", sqlConnection);
                //command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("@paymentRequestId", SqlDbType.Int).Value = PaymentRequestId;

                using (var da = new SqlDataAdapter(command))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    da.Fill(dtPayment);
                }
            }

            return dtPayment;
        }

        public void SavePaymentMadebyCustomer()
        {
            //int cust_id;

            //Email
            string projectTitle = string.Empty;
            string partnerName = string.Empty;
            string partnerEmail = string.Empty;
            string customerName = string.Empty;
            string customerEmail = string.Empty;
            //End Email

            string connection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connection))
            {
                SqlCommand cmd = new SqlCommand("proc_SavePaymentMadebyCustomer", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@paymentRequestId", SqlDbType.Int).Value = PaymentRequestId;
                cmd.Parameters.Add("@razorpayRespnse", SqlDbType.NVarChar).Value = RazorpayRespnse;
                
                cmd.Parameters.Add("@razorpayPaymentId", SqlDbType.VarChar).Value = RazorpayPaymentId;
                cmd.Parameters.Add("@razorpayOrderId", SqlDbType.VarChar).Value = RazorpayOrderId;
                cmd.Parameters.Add("@customerRequestRemarks", SqlDbType.NVarChar).Value = LastRemark;

                //Email
                cmd.Parameters.Add("@projectTitle", SqlDbType.NVarChar, 1000);
                cmd.Parameters["@projectTitle"].Direction = ParameterDirection.Output;

                cmd.Parameters.Add("@partnerName", SqlDbType.VarChar, 100);
                cmd.Parameters.Add("@partnerEmail", SqlDbType.VarChar, 100);
                cmd.Parameters["@partnerName"].Direction = ParameterDirection.Output;
                cmd.Parameters["@partnerEmail"].Direction = ParameterDirection.Output;

                cmd.Parameters.Add("@customerName", SqlDbType.VarChar, 100);
                cmd.Parameters.Add("@customerEmail", SqlDbType.VarChar, 100);
                cmd.Parameters["@customerName"].Direction = ParameterDirection.Output;
                cmd.Parameters["@customerEmail"].Direction = ParameterDirection.Output;
                //End - Email

                con.Open();
                cmd.ExecuteNonQuery();

                //Email
                projectTitle = cmd.Parameters["@projectTitle"].Value.ToString();
                partnerName = cmd.Parameters["@partnerName"].Value.ToString();
                partnerEmail = cmd.Parameters["@partnerEmail"].Value.ToString();
                customerName = cmd.Parameters["@customerName"].Value.ToString();
                customerEmail = cmd.Parameters["@customerEmail"].Value.ToString();

                //End - Email

                con.Close();
            }

            //Email
            System.Threading.Thread email = new System.Threading.Thread(delegate ()
            {
                string subject = "Thanks for Your Payment!";
                string body = "<p>Project Title - " + projectTitle + "</p><p>Thank you for your payment! You can see the details for the same in your dashboard.</p><p>Your payment will remain in the nodal account and released to agency after you approve their Payment Release Request.</p>";
                ClsMail.SendEmail(customerName, customerEmail, subject, body);

                subject = "Payment is Submitted by Customer";
                body = "<p>Project Title - " + projectTitle + "</p><p>Customer has successfully submitted the payment.</p><p>Please work on delivering the project and then raise - Payment Release Request which will be paid to you after customer approval.</p>";
                ClsMail.SendEmail(partnerName, partnerEmail, subject, body);
            });
            email.IsBackground = true;
            email.Start();

            //End - Email

        }

        public void RejectPaymentRequest()
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
                SqlCommand cmd = new SqlCommand("proc_RejectPaymentRequest", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@paymentRequestId", SqlDbType.Int).Value = PaymentRequestId;
                cmd.Parameters.Add("@customerRequestRemarks", SqlDbType.NVarChar).Value = LastRemark;

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
                string subject = "Your Payment Request is Rejected by Customer";
                string body = "<p>Project Title - " + projectTitle + "</p><p>Your payment request is rejected by customer.</p><p>Please discuss with customer and raise a new payment request if required.</p>";
                ClsMail.SendEmail(partnerName, partnerEmail, subject, body);
            });

            email.IsBackground = true;
            email.Start();
            //End - Email

        }


        public void ReleasePaymentRequestbyPartner()
        {
            //Email
            string projectTitle = string.Empty;
            
            string customerName = string.Empty;
            string customerEmail = string.Empty;
            //End Email

            //int cust_id;
            string connection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connection))
            {
                SqlCommand cmd = new SqlCommand("proc_ReleasePaymentRequestbyPartner", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@paymentRequestId", SqlDbType.Int).Value = PaymentRequestId;
                cmd.Parameters.Add("@partnerReleaseRemarks", SqlDbType.NVarChar).Value = LastRemark;
                cmd.Parameters.Add("@isFinalDelivery", SqlDbType.Int).Value = IsFinalDelivery;

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
                string subject = "Payment Release Request by Agency";
                string body = "<p>Project Title - " + projectTitle + "</p><p>The Agency has requested for release of payments towards delivery of the project.</p><p>Please review & take the required action in your dashboard: <a href=\"https://benchkart.com/Customer/Signin\">Signin</a></p>";
                ClsMail.SendEmail(customerName, customerEmail, subject, body);
            });

            email.IsBackground = true;
            email.Start();

            //End - Email

        }

        public int ReleasePaymentbyCustomer()
        {
            //Email
            string projectTitle = string.Empty;
            string partnerName = string.Empty;
            string partnerEmail = string.Empty;
            //End Email

            int projectId;
            string connection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connection))
            {
                SqlCommand cmd = new SqlCommand("proc_ReleasePaymentbyCustomer", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@paymentRequestId", SqlDbType.Int).Value = PaymentRequestId;
                cmd.Parameters.Add("@customerReleaseRemarks", SqlDbType.NVarChar).Value = LastRemark;
                cmd.Parameters.Add("@isFinalDelivery", SqlDbType.Int).Value = IsFinalDelivery;
                //cmd.Parameters.Add("@isFinalDelivery", SqlDbType.Int).Value = IsFinalDelivery;
                cmd.Parameters.Add("@projectId", SqlDbType.Int);
                cmd.Parameters["@projectId"].Direction = ParameterDirection.Output;

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

                projectId = Convert.ToInt32(cmd.Parameters["@projectId"].Value);
                con.Close();
            }

            //Email
            System.Threading.Thread email = new System.Threading.Thread(delegate ()
            {
                string subject = "Your Payment Release Request is Approved";
                string partnerBody = "<p>Project Title - " + projectTitle + "</p><p>Congratulations! Your payment release request is approved by customer.</p><p>Benchkart will soon release the amount to your mentioned bank account. Please cross check your bank details in  the Profile section.</p>";

                ClsMail.SendEmail(partnerName, partnerEmail, subject, partnerBody);
            });

            email.IsBackground = true;
            email.Start();
            //End - Email

            return projectId;

        }


    }
}