using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Benchkart.Consultant
{
    public partial class Bid_Details : System.Web.UI.Page
    {
        int BidId;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["ConsultantId"] == null)
            {
                Response.Redirect("ConsultantLogin.aspx");
            }

            DataTable dtBidDetails;
            if (!IsPostBack)
            {
                
                BidId = Convert.ToInt32(Request.QueryString["BidId"]);
                //projectId = Convert.ToInt32(Request.QueryString["id"]);
                //projectId = 11;

                ClsBidding bd = new ClsBidding();
                bd.BidId = BidId;
                dtBidDetails = bd.GetBidDetails();
                DisplayBid(dtBidDetails);

                if (Request.QueryString["action"] != null)
                {
                    if (Request.QueryString["action"].ToString() == "ApprovaleStatus")
                    {
                        txtMessage.Focus();
                    }
                }
                
            }
        }

        public void DisplayBid(DataTable dtBidDetails)
        {
            string parentId = string.Empty;
            string serviceId = string.Empty;
            hidProjectId.Value = dtBidDetails.Rows[0]["ProjectId"].ToString();
            lblCreationDate.Text = dtBidDetails.Rows[0]["CreationDate"].ToString();

            lblTitle.Text = dtBidDetails.Rows[0]["Title"].ToString();
            lblBidAmount.Text = dtBidDetails.Rows[0]["BidAmount"].ToString();
            lblPocName.Text = dtBidDetails.Rows[0]["PocFullName"].ToString();
            lblCompanyName.Text = dtBidDetails.Rows[0]["CompanyName"].ToString();
            lblExecutionRemarks.Text = dtBidDetails.Rows[0]["ExecutionRemarks"].ToString();
            lblExperience.Text = dtBidDetails.Rows[0]["Experience"].ToString();

            //lblCompany.Text = dtBidDetails.Rows[0]["CompanyIndustry"].ToString();
            lblAbout.Text = dtBidDetails.Rows[0]["CompanyProfile"].ToString();

            lblServices.Text = dtBidDetails.Rows[0]["Services"].ToString();

        }

        protected void btnApprovale_Click(object sender, EventArgs e)
        {
            ClsBidding bdl = new ClsBidding();
            bdl.BidId = Convert.ToInt32(Request.QueryString["BidId"]);
            int approvaleStatus = 1;

            bdl.BidStatus = approvaleStatus;
            bdl.ConsultantComment = txtMessage.Text;
            bdl.UpdateBidApprovaleStatus();
            Response.Redirect("~/Consultant/Project_Bids.aspx?ProjectId="+hidProjectId.Value);
        }

        //protected void btnRejectBid_Click(object sender, EventArgs e)
        //{
        //    ClsBidding bdl = new ClsBidding();
        //    bdl.BidId = Convert.ToInt32(Request.QueryString["BidId"]);
        //    int approvaleStatus = 1;
        //    bdl.ApprovaleStatus = approvaleStatus;
        //    bdl.ConsultantComment = txtMessage.Text;
        //    bdl.UpdateBidApprovaleStatus();
        //    Response.Redirect("~/Consultant/Project_Bids.aspx?ProjectId=" + hidProjectId.Value);
        //}

        protected void lkbBackBids_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Consultant/Project_Bids.aspx?ProjectId=" + hidProjectId.Value);
        }
    }
}