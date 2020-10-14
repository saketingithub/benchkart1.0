using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Benchkart.Admin
{
    public partial class Customer_Details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dtCustomerProfile;
            int CustomerId = Convert.ToInt32(Request.QueryString["id"].ToString());
            //int CustomerId = 15;
            if (!IsPostBack)
            {
                ClsCustomer cs = new ClsCustomer();
                cs.CustomerId = CustomerId;
                dtCustomerProfile = cs.GetCustomerProfileForAdminSearch();

                DisplayCustomerProfile(dtCustomerProfile);
            }
        }

        public void DisplayCustomerProfile(DataTable dtCustomerProfile)
        {
            if (dtCustomerProfile.Rows[0]["FullName"] != DBNull.Value)
            {
                lblFullName.Text = dtCustomerProfile.Rows[0]["FullName"].ToString();
               
            }
            if (dtCustomerProfile.Rows[0]["Email"] != DBNull.Value)
            {
                lblEmailId.Text = dtCustomerProfile.Rows[0]["Email"].ToString();
                
            }
            if (dtCustomerProfile.Rows[0]["ContactNumber"] != DBNull.Value)
            {
                lblContactNumber.Text = dtCustomerProfile.Rows[0]["ContactNumber"].ToString();
                
            }

            if (dtCustomerProfile.Rows[0]["Password"] != DBNull.Value)
            {
                lblPassword.Text = dtCustomerProfile.Rows[0]["Password"].ToString();
               

            }
            if (dtCustomerProfile.Rows[0]["CompanyName"] != DBNull.Value)
            {
                lblCompanyName.Text = dtCustomerProfile.Rows[0]["CompanyName"].ToString();
               
            }
            if (dtCustomerProfile.Rows[0]["CompanyIndustry"] != DBNull.Value)
            {
                lblCompanyIndustry.Text = dtCustomerProfile.Rows[0]["CompanyIndustry"].ToString();
                
            }

            if (dtCustomerProfile.Rows[0]["CompanyProfile"] != DBNull.Value)
            {
                lblCompanyProfile.Text = dtCustomerProfile.Rows[0]["CompanyProfile"].ToString();
                
            }

            if (dtCustomerProfile.Rows[0]["CompanyAddress"] != DBNull.Value)
            {
                lblCompanyAddress.Text = dtCustomerProfile.Rows[0]["CompanyAddress"].ToString();
               
            }

            if (dtCustomerProfile.Rows[0]["CompanyGSTNumber"] != DBNull.Value)
            {
                lblCompanyGSTNumber.Text = dtCustomerProfile.Rows[0]["CompanyGSTNumber"].ToString();
               
            }

            if (dtCustomerProfile.Rows[0]["EmployeeCount"] != DBNull.Value)
            {
                lblEmployeeCount.Text = dtCustomerProfile.Rows[0]["EmployeeCount"].ToString();
               
            }

            if (dtCustomerProfile.Rows[0]["Website"] != DBNull.Value)
            {
                lblWebsite.Text = dtCustomerProfile.Rows[0]["Website"].ToString();
               
            }
            if (dtCustomerProfile.Rows[0]["LogoName"] != DBNull.Value)
            {
                lbllogoName.Text = dtCustomerProfile.Rows[0]["LogoName"].ToString();
                
            }

            if (dtCustomerProfile.Rows[0]["CreationDate"] != DBNull.Value)
            {
                lblCreationDate.Text = dtCustomerProfile.Rows[0]["CreationDate"].ToString();
               
            }
            if (dtCustomerProfile.Rows[0]["ModificationDate"] != DBNull.Value)
            {
                lblModificationDate.Text = dtCustomerProfile.Rows[0]["ModificationDate"].ToString();
               
            }
            //if(dtCustomerProfile.Rows[0]["IsActive"]!=DBNull.Value)
            //{
            //    chkIsActive.Text = dtCustomerProfile.Rows[0]["IsActive"].ToString();
            //    if(chkIsActive.Text=="1")
            //    {
            //        chkIsActive.Checked = true;
            //        chkIsActive.Text = "true";

            //    }
            //    else
            //    {
            //        chkIsActive.Checked = false;
            //        chkIsActive.Text = "false";
            //    }
            //}
            if (dtCustomerProfile.Rows[0]["CompanyType"] != DBNull.Value)
            {
                lblCompanyType.Text = dtCustomerProfile.Rows[0]["CompanyType"].ToString();
                
            }
            if (dtCustomerProfile.Rows[0]["CompanyLink"] != DBNull.Value)
            {
                lblCompanyLink.Text = dtCustomerProfile.Rows[0]["CompanyLink"].ToString();
               
            }
            //if(dtCustomerProfile.Rows[0]["PreferDateTimes"]!=DBNull.Value)
            //{
            //    txtPreferDateTime.Text = dtCustomerProfile.Rows[0]["PreferDateTimes"].ToString();
            //    txtPreferDateTime.ReadOnly = true;
            //    txtPreferDateTime.BorderWidth = 0;
            //}

        }


        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/Customers.aspx");
        }
    }
}