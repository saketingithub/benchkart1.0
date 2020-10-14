using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Benchkart
{
    public class ClsNotifications
    {
        public int NotificationId { get; set; }
        public int PartnerId { get; set; }
        public int CustomerId { get; set; }

        public string Notification { get; set; }

        public DateTime Creation_Date { get; set; }

        public DataTable GetNotificationsforPartner()
        {
            DataTable dtMessages = new DataTable();
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_GetNotificationsforPartner", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add("@partnerId", SqlDbType.Int).Value = PartnerId;

                using (var da = new SqlDataAdapter(command))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    da.Fill(dtMessages);
                }

            }
            return dtMessages;

        }

        public DataTable GetNotificationsforCustomer()
        {
            DataTable dtMessages = new DataTable();
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_GetNotificationsforCustomer", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add("@CustomerId", SqlDbType.Int).Value = CustomerId;

                using (var da = new SqlDataAdapter(command))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    da.Fill(dtMessages);
                }

            }
            return dtMessages;

        }
    }
}