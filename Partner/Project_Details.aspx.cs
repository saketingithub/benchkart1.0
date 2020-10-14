using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;


namespace Benchkart.Partner
{
    public partial class Project_Details : System.Web.UI.Page
    {
        //This is a projectId or requestId based on Status
        int ProjectId;
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dtProject;
            if (!IsPostBack)
            {

                ViewState["ProjectId"] = Request.QueryString["id"].ToString();
                //projectId = Convert.ToInt32(Request.QueryString["id"]);
                //projectId = 11;
                ProjectId = Convert.ToInt32(ViewState["ProjectId"]);
                ClsProject pj = new ClsProject();
                pj.ProjectId = ProjectId;
                dtProject = pj.GetProjectDetailsforPartner();
                DisplayProject(dtProject);

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

        protected void btnPostBid_Click(object sender, EventArgs e)
        {
            DataTable dtNextProject = new DataTable();
            ClsBidding bd = new ClsBidding();
            bd.ProjectId = Convert.ToInt32(ViewState["ProjectId"]);

            //bd.PartnerId = Convert.ToInt32(Session["PartnerId"]);

            bd.PartnerId = 0;
            if (Session["PartnerId"] != null)
            {
                bd.PartnerId = Convert.ToInt32(Session["PartnerId"].ToString());
            }
            else
            {
                //HttpCookie cookie  = Request.Cookies
                bd.PartnerId = Convert.ToInt32(Request.Cookies["PartnerId"].Value);
            }

            bd.BidAmount = Convert.ToInt32(txtBid.Text);
            bd.ExecutionRemarks = txtExecution.Text;
            bd.Experience = txtExperience.Text;

            bd.SubmitBidbyPartner();
            
            Response.Write("<script>alert('Your bid successfully submitted.');window.location='Projects';</script>");
        }

        //protected void btnSkipProject_Click(object sender, EventArgs e)
        //{
        //    DataTable dtNextProject = new DataTable();
        //    ClsBidding bd = new ClsBidding();
        //    bd.ProjectId = Convert.ToInt32(ViewState["ProjectId"]);
        //    bd.PartnerId = Convert.ToInt32(Session["PartnerId"]);

        //    bd.RejectionCode = Convert.ToInt32(ddlRejectionCode.SelectedValue);
        //    bd.RejectionReason = txtRejectionComments.Text;

        //    dtNextProject = bd.SkipProjectbyPartner();

        //    DisplayProject(dtNextProject);
        //}

        public void DisplayProject(DataTable dtProject)
        {
            string parentId = string.Empty;
            string serviceId = string.Empty;

            DateTime Var = Convert.ToDateTime(dtProject.Rows[0]["CreationDate"]).Date;
            lblCreationDate.Text = Var.ToShortDateString();

            lblCategory.Text = dtProject.Rows[0]["ServiceTitle"].ToString();
            lblSubCategory.Text = dtProject.Rows[0]["SubServiceTitle"].ToString();

            lblIndustry.Text = dtProject.Rows[0]["CompanyIndustry"].ToString();
            //lblAboutCompany.Text = dtProject.Rows[0]["CompanyProfile"].ToString();

            lblTitle.Text = dtProject.Rows[0]["Title"].ToString();
            lblDescription.Text = dtProject.Rows[0]["Description"].ToString();
            lblRemarks.Text = dtProject.Rows[0]["StatusComment"].ToString();
            int outSourceType = Convert.ToInt32(dtProject.Rows[0]["OutsourceType"].ToString());

            if (dtProject.Rows[0]["City"] != DBNull.Value)
            {
                if (dtProject.Rows[0]["City"].ToString() != string.Empty)
                {
                    lblCity.Text = dtProject.Rows[0]["City"].ToString() + ", " + dtProject.Rows[0]["State"].ToString();
                }
            }
            else if (dtProject.Rows[0]["State"] != DBNull.Value)
            {
                if (dtProject.Rows[0]["State"].ToString() != string.Empty)
                {
                    lblCity.Text = dtProject.Rows[0]["State"].ToString();
                }
            }


            if (dtProject.Rows[0]["Urgency"] != DBNull.Value)
            {
                if (dtProject.Rows[0]["Urgency"].ToString() == "1")
                {
                    lblUrgency.Text = "Immediate";
                }
                else if (dtProject.Rows[0]["Urgency"].ToString() == "2")
                {
                    lblUrgency.Text = "within 30 days";
                }
                else if (dtProject.Rows[0]["Urgency"].ToString() == "3")
                {
                    lblUrgency.Text = "> 30 days";
                }
            }

            if (dtProject.Rows[0]["Duration"] != DBNull.Value)
            {
                if (dtProject.Rows[0]["Duration"].ToString() != string.Empty)
                {
                    lblDurationProject.Text = dtProject.Rows[0]["Duration"].ToString();
                }
            }

            if (outSourceType == 2)
            {
                lblTypeofWork.Text = "Outsource Project";
                
                
            }
            else
            {
                if (dtProject.Rows[0]["TalentType"] != DBNull.Value)
                {
                    if (dtProject.Rows[0]["TalentType"].ToString() == "0")
                    {
                        lblTypeofWork.Text = "Part Time - Hire Developer";

                        pnlPartTime.Visible = true;

                        if (dtProject.Rows[0]["Basic"] != DBNull.Value)
                        {
                            lblBasicPartTime.Text = dtProject.Rows[0]["Basic"].ToString();
                        }
                        if (dtProject.Rows[0]["Intermediate"] != DBNull.Value)
                        {
                            lblIntermediatePartTime.Text = dtProject.Rows[0]["Intermediate"].ToString();
                        }
                        if (dtProject.Rows[0]["Expert"] != DBNull.Value)
                        {
                            lblExpertPartTime.Text = dtProject.Rows[0]["Expert"].ToString();
                        }
                        if (dtProject.Rows[0]["BasicHours"] != DBNull.Value)
                        {
                            lblBasicHoursperWeek.Text = dtProject.Rows[0]["BasicHours"].ToString();
                        }
                        if (dtProject.Rows[0]["IntermediateHours"] != DBNull.Value)
                        {
                            lblIntermediateHoursperWeek.Text = dtProject.Rows[0]["IntermediateHours"].ToString();
                        }
                        if (dtProject.Rows[0]["ExpertHours"] != DBNull.Value)
                        {
                            lblExpertHoursperWeek.Text = dtProject.Rows[0]["ExpertHours"].ToString();
                        }
                        if (dtProject.Rows[0]["TalentCount"] != DBNull.Value)
                        {
                            lblPartTimeCount.Text = dtProject.Rows[0]["TalentCount"].ToString();
                        }

                    }
                    else if (dtProject.Rows[0]["TalentType"].ToString() == "1")
                    {
                        lblTypeofWork.Text = "Full Time - Hire Developer";
                        pnlFullTime.Visible = true;

                        if (dtProject.Rows[0]["Basic"] != DBNull.Value)
                        {
                            lblBasic.Text = dtProject.Rows[0]["Basic"].ToString();
                        }
                        if (dtProject.Rows[0]["Intermediate"] != DBNull.Value)
                        {
                            lblIntermediate.Text = dtProject.Rows[0]["Intermediate"].ToString();
                        }
                        if (dtProject.Rows[0]["Expert"] != DBNull.Value)
                        {
                            lblExpert.Text = dtProject.Rows[0]["Expert"].ToString();
                        }
                        
                        if (dtProject.Rows[0]["TalentCount"] != DBNull.Value)
                        {
                            txtTotalCount.Text = dtProject.Rows[0]["TalentCount"].ToString();
                        }
                        if (dtProject.Rows[0]["WorkMode"] != DBNull.Value)
                        {
                            if (dtProject.Rows[0]["WorkMode"].ToString() == "1")
                            {
                                lblWorkMode.Text = "Remote";
                            }
                            else if (dtProject.Rows[0]["WorkMode"].ToString() == "2")
                            {
                                lblWorkMode.Text = "Onsite";
                            }
                            else if (dtProject.Rows[0]["WorkMode"].ToString() == "3")
                            {
                                lblWorkMode.Text = "Periodic Onsite";
                            }
                        }
                    }
                }              
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

            txtBid.Text = string.Empty;
            txtExecution.Text = string.Empty;
            txtExperience.Text = string.Empty;
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