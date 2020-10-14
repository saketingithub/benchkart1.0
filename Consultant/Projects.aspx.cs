using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Benchkart.Consultant
{
    public partial class Projects : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //this.Master.iframe.Attributes.Add("src", "some.aspx");
            //LinkButton lnk = (LinkButton)this.ucHeader.FindControl("lnkProjects");
            //lnk.BackColor = Color.FromArgb(76, 175, 80);

          
            if(Request.Cookies["ConsultantId"] == null)
            {
                Response.Redirect("ConsultantLogin.aspx");
            }

            if (!IsPostBack)
            {
                //lblConsultantEmail.Text = Session["ConsultantEmail"].ToString();
                bindGrid();
            }

        }

        public void bindGrid()
        {
            DataTable dtOppurtunities = new DataTable();
            ClsProject pj = new ClsProject();
            dtOppurtunities = pj.GetProjectsforConsultant();

            if (dtOppurtunities.Rows.Count > 0)
            {
                grdProject.DataSource = dtOppurtunities;
                grdProject.DataBind();
            }
            //else
            //{
              //  pnlSearchingProjects.Visible = true;
            //}
        }
      


        protected void grdProject_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int countstatusbids;
            if (e.CommandName == "Accept")
            {
                ClsProject pjt = new ClsProject();
                pjt.ProjectId = Convert.ToInt32(e.CommandArgument.ToString());
                countstatusbids = pjt.ProjectStatusBidComplete();
                if (countstatusbids > 0)
                {
                    bindGrid();
                    Response.Write("<script>alert('Bid completed successfully')</script>");

                }
                else
                {
                    Response.Write("<script>alert('Please select atleast one bid')</script>");
                }
            }
        }

        protected void grdProject_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //if (e.Row.RowType == DataControlRowType.DataRow)
            //{
            //    for(int i=0;i<e.Row.Cells.Count;i++)
            //    { 
            //        if (e.Row.Cells[i].Text == "Bidding In Progress")
            //        {
            //            LinkButton status = (LinkButton)e.Row.FindControl("lkbCompleteBids");
            //            status.Visible = true;

            //        }
            //        else
            //        {
            //        LinkButton status = (LinkButton)e.Row.FindControl("lkbCompleteBids");
            //            status.Visible = false;

            //        }
            //    }

            //}
        }

        protected string SetProjectStatus(int status)
        {
            string strStatus = string.Empty;

            switch (status)
            {
                case 0:
                    strStatus = "Project Under Review";
                    break;
                case 1:
                    strStatus = "Bidding In Progress";
                    break;
                case 2:
                    strStatus = "Bidding Completed";
                    break;
                case 3:
                    strStatus = "Bid Accepted";
                    break;
                case 4:
                    strStatus = "Contract by Agency Received";
                    break;
                case 5:
                    strStatus = "Contract Approved";
                    break;
                case 6:
                    strStatus = "Payment Started";
                    break;
                case 7:
                    strStatus = "Project Closure Request Raised by Agency";
                    break;
                case 8:
                    strStatus = "Project Closed by Customer";
                    break;
                case 9:
                    strStatus = "Reviewed by Customer";
                    break;
                case 10:
                    strStatus = "Reviewed by Partner";
                    break;
                case 11:
                    strStatus = "Contract Sent Back to Agency for Change";
                    break;
                case 12:
                    strStatus = "Premature Closed";
                    break;
                default:
                    strStatus = "Unknown";
                    break;
            }

            return strStatus;
        }

        protected void ddlRequestStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            int requestStatus = Convert.ToInt32(ddlRequestStatus.SelectedValue);
            ClsProject clsproj = new ClsProject();
            
            grdProject.DataSource = clsproj.GetProjectsByStatus(ref requestStatus);
            grdProject.DataBind();
        }
    }
}