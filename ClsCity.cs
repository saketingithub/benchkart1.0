using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace Benchkart
{
    public class ClsCity
    {
        
        public DataTable BindCities(int stateId)
        {
            DataTable dtCities = new DataTable();

            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_BindCities", sqlConnection);
                //command.CommandType = CommandType.StoredProcedure;

                // command.Parameters.Add("@stateId", SqlDbType.NVarChar).Value = stateId;
                command.Parameters.Add("@stateId", SqlDbType.Int).Value = stateId;

                using (var da = new SqlDataAdapter(command))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    da.Fill(dtCities);
                }
            }

            return dtCities;
        }

        // update method krishan 02-06-2020
        public DataSet LoadStatesandServicesSignup( string Email)
        {
            DataSet dtPartnerProfile = new DataSet();

            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_LoadStatesandServicesSignup", sqlConnection);
                //command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("@email", SqlDbType.NVarChar).Value = Email;

                using (var da = new SqlDataAdapter(command))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    da.Fill(dtPartnerProfile);
                }
            }

            return dtPartnerProfile;
        }
        //end method

        public DataSet LoadStatesandServices()
        {
            DataSet dtPartnerProfile = new DataSet();

            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_LoadStatesandServices", sqlConnection);
                //command.CommandType = CommandType.StoredProcedure;

               // command.Parameters.Add("@email", SqlDbType.NVarChar).Value = Email;

                using (var da = new SqlDataAdapter(command))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    da.Fill(dtPartnerProfile);
                }
            }

            return dtPartnerProfile;
        }
        public DataSet LoadStates()
        {
            DataSet dsStatesandServices = new DataSet();

            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_LoadStates", sqlConnection);
                //command.CommandType = CommandType.StoredProcedure;

                using (var da = new SqlDataAdapter(command))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    da.Fill(dsStatesandServices);
                }
            }

            return dsStatesandServices;
        }

        //krishan create method 26-08-2020
        public DataSet BindCitiesManual()
        {
            DataSet dsStatesandServices = new DataSet();

            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_BindCitiesManual", sqlConnection);
                //command.CommandType = CommandType.StoredProcedure;

                using (var da = new SqlDataAdapter(command))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    da.Fill(dsStatesandServices);
                }
            }

            return dsStatesandServices;
        }
        //end

    }
}