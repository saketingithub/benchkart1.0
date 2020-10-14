using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


namespace Benchkart.Admin
{
    public partial class Requests : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ClsRequest rp = new ClsRequest();
                
                rptRequests.DataSource = rp.GetRequestListForAdmin();
                rptRequests.DataBind();
            }
        }

        protected void ddlRequestStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            string requestStatus = ddlRequestStatus.SelectedItem.Text;
            ClsRequest rp = new ClsRequest();
            
            rptRequests.DataSource = rp.GetRequestListForAdminSearchByStatus(requestStatus);
            rptRequests.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            ClsRequest rp = new ClsRequest();
            string contact = txtContactNumber.Text;
            //string requestStatus = "New Request";
            //txtContactNumber
            rptRequests.DataSource = rp.SearchRequestForAdmin(contact);
            rptRequests.DataBind();
        }
    }
}