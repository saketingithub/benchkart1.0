using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace Benchkart.Customer
{
    public partial class Signin_Post_Talent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetSetCustomerCompanyDetails();
                //ddlTalentCount.Items.Insert(0, new ListItem("--Select TalentCount--", "0"));
                //for (int i = 1; i <= 100; i++)
                //{
                //    ddlTalentCount.Items.Insert(i, new ListItem(i.ToString(), i.ToString()));
                //}
                ddlBasic.Items.Insert(0, new ListItem("Select", "0"));
                for (int i = 1; i <= 100; i++)
                {
                    ddlBasic.Items.Insert(i, new ListItem(i.ToString(), i.ToString()));
                }
                ddlIntermediate.Items.Insert(0, new ListItem("Select", "0"));
                for (int i = 1; i <= 100; i++)
                {
                    ddlIntermediate.Items.Insert(i, new ListItem(i.ToString(), i.ToString()));
                }
                ddlExpert.Items.Insert(0, new ListItem("Select", "0"));
                for (int i = 1; i <= 100; i++)
                {
                    ddlExpert.Items.Insert(i, new ListItem(i.ToString(), i.ToString()));
                }
                ddlBasicPartTime.Items.Insert(0, new ListItem("Select", "0"));
                for (int i = 1; i <= 100; i++)
                {
                    ddlBasicPartTime.Items.Insert(i, new ListItem(i.ToString(), i.ToString()));
                }
                ddlIntermediatePartTime.Items.Insert(0, new ListItem("Select", "0"));
                for (int i = 1; i <= 100; i++)
                {
                    ddlIntermediatePartTime.Items.Insert(i, new ListItem(i.ToString(), i.ToString()));
                }
                ddlExpertPartTime.Items.Insert(0, new ListItem("Select", "0"));
                for (int i = 1; i <= 100; i++)
                {
                    ddlExpertPartTime.Items.Insert(i, new ListItem(i.ToString(), i.ToString()));
                }
                ddlBasicHoursperWeek.Items.Insert(0, new ListItem("Select", "0"));
                for (int i = 1; i <= 50; i++)
                {
                    ddlBasicHoursperWeek.Items.Insert(i, new ListItem(i.ToString(), i.ToString()));
                }
                ddlIntermediateHoursperWeek.Items.Insert(0, new ListItem("Select", "0"));
                for (int i = 1; i <= 50; i++)
                {
                    ddlIntermediateHoursperWeek.Items.Insert(i, new ListItem(i.ToString(), i.ToString()));
                }
                ddlExpertHoursperWeek.Items.Insert(0, new ListItem("Select", "0"));
                for (int i = 1; i <= 50; i++)
                {
                    ddlExpertHoursperWeek.Items.Insert(i, new ListItem(i.ToString(), i.ToString()));
                }

                string serviceId = string.Empty;
                if (Request.QueryString["id"] != null)
                {
                    serviceId = Request.QueryString["id"].ToString();

                    ddlCategory.Items.FindByValue(serviceId).Selected = true;
                    SetSubCategory(Convert.ToInt32(serviceId));

                }

                GetStateFullTime();
                GetStatePartTime();
            }
        }

        public void GetSetCustomerCompanyDetails()
        {
            //int customerId = Convert.ToInt32(Session["CustomerId"]);
            int customerId = 0;
            if (Session["CustomerId"] != null)
            {
                customerId = Convert.ToInt32(Session["CustomerId"].ToString());
            }
            else
            {
                customerId = Convert.ToInt32(Request.Cookies["CustomerId"].Value);
            }

            ClsCustomer cs = new ClsCustomer();
            cs.CustomerId = customerId;

            DataTable dtCompany = cs.GetSetCustomerCompanyDetails();

            if (dtCompany.Rows[0]["CompanyIndustry"] != DBNull.Value)
            {
                ddlIndustry.SelectedValue = dtCompany.Rows[0]["CompanyIndustry"].ToString();
            }
            if (dtCompany.Rows[0]["CompanyType"] != DBNull.Value)
            {
                ddlTypeofCompany.SelectedValue = dtCompany.Rows[0]["CompanyType"].ToString();
            }
            if (dtCompany.Rows[0]["CompanyName"] != DBNull.Value)
            {
                txtCompanyName.Text = dtCompany.Rows[0]["CompanyName"].ToString();
            }
            if (dtCompany.Rows[0]["CompanyProfile"] != DBNull.Value)
            {
                txtCompanyIntroduce.Text = dtCompany.Rows[0]["CompanyProfile"].ToString();
            }
            if (dtCompany.Rows[0]["ContactNumber"] != DBNull.Value)
            {
                txtContactNumber.Text = dtCompany.Rows[0]["ContactNumber"].ToString();
            }

        }

        public void GetStateFullTime()
        {
            ClsCity ct = new ClsCity();

            DataSet dsStates = new DataSet();
            dsStates = ct.LoadStates();

            ddlStatesFullTime.DataSource = dsStates.Tables[0];
            ddlStatesFullTime.DataTextField = "State";
            ddlStatesFullTime.DataValueField = "StateId";
            ddlStatesFullTime.DataBind();

            ddlStatesFullTime.Items.Insert(0, new ListItem("Select State", ""));
            // ddlCities.Items.Insert(0, new ListItem("Select City", ""));


        }
        public void GetStatePartTime()
        {
            ClsCity ct = new ClsCity();

            DataSet dsStates = new DataSet();
            dsStates = ct.LoadStates();

            ddlStatesPartTime.DataSource = dsStates.Tables[0];
            ddlStatesPartTime.DataTextField = "State";
            ddlStatesPartTime.DataValueField = "StateId";
            ddlStatesPartTime.DataBind();

            ddlStatesPartTime.Items.Insert(0, new ListItem("Select State", ""));
            // ddlCities.Items.Insert(0, new ListItem("Select City", ""));


        }
        public void SetSubCategory(int serviceId)
        {
            // ddlSubCategory.Items.Clear();

            ClsServiceMaster sm = new ClsServiceMaster();
            DataTable dtSubCategory = sm.GetSubCategory(serviceId);
            ddlSubCategory.DataSource = dtSubCategory;
            ddlSubCategory.DataValueField = "ServiceId";
            ddlSubCategory.DataTextField = "Title";
            ddlSubCategory.DataBind();
            //ddlSubCategory.Items.Insert(0, new ListItem("-Any SubCategory-", "0"));
            //ddlSubCategory.Items.FindByValue("0").Selected = true;
        }
        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            int serviceId = Convert.ToInt32(ddlCategory.SelectedValue);
            SetSubCategory(serviceId);
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            
            ClsRequest clsreq = new ClsRequest();

            //string email = Session["emailId"].ToString();
            string email = string.Empty;
            if (Session["emailId"] != null)
            {
                email = Session["emailId"].ToString();
            }
            else
            {
                email = Request.Cookies["emailId"].Value.ToString();
            }

            string companyName = txtCompanyName.Text;
            string companyIndustry = ddlIndustry.SelectedValue;
            string companyType = ddlTypeofCompany.SelectedItem.Text;
            string companyProfile = txtCompanyIntroduce.Text;

            string contactNumber = txtContactNumber.Text;


            //clsreq.CustomerId = Convert.ToInt32(Session["CustomerId"]);
            clsreq.CustomerId = 0;
            if (Session["CustomerId"] != null)
            {
                clsreq.CustomerId = Convert.ToInt32(Session["CustomerId"].ToString());
            }
            else
            {
                clsreq.CustomerId = Convert.ToInt32(Request.Cookies["CustomerId"].Value);
            }


            clsreq.ServiceId = Convert.ToInt32(ddlSubCategory.SelectedValue);
            clsreq.Title = txtProjectTitle.Text;
            clsreq.Description = txtProjectDescription.Text;

            if (rblYesSelect.Checked == true)
            {
                clsreq.TalentType = 1;
                clsreq.Basic = Convert.ToInt32(ddlBasic.SelectedValue);
                clsreq.Intermediate = Convert.ToInt32(ddlIntermediate.SelectedValue);
                clsreq.Expert = Convert.ToInt32(ddlExpert.SelectedValue);
                clsreq.BasicHours = Convert.ToInt32(ddlBasicHoursperWeek.SelectedValue);
                clsreq.IntermediateHours = Convert.ToInt32(ddlIntermediateHoursperWeek.SelectedValue);
                clsreq.ExpertHours = Convert.ToInt32(ddlExpertHoursperWeek.SelectedValue);
                clsreq.TalentCount = Int32.Parse(hidden.Value);
                clsreq.Duration = txtRoleDurationfulltime.Text;
                clsreq.WorkMode = Convert.ToInt32(ddlWorkMode.SelectedValue);
                clsreq.State = ddlStatesFullTime.SelectedValue;
                clsreq.OnsiteLocation = ddlCitiesFullTime.SelectedValue;

            }
            else
            {
                clsreq.TalentType = 0;
                clsreq.Basic = Convert.ToInt32(ddlBasicPartTime.SelectedValue);
                clsreq.Intermediate = Convert.ToInt32(ddlIntermediatePartTime.SelectedValue);
                clsreq.Expert = Convert.ToInt32(ddlExpertPartTime.SelectedValue);
                clsreq.BasicHours = Convert.ToInt32(ddlBasicHoursperWeek.SelectedValue);
                clsreq.IntermediateHours = Convert.ToInt32(ddlIntermediateHoursperWeek.SelectedValue);
                clsreq.ExpertHours = Convert.ToInt32(ddlExpertHoursperWeek.SelectedValue);
                clsreq.TalentCount = Int32.Parse(hidden.Value);
                clsreq.Duration = txtDurationPartTime.Text;
                clsreq.WorkMode = Convert.ToInt32(ddlWorkMode.SelectedValue);
                clsreq.State = ddlStatesPartTime.SelectedValue;
                clsreq.OnsiteLocation = ddlCitiesPartTime.SelectedValue;
            }

            clsreq.SkillRequired = txtSkills.Text;

            if (txtBudgetOpional.Text != string.Empty)
            {
                clsreq.Budget = int.Parse(txtBudgetOpional.Text);
            }
            clsreq.BudgetType = Convert.ToInt32(rblBudgetType.SelectedValue);
            clsreq.Urgency = rblUrgency.SelectedValue;
            clsreq.QueryForPartner = txtInstructions.Text;
            clsreq.IsBudgetShard = 1;
            int requestss = clsreq.SigninPostTalentRequest(email, companyName, companyIndustry, companyType, companyProfile, contactNumber);
            SendEmailSubmit(email);
            string newPath = string.Empty;
            HttpFileCollection fileCollection = Request.Files;
            if (Request.Files.Count > 0 && Request.Files[0].ContentLength > 0)
            {
                // Mention the directory name where you want to create sub directories.
                string strMainFolderPath = Server.MapPath("~/UploadFiles/ProjectAttachments/");

                //Create a new subfolder in the main folder.
                newPath = System.IO.Path.Combine(strMainFolderPath, requestss.ToString());

                DirectoryInfo objDirectory = new DirectoryInfo(newPath);
                if (!objDirectory.Exists)
                {
                    System.IO.Directory.CreateDirectory(newPath);
                }


                for (int i = 0; i < fileCollection.Count; i++)
                {
                    HttpPostedFile uploadfile = fileCollection[i];
                    string fileName = Path.GetFileName(uploadfile.FileName);
                    //if (uploadfile.ContentLength > 0)
                    //{
                    uploadfile.SaveAs(newPath + "\\" + fileName);
                    //}
                }
            }
            //Response.Redirect("Projects_Dashboard.aspx");
            Response.Write("<script>alert('Your project has been successfuly posted for review.');window.location='../Customer/Projects_Dashboard.aspx';</script>");
        }
        public void SendEmailSubmit(string email)
        {
            //Email
            System.Threading.Thread emailThread = new System.Threading.Thread(delegate ()
            {
                string subject = "Thanks for posting your company requirement";
                string body = "<p>Thanks for posting your project on Benchkart. Your project will be shortly live after review.</p><p>Benchkart has the network of curated agencies which will give their best bids to make your project a success.</p>";

                ClsMail.SendEmail(string.Empty, email, subject, body);

            });

            emailThread.IsBackground = true;
            emailThread.Start();

            //End - Email
        }
    protected void ddlStatesFullTime_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlStatesFullTime.Attributes.Add("Style", "display:block;");
            ddlCitiesFullTime.Attributes.Add("Style", "display:block;");
            DataTable dtCities = new DataTable();
            ddlCitiesFullTime.Items.Clear();

            int stateId = int.Parse(ddlStatesFullTime.SelectedItem.Value);
            if (stateId > 0)
            {
                ClsCity ct = new ClsCity();
                dtCities = ct.BindCities(stateId);

                ddlCitiesFullTime.DataSource = dtCities;
                ddlCitiesFullTime.DataTextField = "City";
                ddlCitiesFullTime.DataValueField = "CityId";
                ddlCitiesFullTime.DataBind();
            }
            ddlCitiesFullTime.Items.Insert(0, new ListItem("Select City", "0"));
        }

        protected void ddlStatesPartTime_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlStatesPartTime.Attributes.Add("Style", "display:block;");
            ddlCitiesPartTime.Attributes.Add("Style", "display:block;");
            DataTable dtCities = new DataTable();
            ddlCitiesPartTime.Items.Clear();

            int stateId = int.Parse(ddlStatesPartTime.SelectedItem.Value);
            if (stateId > 0)
            {
                ClsCity ct = new ClsCity();
                dtCities = ct.BindCities(stateId);

                ddlCitiesPartTime.DataSource = dtCities;
                ddlCitiesPartTime.DataTextField = "City";
                ddlCitiesPartTime.DataValueField = "CityId";
                ddlCitiesPartTime.DataBind();
            }
            ddlCitiesPartTime.Items.Insert(0, new ListItem("Select City", "0"));
        }

        protected void lnkSignOut_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            Session.RemoveAll();
            Response.Redirect("~/");
        }
    }
}