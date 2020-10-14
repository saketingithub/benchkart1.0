using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Benchkart.Partner
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //int partnerId = Convert.ToInt32(Session["PartnerId"].ToString());
                int partnerId = 0;
                if (Session["PartnerId"] != null)
                {
                    partnerId = Convert.ToInt32(Session["PartnerId"].ToString());
                }
                else
                {
                    partnerId = Convert.ToInt32(Request.Cookies["PartnerId"].Value);
                }

                ClsPartner pt = new ClsPartner();
                int msgCount = 0;
                int notifCount = 0;
                string companyName = string.Empty;
                pt.GetPartnerDashboard(partnerId, ref msgCount, ref notifCount, ref companyName);
                lblMessages.Text = msgCount.ToString();
                if (msgCount == 0)
                {
                    lblMessages.Style.Add("display", "none");
                }
                lblNotifications.Text = notifCount.ToString();
                if (notifCount == 0)
                {
                    lblNotifications.Style.Add("display", "none");
                }
                lblCompanyName.Text = companyName;

            }
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