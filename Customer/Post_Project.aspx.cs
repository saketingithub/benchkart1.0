using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.IO;
using System.Net.Mail;
using System.Net;
using System.Text;

namespace Benchkart.Customer
{
    public partial class Post_Project1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                //string subject = "Thanks for posting your company requirement - " + DateTime.Now.ToString();
                //string body = "<p>Congratulations! DATE- " + DateTime.Now.ToString() + " Hundreds of companies are getting their projects executed end-to-end on Benchkart & you are joining them. Projects executed on Benchkart not only get you quality while saving your time & money, they also ensure that you have complete Peace Of Mind on matters related to security, payments & accountability.</p><p>Right now, your project is undergoing a short review & then will be live on platform. In case we require additional information, we may reach out to you on the email/phone number provided by you.</p><p>From now on, your Benchkart account becomes the place for action! Your shortlisted bids, contracts, project management, payments & reviews will all happen in your account.</p>";
                //ClsMail.SendEmail("Shri Krishan", "shrikrishan.goldcash@gmail.com", subject, body);
                pnlFirst.Attributes.Add("style", "display:block;");
                string serviceId = string.Empty;
                if (Request.QueryString["id"] != null)
                {
                    serviceId = Request.QueryString["id"].ToString();

                    //ddlCategory.Items.FindByValue(serviceId).Selected = true;
                    SetCategory(Convert.ToInt32(serviceId));
                   
                }

              

            }
        }
      
        public void SetCategory(int serviceId)
        {
            // ddlSubCategory.Items.Clear();
            
            ClsServiceMaster sm = new ClsServiceMaster();
            DataSet dtCategory = sm.GetCategory(serviceId);
            ddlCategory.DataSource = dtCategory.Tables[1];
            ddlCategory.DataValueField = "ServiceId";
            ddlCategory.DataTextField = "CategoryTitle";
            ddlCategory.DataBind();

            ddlSubCategory.DataSource = dtCategory.Tables[0];
            ddlSubCategory.DataValueField = "ServiceId";
            ddlSubCategory.DataTextField = "SubcategoryTitle";
            ddlSubCategory.DataBind();
            //ddlSubCategory.Items.Insert(0, new ListItem("-Any SubCategory-", "0"));
            string categoryId = string.Empty;
            categoryId = dtCategory.Tables[0].Rows[0]["ParentId"].ToString();
            ddlCategory.Items.FindByValue(categoryId).Selected = true;
            ddlSubCategory.Items.FindByValue(serviceId.ToString()).Selected = true;
        }


        public void SetSubCategory(int serviceId)
        {
            // ddlSubCategory.Items.Clear();

            ClsServiceMaster sm = new ClsServiceMaster();
            DataTable dtSubCategory = sm.GetSubCategory(serviceId);
            ddlSubCategory.DataSource = dtSubCategory;
           
            ddlSubCategory.DataTextField = "Title";
             ddlSubCategory.DataValueField = "ServiceId";
           
            ddlSubCategory.DataBind();
            ddlSubCategory.Items.Insert(0, new ListItem("Select Project SubCategory", ""));
            //ddlSubCategory.Items.FindByValue("0").Selected = true;
            
            
          
        }
        
        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            int serviceId = Convert.ToInt32(ddlCategory.SelectedValue);
            SetSubCategory(serviceId);
          
        }        

        protected void btnNext_Click(object sender, EventArgs e)
        {
            ClsCustomer cs = new ClsCustomer();
            cs.FullName = txtFullname.Text.Trim();
            cs.Email = txtEmailid.Text.Trim();
            cs.ContactNumber = txtContactNumber.Text.Trim();

            int verify = cs.SubmitCustomerdetails();

            if (verify == 0)
            {
                lblEmailExists.Attributes.Add("style", "display:block;");
                pnlSecond.Attributes.Add("style", "display:none;");
                pnlFirst.Attributes.Add("style", "display:block;");                
            }
            else
            {
                pnlSecond.Attributes.Add("style", "display:block;");
                pnlFirst.Attributes.Add("style", "display:none;");                
            }
        }
        private void SendEmail()
        {
            Random rnd = new Random();
            int otp = rnd.Next(1000, 9999);
            ViewState["otpemail"] = otp;
            ViewState["Email"] = txtEmailid.Text;
            string otpmessage = otp + " is otp from benchkart.com ";

            ClsMail mail = new ClsMail();
            mail.EmailTo = txtEmailid.Text;
            mail.Subject = otpmessage;
            mail.Body = "Please enter the OTP" + otp.ToString() + "in the OTP section during registration";
            mail.SendMail();

        }

        //public void SendEmailSubmit()
        //{
        //    ClsMail mail = new ClsMail();
        //    mail.EmailTo = txtEmailid.Text;
        //    mail.Subject = "Benchkart.com";
        //    mail.Body = "Request is submit successfully";
        //    mail.SendMail();
        //}
        protected void btnSetPassword_Click(object sender, EventArgs e)
        {
            ClsRequest clsreq = new ClsRequest();
            string email = txtEmailid.Text;
            string companyName = string.Empty;
           
            string password = txtPassword.Text;

           
            if (rblwebsite.SelectedValue!="")
            {
                companyName = txtCompanyName.Text;
            }
           

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
           
            if (rblbudgetoption.SelectedValue == "0")
            {
                if(ddlrupees.SelectedValue!="")
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
          
            int customerId = 0;
            int requestss = clsreq.PostProjectRequest(ref customerId, email,password, companyName);

            
            if (customerId == 0)

            {
                Response.Write("<script>alert('This Email Id already present in our database. Please login.)</script>");
            }
            else
            {
                Session["CustomerId"] = customerId;
                //Anurag - Bug Fixed 28-4-2020
                Session["emailId"] = email;

                //HttpCookie CookieCustomerId = new HttpCookie("CustomerId");
                //CookieCustomerId.Value = customerId.ToString();
                //CookieCustomerId.Expires = DateTime.Now.AddHours(24);
                //Response.Cookies.Add(CookieCustomerId);

                //HttpCookie CookieCustomerEmail = new HttpCookie("emailId");
                //CookieCustomerEmail.Value = email;
                //CookieCustomerEmail.Expires = DateTime.Now.AddHours(24);
                //Response.Cookies.Add(CookieCustomerEmail);

                Response.Cookies["CustomerId"].Expires = DateTime.Now.AddDays(60);
                Response.Cookies["CustomerId"].Value = customerId.ToString();

                //Start - Cookie Implementation for password - 23 Jun
                if (chkRememberMe.Checked)
                {
                    Response.Cookies["CustomerEmail"].Expires = DateTime.Now.AddDays(30);
                    Response.Cookies["Password"].Expires = DateTime.Now.AddDays(30);
                }
                else
                {
                    Response.Cookies["CustomerEmail"].Expires = DateTime.Now.AddDays(-1);
                    Response.Cookies["Password"].Expires = DateTime.Now.AddDays(-1);

                }
                Response.Cookies["CustomerEmail"].Value = email.Trim();
                Response.Cookies["Password"].Value = txtPassword.Text.Trim();
                //End


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

                //Email
                System.Threading.Thread emailThread = new System.Threading.Thread(delegate ()
                {
                    string subject = "Thanks for posting your company requirement";
                    string body = "<p>Congratulations! Hundreds of companies are getting their projects executed end-to-end on Benchkart & you are joining them. Projects executed on Benchkart not only get you quality while saving your time & money, they also ensure that you have complete Peace Of Mind on matters related to security, payments & accountability.</p><p>Right now, your project is undergoing a short review & then will be live on platform. In case we require additional information, we may reach out to you on the email/phone number provided by you.</p><p>From now on, your Benchkart account becomes the place for action! Your shortlisted bids, contracts, project management, payments & reviews will all happen in your account.</p>";

                    ClsMail.SendEmail(txtFullname.Text, email, subject, body);

                });

                emailThread.IsBackground = true;
                emailThread.Start();

                //End - Email

                Response.Redirect("Projects_Dashboard?action=post");
            }
        }

        
        protected void ddlSubCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            //SetSubCategoryHint();
        }
    }
}