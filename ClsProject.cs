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

        //krishan create line

        public string ConsultantComments { get; set; }

        public DataTable GetProjectsforPartner(int PartnerId, ref int oppurtunitiesCount, ref int bidCount, ref int selectedbidCount, ref int activeProjectCount)
        {
            DataTable dtOppurtunities = new DataTable();

            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_GetProjectsforPartner", sqlConnection);
                //command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("@partnerId", SqlDbType.NVarChar).Value = PartnerId;

                command.Parameters.Add("@oppurtunitiesCount", SqlDbType.Int, 5);
                command.Parameters["@oppurtunitiesCount"].Direction = ParameterDirection.Output;
                command.Parameters.Add("@bidCount", SqlDbType.Int, 5);
                command.Parameters["@bidCount"].Direction = ParameterDirection.Output;
                command.Parameters.Add("@selectedbidCount", SqlDbType.Int, 5);
                command.Parameters["@selectedbidCount"].Direction = ParameterDirection.Output;
                command.Parameters.Add("@activeProjectCount", SqlDbType.Int, 5);
                command.Parameters["@activeProjectCount"].Direction = ParameterDirection.Output;

                using (var da = new SqlDataAdapter(command))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    da.Fill(dtOppurtunities);
                }
                if (command.Parameters["@oppurtunitiesCount"].Value != DBNull.Value)
                {
                    oppurtunitiesCount = Convert.ToInt32(command.Parameters["@oppurtunitiesCount"].Value);
                }
                else
                {
                    oppurtunitiesCount = 0;
                }
                if (command.Parameters["@bidCount"].Value != DBNull.Value)
                {
                    bidCount = Convert.ToInt32(command.Parameters["@bidCount"].Value);
                }
                else
                {
                    bidCount = 0;
                }
                if (command.Parameters["@selectedbidCount"].Value != DBNull.Value)
                {
                    selectedbidCount = Convert.ToInt32(command.Parameters["@selectedbidCount"].Value);
                }
                else
                {
                    selectedbidCount = 0;
                }
                if (command.Parameters["@activeProjectCount"].Value != DBNull.Value)
                {
                    activeProjectCount = Convert.ToInt32(command.Parameters["@activeProjectCount"].Value);
                }
                else
                {
                    activeProjectCount = 0;
                }
            }

            return dtOppurtunities;
        }

       
        public DataTable GetProjectsforConsultant()
        {
            DataTable dtOppurtunities = new DataTable();

            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_GetProjectsforConsultant", sqlConnection);
                //command.CommandType = CommandType.StoredProcedure;

                // command.Parameters.Add("@partnerId", SqlDbType.NVarChar).Value = PartnerId;

                using (var da = new SqlDataAdapter(command))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    da.Fill(dtOppurtunities);
                }
            }

            return dtOppurtunities;
        }
       
        public DataSet GetProjectsDashboardforCustomer(int CustomerId, ref int projectsCount, ref int bidsCount, ref int projectsRunningCount, ref int projectsClosedCount)
        {
            DataSet dsProjects = new DataSet();

            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_GetProjectsDashboardforCustomer", sqlConnection);
                //command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("@customerId", SqlDbType.Int).Value = CustomerId;

                command.Parameters.Add("@projectsCount", SqlDbType.Int, 5);
                command.Parameters["@projectsCount"].Direction = ParameterDirection.Output;
                command.Parameters.Add("@bidsCount", SqlDbType.Int, 5);
                command.Parameters["@bidsCount"].Direction = ParameterDirection.Output;
                command.Parameters.Add("@projectsRunningCount", SqlDbType.Int, 5);
                command.Parameters["@projectsRunningCount"].Direction = ParameterDirection.Output;
                command.Parameters.Add("@projectsClosedCount", SqlDbType.Int, 5);
                command.Parameters["@projectsClosedCount"].Direction = ParameterDirection.Output;

                using (var da = new SqlDataAdapter(command))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    da.Fill(dsProjects);
                }

                if (command.Parameters["@projectsCount"].Value != DBNull.Value)
                {
                    projectsCount = Convert.ToInt32(command.Parameters["@projectsCount"].Value);
                }
                else
                {
                    projectsCount = 0;
                }
                if (command.Parameters["@bidsCount"].Value != DBNull.Value)
                {
                    bidsCount = Convert.ToInt32(command.Parameters["@bidsCount"].Value);
                }
                else
                {
                    bidsCount = 0;
                }
                if (command.Parameters["@projectsRunningCount"].Value != DBNull.Value)
                {
                    projectsRunningCount = Convert.ToInt32(command.Parameters["@projectsRunningCount"].Value);
                }
                else
                {
                    projectsRunningCount = 0;
                }
                if (command.Parameters["@projectsClosedCount"].Value != DBNull.Value)
                {
                    projectsClosedCount = Convert.ToInt32(command.Parameters["@projectsClosedCount"].Value);
                }
                else
                {
                    projectsClosedCount = 0;
                }
            }

            return dsProjects;
        }

        public DataSet GetProjectsDashboardforPartner(int PartnerId)
        {
            DataSet dsProjects = new DataSet();

            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_GetProjectsDashboardforPartner", sqlConnection);
                //command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("@partnerId", SqlDbType.Int).Value = PartnerId;

                using (var da = new SqlDataAdapter(command))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    da.Fill(dsProjects);
                }
            }

            return dsProjects;
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

        public DataTable GetProjectorRequestDetailsforCustomer()
        {
            DataTable dtProjectDetails = new DataTable();

            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_GetProjectorRequestDetailsforCustomer", sqlConnection);
                //command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("@projectId", SqlDbType.NVarChar).Value = ProjectId;
                command.Parameters.Add("@customerId", SqlDbType.NVarChar).Value = CustomerId;

                using (var da = new SqlDataAdapter(command))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    da.Fill(dtProjectDetails);
                }
            }

            return dtProjectDetails;
        }
        /// <summary>
        // krishan create method start 22-04-2020
        //start
        public DataTable GetProjectorDetailsforCustomer()
        {
            DataTable dtProjectDetails = new DataTable();

            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_GetProjectorDetailsforCustomer", sqlConnection);
                //command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("@projectId", SqlDbType.NVarChar).Value = ProjectId;
               // command.Parameters.Add("@customerId", SqlDbType.NVarChar).Value = CustomerId;

                using (var da = new SqlDataAdapter(command))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    da.Fill(dtProjectDetails);
                }
            }

            return dtProjectDetails;
        }
        /// </summary>
        /// <returns></returns>
        
        public DataTable GetProjectDetailsforAdmin()
        {
            DataTable dtProjectDetails = new DataTable();

            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_GetProjectDetailsforAdmin", sqlConnection);
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
        public DataTable GetProjectsforAdmin()
        {
            DataTable dtOppurtunities = new DataTable();

            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_GetProjectsforAdmin", sqlConnection);
                //command.CommandType = CommandType.StoredProcedure;



                using (var da = new SqlDataAdapter(command))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    da.Fill(dtOppurtunities);
                }
            }

            return dtOppurtunities;
        }
        public void ProjectStatusUpdateByProjectId()
        {
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_ProjectStatusUpdateByProjectId", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add("@ProjectId", SqlDbType.Int).Value = ProjectId;
                //  command.Parameters.Add("@Status", SqlDbType.VarChar).Value = Status;
                sqlConnection.Open();
                command.ExecuteNonQuery();
                sqlConnection.Close();



            }
        }

        //krishan create method 06-03-2020  3 bid approved consultant project status update  status=2
        public int ProjectStatusBidComplete()
        {
            //Email
            string projectTitle = string.Empty;
           
            string customerName = string.Empty;
            string customerEmail = string.Empty;
            string partnerEmails = string.Empty;
            //End Email

            int countstatusbids;
            DataTable dtProjectDetails = new DataTable();

            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_ProjectStatusBidComplete", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("@projectId", SqlDbType.Int).Value = ProjectId;
                command.Parameters.Add("@Countstatusbids", SqlDbType.Int);
                command.Parameters["@Countstatusbids"].Direction = ParameterDirection.Output;

                //Email
                command.Parameters.Add("@projectTitle", SqlDbType.NVarChar, 1000);
                command.Parameters["@projectTitle"].Direction = ParameterDirection.Output;

                command.Parameters.Add("@customerName", SqlDbType.VarChar, 100);
                command.Parameters.Add("@customerEmail", SqlDbType.VarChar, 100);
                command.Parameters["@customerName"].Direction = ParameterDirection.Output;
                command.Parameters["@customerEmail"].Direction = ParameterDirection.Output;
                //End - Email

                //bccEmail
                //bccEmail
                command.Parameters.Add("@partnerEmailList", SqlDbType.NVarChar, -1);
                command.Parameters["@partnerEmailList"].Direction = ParameterDirection.Output;
                

                sqlConnection.Open();
                command.ExecuteNonQuery();
                countstatusbids = Convert.ToInt32(command.Parameters["@Countstatusbids"].Value);

                //Email
                projectTitle = command.Parameters["@projectTitle"].Value.ToString();
                
                customerName = command.Parameters["@customerName"].Value.ToString();
                customerEmail = command.Parameters["@customerEmail"].Value.ToString();

                partnerEmails = command.Parameters["@partnerEmailList"].Value.ToString();

                //End - Email
                sqlConnection.Close();
            }
            if (countstatusbids > 0)
            {
                //Email
                System.Threading.Thread email = new System.Threading.Thread(delegate ()
                {
                    string subject = "The Best Bids for Your Project Have Arrived";
                    string body = "<p>Project Title - " + projectTitle + "</p><p>We are pleased to inform you that the best bids on your project have arrived!</p><p>These bids will be displayed under the BIDS tab in your Benchkart dashboard. You can start connecting with the agencies and select the best agency suitable for your project.</p><p>You can log in to your dashboard and view bids from here: <a href=\"https://benchkart.com/Customer/Signin\">VIEW BIDS</a></p>";
                    ClsMail.SendEmail(customerName, customerEmail, subject, body);

                    //Email
                    if (partnerEmails != string.Empty)
                    {
                        subject = "Your bid is shortlisted and displayed to the customer";
                        body = "<p>Project Title - " + projectTitle + "</p><p>Your bid has been shortlisted and sent to the customer. Only a few bids are shortlisted & provided to customer for selection.</p><p>As the next step, the Customer may reach out to you for further clarification or finalization. Do help the customer understand the processes for project management & payment on our platform.</p>";
                        ClsMail.SendBccEmail(partnerEmails, subject, body);
                    }
                    //End - Email

                });

                email.IsBackground = true;
                email.Start();

               
            }

            //End - Email
            return countstatusbids;

        }

        // krishan create method 13-03-2020 project status update by Partner close project

        public void CloseProjectbyPartner()
            {
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_CloseProjectbyPartner", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add("@ProjectId", SqlDbType.Int).Value = ProjectId;
                //  command.Parameters.Add("@Status", SqlDbType.VarChar).Value = Status;
                sqlConnection.Open();
                command.ExecuteNonQuery();
                sqlConnection.Close();



            }
        }

        // krishan create method 13-03-2020 project status update by Customer

        public void CloseProjectbyCustomer()
        {
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_CloseProjectbyCustomer", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add("@ProjectId", SqlDbType.Int).Value = ProjectId;
                //  command.Parameters.Add("@Status", SqlDbType.VarChar).Value = Status;
                sqlConnection.Open();
                command.ExecuteNonQuery();
                sqlConnection.Close();



            }
        }

        // krishan create method 16-03-2020 project status update by Custoemr review project

        public void ReviewProjectbyCustomer()
        {
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_ReviewProjectbyCustomer", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add("@ProjectId", SqlDbType.Int).Value = ProjectId;
                //  command.Parameters.Add("@Status", SqlDbType.VarChar).Value = Status;
                sqlConnection.Open();
                command.ExecuteNonQuery();
                sqlConnection.Close();



            }
        }
        // krishan create method 16-03-2020 project status update by Partners
        public void ReviewProjectbyPartners()
        {
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_ReviewProjectbyPartners", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add("@ProjectId", SqlDbType.Int).Value = ProjectId;
                //  command.Parameters.Add("@Status", SqlDbType.VarChar).Value = Status;
                sqlConnection.Open();
                command.ExecuteNonQuery();
                sqlConnection.Close();



            }
        }

        // create method krishan 23-06-2020
        public DataTable GetProjectsByStatus(ref int projectStatus)
        {
            DataTable dtOppurtunities = new DataTable();

            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_GetProjectsByStatus", sqlConnection);
                //command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("@projectStatus", SqlDbType.Int).Value = projectStatus;

                using (var da = new SqlDataAdapter(command))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    da.Fill(dtOppurtunities);
                }
            }

            return dtOppurtunities;
        }
        // end
        // krishan create method 23-06-2020
        public void CreateConsultantComment()
        {
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_CreateConsultantComment", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add("@ProjectId", SqlDbType.Int).Value = ProjectId;
                command.Parameters.Add("@consultantComments", SqlDbType.NVarChar).Value = ConsultantComments;
                sqlConnection.Open();
                command.ExecuteNonQuery();
                sqlConnection.Close();
            }
        }
        // end

        //krishan create method 20-08-2020 19:40
        public DataTable GetManualProjectByProject()
        {
            DataTable dtPartnerManual = new DataTable();

            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_GetManualProjectByProject", sqlConnection);
                //command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("@projectId", SqlDbType.Int).Value = ProjectId;
                command.Parameters.Add("@serviceId", SqlDbType.Int).Value = ServiceId;


                using (var da = new SqlDataAdapter(command))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    da.Fill(dtPartnerManual);
                }
            }

            return dtPartnerManual;
        }
        //end
    }
}