using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace Benchkart.Customer
{
    public partial class Signin_Post_Project : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HtmlGenericControl li_Signin_Post_Project = (HtmlGenericControl)Master.FindControl("li_Signin_Post_Project");
                li_Signin_Post_Project.Style.Add("background-color", "white");

                GetSetCustomerCompanyDetails();
                string serviceId = string.Empty;
                if (Request.QueryString["id"] != null)
                {
                    serviceId = Request.QueryString["id"].ToString();

                   // ddlCategory.Items.FindByValue(serviceId).Selected = true;
                    SetSubCategory(Convert.ToInt32(serviceId));

                }
              
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

            DataTable dtCompany =  cs.GetSetCustomerCompanyDetails();

            
            if (dtCompany.Rows[0]["CompanyName"] != DBNull.Value)
            {
                txtCompanyName.Text = dtCompany.Rows[0]["CompanyName"].ToString();
            }
          
            if (dtCompany.Rows[0]["ContactNumber"] != DBNull.Value)
            {
                txtContactNumber.Text = dtCompany.Rows[0]["ContactNumber"].ToString();
            }

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
           // ddlSubCategory.Items.Insert(0, new ListItem("Select Project SubCategory", " "));
            //ddlSubCategory.Items.FindByValue("0").Selected = true;
        }
        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            int serviceId = Convert.ToInt32(ddlCategory.SelectedValue);
            SetSubCategory(serviceId);
            ClsServiceMaster sm = new ClsServiceMaster();
            sm.ServiceId = Convert.ToInt32(ddlSubCategory.SelectedValue);
            //SetSubCategoryHint();
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

            string CompanyName = txtCompanyName.Text;
            //string companyIndustry = ddlIndustry.SelectedValue;
            //string companyType = ddlTypeofCompany.SelectedItem.Text;
            //string companyProfile = txtCompanyIntroduce.Text;            

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

            //clsreq.ServiceId = Convert.ToInt32(ddlCategory.SelectedValue);
            if (ddlSubCategory.SelectedValue == "0")
            {
                clsreq.ServiceId = Convert.ToInt32(ddlCategory.SelectedValue);
            }
            else
            {
                clsreq.ServiceId = Convert.ToInt32(ddlSubCategory.SelectedValue);
            }

            clsreq.Title = txtProjectTitle.Text;
            clsreq.Description = txtProjectDescription.Text;
            // clsreq.QueryForPartner = txtInstructions.Text;
            // clsreq.SkillRequired = txtSkills.Text;
            // clsreq.State = ddlStates.SelectedValue;
            // clsreq.OnsiteLocation = ddlCities.SelectedValue; ;
            // clsreq.Duration = txtRoleDuration.Text;
            if (rblbudgetoption.SelectedValue == "0")
            {
                if (ddlrupees.SelectedValue != "")
                {
                    clsreq.Budget = Convert.ToInt32(ddlrupees.SelectedValue);
                }
            }
            else
            {
                if (ddlusd.SelectedValue != "")
                {
                    clsreq.Budget = Convert.ToInt32(ddlusd.SelectedValue);
                }
            }
            // clsreq.Budget = Convert.ToInt32(txtbudgetopional.Text);
            // clsreq.BudgetType = Convert.ToInt32(rblBudgetType.SelectedValue);
            // clsreq.Urgency = rblUrgency.SelectedValue;
            //clsreq.IsBudgetShard = checkbox1.Checked ? 1 : 0;
            // clsreq.IsBudgetShard = 1;
            //clsreq.requestprojectcreatetalentdetails();
            int requestss = clsreq.SigninPostProjectRequest(email, CompanyName, contactNumber);
            //Anurag - comment due to latency;
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
            // Response.Redirect("Projects_Dashboard");
            Response.Write("<script>alert('Your project has been successfully posted for review.');window.location='../Customer/Projects_Dashboard';</script>");

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
      

      
       
    }
}