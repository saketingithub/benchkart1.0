using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Web.UI.HtmlControls;

namespace Benchkart.Partner
{
    public partial class Projects_Dashboard : System.Web.UI.Page
    {
        public int cLine = 0;
        DataSet dsProjects = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                
                 HtmlAnchor a_Projects_Dashboard = (HtmlAnchor)Master.FindControl("a_Projects_Dashboard");
                a_Projects_Dashboard.Style.Add("background-color", "white");

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

                ClsProject pj = new ClsProject();
                dsProjects = pj.GetProjectsDashboardforPartner(PartnerId);
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
        }

        protected void lstProjects_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            string id = string.Empty;

            id = (e.Item.FindControl("hfProjectId") as HiddenField).Value;

            DataTable dtPayments = new DataTable();
            dtPayments = dsProjects.Tables[1];
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
       
        protected void lstProjects_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if(e.CommandName=="status")
            {
                ClsProject pj = new ClsProject();
                pj.ProjectId =Convert.ToInt32( e.CommandArgument.ToString());
                pj.CloseProjectbyPartner();
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
                    strStatus = "Bid Accepted - Now Discuss with Client & Create Contract Under Contract Tab";
                    break;
                case 4:
                    strStatus = "Contract Sent for Customer Approval";
                    break;
                case 5:
                    strStatus = "Contract Approved";
                    break;
                case 6:
                    strStatus = "Delivery & Payment In Progress";
                    break;
                case 7:
                    strStatus = "Project Closure Request Raised";
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
                    strStatus = "Contract Not Approved. Re-Send Contract to Client";
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
                    strStatus = "Payment Request Sent";
                    break;
                case 2:
                    strStatus = "Payment Rejected by Customer";
                    break;
                case 3:
                    strStatus = "Payment Successfuly Submitted";
                    break;
                case 4:
                    strStatus = "Payment Release Request Sent";
                    break;
                case 5:
                    strStatus = "Payment Released Successfuly";
                    break;
                
            }

            return strStatus;
        }
    }
}