using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
using System.IO;


namespace Benchkart.Customer
{
    public partial class Projects_Dashboard : System.Web.UI.Page
    {
        public int cLine = 0;
        DataSet dsProjects = new DataSet();
        public string orderId;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                HtmlGenericControl li_Projects_Dashboard = (HtmlGenericControl)Master.FindControl("li_Projects_Dashboard");
                li_Projects_Dashboard.Style.Add("background-color", "white");
                //int CustomerId = Convert.ToInt32(Session["CustomerId"].ToString());
                int CustomerId = 0;
                if (Session["CustomerId"] != null)
                {
                    CustomerId = Convert.ToInt32(Session["CustomerId"].ToString());
                }
                else
                {
                    CustomerId = Convert.ToInt32(Request.Cookies["CustomerId"].Value);
                }

                ClsProject pj = new ClsProject();

                int projectsCount = 0, bidsCount = 0, projectsRunningCount = 0, projectsClosedCount = 0;

                dsProjects = pj.GetProjectsDashboardforCustomer(CustomerId, ref projectsCount, ref bidsCount, ref projectsRunningCount, ref projectsClosedCount);

                lblprojectsCount.Text = projectsCount.ToString();
                lblbidsCount.Text = bidsCount.ToString();
                lblprojectsRunningCount.Text = projectsRunningCount.ToString();
                lblprojectsClosedCount.Text = projectsClosedCount.ToString();

                if (dsProjects.Tables.Count > 0)
                {
                    DataTable dtProjects = new DataTable();
                    dtProjects = dsProjects.Tables[0];

                    if (dtProjects.Rows.Count > 0)
                    {
                        // projects = dtProjects.ToList();
                        lstProjects.DataSource = dtProjects;
                        lstProjects.DataBind();
                    }
                    else
                    {
                        pnlSearchingProjects.Visible = true;
                    }
                }
                else
                {
                    pnlSearchingProjects.Visible = true;
                }
            }
        }

        protected void lstProjects_ItemDataBound(object sender, ListViewItemEventArgs e)
        {

            string id = string.Empty;
            id = (e.Item.FindControl("hfProjectId") as HiddenField).Value;

            if (dsProjects.Tables.Count > 1)
            {

                DataTable dtBids = new DataTable();
                dtBids = dsProjects.Tables[1];
                DataView dvBids = new DataView(dtBids);
                dvBids.RowFilter = "ProjectId = " + id;

                if (dvBids.Count > 0)
                {
                    ListView lstBids = (e.Item.FindControl("lstBids") as ListView);
                    lstBids.Visible = true;

                    lstBids.DataSource = dvBids;
                    lstBids.DataBind();


                }

                DataTable dtPayments = new DataTable();
                dtPayments = dsProjects.Tables[2];
                DataView dvPayments = new DataView(dtPayments);
                dvPayments.RowFilter = "ProjectId = " + id;

                if (dvPayments.Count > 0)
                {
                    ListView lstPayments = (e.Item.FindControl("lstPayments") as ListView);
                    lstPayments.Visible = true;

                    lstPayments.DataSource = dvPayments;
                    lstPayments.DataBind();


                }

                HiddenField hfContractId = (HiddenField)e.Item.FindControl("hfContractId");

                if (hfContractId != null && hfContractId.Value != null && hfContractId.Value != string.Empty)
                {
                    int contractId;
                    contractId = Convert.ToInt32(hfContractId.Value);

                    Panel pnlAttachments = e.Item.FindControl("pnlContractAttachments") as Panel;
                    if (Directory.Exists(Server.MapPath("~/Uploadfiles/Contracts/" + contractId + "/")))
                    {
                        DirectoryInfo di = new DirectoryInfo(Server.MapPath("~/Uploadfiles/Contracts/" + contractId + "/"));
                        int i = 0;
                        foreach (FileInfo fi in di.GetFiles())
                        {
                            HyperLink HL = new HyperLink();
                            HL.ID = "HyperLink" + i++;
                            HL.Text = fi.Name;
                            HL.NavigateUrl = "~/Download.ashx?file=" + fi.FullName;
                            HL.Attributes.Add("style", "color: blue; text-decoration: underline; line-height: 2;");
                            pnlAttachments.Controls.Add(HL);
                            pnlAttachments.Controls.Add(new LiteralControl("<br/>"));
                        }
                    }

                }


            }

        }


        protected void lstPayments_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            int paymentRequestId;

            paymentRequestId = Convert.ToInt32((e.Item.FindControl("hfPaymentRequestId") as HiddenField).Value);

            Panel pnlAttachments = e.Item.FindControl("pnlAttachments") as Panel;
            if (Directory.Exists(Server.MapPath("~/Uploadfiles/Payments/" + paymentRequestId + "/")))
            {
                DirectoryInfo di = new DirectoryInfo(Server.MapPath("~/Uploadfiles/Payments/" + paymentRequestId + "/"));
                int i = 0;
                foreach (FileInfo fi in di.GetFiles())
                {
                    HyperLink HL = new HyperLink();
                    HL.ID = "HyperLink" + i++;
                    HL.Text = fi.Name;
                    HL.NavigateUrl = "~/Download.ashx?file=" + fi.FullName;
                    HL.Attributes.Add("style", "color: blue; text-decoration: underline; line-height: 2;");
                    pnlAttachments.Controls.Add(HL);
                    pnlAttachments.Controls.Add(new LiteralControl("<br/>"));
                }
            }
            //string folderPath = Server.MapPath("~/Uploadfiles/"+ paymentRequestId);           

        }

        protected void lstPayments_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            //if (e.CommandName == "AcceptContract")
            //{
            //    int ContractId = Convert.ToInt32((e.Item.FindControl("hfContractId") as HiddenField).Value);
            //    ClsContract co = new ClsContract();
            //    co.ContractId = ContractId;
            //    co.ApprovedByCustomer = 1;

            //    co.ApproveContract();
            //    Response.Redirect("Projects_Dashboard");
            //    //Response.Write("<script>alert('Contract is approved. Partner agency will start the work');</script>");
            //}

           

        }

        

        protected void lstProjects_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if(e.CommandName == "AcceptContract")
            {
                int ContractId = Convert.ToInt32((e.Item.FindControl("hfContractId") as HiddenField).Value);
                ClsContract co = new ClsContract();
                co.ContractId = ContractId;
                co.ApprovedByCustomer = 30;
               
                co.ApproveContract();
                //Response.Redirect("Projects_Dashboard");
                Response.Write("<script>alert('Contract has been approved. Agency will start work now!');window.location='../Customer/Projects_Dashboard';</script>");
                //Response.Write("<script>alert('Contract is approved. Partner agency will start the work');</script>");
            }

            else if (e.CommandName == "SendBackContract")
            {
                int ContractId = Convert.ToInt32((e.Item.FindControl("hfContractId") as HiddenField).Value);
                ClsContract co = new ClsContract();
                co.ContractId = ContractId;
                co.ApprovedByCustomer = 10;

                co.ApproveContract();
                //Response.Redirect("Projects_Dashboard");
                Response.Write("<script>alert('Contract has been sent back for review to Agency!');window.location='../Customer/Projects_Dashboard';</script>");
                //Response.Write("<script>alert('Contract is sent back to agency for revision.');</script>");

            }
			else if (e.CommandName == "status")
            {
                string id = string.Empty;
                id = (e.Item.FindControl("hfProjectId") as HiddenField).Value;
                ClsProject pj = new ClsProject();
                pj.ProjectId = Convert.ToInt32(e.CommandArgument.ToString());
                pj.CloseProjectbyCustomer();
                Response.Redirect("~/Customer/Customer_Review?ProjectId="+id);
            }
        }

        protected void lstBids_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "AcceptBid")
            {

                int BidId = Convert.ToInt32((e.Item.FindControl("hfBidId") as HiddenField).Value);
                ClsBidding bd = new ClsBidding();
                bd.BidId = BidId;
                bd.BiddingAcceptedTrue();

                Response.Write("<script>alert('Bid has been successfuly accepted. Agency will send you the CONTRACT shortly.');window.location='../Customer/Projects_Dashboard';</script>");


            }
            else if (e.CommandName == "GetCallBack")
            {
                LinkButton getcallback = (LinkButton)e.Item.FindControl("btnGetCallBack");
                Label getcall = (Label)e.Item.FindControl("LabelGetCallBack");
                int BidId = Convert.ToInt32((e.Item.FindControl("hfBidId") as HiddenField).Value);
                ClsBidding bd = new ClsBidding();
                bd.BidId = BidId;
                bd.BiddingGetCallBack();
                getcallback.Visible = false;
                getcall.Visible = true;

                
            }
            else if(e.CommandName== "getcontact")
            {
                int BidId = Convert.ToInt32((e.Item.FindControl("hfBidId") as HiddenField).Value);
                HyperLink getcallback = (HyperLink)e.Item.FindControl("hplContactNumber");
                LinkButton getcall = (LinkButton)e.Item.FindControl("btncontact");
                ClsBidding bd = new ClsBidding();
                bd.BidId = BidId;
                bd.BiddingContactGetCallBack();
                
                getcallback.Visible = true;
                getcall.Visible = false;
                
            }
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
                    strStatus = "Delivery In Progress";
                    break;
                case 7:
                    strStatus = "Project Closure Request Raised by Agency";
                    break;
                case 8:
                    strStatus = "Project Closed";
                    break;
                case 9:
                    strStatus = "Project Closed";
                    break;
                case 10:
                    strStatus = "Project Closed";
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

        protected string SetPaymentStatus(int PaymentStatus)
        {
            string strStatus = string.Empty;

            switch (PaymentStatus)
            {
                case 1:
                    strStatus = "Payment Request by Agency";
                    break;
                case 2:
                    strStatus = "Payment Request Rejected";
                    break;
                case 3:
                    strStatus = "Payment Successfuly Submitted";
                    break;
                case 4:
                    strStatus = "Payment Release Requested";
                    break;
                case 5:
                    strStatus = "Payment Released";
                    break;

            }

            return strStatus;
        }



    }
}