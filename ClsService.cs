using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Benchkart
{
    public class ClsService
    {
        public int ServiceId { get; set; }

        public int PartnerId { get; set; }

        public DateTime? CreationDate { get; set; }

        public DataSet GetServicesforPartner(int partnerId)
        {
            DataSet dsServices = new DataSet();
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_GetServicesforPartner", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add("@partnerId", SqlDbType.Int).Value = partnerId;

                using (var da = new SqlDataAdapter(command))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    da.Fill(dsServices);
                }

            }
            return dsServices;
        }

        // krishan create method 27-05-2020
        public DataSet GetServicesforPartnerConsultant(int partnerId)
        {
            DataSet dsServices = new DataSet();
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_GetServicesforPartnerConsultant", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add("@partnerId", SqlDbType.Int).Value = partnerId;

                using (var da = new SqlDataAdapter(command))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    da.Fill(dsServices);
                }

            }
            return dsServices;
        }

        //end method
        public DataTable GetPartnerOtherServicesOffers(int partnerId)
        {
            DataTable dtOtherServices = new DataTable();
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("GetPartnerOtherServicesOffers", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("@partnerId", SqlDbType.Int).Value = partnerId;

                using (var da = new SqlDataAdapter(command))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    da.Fill(dtOtherServices);

                }

            }
            return dtOtherServices;
        }

        //Start-Anurag
        public void UpdatePartnerServices(string serviceidList)
        {
            //int authenticate;
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            //try
            //{
                using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
                {
                    SqlCommand command = new SqlCommand("proc_UpdatePartnerServices", sqlConnection);
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add("@partnerId", SqlDbType.Int).Value = PartnerId;

                    command.Parameters.Add("@servicesOffered", SqlDbType.NVarChar).Value = serviceidList;

                    command.CommandType = CommandType.StoredProcedure;

                    sqlConnection.Open();
                    command.ExecuteNonQuery();
                    //authenticate = Convert.ToInt32(command.Parameters["@exist"].Value);
                    //int authenticate = (int)command.ExecuteScalar();
                    //string id = command.Parameters["@id"].Value.ToString();
                    sqlConnection.Close();

                }
            //}
            //catch (Exception ex)
            //{
            //}
            //return authenticate;      


        }

        //End
        //krishan create method 27-05-2020
        public void UpdatePartnerServicesConsultant(string serviceidList)
        {
            //int authenticate;
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            //try
            //{
                using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
                {
                    SqlCommand command = new SqlCommand("proc_UpdatePartnerServicesConsultant", sqlConnection);
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add("@partnerId", SqlDbType.Int).Value = PartnerId;

                    command.Parameters.Add("@servicesOffered", SqlDbType.NVarChar).Value = serviceidList;

                    command.CommandType = CommandType.StoredProcedure;

                    sqlConnection.Open();
                    command.ExecuteNonQuery();
                    //authenticate = Convert.ToInt32(command.Parameters["@exist"].Value);
                    //int authenticate = (int)command.ExecuteScalar();
                    //string id = command.Parameters["@id"].Value.ToString();
                    sqlConnection.Close();

                }
            //}
            //catch (Exception ex)
            //{
            //}
            //return authenticate;      


        }
        //end method
        public String GetSkillsforPartner(int partnerId, out int isTalentShared)
        {
            DataTable dtSkills = new DataTable();
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string strSkills = string.Empty;
            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_GetSkillsforPartner", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add("@partnerId", SqlDbType.Int).Value = partnerId;

                command.Parameters.Add("@skills", SqlDbType.NVarChar, 1000);
                command.Parameters["@skills"].Direction = ParameterDirection.Output;

                command.Parameters.Add("@isTalentShared", SqlDbType.Int, 10);
                command.Parameters["@isTalentShared"].Direction = ParameterDirection.Output;

                sqlConnection.Open();
                command.ExecuteNonQuery();
                
                strSkills = command.Parameters["@skills"].Value.ToString();

                if (command.Parameters["@isTalentShared"].Value != DBNull.Value)
                {
                    isTalentShared = Convert.ToInt32(command.Parameters["@isTalentShared"].Value);
                }
                else
                {
                    isTalentShared = 0;
                }
                sqlConnection.Close();
            }
            return strSkills;
        }

        //Start-Anurag
        public void UpdatePartnerSkills(string skills, int isTalentShared)
        {
            //int authenticate;
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
           // try
            //{
                using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
                {
                    SqlCommand command = new SqlCommand("proc_UpdatePartnerSkills", sqlConnection);
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add("@partnerId", SqlDbType.Int).Value = PartnerId;

                    command.Parameters.Add("@skills", SqlDbType.NVarChar).Value = skills;

                    command.Parameters.Add("@isTalentShared", SqlDbType.Int).Value = Convert.ToInt32(isTalentShared);

                    command.CommandType = CommandType.StoredProcedure;

                    sqlConnection.Open();
                    command.ExecuteNonQuery();
                    //authenticate = Convert.ToInt32(command.Parameters["@exist"].Value);
                    //int authenticate = (int)command.ExecuteScalar();
                    //string id = command.Parameters["@id"].Value.ToString();
                    sqlConnection.Close();

                }
            //}
            //catch (Exception ex)
            //{
            //}
            //return authenticate;      


        }

        //End


    }
}