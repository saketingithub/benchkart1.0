using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Benchkart.Customer
{
    public partial class Notifications : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //try
            //{
                DataTable dtNotifications = new DataTable();
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

                //int customerId = 15;
                if (!IsPostBack)
                {

                    ClsNotifications nf = new ClsNotifications();
                    nf.CustomerId = customerId;

                    dtNotifications = nf.GetNotificationsforCustomer();
                    rptNotifications.DataSource = dtNotifications;
                    rptNotifications.DataBind();
                }
            //}
            //catch (Exception ex)
            //{

            //}
        }
    }
}