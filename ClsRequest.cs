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

        public int CustomerId { get; set; }

        public int ServiceId { get; set; }

        public int ConsultantId { get; set; }

        public string Title { get; set; }

        public string Description { get; set; }

        public int OutsourceType { get; set; }

        public int TalentCount { get; set; }

        public int TalentProficiency { get; set; }

        public string Duration { get; set; }

        public string QueryForPartner { get; set; }

        public int WorkMode { get; set; }
        public int IsBudgetShard { get; set; }
        public string OnsiteLocation { get; set; }

        public string SkillRequired { get; set; }

        public DateTime CreationDate { get; set; }

        public DateTime ModificatioinDate { get; set; }

        public int Status { get; set; }

        public string StatusComment { get; set; }

        public int Budget { get; set; }

        public int BudgetType { get; set; }

        public string Urgency { get; set; }
        public int TalentType { get; set; }
        public int Basic { get; set; }
        public int Intermediate { get; set; }
        public int Expert { get; set; }
        public int BasicHours { get; set; }
        public int IntermediateHours { get; set; }
        public int ExpertHours { get; set; }
        public string State { get; set; }
       

        public ClsRequest()
        { 
        
        }
        

        //public void requestprojectcreatetalentdetails()
        public int PostProjectRequest(ref int customerId,  string email, string password,string companyName)
        {
            int requestid;
            //int customerId;
            string connectionstring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionstring))
            {
                SqlCommand cmd = new SqlCommand("proc_PostProjectRequest", con);
                cmd.CommandType = CommandType.StoredProcedure;
                //cmd.Parameters.Add("@CustomerId", SqlDbType.Int).Value = CustomerId;
                cmd.Parameters.Add("@ServiceId", SqlDbType.Int).Value = ServiceId;
                cmd.Parameters.Add("@Title", SqlDbType.NVarChar).Value = Title;
                cmd.Parameters.Add("@Description", SqlDbType.NVarChar).Value = Description;
              //  cmd.Parameters.Add("@SkillRequired", SqlDbType.NVarChar).Value = SkillRequired;
                
               // cmd.Parameters.Add("@Duration", SqlDbType.VarChar).Value = Duration;
              //  cmd.Parameters.Add("@State", SqlDbType.VarChar).Value = State;
               // cmd.Parameters.Add("@OnsiteLocation", SqlDbType.VarChar).Value = OnsiteLocation;
                cmd.Parameters.Add("@Budget", SqlDbType.Int).Value = Budget;
                //cmd.Parameters.Add("@BudgetType", SqlDbType.Int).Value = BudgetType;
                //cmd.Parameters.Add("@IsBudgetShared", SqlDbType.Int).Value = IsBudgetShard;
             //   cmd.Parameters.Add("@QueryForPartner", SqlDbType.NVarChar).Value = QueryForPartner;
               // cmd.Parameters.Add("@Urgency", SqlDbType.NVarChar).Value = Urgency;

                //Customer Info
                cmd.Parameters.Add("@email", SqlDbType.NVarChar).Value = email;
                cmd.Parameters.Add("@companyName", SqlDbType.NVarChar).Value = companyName;
               // cmd.Parameters.Add("@CompanyIndustry", SqlDbType.NVarChar).Value = companyIndustry;
               // cmd.Parameters.Add("@CompanyProfile", SqlDbType.VarChar).Value = companyProfile;
               // cmd.Parameters.Add("@CompanyType", SqlDbType.VarChar).Value = companyType;
               // cmd.Parameters.Add("@ContactNumber", SqlDbType.VarChar).Value = contactNumber;
                cmd.Parameters.Add("@Password", SqlDbType.VarChar).Value = password;
                 cmd.Parameters.Add("@RequestId", SqlDbType.Int);
                 cmd.Parameters["@RequestId"].Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@CustomerId", SqlDbType.Int);
                cmd.Parameters["@CustomerId"].Direction = ParameterDirection.Output;
                con.Open();
                cmd.ExecuteNonQuery();
                requestid = Convert.ToInt32(cmd.Parameters["@RequestId"].Value);

                customerId = Convert.ToInt32(cmd.Parameters["@customerId"].Value);
                con.Close();
                
            }
            return requestid;
        }

        //krishan create method 25-04-2020 postrequest method
        public int PostRequest(ref int customerId, string email)
        {
            int requestid;
            //int customerId;
            string connectionstring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionstring))
            {
                SqlCommand cmd = new SqlCommand("proc_PostRequest", con);
                cmd.CommandType = CommandType.StoredProcedure;
                //cmd.Parameters.Add("@CustomerId", SqlDbType.Int).Value = CustomerId;
                cmd.Parameters.Add("@ServiceId", SqlDbType.Int).Value = ServiceId;
                cmd.Parameters.Add("@Title", SqlDbType.NVarChar).Value = Title;
                cmd.Parameters.Add("@Description", SqlDbType.NVarChar).Value = Description;

               
                cmd.Parameters.Add("@Budget", SqlDbType.Int).Value = Budget;
                cmd.Parameters.Add("@BudgetType", SqlDbType.Int).Value = BudgetType;
                cmd.Parameters.Add("@State", SqlDbType.VarChar).Value = State;
                cmd.Parameters.Add("@OnsiteLocation", SqlDbType.VarChar).Value = OnsiteLocation;
                //Customer 
                //cmd.Parameters.Add("@FullName", SqlDbType.VarChar).Value = fullname;
                cmd.Parameters.Add("@email", SqlDbType.VarChar).Value = email;
                //cmd.Parameters.Add("@CompanyName", SqlDbType.VarChar).Value = companyName;

                cmd.Parameters.Add("@RequestId", SqlDbType.Int);
                cmd.Parameters["@RequestId"].Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@CustomerId", SqlDbType.Int);
                cmd.Parameters["@CustomerId"].Direction = ParameterDirection.Output;
                con.Open();
                cmd.ExecuteNonQuery();
                requestid = Convert.ToInt32(cmd.Parameters["@RequestId"].Value);

                customerId = Convert.ToInt32(cmd.Parameters["@CustomerId"].Value);
                con.Close();

            }
            return requestid;
        }


        //end
        public int SigninPostProjectRequest(string email, string CompanyName,string contactNumber)
        {
            int requestid;
            string connectionstring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionstring))
            {
                SqlCommand cmd = new SqlCommand("proc_SigninPostProjectRequest", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@CustomerId", SqlDbType.Int).Value = CustomerId;
                cmd.Parameters.Add("@ServiceId", SqlDbType.Int).Value = ServiceId;
                cmd.Parameters.Add("@Title", SqlDbType.NVarChar).Value = Title;
                cmd.Parameters.Add("@Description", SqlDbType.NVarChar).Value = Description;
               // cmd.Parameters.Add("@SkillRequired", SqlDbType.NVarChar).Value = SkillRequired;

                //cmd.Parameters.Add("@Duration", SqlDbType.VarChar).Value = Duration;
                //cmd.Parameters.Add("@State", SqlDbType.VarChar).Value = State;
                //cmd.Parameters.Add("@OnsiteLocation", SqlDbType.VarChar).Value = OnsiteLocation;
                cmd.Parameters.Add("@Budget", SqlDbType.Int).Value = Budget;
                //cmd.Parameters.Add("@BudgetType", SqlDbType.Int).Value = BudgetType;
                //cmd.Parameters.Add("@IsBudgetShared", SqlDbType.Int).Value = IsBudgetShard;
                //cmd.Parameters.Add("@QueryForPartner", SqlDbType.NVarChar).Value = QueryForPartner;
                //cmd.Parameters.Add("@Urgency", SqlDbType.NVarChar).Value = Urgency;

                //Customer Info
                cmd.Parameters.Add("@email", SqlDbType.NVarChar).Value = email;
                cmd.Parameters.Add("@CompanyName", SqlDbType.NVarChar).Value = CompanyName;
               // cmd.Parameters.Add("@CompanyIndustry", SqlDbType.NVarChar).Value = companyIndustry;
                //cmd.Parameters.Add("@CompanyProfile", SqlDbType.VarChar).Value = companyProfile;
                //cmd.Parameters.Add("@CompanyType", SqlDbType.VarChar).Value = companyType;
                cmd.Parameters.Add("@ContactNumber", SqlDbType.NVarChar).Value = contactNumber;
                
                cmd.Parameters.Add("@RequestId", SqlDbType.Int);
                cmd.Parameters["@RequestId"].Direction = ParameterDirection.Output;
                con.Open();
                cmd.ExecuteNonQuery();
                requestid = Convert.ToInt32(cmd.Parameters["@RequestId"].Value);
                con.Close();

            }
            return requestid;
        }
        public int PostTalentRequest(ref int customerId, string email, string companyName, string companyIndustry, string companyType, string companyProfile, string contactNumber,string password)
        {
              int requestid;
            string connectionstring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionstring))
            {
                SqlCommand cmd = new SqlCommand("proc_PostTalentRequest", con);
                cmd.CommandType = CommandType.StoredProcedure;

                //cmd.Parameters.Add("@CustomerId", SqlDbType.Int).Value = CustomerId;
                cmd.Parameters.Add("@ServiceId", SqlDbType.Int).Value = ServiceId;
                cmd.Parameters.Add("@Title", SqlDbType.NVarChar).Value = Title;
                cmd.Parameters.Add("@Description", SqlDbType.NVarChar).Value = Description;
                cmd.Parameters.Add("@SkillRequired", SqlDbType.NVarChar).Value = SkillRequired;
                cmd.Parameters.Add("@TalentType", SqlDbType.Int).Value = TalentType;
                cmd.Parameters.Add("@Basic", SqlDbType.Int).Value = Basic;
                cmd.Parameters.Add("@Intermediate", SqlDbType.Int).Value = Intermediate;
                cmd.Parameters.Add("@Expert", SqlDbType.Int).Value = Expert;
                cmd.Parameters.Add("@BasicHours", SqlDbType.Int).Value = BasicHours;
                cmd.Parameters.Add("@IntermediateHours", SqlDbType.Int).Value = IntermediateHours;
                cmd.Parameters.Add("@ExpertHours", SqlDbType.Int).Value = ExpertHours;
                cmd.Parameters.Add("@TalentCount", SqlDbType.Int).Value = TalentCount;
                cmd.Parameters.Add("@Duration", SqlDbType.VarChar).Value = Duration;
                cmd.Parameters.Add("@WorkMode", SqlDbType.Int).Value = WorkMode;
                cmd.Parameters.Add("@States", SqlDbType.VarChar).Value = State;
                cmd.Parameters.Add("@OnsiteLocation", SqlDbType.VarChar).Value = OnsiteLocation;
                cmd.Parameters.Add("@Budget", SqlDbType.Int).Value = Budget;
                cmd.Parameters.Add("@BudgetType", SqlDbType.Int).Value = BudgetType;
                cmd.Parameters.Add("@IsBudgetShard", SqlDbType.Int).Value = IsBudgetShard;
                cmd.Parameters.Add("@QueryForPartner", SqlDbType.NVarChar).Value = QueryForPartner;
                cmd.Parameters.Add("@Urgency", SqlDbType.NVarChar).Value = Urgency;

                //Customer Info
                cmd.Parameters.Add("@email", SqlDbType.NVarChar).Value = email;
                cmd.Parameters.Add("@CompanyName", SqlDbType.NVarChar).Value = companyName;
                cmd.Parameters.Add("@CompanyIndustry", SqlDbType.NVarChar).Value = companyIndustry;
                cmd.Parameters.Add("@CompanyProfile", SqlDbType.VarChar).Value = companyProfile;
                cmd.Parameters.Add("@CompanyType", SqlDbType.VarChar).Value = companyType;
                cmd.Parameters.Add("@ContactNumber", SqlDbType.VarChar).Value = contactNumber;
                cmd.Parameters.Add("@Password", SqlDbType.VarChar).Value = password;

                cmd.Parameters.Add("@RequestId", SqlDbType.Int);
                cmd.Parameters["@RequestId"].Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@CustomerId", SqlDbType.Int);
                cmd.Parameters["@CustomerId"].Direction = ParameterDirection.Output;
                con.Open();
                cmd.ExecuteNonQuery();
                requestid = Convert.ToInt32(cmd.Parameters["@RequestId"].Value);

                customerId = Convert.ToInt32(cmd.Parameters["@customerId"].Value);
                con.Close();

            }
             return requestid;
        }

        // krishan create method 27-04-2020 Signinpostrequest 
        public int SigninPostRequest(string email)
        {
            int requestid;
            string connectionstring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionstring))
            {
                SqlCommand cmd = new SqlCommand("proc_SigninPostRequest", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@CustomerId", SqlDbType.Int).Value = CustomerId;
                cmd.Parameters.Add("@ServiceId", SqlDbType.Int).Value = ServiceId;
                cmd.Parameters.Add("@Title", SqlDbType.NVarChar).Value = Title;
                cmd.Parameters.Add("@Description", SqlDbType.NVarChar).Value = Description;
               
                cmd.Parameters.Add("@State", SqlDbType.VarChar).Value = State;
                cmd.Parameters.Add("@OnsiteLocation", SqlDbType.VarChar).Value = OnsiteLocation;
                cmd.Parameters.Add("@Budget", SqlDbType.Int).Value = Budget;
                cmd.Parameters.Add("@BudgetType", SqlDbType.Int).Value = BudgetType;
                

                //Customer Info
                cmd.Parameters.Add("@email", SqlDbType.NVarChar).Value = email;
               

                cmd.Parameters.Add("@RequestId", SqlDbType.Int);
                cmd.Parameters["@RequestId"].Direction = ParameterDirection.Output;
                con.Open();
                cmd.ExecuteNonQuery();
                requestid = Convert.ToInt32(cmd.Parameters["@RequestId"].Value);
                con.Close();

            }
            return requestid;
        }

        //end
        public int SigninPostTalentRequest(string email, string companyName, string companyIndustry, string companyType, string companyProfile, string contactNumber)
        {
            int requestid;
            string connectionstring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionstring))
            {
                SqlCommand cmd = new SqlCommand("proc_SigninPostTalentRequest", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@CustomerId", SqlDbType.Int).Value = CustomerId;
                cmd.Parameters.Add("@ServiceId", SqlDbType.Int).Value = ServiceId;
                cmd.Parameters.Add("@Title", SqlDbType.NVarChar).Value = Title;
                cmd.Parameters.Add("@Description", SqlDbType.NVarChar).Value = Description;
                cmd.Parameters.Add("@SkillRequired", SqlDbType.NVarChar).Value = SkillRequired;
                cmd.Parameters.Add("@TalentType", SqlDbType.Int).Value = TalentType;
                cmd.Parameters.Add("@Basic", SqlDbType.Int).Value = Basic;
                cmd.Parameters.Add("@Intermediate", SqlDbType.Int).Value = Intermediate;
                cmd.Parameters.Add("@Expert", SqlDbType.Int).Value = Expert;
                cmd.Parameters.Add("@BasicHours", SqlDbType.Int).Value = BasicHours;
                cmd.Parameters.Add("@IntermediateHours", SqlDbType.Int).Value = IntermediateHours;
                cmd.Parameters.Add("@ExpertHours", SqlDbType.Int).Value = ExpertHours;
                cmd.Parameters.Add("@TalentCount", SqlDbType.Int).Value = TalentCount;
                cmd.Parameters.Add("@Duration", SqlDbType.VarChar).Value = Duration;
                cmd.Parameters.Add("@WorkMode", SqlDbType.Int).Value = WorkMode;
                cmd.Parameters.Add("@States", SqlDbType.VarChar).Value = State;
                cmd.Parameters.Add("@OnsiteLocation", SqlDbType.VarChar).Value = OnsiteLocation;
                cmd.Parameters.Add("@Budget", SqlDbType.Int).Value = Budget;
                cmd.Parameters.Add("@BudgetType", SqlDbType.Int).Value = BudgetType;
                cmd.Parameters.Add("@IsBudgetShard", SqlDbType.Int).Value = IsBudgetShard;
                cmd.Parameters.Add("@QueryForPartner", SqlDbType.NVarChar).Value = QueryForPartner;
                cmd.Parameters.Add("@Urgency", SqlDbType.NVarChar).Value = Urgency;

                //Customer Info
                cmd.Parameters.Add("@email", SqlDbType.NVarChar).Value = email;
                cmd.Parameters.Add("@CompanyName", SqlDbType.NVarChar).Value = companyName;
                cmd.Parameters.Add("@CompanyIndustry", SqlDbType.NVarChar).Value = companyIndustry;
                cmd.Parameters.Add("@CompanyProfile", SqlDbType.VarChar).Value = companyProfile;
                cmd.Parameters.Add("@CompanyType", SqlDbType.VarChar).Value = companyType;
                cmd.Parameters.Add("@ContactNumber", SqlDbType.VarChar).Value = contactNumber;
                
                cmd.Parameters.Add("@RequestId", SqlDbType.Int);
                cmd.Parameters["@RequestId"].Direction = ParameterDirection.Output;
                con.Open();
                cmd.ExecuteNonQuery();
                requestid = Convert.ToInt32(cmd.Parameters["@RequestId"].Value);
                con.Close();

            }
            return requestid;
        }
               
       
        
       
        public int SubmitProject(string consultantEmail,string projectType)
        {
            //Email
            string customerName = string.Empty;
            string customerEmail = string.Empty;
            string partnerEmails = string.Empty;
            string subCategory = string.Empty;
            
            //End Email
            //DataTable dtNewProject = new DataTable();

            int projectId;
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_SubmitProject", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;


                command.Parameters.Add("@requestId", SqlDbType.Int).Value = RequestId;
                command.Parameters.Add("@consultantEmail", SqlDbType.NVarChar).Value = consultantEmail;
                command.Parameters.Add("@serviceId", SqlDbType.Int).Value = ServiceId;
                command.Parameters.Add("@title", SqlDbType.NVarChar).Value = Title;
                command.Parameters.Add("@description", SqlDbType.NVarChar).Value = Description;

                command.Parameters.Add("@outsourceType", SqlDbType.Int).Value = OutsourceType;
                command.Parameters.Add("@TalentType", SqlDbType.Int).Value = TalentType;
                command.Parameters.Add("@Basic", SqlDbType.Int).Value = Basic;
                command.Parameters.Add("@Intermediate", SqlDbType.Int).Value = Intermediate;
                command.Parameters.Add("@Expert", SqlDbType.Int).Value = Expert;
                command.Parameters.Add("@BasicHours", SqlDbType.Int).Value = BasicHours;
                command.Parameters.Add("@IntermediateHours", SqlDbType.Int).Value = IntermediateHours;
                command.Parameters.Add("@ExpertHours", SqlDbType.Int).Value = ExpertHours;
                command.Parameters.Add("@TalentCount", SqlDbType.Int).Value = TalentCount;
                command.Parameters.Add("@WorkMode", SqlDbType.Int).Value = WorkMode;
                command.Parameters.Add("@States", SqlDbType.VarChar).Value = State;  //krishan add line
                command.Parameters.Add("@OnsiteLocation", SqlDbType.NVarChar).Value = OnsiteLocation;   //krishan add line
                //if (OutsourceType == 3)
                //{
                //    command.Parameters.Add("@talentCount", SqlDbType.Int).Value = TalentCount;
                //    command.Parameters.Add("@talentWorkMode", SqlDbType.Int).Value = WorkMode;
                //    command.Parameters.Add("@talenOnsiteLocation", SqlDbType.NVarChar).Value = OnsiteLocation;
                //    command.Parameters.Add("@talentProficiency", SqlDbType.Int).Value = TalentProficiency;
                //}

                command.Parameters.Add("@budget", SqlDbType.Int).Value = Budget;
                command.Parameters.Add("@budgetType", SqlDbType.Int).Value = BudgetType;
                command.Parameters.Add("@duration", SqlDbType.VarChar).Value = Duration;
                command.Parameters.Add("@skills", SqlDbType.NVarChar).Value = SkillRequired;
                command.Parameters.Add("@IsBudgetShard", SqlDbType.Int).Value = IsBudgetShard;
                command.Parameters.Add("@queryForPartner", SqlDbType.NVarChar).Value = QueryForPartner;
               
                command.Parameters.Add("@status", SqlDbType.Int).Value = Status;
                command.Parameters.Add("@Urgency", SqlDbType.NVarChar).Value = Urgency;           //krishan add line
                command.Parameters.Add("@statusComment", SqlDbType.NVarChar).Value = StatusComment;
                command.Parameters.Add("@projectType", SqlDbType.VarChar).Value = projectType; //krishan add line
                command.Parameters.Add("@projectId", SqlDbType.Int);
                command.Parameters["@projectid"].Direction = ParameterDirection.Output;

                //bccEmail
                command.Parameters.Add("@partnerEmailList", SqlDbType.NVarChar, -1);
                command.Parameters["@partnerEmailList"].Direction = ParameterDirection.Output;

                command.Parameters.Add("@subcategory", SqlDbType.VarChar, 100);
                command.Parameters["@subcategory"].Direction = ParameterDirection.Output;
                //End

                //Email
                command.Parameters.Add("@customerName", SqlDbType.VarChar, 100);
                command.Parameters.Add("@customerEmail", SqlDbType.VarChar, 100);
                command.Parameters["@customerName"].Direction = ParameterDirection.Output;
                command.Parameters["@customerEmail"].Direction = ParameterDirection.Output;
                //End - Email

                command.CommandType = CommandType.StoredProcedure;
                sqlConnection.Open();
                command.ExecuteNonQuery();
                projectId = Convert.ToInt32(command.Parameters["@projectId"].Value);

                //Email
                customerName = command.Parameters["@customerName"].Value.ToString();
                customerEmail = command.Parameters["@customerEmail"].Value.ToString();

                //End - Email

                //bccEmail
                partnerEmails = command.Parameters["@partnerEmailList"].Value.ToString();

                subCategory = command.Parameters["@subCategory"].Value.ToString();
                //End
                sqlConnection.Close();
            }

            if(Status == 6)
            {
                //Email
                System.Threading.Thread email = new System.Threading.Thread(delegate ()
                {
                    string subject = "Great! Your Project is Live for Bidding";
                    string body = "<p><b>Project Title -</b> " + Title + "</p><p>Your Project is now live on benchkart. Our expert agencies will now start bidding on your project. It will take around 48 hrs for the top bids to reflect in your dashboard, after the algorithm based matching and the automated bidding & review process. It will be worth the wait!!</p><p>You can then compare the bids and select the best bid/agency suited for your project requirement. You can watch a 3 min Video to understand the entire process: <a href=\"https://www.youtube.com/watch?v=Ce1ocIxwDgs\">Watch Video</a></p>";
                    ClsMail.SendEmail(customerName, customerEmail, subject, body);

                    //Email
                    if (partnerEmails != string.Empty)
                    {
                        subject = "<b>New Project -</b> " + subCategory;
                        body = "<p>There is a new project LEAD in your dashboard.</p><p><b>Project Title -</b> " + Title + "</p><p><b>Sub-Category -</b> " + subCategory + "</p><p><b>Description -</b>" + Description + "</p><p><b>Status Comments -</b>" + StatusComment+ "</p><p>Post your BID before bidding timeframe (normally 12 - 48 Hrs*) closed for this project. To stop receiving project notifications over email, please write to outsource@benchkart.com.</p>";
                        ClsMail.SendBccEmail(partnerEmails, subject, body);
                    }
                    //End - Email

                });

                email.IsBackground = true;
                email.Start();

                //End - Email                

            }

            return projectId;

        }

        public int SubmitProjectManual(string consultantEmail, string projectType, ref string customerName,ref string customerEmail, ref string partnerEmails, ref string subCategory)
        {
            //Email
            //string customerName = string.Empty;
            //string customerEmail = string.Empty;
            //string partnerEmails = string.Empty;
            //string subCategory = string.Empty;

            //End Email
            //DataTable dtNewProject = new DataTable();

            int projectId;
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_SubmitProject", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;


                command.Parameters.Add("@requestId", SqlDbType.Int).Value = RequestId;
                command.Parameters.Add("@consultantEmail", SqlDbType.NVarChar).Value = consultantEmail;
                command.Parameters.Add("@serviceId", SqlDbType.Int).Value = ServiceId;
                command.Parameters.Add("@title", SqlDbType.NVarChar).Value = Title;
                command.Parameters.Add("@description", SqlDbType.NVarChar).Value = Description;

                command.Parameters.Add("@outsourceType", SqlDbType.Int).Value = OutsourceType;
                command.Parameters.Add("@TalentType", SqlDbType.Int).Value = TalentType;
                command.Parameters.Add("@Basic", SqlDbType.Int).Value = Basic;
                command.Parameters.Add("@Intermediate", SqlDbType.Int).Value = Intermediate;
                command.Parameters.Add("@Expert", SqlDbType.Int).Value = Expert;
                command.Parameters.Add("@BasicHours", SqlDbType.Int).Value = BasicHours;
                command.Parameters.Add("@IntermediateHours", SqlDbType.Int).Value = IntermediateHours;
                command.Parameters.Add("@ExpertHours", SqlDbType.Int).Value = ExpertHours;
                command.Parameters.Add("@TalentCount", SqlDbType.Int).Value = TalentCount;
                command.Parameters.Add("@WorkMode", SqlDbType.Int).Value = WorkMode;
                command.Parameters.Add("@States", SqlDbType.VarChar).Value = State;  //krishan add line
                command.Parameters.Add("@OnsiteLocation", SqlDbType.NVarChar).Value = OnsiteLocation;   //krishan add line
                //if (OutsourceType == 3)
                //{
                //    command.Parameters.Add("@talentCount", SqlDbType.Int).Value = TalentCount;
                //    command.Parameters.Add("@talentWorkMode", SqlDbType.Int).Value = WorkMode;
                //    command.Parameters.Add("@talenOnsiteLocation", SqlDbType.NVarChar).Value = OnsiteLocation;
                //    command.Parameters.Add("@talentProficiency", SqlDbType.Int).Value = TalentProficiency;
                //}

                command.Parameters.Add("@budget", SqlDbType.Int).Value = Budget;
                command.Parameters.Add("@budgetType", SqlDbType.Int).Value = BudgetType;
                command.Parameters.Add("@duration", SqlDbType.VarChar).Value = Duration;
                command.Parameters.Add("@skills", SqlDbType.NVarChar).Value = SkillRequired;
                command.Parameters.Add("@IsBudgetShard", SqlDbType.Int).Value = IsBudgetShard;
                command.Parameters.Add("@queryForPartner", SqlDbType.NVarChar).Value = QueryForPartner;

                command.Parameters.Add("@status", SqlDbType.Int).Value = Status;
                command.Parameters.Add("@Urgency", SqlDbType.NVarChar).Value = Urgency;           //krishan add line
                command.Parameters.Add("@statusComment", SqlDbType.NVarChar).Value = StatusComment;
                command.Parameters.Add("@projectType", SqlDbType.VarChar).Value = projectType; //krishan add line
                command.Parameters.Add("@projectId", SqlDbType.Int);
                command.Parameters["@projectid"].Direction = ParameterDirection.Output;

                //bccEmail
                command.Parameters.Add("@partnerEmailList", SqlDbType.NVarChar, -1);
                command.Parameters["@partnerEmailList"].Direction = ParameterDirection.Output;

                command.Parameters.Add("@subcategory", SqlDbType.VarChar, 100);
                command.Parameters["@subcategory"].Direction = ParameterDirection.Output;
                //End

                //Email
                command.Parameters.Add("@customerName", SqlDbType.VarChar, 100);
                command.Parameters.Add("@customerEmail", SqlDbType.VarChar, 100);
                command.Parameters["@customerName"].Direction = ParameterDirection.Output;
                command.Parameters["@customerEmail"].Direction = ParameterDirection.Output;
                //End - Email

                command.CommandType = CommandType.StoredProcedure;
                sqlConnection.Open();
                command.ExecuteNonQuery();
                projectId = Convert.ToInt32(command.Parameters["@projectId"].Value);

                //Email
                customerName = command.Parameters["@customerName"].Value.ToString();
                customerEmail = command.Parameters["@customerEmail"].Value.ToString();

                //End - Email

                //bccEmail
                partnerEmails = command.Parameters["@partnerEmailList"].Value.ToString();

                subCategory = command.Parameters["@subCategory"].Value.ToString();
                //End
                sqlConnection.Close();
            }

            //if (Status == 6)
            //{
            //    //Email
            //    System.Threading.Thread email = new System.Threading.Thread(delegate ()
            //    {
            //        string subject = "Great! Your Project is Live for Bidding";
            //        string body = "<p><b>Project Title -</b> " + Title + "</p><p>Your Project is now live on benchkart. Our expert agencies will now start bidding on your project. It will take around 48 hrs for the top bids to reflect in your dashboard, after the algorithm based matching and the automated bidding & review process. It will be worth the wait!!</p><p>You can then compare the bids and select the best bid/agency suited for your project requirement. You can watch a 3 min Video to understand the entire process: <a href=\"https://www.youtube.com/watch?v=Ce1ocIxwDgs\">Watch Video</a></p>";
            //        ClsMail.SendEmail(customerName, customerEmail, subject, body);

            //        //Email
            //        if (partnerEmails != string.Empty)
            //        {
            //            subject = "<b>New Project -</b> " + subCategory;
            //            body = "<p>There is a new project LEAD in your dashboard.</p><p><b>Project Title -</b> " + Title + "</p><p><b>Sub-Category -</b> " + subCategory + "</p><p><b>Description -</b> </p><p>" + Description + "</p><p><b>Status Comments -</b>" + StatusComment + "</p><p>Post your BID before bidding timeframe (normally 12 - 48 Hrs*) closed for this project. To stop receiving project notifications over email, please write to outsource@benchkart.com.</p>";
            //            ClsMail.SendBccEmail(partnerEmails, subject, body);
            //        }
            //        //End - Email

            //    });

            //    email.IsBackground = true;
            //    email.Start();

            //    //End - Email                

            //}

            return projectId;

        }

        public DataTable UpdateStatus(string consultantEmail)
        {
            DataTable dtNewProject = new DataTable();

            //int requestId;
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_UpdateStatus", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("@requestId", SqlDbType.Int).Value = RequestId;
                command.Parameters.Add("@consultantEmail", SqlDbType.NVarChar).Value = consultantEmail;
                command.Parameters.Add("@status", SqlDbType.Int).Value = Status;
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

        public DataTable GetRequestList( ref int requestStatus)
        {
            DataTable dtRequestList = new DataTable();
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_GetRequestList", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("@requestStatus", SqlDbType.Int).Value = requestStatus;

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
        
        //krishan create method 24-01-2020

        public void PostProjectRequestCunsultant(string FullName,string Email,string ContactNumber,string CompanyName)
        {
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                sqlConnection.Open();
                SqlCommand command = new SqlCommand("proc_PostProjectRequestCunsultant", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("@FullName", SqlDbType.VarChar).Value = FullName;
                command.Parameters.Add("@Email", SqlDbType.VarChar).Value = Email;
                command.Parameters.Add("@ContactNumber", SqlDbType.VarChar).Value = ContactNumber;
                command.Parameters.Add("@CompanyName", SqlDbType.VarChar).Value = CompanyName;
              //  command.Parameters.Add("@CustomerId", SqlDbType.Int).Value = CustomerId;
                command.Parameters.Add("@ServiceId", SqlDbType.Int).Value = ServiceId;
                command.Parameters.Add("@Title", SqlDbType.NVarChar).Value = Title;
                command.Parameters.Add("@Description", SqlDbType.NVarChar).Value = Description;
                command.Parameters.Add("@OutSourceType", SqlDbType.Int).Value = OutsourceType;
                command.Parameters.Add("@TalentType", SqlDbType.Int).Value = TalentType;
                command.Parameters.Add("@Basic", SqlDbType.Int).Value = Basic;
                command.Parameters.Add("@BasicHours", SqlDbType.Int).Value = BasicHours;
                command.Parameters.Add("@Intermediate", SqlDbType.Int).Value = Intermediate;
                command.Parameters.Add("@IntermediateHours", SqlDbType.Int).Value = IntermediateHours;
                command.Parameters.Add("@Expert", SqlDbType.Int).Value = Expert;
                command.Parameters.Add("@ExpertHours", SqlDbType.Int).Value = ExpertHours;
                command.Parameters.Add("@TalentCount", SqlDbType.Int).Value = TalentCount;
                command.Parameters.Add("@Duration", SqlDbType.VarChar).Value = Duration;
                command.Parameters.Add("@WorkMode", SqlDbType.Int).Value = WorkMode;
                command.Parameters.Add("@States", SqlDbType.VarChar).Value = State;
                command.Parameters.Add("@OnsiteLocation", SqlDbType.VarChar).Value = OnsiteLocation;
                command.Parameters.Add("@SkillRequired", SqlDbType.NVarChar).Value = SkillRequired;
                command.Parameters.Add("@Budget", SqlDbType.Int).Value = Budget;
                command.Parameters.Add("@BudgetType", SqlDbType.Int).Value = BudgetType;
                command.Parameters.Add("@IsBudgetShared", SqlDbType.Int).Value = IsBudgetShard;
                command.Parameters.Add("@QueryForPartner", SqlDbType.NVarChar).Value = QueryForPartner;
                command.Parameters.Add("@Urgency", SqlDbType.NVarChar).Value = Urgency;
                command.Parameters.Add("@StatusComment", SqlDbType.NVarChar).Value = StatusComment;
                command.ExecuteNonQuery();
                sqlConnection.Close();
            }
        }

        // krishan create method 27-01-2020

        public DataTable GetRequestListForAdminSearchByStatus(string requestStatus)
        {
            DataTable dtRequestList = new DataTable();
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_GetRequestListForAdminSearchByStatus", sqlConnection);
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
        public DataTable GetRequestListForAdmin()
        {
            DataTable dtRequestList = new DataTable();
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_GetRequestListForAdmin", sqlConnection);
                command.CommandType = CommandType.StoredProcedure;

              

                using (var da = new SqlDataAdapter(command))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    da.Fill(dtRequestList);
                }
                sqlConnection.Close();
            }
            return dtRequestList;
        }
        public DataTable SearchRequestForAdmin(string contact)
        {
            DataTable dtSearchResult = new DataTable();
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection sqlConnection = new SqlConnection(dbConnectionString))
            {
                SqlCommand command = new SqlCommand("proc_SearchRequestForAdmin", sqlConnection);
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