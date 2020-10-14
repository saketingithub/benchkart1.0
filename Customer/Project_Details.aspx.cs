using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Benchkart.Customer
{
    public partial class Project_Details : System.Web.UI.Page
    {
        int ProjectId;
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dtProject;
            if (!IsPostBack)
            {

                //ViewState["ProjectId"] = Request.QueryString["id"].ToString();
                //projectId = Convert.ToInt32(Request.QueryString["id"]);
                //projectId = 11;
                //if (Request.QueryString["id"] != null)
                //{
                ProjectId = Convert.ToInt32(Request.QueryString["id"].ToString());
                //}
                
                ClsProject pj = new ClsProject();

                //pj.CustomerId = Convert.ToInt32(Session["CustomerId"].ToString());
                pj.CustomerId = 0;
                if (Session["CustomerId"] != null)
                {
                    pj.CustomerId = Convert.ToInt32(Session["CustomerId"].ToString());
                }
                else
                {
                    pj.CustomerId = Convert.ToInt32(Request.Cookies["CustomerId"].Value);
                }

                pj.ProjectId = ProjectId;
                dtProject = pj.GetProjectorRequestDetailsforCustomer();
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
        public void DisplayProject(DataTable dtProject)
        {
            string parentId = string.Empty;
            string serviceId = string.Empty;

            DateTime Var = Convert.ToDateTime(dtProject.Rows[0]["CreationDate"]).Date;
            lblCreationDate.Text = Var.ToShortDateString();

            lblCategory.Text = dtProject.Rows[0]["ServiceTitle"].ToString();
            lblSubCategory.Text = dtProject.Rows[0]["SubServiceTitle"].ToString();

            lblTitle.Text = dtProject.Rows[0]["Title"].ToString();
            lblDescription.Text = dtProject.Rows[0]["Description"].ToString();

            int outSourceType = Convert.ToInt32(dtProject.Rows[0]["OutsourceType"].ToString());

            if (dtProject.Rows[0]["City"] != DBNull.Value)
            {
                if (dtProject.Rows[0]["City"].ToString() != string.Empty)
                {
                    lblCity.Text = dtProject.Rows[0]["City"].ToString() +", "+ dtProject.Rows[0]["State"].ToString();
                }
            }
            else if(dtProject.Rows[0]["State"] != DBNull.Value)
            {
                if (dtProject.Rows[0]["State"].ToString() != string.Empty)
                {
                    lblCity.Text = dtProject.Rows[0]["State"].ToString();
                }
            }

            if (dtProject.Rows[0]["Urgency"] != DBNull.Value)
            {
                if(dtProject.Rows[0]["Urgency"].ToString() == "1")
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