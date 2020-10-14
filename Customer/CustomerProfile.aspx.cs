using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Drawing;

namespace Benchkart.Customer
{
    public partial class CustomerProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HtmlGenericControl li_CustomerProfile = (HtmlGenericControl)Master.FindControl("li_CustomerProfile");
            li_CustomerProfile.Style.Add("background-color", "white");

            //LinkButton lnk = (LinkButton)this.ucHeader.FindControl("lnkProfile");
            //lnk.BackColor = Color.FromArgb(76, 175, 80);

            DataTable dtCustomerProfile;
            //int CustomerId = Convert.ToInt32(Session["CustomerId"].ToString());

            int CustomerId = 0;
            if (Session["CustomerId"] != null)
            {
                CustomerId = Convert.ToInt32(Session["CustomerId"].ToString());
            }
            else
            {
                CustomerId = Convert.ToInt32(Request.Cookies["CustomerId"].Value);
            }

            //int CustomerId = 15;
            if (!IsPostBack)
            {
                ClsCustomer cs = new ClsCustomer();
                cs.CustomerId = CustomerId;
                dtCustomerProfile = cs.GetCustomerProfile();

                DisplayCustomerProfile(dtCustomerProfile);
            }
        }

        public void DisplayCustomerProfile(DataTable dtCustomerProfile)
        {
            if (dtCustomerProfile.Rows[0]["FullName"] != DBNull.Value)
            {
                txtFullName.Text = dtCustomerProfile.Rows[0]["FullName"].ToString();
                txtFullName.ReadOnly = true;
                txtFullName.BorderWidth = 0;
            }
            if (dtCustomerProfile.Rows[0]["Email"] != DBNull.Value)
            {
                txtEmailId.Text = dtCustomerProfile.Rows[0]["Email"].ToString();
                txtEmailId.ReadOnly = true;
                txtEmailId.BorderWidth = 0;
            }
            if (dtCustomerProfile.Rows[0]["ContactNumber"] != DBNull.Value)
            {
                txtContactNumber.Text = dtCustomerProfile.Rows[0]["ContactNumber"].ToString();
                txtContactNumber.ReadOnly = true;
                txtContactNumber.BorderWidth = 0;
            }

          
            if (dtCustomerProfile.Rows[0]["CompanyName"] !=DBNull.Value)
            {
                txtCompanyName.Text = dtCustomerProfile.Rows[0]["CompanyName"].ToString();
                txtCompanyName.ReadOnly = true;
                txtCompanyName.BorderWidth = 0;
            }
            if(dtCustomerProfile.Rows[0]["CompanyIndustry"] !=DBNull.Value)
            {
                ddlCompanyIndustry.SelectedItem.Text = dtCustomerProfile.Rows[0]["CompanyIndustry"].ToString();
                ddlCompanyIndustry.Enabled = false;
                ddlCompanyIndustry.BorderWidth = 0;
               
            }
           
            if (dtCustomerProfile.Rows[0]["CompanyProfile"] != DBNull.Value)
            {
                txtCompanyProfile.Text = dtCustomerProfile.Rows[0]["CompanyProfile"].ToString();
                txtCompanyProfile.ReadOnly = true;
                txtCompanyProfile.BorderWidth = 0;
            }

           

            if (dtCustomerProfile.Rows[0]["CompanyGSTNumber"] != DBNull.Value)
            {
                txtCompanyGSTNumber.Text = dtCustomerProfile.Rows[0]["CompanyGSTNumber"].ToString();
                txtCompanyGSTNumber.ReadOnly = true;
                txtCompanyGSTNumber.BorderWidth = 0;
            }

            if (dtCustomerProfile.Rows[0]["EmployeeCount"] != DBNull.Value)
            {
                txtEmployeeCount.Text = dtCustomerProfile.Rows[0]["EmployeeCount"].ToString();
                txtEmployeeCount.ReadOnly = true;
                txtEmployeeCount.BorderWidth = 0;
            }

            if (dtCustomerProfile.Rows[0]["Website"] != DBNull.Value)
            {
                txtWebsite.Text = dtCustomerProfile.Rows[0]["Website"].ToString();
                txtWebsite.ReadOnly = true;
                txtWebsite.BorderWidth = 0;
            }
          
            
            if(dtCustomerProfile.Rows[0]["CompanyType"]!=DBNull.Value)
            {
                txtCompanyType.Text = dtCustomerProfile.Rows[0]["CompanyType"].ToString();
                txtCompanyType.ReadOnly = true;
                txtCompanyType.BorderWidth = 0;
            }
            if(dtCustomerProfile.Rows[0]["CompanyLink"]!=DBNull.Value)
            {
                txtCompanyLink.Text = dtCustomerProfile.Rows[0]["CompanyLink"].ToString();
                txtCompanyLink.ReadOnly = true;
                txtCompanyLink.BorderWidth = 0;
            }
            

        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            ClsCustomer cust = new ClsCustomer();
            //cust.CustomerId =Convert.ToInt32( Session["CustomerId"]);

            cust.CustomerId = 0;
            if (Session["CustomerId"] != null)
            {
                cust.CustomerId = Convert.ToInt32(Session["CustomerId"].ToString());
            }
            else
            {
                cust.CustomerId = Convert.ToInt32(Request.Cookies["CustomerId"].Value);
            }

            cust.FullName = txtFullName.Text;
            cust.Email = txtEmailId.Text;
            cust.ContactNumber = txtContactNumber.Text;
            
            cust.CompanyName = txtCompanyName.Text;
            cust.CompanyIndustry = ddlCompanyIndustry.SelectedItem.Text;
            cust.CompanyProfile = txtCompanyProfile.Text;
            //cust.CompanyAddress = txtCompanyAddress.Text;
            
            cust.CompanyGSTNumber = txtCompanyGSTNumber.Text;
            cust.EmployeeCount = txtEmployeeCount.Text;
            cust.Website = txtWebsite.Text;
           
            cust.CompanyType = txtCompanyType.Text;
            cust.CompanyLink = txtCompanyLink.Text;
            cust.SubmitCustomerProfile();
            //SendEmailSubmit();
            txtFullName.ReadOnly = true;
            txtFullName.BorderWidth = 0;
            txtEmailId.ReadOnly = true;
            txtEmailId.BorderWidth = 0;
            txtContactNumber.ReadOnly = true;
            txtContactNumber.BorderWidth = 0;
            ddlCompanyIndustry.Enabled = false;
            ddlCompanyIndustry.BorderWidth = 0;
          
            txtCompanyName.ReadOnly = true;
            txtCompanyName.BorderWidth = 0;
           
            txtCompanyProfile.ReadOnly = true;
            txtCompanyProfile.BorderWidth = 0;
           
            txtCompanyGSTNumber.ReadOnly = true;
            txtCompanyGSTNumber.BorderWidth = 0;
            txtEmployeeCount.ReadOnly = true;
            txtEmployeeCount.BorderWidth = 0;
            txtWebsite.ReadOnly = true;
            txtWebsite.BorderWidth = 0;

           
            txtCompanyType.ReadOnly = true;
            txtCompanyType.BorderWidth = 0;
            txtCompanyLink.ReadOnly = true;
            txtCompanyLink.BorderWidth = 0;


        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            txtFullName.ReadOnly = false;
            txtFullName.BorderWidth = 1;
            txtEmailId.ReadOnly = true;
            txtEmailId.BorderWidth = 0;
            txtContactNumber.ReadOnly = false;
            txtContactNumber.BorderWidth = 1;
            //txtPassword.ReadOnly = false;
            //txtPassword.BorderWidth = 1;
            txtCompanyName.ReadOnly = false;
            txtCompanyName.BorderWidth = 1;
            //txtCompanyIndustry.ReadOnly = false;
            //txtCompanyIndustry.BorderWidth = 1;
            txtCompanyProfile.ReadOnly = false;
            txtCompanyProfile.BorderWidth = 1;
            //txtCompanyAddress.ReadOnly = false;
            //txtCompanyAddress.BorderWidth = 1;
            txtCompanyGSTNumber.ReadOnly = false;
            txtCompanyGSTNumber.BorderWidth = 1;
            txtEmployeeCount.ReadOnly = false;
            txtEmployeeCount.BorderWidth = 1;
            txtWebsite.ReadOnly = false;
            txtWebsite.BorderWidth = 1;
            ddlCompanyIndustry.Enabled = true;
            ddlCompanyIndustry.BorderWidth = 1;
            
            txtCompanyType.ReadOnly = false;
            txtCompanyType.BorderWidth = 1;
            txtCompanyLink.ReadOnly = false;
            txtCompanyLink.BorderWidth = 1;

        }
        //public void SendEmailSubmit()
        //{
        //    ClsMail mail = new ClsMail();
        //    mail.EmailTo = txtEmailId.Text;
        //    mail.Subject = "Benchkart.com";
        //    mail.Body = "Request is Update successfully";
        //    mail.SendMail();
        //}
        protected void lnkSignOut_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            Session.RemoveAll();
            Response.Redirect("~/");
        }

      
    }
}