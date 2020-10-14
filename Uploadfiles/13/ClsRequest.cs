using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Benchkart
{
    public class ClsRequest
    {
        public int RequestId { get; set; }

        public int? CustomerId { get; set; }

        public int? ServiceId { get; set; }

        public int? ConsultantId { get; set; }

        public string Title { get; set; }

        public string Description { get; set; }

        public int? OutsourceType { get; set; }

        public int? TalentCount { get; set; }

        public int? TalentProficiency { get; set; }

        public string Duration { get; set; }

        public string QueryForPartner { get; set; }

        public int? WorkMode { get; set; }

        public string OnsiteLocation { get; set; }

        public string SkillRequired { get; set; }

        public DateTime? CreationDate { get; set; }

        public DateTime? ModificatioinDate { get; set; }

        public string Status { get; set; }

        public string StatusComment { get; set; }

        public int? Budget { get; set; }

        public int? BudgetType { get; set; }

        public string Urgency { get; set; }
        public ClsRequest()
        { 
        
        }
        //krishan method 24/12/2019

        public int requestprojectcreatedetails()
        {
            int requestid;
            string connectionstring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionstring))
            {
                SqlCommand cmd = new SqlCommand("proc_requestprojectcreatedetails", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@CustomerId", SqlDbType.Int).Value = CustomerId;
                cmd.Parameters.Add("ServiceId", SqlDbType.Int).Value = ServiceId;
                cmd.Parameters.Add("@title", SqlDbType.NVarChar).Value = Title;
                cmd.Parameters.Add("@Description", SqlDbType.NVarChar).Value = Description;
                cmd.Parameters.Add("@QueryforPartner", SqlDbType.NVarChar).Value = QueryForPartner;
                cmd.Parameters.Add("@Budget", SqlDbType.Int).Value = Budget;
                cmd.Parameters.Add("@BudgetType", SqlDbType.Int).Value = BudgetType;
                cmd.Parameters.Add("@Urgency", SqlDbType.NVarChar).Value = Urgency;
                cmd.Parameters.Add("@requestId", SqlDbType.Int);
                cmd.Parameters["@requestId"].Direction = ParameterDirection.Output;
                con.Open();
                cmd.ExecuteNonQuery();
                requestid = Convert.ToInt32(cmd.Parameters["@requestId"].Value);
                con.Close();
            }
            return requestid;
        }

        // krishan method 30-12-2019

        public int requestprojectcreatetalentdetails()
        {
            int requestid;
            string connectionstring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionstring))
            {
                SqlCommand cmd = new SqlCommand("proc_requestprojectcreatetalentdetails", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@CustomerId", SqlDbType.Int).Value = CustomerId;
                cmd.Parameters.AddWithValue("@ServiceId", SqlDbType.Int).Value = ServiceId;
                cmd.Parameters.AddWithValue("@Title", SqlDbType.NVarChar).Value = Title;
                cmd.Parameters.AddWithValue("@Description", SqlDbType.NVarChar).Value = Description;
                cmd.Parameters.AddWithValue("@SkillRequired", SqlDbType.NVarChar).Value = SkillRequired;
                cmd.Parameters.AddWithValue("@WorkMode", SqlDbType.Int).Value = WorkMode;
                cmd.Parameters.AddWithValue("@OnsiteLocation", SqlDbType.VarChar).Value = OnsiteLocation;
                cmd.Parameters.AddWithValue("@TalentProficiency", SqlDbType.Int).Value = TalentProficiency;
                cmd.Parameters.AddWithValue("@Duration", SqlDbType.VarChar).Value = Duration;
                cmd.Parameters.AddWithValue("@Budget", SqlDbType.Int).Value = Budget;
                cmd.Parameters.AddWithValue("@BudgetType", SqlDbType.Int).Value = BudgetType;
                cmd.Parameters.AddWithValue("@Urgency", SqlDbType.NVarChar).Value = Urgency;
                cmd.Parameters.AddWithValue("@QueryForPartner", SqlDbType.NVarChar).Value = QueryForPartner;
                cmd.Parameters.AddWithValue("@RequestId", SqlDbType.Int);
                cmd.Parameters["RequestId"].Direction = ParameterDirection.Output;
                con.Open();
                cmd.ExecuteNonQuery();
                requestid = Convert.ToInt32(cmd.Parameters["RequestId"].Value);
                con.Close();
                
            }
            return requestid;
        }
        public int RequestAssitance(string email, string industry, string companyName, string companyInfo)
        {
            int requestId;
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_RequestAssistance", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("@email", SqlDbType.NVarChar).Value = email;

                //command.Parameters.Add("@preferTimetoContact", SqlDbType.NVarChar).Value = PreferTimetoContact;
                command.Parameters.Add("@industry", SqlDbType.NVarChar).Value = industry;

                command.Parameters.Add("@companyName", SqlDbType.NVarChar).Value = companyName;

                command.Parameters.Add("@companyInfo", SqlDbType.NVarChar).Value = companyInfo;

                command.Parameters.Add("@description", SqlDbType.NVarChar).Value = Description;

                command.Parameters.Add("@requestId", SqlDbType.Int);
                command.Parameters["@requestId"].Direction = ParameterDirection.Output;

                command.CommandType = CommandType.StoredProcedure;

                sqlConnection.Open();
                command.ExecuteNonQuery();
                requestId = Convert.ToInt32(command.Parameters["@requestId"].Value);
                sqlConnection.Close();
            }
            return requestId;
        }

        public int RequestService(string email, string industry, string companyName, string companyInfo)
        {
            int requestId;
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_RequestService", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("@email", SqlDbType.NVarChar).Value = email;

                command.Parameters.Add("@industry", SqlDbType.NVarChar).Value = industry;

                //command.Parameters.Add("@preferTimetoContact", SqlDbType.NVarChar).Value = PreferTimetoContact;
                command.Parameters.Add("@companyName", SqlDbType.NVarChar).Value = companyName;

                command.Parameters.Add("@serviceId", SqlDbType.Int).Value = ServiceId;
                command.Parameters.Add("@companyInfo", SqlDbType.NVarChar).Value = companyInfo;

                command.Parameters.Add("@title", SqlDbType.NVarChar).Value = Title;
                command.Parameters.Add("@description", SqlDbType.NVarChar).Value = Description;

                //command.Parameters.Add("@duration", SqlDbType.NVarChar).Value = Duration;
                command.Parameters.Add("@skills", SqlDbType.NVarChar).Value = SkillRequired;
                command.Parameters.Add("@queryForPartner", SqlDbType.NVarChar).Value = QueryForPartner;

                command.Parameters.Add("@budget", SqlDbType.Int).Value = Budget;
                command.Parameters.Add("@budgetType", SqlDbType.Int).Value = BudgetType;

                command.Parameters.Add("@requestId", SqlDbType.Int);
                command.Parameters["@requestId"].Direction = ParameterDirection.Output;

                command.CommandType = CommandType.StoredProcedure;

                sqlConnection.Open();
                command.ExecuteNonQuery();
                requestId = Convert.ToInt32(command.Parameters["@requestId"].Value);
                sqlConnection.Close();
            }
            return requestId;
        }

        public int RequestTalent(string Email, string industry, string companyName, string companyInfo)
        {

            int requestId;
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_RequestTalent", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("@email", SqlDbType.NVarChar).Value = Email;

                command.Parameters.Add("@industry", SqlDbType.NVarChar).Value = industry;
                command.Parameters.Add("@companyName", SqlDbType.NVarChar).Value = companyName;

                command.Parameters.Add("@serviceId", SqlDbType.Int).Value = ServiceId;

                command.Parameters.Add("@companyInfo", SqlDbType.NVarChar).Value = companyInfo;

                //command.Parameters.Add("@preferTimetoContact", SqlDbType.NVarChar).Value = PreferTimetoContact;

                command.Parameters.Add("@description", SqlDbType.NVarChar).Value = Description;

                command.Parameters.Add("@skills", SqlDbType.NVarChar).Value = SkillRequired;

                command.Parameters.Add("@instructionsForPartner", SqlDbType.NVarChar).Value = QueryForPartner;
                //command.Parameters.Add("@locationPreference", SqlDbType.NVarChar).Value = LocationPreference;
                command.Parameters.Add("@title", SqlDbType.NVarChar).Value = Title;

                command.Parameters.Add("@duration", SqlDbType.NVarChar).Value = Duration;
                command.Parameters.Add("@talentCount", SqlDbType.Int).Value = TalentCount;
                command.Parameters.Add("@talentWorkMode", SqlDbType.Int).Value = WorkMode;
                command.Parameters.Add("@talentProficiency", SqlDbType.Int).Value = TalentProficiency;
                command.Parameters.Add("@talenOnsiteLocation", SqlDbType.NVarChar).Value = OnsiteLocation;

                command.Parameters.Add("@budget", SqlDbType.Int).Value = Budget;
                command.Parameters.Add("@budgetType", SqlDbType.Int).Value = BudgetType;

                command.Parameters.Add("@requestId", SqlDbType.Int);
                command.Parameters["@requestId"].Direction = ParameterDirection.Output;

                //command.Parameters.Add("@id", SqlDbType.Int).Direction = ParameterDirection.Output; 

                command.CommandType = CommandType.StoredProcedure;

                sqlConnection.Open();
                command.ExecuteNonQuery();
                requestId = Convert.ToInt32(command.Parameters["@requestId"].Value);
                //string id = command.Parameters["@id"].Value.ToString();
                sqlConnection.Close();
            }

            return requestId;

        }

        public DataTable SubmitandGetNewRequest(string consultantEmail)
        {
            DataTable dtNewProject = new DataTable();

            //int requestId;
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_SubmitandGetNewRequest", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;


                command.Parameters.Add("@requestId", SqlDbType.Int).Value = RequestId;
                command.Parameters.Add("@consultantEmail", SqlDbType.NVarChar).Value = consultantEmail;
                command.Parameters.Add("@serviceId", SqlDbType.Int).Value = ServiceId;
                command.Parameters.Add("@title", SqlDbType.NVarChar).Value = Title;
                command.Parameters.Add("@description", SqlDbType.NVarChar).Value = Description;

                command.Parameters.Add("@outsourceType", SqlDbType.Int).Value = OutsourceType;

                if (OutsourceType == 3)
                {
                    command.Parameters.Add("@talentCount", SqlDbType.Int).Value = TalentCount;
                    command.Parameters.Add("@talentWorkMode", SqlDbType.Int).Value = WorkMode;
                    command.Parameters.Add("@talenOnsiteLocation", SqlDbType.NVarChar).Value = OnsiteLocation;
                    command.Parameters.Add("@talentProficiency", SqlDbType.Int).Value = TalentProficiency;
                }

                command.Parameters.Add("@budget", SqlDbType.Int).Value = Budget;
                command.Parameters.Add("@budgetType", SqlDbType.Int).Value = BudgetType;
                command.Parameters.Add("@duration", SqlDbType.NVarChar).Value = Duration;
                command.Parameters.Add("@skills", SqlDbType.NVarChar).Value = SkillRequired;

                command.Parameters.Add("@queryForPartner", SqlDbType.NVarChar).Value = QueryForPartner;
                command.Parameters.Add("@status", SqlDbType.NVarChar).Value = Status;
                command.Parameters.Add("@statusComment", SqlDbType.NVarChar).Value = StatusComment;


                using (var da = new SqlDataAdapter(command))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    da.Fill(dtNewProject);
                }
                sqlConnection.Close();
            }

            return dtNewProject;

        }

        public DataTable UpdateStatusandGetNewRequest(string consultantEmail)
        {
            DataTable dtNewProject = new DataTable();

            //int requestId;
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_UpdateStatusandGetNewRequest", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("@requestId", SqlDbType.Int).Value = RequestId;
                command.Parameters.Add("@consultantEmail", SqlDbType.Int).Value = consultantEmail;
                command.Parameters.Add("@status", SqlDbType.NVarChar).Value = Status;
                command.Parameters.Add("@statusComment", SqlDbType.NVarChar).Value = StatusComment;

                using (var da = new SqlDataAdapter(command))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    da.Fill(dtNewProject);
                }
                sqlConnection.Close();
            }

            return dtNewProject;

        }

        public DataTable GetRequestList(string requestStatus)
        {
            DataTable dtRequestList = new DataTable();
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_GetRequestList", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("@requestStatus", SqlDbType.VarChar).Value = requestStatus;

                using (var da = new SqlDataAdapter(command))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    da.Fill(dtRequestList);
                }
                sqlConnection.Close();
            }
            return dtRequestList;
        }

        public DataTable SearchRequest(string contact)
        {
            DataTable dtSearchResult = new DataTable();
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_SearchRequest", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("@contact", SqlDbType.VarChar).Value = contact;

                using (var da = new SqlDataAdapter(command))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    da.Fill(dtSearchResult);
                }
                sqlConnection.Close();
            }
            return dtSearchResult;
        }
       
    }
}