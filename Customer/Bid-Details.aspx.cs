using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Benchkart.Partner
{
    public partial class Bid_Details : System.Web.UI.Page
    {
        int BidId;
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dtBidDetails;
            if (!IsPostBack)
            {

                ViewState["BidId"] = Request.QueryString["id"].ToString();
                //projectId = Convert.ToInt32(Request.QueryString["id"]);
                //projectId = 11;
                BidId = Convert.ToInt32(ViewState["BidId"]);
                ClsBidding bd = new ClsBidding();
                bd.BidId = BidId;
                dtBidDetails = bd.GetBidDetails();
                DisplayBid(dtBidDetails);

                if (Request.QueryString["action"] != null)
                {
                    if (Request.QueryString["action"].ToString() == "message")
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

            lblCreationDate.Text = dtBidDetails.Rows[0]["CreationDate"].ToString();
           // hidnProjectId.Value = dtBidDetails.Rows[0]["ProjectId"].ToString();
            lblTitle.Text = dtBidDetails.Rows[0]["Title"].ToString();
            lblBidAmount.Text = dtBidDetails.Rows[0]["BidAmount"].ToString();

            lblCompanyName.Text = dtBidDetails.Rows[0]["CompanyName"].ToString();
            lblPocName.Text = dtBidDetails.Rows[0]["PocFullName"].ToString();

            lblExecutionRemarks.Text = dtBidDetails.Rows[0]["ExecutionRemarks"].ToString();
            lblExperience.Text = dtBidDetails.Rows[0]["Experience"].ToString();
            lblEmployeeCount.Text = dtBidDetails.Rows[0]["EmployeeCount"].ToString();
            //lblCompany.Text = dtBidDetails.Rows[0]["CompanyIndustry"].ToString();
            lblAbout.Text = dtBidDetails.Rows[0]["CompanyProfile"].ToString();

            lblServices.Text = dtBidDetails.Rows[0]["Services"].ToString();

            if(dtBidDetails.Rows[0]["BidStatus"] != DBNull.Value)
            {
                if(Convert.ToInt32(dtBidDetails.Rows[0]["BidStatus"]) == 2)
                {
                    btnAccept.Visible = false;
                    lblBidAccepted.Visible = true;
                }
            }

        }

        
        protected void btnMessage_Click(object sender, EventArgs e)
        {
            //string category = string.Empty;

            ClsBidding bd = new ClsBidding();

            bd.BidId = Convert.ToInt32(ViewState["BidId"]);

            bd.SendMessageAgainstBid(txtMessage.Text);

            Response.Write("<script>alert('Your message has been successfuly sent to bidding agency');window.location='../Customer/Projects_Dashboard';</script>");
        }

        protected void btnAccept_Click(object sender, EventArgs e)
        {
            string partnerEmail = string.Empty;
            string customerEmail=string.Empty;
            ViewState["BidId"] = Request.QueryString["id"].ToString();
            //projectId = Convert.ToInt32(Request.QueryString["id"]);
            //projectId = 11;
            BidId = Convert.ToInt32(ViewState["BidId"]);
            ClsBidding bd = new ClsBidding();
            bd.BidId = BidId;

            if(txtMessage.Text != string.Empty)
            {
                bd.SendMessageAgainstBid(txtMessage.Text);
            }

            bd.BiddingAcceptedTrue();
            
            Response.Write("<script>alert('Bid has been successfuly accepted. Partner will send you the details shortly.');window.location='../Customer/Projects_Dashboard';</script>");

        }
       

    }
}