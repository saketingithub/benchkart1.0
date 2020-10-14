using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Benchkart.Consultant
{
    public partial class Project_Bids : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //LinkButton lnk = (LinkButton)this.ucHeader.FindControl("lnkBids");
            //lnk.BackColor = Color.FromArgb(76, 175, 80);

            DataTable dtBids = new DataTable();

            if (Request.Cookies["ConsultantId"] == null)
            {
                Response.Redirect("ConsultantLogin.aspx");
            }

            int ProjectId =Convert.ToInt32( Request.QueryString["ProjectId"]);
            //int customerId = 15;
            if (!IsPostBack)
            {
                ClsBidding bd = new ClsBidding();

                dtBids = bd.GetBidDetailsforProject(ProjectId);

                if (dtBids.Rows.Count > 0)
                {
                    lstBids.DataSource = dtBids;
                    lstBids.DataBind();
                }
                else
                {
                    lstBids.Visible = false;
                    lblNobids.Visible = true;
                }


            }
        }

      
    }
}