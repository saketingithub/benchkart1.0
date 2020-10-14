using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Benchkart.Admin
{
    public partial class Projects : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          

            //int customerId = Convert.ToInt32(Session["CustomerId"].ToString());
            //int customerId = 15;
            if (!this.IsPostBack)
            {
                //lblEmail.Text = Session["PartnerEmail"].ToString();
                //hdnPartnerId.Value = Session["PartnerId"].ToString();
                //hdnPartnerId.Value = "39";
               this.bindGrid();
               
            }
        }
        public void bindGrid(string sortExpression = null)
        {
            DataTable dtOppurtunities = new DataTable();
            ClsProject pj = new ClsProject();
            dtOppurtunities = pj.GetProjectsforAdmin();
            if (sortExpression != null)
            {
                DataView dt = dtOppurtunities.AsDataView();
                this.SortDirection = this.SortDirection == "ASC" ? "DESC" : "ASC";

                dt.Sort = sortExpression + " " + this.SortDirection;
                grd.DataSource = dt;
            }
            else
            {
                grd.DataSource = dtOppurtunities;
            }
            grd.DataBind();
        }
        private string SortDirection
        {
            get { return ViewState["SortDirection"] != null ? ViewState["SortDirection"].ToString() : "ASC"; }
            set { ViewState["SortDirection"] = value; }
        }

        protected void grd_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

            grd.PageIndex = e.NewPageIndex;
            
           this.bindGrid();
        }

        protected void grd_Sorting(object sender, GridViewSortEventArgs e)
        {
            this.bindGrid(e.SortExpression);
        }

        protected void grd_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                foreach (TableCell tc in e.Row.Cells)
                {
                    if (tc.HasControls())
                    {
                        LinkButton lb = (LinkButton)tc.Controls[0];
                        if (lb != null)
                        {
                            Image icon = new Image();
                            icon.ImageUrl = "~/Images/icons8-sort-50.png" + (this.SortDirection = this.SortDirection == "ASC" ? "DESC" : "ASC") + ".png";
                            if (grd.SortExpression == lb.CommandArgument)
                            {
                                tc.Controls.Add(new LiteralControl(" "));
                                tc.Controls.Add(icon);
                            }
                        }
                    }
                }
            }
        }
    }
}