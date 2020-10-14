using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Benchkart.Partner
{
    public partial class Notifications : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //try
            //{
                DataTable dtNotifications = new DataTable();

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

                //int customerId = 15;
                if (!IsPostBack)
                {

                    ClsNotifications nf = new ClsNotifications();
                    nf.PartnerId = partnerId;

                    dtNotifications = nf.GetNotificationsforPartner();
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