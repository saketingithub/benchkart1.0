using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Benchkart.Partner
{
    public partial class Partner_Review : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            ClsPartnerReview clsPartner = new ClsPartnerReview();
            ClsProject clsProject = new ClsProject();

            //int PartnerId = Convert.ToInt32(Session["PartnerId"].ToString());
            int PartnerId = 0;
            if (Session["PartnerId"] != null)
            {
                PartnerId = Convert.ToInt32(Session["PartnerId"].ToString());
            }
            else
            {
                PartnerId = Convert.ToInt32(Request.Cookies["PartnerId"].Value);
            }

            int ProjectId = Convert.ToInt32(Request.QueryString["Id"]);
            clsPartner.ProjectId = ProjectId;
            clsPartner.PartnerId = PartnerId;
            clsPartner.Overall = Convert.ToInt32( rbloverall.SelectedValue);
            clsPartner.Comments = txtanycomment.Text;
            clsPartner.ReviewProjectbyPartner();
            clsProject.ProjectId = ProjectId;
            clsProject.ReviewProjectbyPartners();
            // Response.Redirect("Projects_Dashboard");
            Response.Write("<script>alert('Thanks for submitting review!');window.location='../Partner/Projects_Dashboard';</script>");
        }
    }
}