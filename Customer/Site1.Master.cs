using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Benchkart.Customer
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //int customerId = Convert.ToInt32(Session["CustomerId"].ToString());
                int customerId = 0;
                if (Session["CustomerId"] != null)
                {
                    customerId = Convert.ToInt32(Session["CustomerId"].ToString());
                }
                else
                {
                    customerId = Convert.ToInt32(Request.Cookies["CustomerId"].Value);
                }

                ClsCustomer pt = new ClsCustomer();
                int msgCount = 0;
                int notifCount = 0;
                string companyName = string.Empty;
                pt.GetCustomerDashboard(customerId, ref msgCount, ref notifCount, ref companyName);
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