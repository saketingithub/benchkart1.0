using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Benchkart.Consultant
{
    public partial class Requests : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //lblConsultantEmail.Text = Session["ConsultantEmail"].ToString();
            if (Request.Cookies["ConsultantId"] == null)
            {
                Response.Redirect("ConsultantLogin.aspx");
            }

            if (!IsPostBack)
            {
               
                ClsRequest rp = new ClsRequest();
                int requestStatus = 0;
                rptRequests.DataSource = rp.GetRequestList(ref requestStatus);
                rptRequests.DataBind();
                
            }
        }

        protected void ddlRequestStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            int requestStatus =Convert.ToInt32( ddlRequestStatus.SelectedValue);
            ClsRequest rp = new ClsRequest();
            rptRequests.DataSource = rp.GetRequestList( ref requestStatus);
            rptRequests.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            ClsRequest rp = new ClsRequest();
            string contact = txtContactNumber.Text;
            //string requestStatus = "New Request";
            //txtContactNumber
            rptRequests.DataSource = rp.SearchRequest(contact);
            rptRequests.DataBind();
        }
    }
}