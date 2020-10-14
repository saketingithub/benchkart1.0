using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace Benchkart.Consultant
{
    public partial class Customers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["ConsultantId"] == null)
            {
                Response.Redirect("ConsultantLogin.aspx");
            }

            if (!IsPostBack)
            {
                ClsCustomer cst = new ClsCustomer();
                rptRequests.DataSource = cst.GetCustomerProfileForAdmin();
                rptRequests.DataBind();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            ClsCustomer cst = new ClsCustomer();
            cst.ContactNumber = txtContactNumber.Text;
            rptRequests.DataSource = cst.GetCustomerProfileForAdminSearchByContactNumber();
            rptRequests.DataBind();
        }

        protected void ddlCompanyType_SelectedIndexChanged(object sender, EventArgs e)
        {
            ClsCustomer cst = new ClsCustomer();
            cst.CompanyType = ddlCompanyType.SelectedItem.Text;
            rptRequests.DataSource = cst.GetCustomerProfileForAdminSearchByCompanyType();
            rptRequests.DataBind();
        }
    }
}