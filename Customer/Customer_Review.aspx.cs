using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;

namespace Benchkart.Customer
{
    public partial class Customer_Review : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            ClsProject clsProject = new ClsProject();
            ClsReferrals clsReferrals = new ClsReferrals();

            int customerId = 0;
            if (Session["CustomerId"] != null)
            {
                customerId = Convert.ToInt32(Session["CustomerId"].ToString());
            }
            else
            {
                customerId = Convert.ToInt32(Request.Cookies["CustomerId"].Value);
            }

            ClsCustomerReview clsReview = new ClsCustomerReview();
            int projectId = Convert.ToInt32(Request.QueryString["ProjectId"]);
            clsReview.ProjectId = projectId;
            clsReview.Quality =Convert.ToInt32(rblquality.SelectedValue);
            clsReview.TimeLiness = Convert.ToInt32(rbltimeliness.SelectedValue);
            clsReview.Value = Convert.ToInt32(rblmoney.SelectedValue);
            clsReview.Comments = txtanycomment.Text;
            clsReview.CustomerReviewSubmit();
            if(txtPersonName1.Text!="" || txtCompanyName1.Text!="" || txtEmail1.Text!="" || txtPhoneNumber1.Text!="" )
            {
                clsReferrals.CustomerId = customerId;
                clsReferrals.ProjectId = projectId;
                clsReferrals.PersonName = txtPersonName1.Text;
                clsReferrals.CompanyName = txtCompanyName1.Text;
                clsReferrals.Email = txtEmail1.Text;
                clsReferrals.Phone = txtPhoneNumber1.Text;
                clsReferrals.CustomerReferrals();
            }
            if (txtPersonName2.Text != "" || txtCompanyName2.Text != "" || txtEmail2.Text != "" || txtPhoneNumber2.Text != "")
            {
                clsReferrals.CustomerId = customerId;
                clsReferrals.ProjectId = projectId;
                clsReferrals.PersonName = txtPersonName2.Text;
                clsReferrals.CompanyName = txtCompanyName2.Text;
                clsReferrals.Email = txtEmail2.Text;
                clsReferrals.Phone = txtPhoneNumber2.Text;
                clsReferrals.CustomerReferrals();
            }
            if (txtPersonName3.Text != "" || txtCompanyName3.Text != "" || txtEmail3.Text != "" || txtPhoneNumber3.Text != "")
            {
                clsReferrals.CustomerId = customerId;
                clsReferrals.ProjectId = projectId;
                clsReferrals.PersonName = txtPersonName3.Text;
                clsReferrals.CompanyName = txtCompanyName3.Text;
                clsReferrals.Email = txtEmail3.Text;
                clsReferrals.Phone = txtPhoneNumber3.Text;
                clsReferrals.CustomerReferrals();
            }
            else
            {

            }
            clsProject.ProjectId = projectId;
            clsProject.ReviewProjectbyCustomer();
            //Response.Redirect("~/Customer/Projects_Dashboard");
            Response.Write("<script>alert('Your review has been successfuly submitted');window.location='../Customer/Projects_Dashboard';</script>");
        }
    }
}