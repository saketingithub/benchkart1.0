using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

namespace Benchkart.Customer
{
    public partial class Bid_Detail : System.Web.UI.Page
    { //This is a projectId or requestId based on Status
        int BidId;
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dtProject;
            if (!IsPostBack)
            {

                ViewState["BidId"] = Request.QueryString["id"].ToString();
                //projectId = Convert.ToInt32(Request.QueryString["id"]);
                //projectId = 11;
                BidId = Convert.ToInt32(ViewState["BidId"]);
                ClsBidding pj = new ClsBidding();
                pj.BidId = BidId;
                dtProject = pj.GetBidDetailsForPartner();
                DisplayProject(dtProject);

                int ProjectId = Convert.ToInt32(dtProject.Rows[0]["ProjectId"]);

                int RequestId = 0;
                if (dtProject.Rows[0]["RequestId"] != DBNull.Value)
                {
                    RequestId = Convert.ToInt32(dtProject.Rows[0]["RequestId"]);
                }
                else
                {
                    RequestId = ProjectId;
                }
                DisplayDownloads(RequestId);

            }
        }

       

        public void DisplayProject(DataTable dtProject)
        {
            string parentId = string.Empty;
            string serviceId = string.Empty;

            lblCreationDate.Text = dtProject.Rows[0]["CreationDate"].ToString();

            lblCategory.Text = dtProject.Rows[0]["ServiceTitle"].ToString();
            lblSubCategory.Text = dtProject.Rows[0]["SubServiceTitle"].ToString();

            lblIndustry.Text = dtProject.Rows[0]["CompanyIndustry"].ToString();
            ///lblAboutCompany.Text = dtProject.Rows[0]["CompanyProfile"].ToString();

            lblTitle.Text = dtProject.Rows[0]["Title"].ToString();
            lblDescription.Text = dtProject.Rows[0]["Description"].ToString();

            int outSourceType = Convert.ToInt32(dtProject.Rows[0]["OutsourceType"].ToString());

            if (outSourceType == 2)
            {
                lblTypeofWork.Text = "Outsource Project";
                pnlTalent.Visible = false;
            }
            else
            {
                lblTypeofWork.Text = "Hire Developer";
                lblTalentCount.Text = dtProject.Rows[0]["TalentCount"].ToString();
                if (dtProject.Rows[0]["TalentProficiency"] != DBNull.Value)
                {
                    lblTalentProficiency.Text = dtProject.Rows[0]["TalentProficiency"].ToString();
                }
                lblDuration.Text = dtProject.Rows[0]["Duration"].ToString();
                if (dtProject.Rows[0]["WorkMode"] != DBNull.Value)
                {
                    lblWorkMode.Text = dtProject.Rows[0]["WorkMode"].ToString();
                }
                lblOnsiteLocation.Text = dtProject.Rows[0]["OnsiteLocation"].ToString();
            }

            if (dtProject.Rows[0]["QueryForPartner"] != DBNull.Value)
            {
                lblQuery.Text = dtProject.Rows[0]["QueryForPartner"].ToString();
            }

            if (dtProject.Rows[0]["SkillRequired"] != DBNull.Value)
            {
                lblSkill.Text = dtProject.Rows[0]["SkillRequired"].ToString();
            }

            if (dtProject.Rows[0]["Budget"] != DBNull.Value)
            {
                if (dtProject.Rows[0]["Budget"].ToString() == "1")
                {
                    lblBudget.Text = "<INR 25000";
                }

                else if (dtProject.Rows[0]["Budget"].ToString() == "2")
                {
                    lblBudget.Text = "INR 25000-1 Lac";
                }
                else if (dtProject.Rows[0]["Budget"].ToString() == "3")
                {
                    lblBudget.Text = "INR 1 Lac-10 Lacs";
                }
                else if (dtProject.Rows[0]["Budget"].ToString() == "4")
                {
                    lblBudget.Text = "INR 10-50 Lacs";
                }
                else if (dtProject.Rows[0]["Budget"].ToString() == "5")
                {
                    lblBudget.Text = "INR 50 Lacs +";
                }
                else if (dtProject.Rows[0]["Budget"].ToString() == "6")
                {
                    lblBudget.Text = "<USD 1000";
                }
                else if (dtProject.Rows[0]["Budget"].ToString() == "7")
                {
                    lblBudget.Text = "USD 1K-5K";
                }
                else if (dtProject.Rows[0]["Budget"].ToString() == "8")
                {
                    lblBudget.Text = "USD 5K-20K";
                }
                else if (dtProject.Rows[0]["Budget"].ToString() == "9")
                {
                    lblBudget.Text = "USD 20 K-100K";
                }
                else if (dtProject.Rows[0]["Budget"].ToString() == "10")
                {
                    lblBudget.Text = "USD 100K+";
                }
                else
                {
                    lblBudget.Text = dtProject.Rows[0]["Budget"].ToString();
                }

            }

            else
            {
                lblBudget.Text = "Budget Not Shared";
            }

            if (dtProject.Rows[0]["BidAmount"] != DBNull.Value)
            {
                txtBid.Text = dtProject.Rows[0]["BidAmount"].ToString();
            }
            if (dtProject.Rows[0]["ExecutionRemarks"] != DBNull.Value)
            {
                txtExecution.Text = dtProject.Rows[0]["ExecutionRemarks"].ToString();
            }
            if (dtProject.Rows[0]["Experience"] != DBNull.Value)
            {
                txtExperience.Text = dtProject.Rows[0]["Experience"].ToString();
            }

           
            if(dtProject.Rows[0]["GetCallBack"]!=DBNull.Value)
            {
                if (Convert.ToInt32(dtProject.Rows[0]["GetCallBack"].ToString()) == 2 )
                {

                    lblFullName.Text = dtProject.Rows[0]["FullName"].ToString();

                    lblCompanyName.Text = dtProject.Rows[0]["CompanyName"].ToString();

                    lblContactNumber.Text = dtProject.Rows[0]["ContactNumber"].ToString();

                    pnlCustomerDetails.Visible = true;
                }
            }           
               
            
            //txtRejectionComments.Text = string.Empty;
            //ddlRejectionCode.ClearSelection();
            //ddlRejectionCode.Items.FindByValue("0").Selected = true;

        }

        public void DisplayDownloads(int projectId)
        {
            if (Directory.Exists(Server.MapPath("~/Uploadfiles/ProjectAttachments/" + projectId + "/")))
            {
                DirectoryInfo di = new DirectoryInfo(Server.MapPath("~/Uploadfiles/ProjectAttachments/" + projectId + "/"));
                int i = 0;
                foreach (FileInfo fi in di.GetFiles())
                {
                    HyperLink HL = new HyperLink();
                    HL.ID = "HyperLink" + i++;
                    HL.Text = fi.Name;
                    HL.NavigateUrl = "~/Download.ashx?file=" + fi.FullName;
                    HL.Attributes.Add("style", "color: blue; text-decoration: underline; line-height: 2;");
                    pnlDownloads.Controls.Add(HL);
                    pnlDownloads.Controls.Add(new LiteralControl("<br/>"));
                }
            }

        }

    }
}