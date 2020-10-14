using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Data;
using System.Web.UI.HtmlControls;

namespace Benchkart.Partner
{
    public partial class Bids : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HtmlAnchor a_Bids = (HtmlAnchor)Master.FindControl("a_Bids");
            a_Bids.Style.Add("background-color", "white");

            //int PartnerId = Convert.ToInt32(Session["PartnerId"]);
            int PartnerId = 0;
            if (Session["PartnerId"] != null)
            {
                PartnerId = Convert.ToInt32(Session["PartnerId"].ToString());
            }
            else
            {
                PartnerId = Convert.ToInt32(Request.Cookies["PartnerId"].Value);
            }

            //int CustomerId = 15;
            DataTable dtBids = new DataTable();
            ClsBidding pj = new ClsBidding();
            dtBids = pj.GetBidsbyPartner(PartnerId);
            if (dtBids.Rows.Count > 0)
            {
                rptBids.DataSource = dtBids;
                rptBids.DataBind();
            }
            else
            {
                pnlSearchingProjects.Visible = true;
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