using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Benchkart
{
    public class ClsProject
    {
        public int ProjectId { get; set; }

        public int? RequestId { get; set; }

        public int? CustomerId { get; set; }

        public int? ConsultantId { get; set; }

        public int? ServiceId { get; set; }

        public string Title { get; set; }

        public string Description { get; set; }

        public int? OutsourceType { get; set; }

        public int? TalentCount { get; set; }

        public int? TalentProficiency { get; set; }

        public string Duration { get; set; }

        public string QueryForProvider { get; set; }

        public int? WorkMode { get; set; }

        public string OnsiteLocation { get; set; }

        public string SkillRequired { get; set; }

        public DateTime? CreationDate { get; set; }

        public DateTime? ModificatioinDate { get; set; }

        public string Status { get; set; }

        public string StatusComment { get; set; }

        public int? Budget { get; set; }

        public int? BudgetType { get; set; }


        public DataTable GetProjectsforPartner(int PartnerId)
        {
            DataTable dtOppurtunities = new DataTable();

            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_GetProjectsforPartner", sqlConnection);
                //command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("@partnerId", SqlDbType.NVarChar).Value = PartnerId;

                using (var da = new SqlDataAdapter(command))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    da.Fill(dtOppurtunities);
                }
            }

            return dtOppurtunities;
        }

        public DataTable GetProjectsforCustomer(int CustomerId)
        {
            DataTable dtProjects = new DataTable();

            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_GetProjectsforCustomer", sqlConnection);
                //command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("@customerId", SqlDbType.NVarChar).Value = CustomerId;

                using (var da = new SqlDataAdapter(command))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    da.Fill(dtProjects);
                }
            }

            return dtProjects;
        }

        public DataTable GetProjectDetailsforPartner()
        {
            DataTable dtProjectDetails = new DataTable();

            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_GetProjectDetailsforPartner", sqlConnection);
                //command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("@projectId", SqlDbType.NVarChar).Value = ProjectId;

                using (var da = new SqlDataAdapter(command))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    da.Fill(dtProjectDetails);
                }
            }

            return dtProjectDetails;
        }

        public DataTable GetCustomerProjectDetails()
        {
            DataTable dtProjectDetails = new DataTable();

            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_GetCustomerProjectDetails", sqlConnection);
                //command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("@projectId", SqlDbType.NVarChar).Value = ProjectId;

                using (var da = new SqlDataAdapter(command))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    da.Fill(dtProjectDetails);
                }
            }

            return dtProjectDetails;
        }
    }
}