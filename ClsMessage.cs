using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Benchkart
{
    public class ClsMessage
    {
        public int MessageId { get; set; }

        public string Message { get; set; }
        public DataTable GetMessageDetails(int MessageId)
        {
            DataTable dtMessages = new DataTable();

            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_GetMessageDetails", sqlConnection);
                //command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("@messageId", SqlDbType.NVarChar).Value = MessageId;

                using (var da = new SqlDataAdapter(command))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    da.Fill(dtMessages);
                }
            }

            return dtMessages;
        }

        public DataTable GetMessagesforPartner(int partnerId, string action)
        {
            DataTable dtMessages = new DataTable();
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_GetMessagesforPartner", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add("@partnerId", SqlDbType.Int).Value = partnerId;
                command.Parameters.Add("@action", SqlDbType.VarChar).Value = action;

                using (var da = new SqlDataAdapter(command))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    da.Fill(dtMessages);
                }

            }
            return dtMessages;

        }

        //krishan create message 04-03-2020 getmessage details
        public DataTable GetMessagesforCustomer(int customerId, string action)
        {
            DataTable dtMessages = new DataTable();
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_GetMessagesforCustomer", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add("@customerId", SqlDbType.Int).Value = customerId;
                command.Parameters.Add("@action", SqlDbType.VarChar).Value = action;
                using (var da = new SqlDataAdapter(command))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    da.Fill(dtMessages);
                }

            }
            return dtMessages;

        }

        public int SendMessagebyPartner()
        {
            //Email
            string projectTitle = string.Empty;
           
            string customerName = string.Empty;
            string customerEmail = string.Empty;
            //End Email

            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            int newMessageId = 0;
            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand cmd = new SqlCommand("proc_SendMessagebyPartner", sqlConnection);
                cmd.CommandType = CommandType.StoredProcedure;
                sqlConnection.Open();
                cmd.Parameters.Add("@parentMessageId", SqlDbType.Int).Value = MessageId;
                cmd.Parameters.Add("@message", SqlDbType.NVarChar).Value = Message;

                cmd.Parameters.Add("@newMessageId", SqlDbType.BigInt);
                cmd.Parameters["@newMessageId"].Direction = ParameterDirection.Output;

                //Email
                cmd.Parameters.Add("@projectTitle", SqlDbType.NVarChar, 1000);
                cmd.Parameters["@projectTitle"].Direction = ParameterDirection.Output;

                cmd.Parameters.Add("@customerName", SqlDbType.VarChar, 100);
                cmd.Parameters.Add("@customerEmail", SqlDbType.VarChar, 100);
                cmd.Parameters["@customerName"].Direction = ParameterDirection.Output;
                cmd.Parameters["@customerEmail"].Direction = ParameterDirection.Output;
                //End - Email

                cmd.ExecuteNonQuery();
                newMessageId = Convert.ToInt32(cmd.Parameters["@newMessageId"].Value);

                //Email
                projectTitle = cmd.Parameters["@projectTitle"].Value.ToString();
                
                customerName = cmd.Parameters["@customerName"].Value.ToString();
                customerEmail = cmd.Parameters["@customerEmail"].Value.ToString();

                //End - Email

                sqlConnection.Close();
            }

            //Email
            System.Threading.Thread email = new System.Threading.Thread(delegate ()
            {
                string subject = "Message Received from Agency";
                string body = "<p>Project Title - " + projectTitle + "</p><p>A message has been received from the agency.</p><p>Please login to your Benchkart dashboard to view and respond.</p>";
                ClsMail.SendEmail(customerName, customerEmail, subject, body);
            });

            email.IsBackground = true;
            email.Start();

            //End - Email
            return newMessageId;
        }


        //krishan create method 28-02-2020
        public int SendMessagebyCustomer()
        {
            //Email
            string projectTitle = string.Empty;
            string partnerName = string.Empty;
            string partnerEmail = string.Empty;
            //End Email

            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            int newMessageId = 0;
            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand cmd = new SqlCommand("proc_SendMessagebyCustomer", sqlConnection);
                cmd.CommandType = CommandType.StoredProcedure;
                sqlConnection.Open();
                cmd.Parameters.Add("@parentMessageId", SqlDbType.Int).Value = MessageId;
                cmd.Parameters.Add("@message", SqlDbType.NVarChar).Value = Message;

                cmd.Parameters.Add("@newMessageId", SqlDbType.BigInt);
                cmd.Parameters["@newMessageId"].Direction = ParameterDirection.Output;

                //Email
                cmd.Parameters.Add("@projectTitle", SqlDbType.NVarChar, 1000);
                cmd.Parameters["@projectTitle"].Direction = ParameterDirection.Output;

                cmd.Parameters.Add("@partnerName", SqlDbType.VarChar, 100);
                cmd.Parameters.Add("@partnerEmail", SqlDbType.VarChar, 100);
                cmd.Parameters["@partnerName"].Direction = ParameterDirection.Output;
                cmd.Parameters["@partnerEmail"].Direction = ParameterDirection.Output;

                //End - Email

                cmd.ExecuteNonQuery();
                newMessageId = Convert.ToInt32(cmd.Parameters["@newMessageId"].Value);

                //Email
                projectTitle = cmd.Parameters["@projectTitle"].Value.ToString();
                partnerName = cmd.Parameters["@partnerName"].Value.ToString();
                partnerEmail = cmd.Parameters["@partnerEmail"].Value.ToString();
                //End - Email


                sqlConnection.Close();
            }
            //Email
            System.Threading.Thread email = new System.Threading.Thread(delegate ()
            {
                string subject = "Message Received from Customer";
                string customerBody = "<p>Project Title - " + projectTitle + "</p><p>You have received a message from customer.</p><p>Please login to Benchkart and respond.</p>";

                ClsMail.SendEmail(partnerName, partnerEmail, subject, customerBody);
            });
            email.IsBackground = true;
            email.Start();
            //End - Email

            return newMessageId;
        }

        public int SendMessagetoPartner(int contractId)
        {
            //Email
            string projectTitle = string.Empty;
            string partnerName = string.Empty;
            string partnerEmail = string.Empty;
            //End Email

            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            int newMessageId = 0;
            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand cmd = new SqlCommand("proc_SendMessagetoPartner", sqlConnection);
                cmd.CommandType = CommandType.StoredProcedure;
                sqlConnection.Open();
                cmd.Parameters.Add("@contractId", SqlDbType.Int).Value = contractId;
                cmd.Parameters.Add("@message", SqlDbType.NVarChar).Value = Message;

                cmd.Parameters.Add("@newMessageId", SqlDbType.BigInt);
                cmd.Parameters["@newMessageId"].Direction = ParameterDirection.Output;

                //Email
                cmd.Parameters.Add("@projectTitle", SqlDbType.NVarChar, 1000);
                cmd.Parameters["@projectTitle"].Direction = ParameterDirection.Output;

                cmd.Parameters.Add("@partnerName", SqlDbType.VarChar, 100);
                cmd.Parameters.Add("@partnerEmail", SqlDbType.VarChar, 100);
                cmd.Parameters["@partnerName"].Direction = ParameterDirection.Output;
                cmd.Parameters["@partnerEmail"].Direction = ParameterDirection.Output;

                //End - Email

                cmd.ExecuteNonQuery();
                newMessageId = Convert.ToInt32(cmd.Parameters["@newMessageId"].Value);

                //Email
                projectTitle = cmd.Parameters["@projectTitle"].Value.ToString();
                partnerName = cmd.Parameters["@partnerName"].Value.ToString();
                partnerEmail = cmd.Parameters["@partnerEmail"].Value.ToString();
                //End - Email


                sqlConnection.Close();
            }
            //Email
            System.Threading.Thread email = new System.Threading.Thread(delegate ()
            {
                string subject = "Message Received from Customer";
                string customerBody = "<p>Project Title - " + projectTitle + "</p><p>You have received a message from customer.</p><p>Please login to Benchkart and respond.</p>";

                ClsMail.SendEmail(partnerName, partnerEmail, subject, customerBody);
            });
            email.IsBackground = true;
            email.Start();
            //End - Email

            return newMessageId;
        }
    }
}