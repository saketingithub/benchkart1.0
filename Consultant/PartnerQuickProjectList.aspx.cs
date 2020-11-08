using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;

namespace Benchkart.Consultant
{
    public partial class PartnerQuickProjectList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["ConsultantId"] == null)
            {
                Response.Redirect("ConsultantLogin.aspx");
            }

            if (!IsCrossPagePostBack)
            {
                grdpartnerQuickdetails.Visible = true;
                GetPackageData();
            }
        }
        public void GetPackageData()
        {
            DataTable dt = new DataTable();
            ClsPartner clsqp = new ClsPartner();
            
            dt = clsqp.GetPartnerQuickDetailsAll();
            if (dt.Rows.Count > 0)
            {
                grdpartnerQuickdetails.Visible = true;
                grdpartnerQuickdetails.DataSource = dt;
                grdpartnerQuickdetails.DataBind();
            }
            else
            {
                grdpartnerQuickdetails.Visible = false;
            }
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            ClsPartner clsqp = new ClsPartner();
            clsqp.PocFullName = txtsearch.Text;
            clsqp.CompanyName = txtsearch.Text;
            dt = clsqp.GetPartnerQuickDetailsByPartnerIdSearch();
            if (dt.Rows.Count > 0)
            {
                //grdpartnerQuickdetails.Visible = true;
                grdpartnerQuickdetails.DataSource = dt;
                grdpartnerQuickdetails.DataBind();
            }
            else
            {
                grdpartnerQuickdetails.Visible = false;
            }
        }
    }
}