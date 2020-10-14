using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;
using System.Web.UI.HtmlControls;

namespace Benchkart.Partner
{
    public partial class Projects : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HtmlAnchor a_Leads = (HtmlAnchor)Master.FindControl("a_Leads");
            a_Leads.Style.Add("background-color", "white");

            DataTable dtOppurtunities = new DataTable();

            //int customerId = Convert.ToInt32(Session["CustomerId"].ToString());
            //int customerId = 15;
            if (!IsPostBack)
            {
                //lblEmail.Text = Session["PartnerEmail"].ToString();
                //hdnPartnerId.Value = Session["PartnerId"].ToString();
                //hdnPartnerId.Value = "39";
                int PartnerId = 0;
                if (Session["PartnerId"] != null)
                {
                    PartnerId = Convert.ToInt32(Session["PartnerId"].ToString());
                }
                else
                {
                    PartnerId = Convert.ToInt32(Request.Cookies["PartnerId"].Value);
                }
                
                ClsProject pj = new ClsProject();

                int oppurtunitiesCount = 0, bidCount = 0, selectedbidCount = 0, activeProjectCount = 0;

                dtOppurtunities = pj.GetProjectsforPartner(PartnerId, ref oppurtunitiesCount, ref bidCount, ref selectedbidCount, ref activeProjectCount);

                lblOppurtunitiesCount.Text = oppurtunitiesCount.ToString();
                lblBidCount.Text = bidCount.ToString();
                lblSelectedbidCount.Text = selectedbidCount.ToString();
                lblActiveProjectCount.Text = activeProjectCount.ToString();

                if (dtOppurtunities.Rows.Count > 0)
                {
                    lstProjects.DataSource = dtOppurtunities;
                    lstProjects.DataBind();
                }
                else
                {
                    pnlSearchingProjects.Visible = true;
                }
            }
            
        }

        
    }
}