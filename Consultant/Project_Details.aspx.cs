using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Benchkart.Consultant
{
    public partial class Project_Details : System.Web.UI.Page
    {
        int ProjectId;
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dtProject;

            if (Request.Cookies["ConsultantId"] == null)
            {
                Response.Redirect("ConsultantLogin.aspx");
            }

            if (!IsPostBack)
            {

                //ViewState["ProjectId"] = Convert.ToInt32(Request.QueryString["ProjectId"]);
                //projectId = Convert.ToInt32(Request.QueryString["id"]);
                //projectId = 11;
                //ProjectId = Convert.ToInt32(ViewState["ProjectId"]);
                ProjectId = Convert.ToInt32(Request.QueryString["ProjectId"]);

                ClsProject pj = new ClsProject();
               // pj.CustomerId = Convert.ToInt32(Session["CustomerId"].ToString());
                pj.ProjectId = ProjectId;
                dtProject = pj.GetProjectorDetailsforCustomer();
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

            lblCreationDate.Text = dtProject.Rows[0]["CreationDate"].ToString();

            lblCategory.Text = dtProject.Rows[0]["ServiceTitle"].ToString();
            lblSubCategory.Text = dtProject.Rows[0]["SubServiceTitle"].ToString();

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
                lblTypeofWork.Text = "Talent Required";
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

            if (dtProject.Rows[0]["StatusComment"] != DBNull.Value)
            {
                lblBenchkartComments.Text = dtProject.Rows[0]["StatusComment"].ToString();
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

            if (dtProject.Rows[0]["ConsultantComments"] != DBNull.Value)
            {
                lblConsultantComment.Text = dtProject.Rows[0]["ConsultantComments"].ToString();
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

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
           
            int  ProjectId = Convert.ToInt32(Request.QueryString["ProjectId"]);
            ClsProject clsproj = new ClsProject();
            clsproj.ProjectId =ProjectId;
            clsproj.ConsultantComments = DateTime.Now.ToString() + "  " + txtconsultantcomments.Text;
            clsproj.CreateConsultantComment();
            Response.Redirect("Projects.aspx");
        }
    }
}