using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Benchkart.Admin
{
    public partial class Partners : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ClsPartner pn = new ClsPartner();
                pn.IsActive = Convert.ToInt32(ddlRequestStatus.SelectedValue);
                rptRequests.DataSource = pn.GetPartnerProfileSearchByIsActive();
                rptRequests.DataBind();

            }
        }

        protected void ddlRequestStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlRequestStatus.SelectedValue == "3")
            {
                ClsPartner pn = new ClsPartner();
                rptRequests.DataSource = pn.GetPartnerProfileAll();
                rptRequests.DataBind();
            }
            else
            {
                ClsPartner pn = new ClsPartner();
                pn.IsActive = Convert.ToInt32(ddlRequestStatus.SelectedValue);
                rptRequests.DataSource = pn.GetPartnerProfileSearchByIsActive();
                rptRequests.DataBind();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            ClsPartner pn = new ClsPartner();
            pn.ContactNumber = txtContactNumber.Text;
            rptRequests.DataSource = pn.GetPartnerProfileSearchByContactNumber();
            rptRequests.DataBind();

        }
    }
}