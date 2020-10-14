using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Benchkart.Admin
{
    public partial class Project_Details : System.Web.UI.Page
    {
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
                dtProject = pj.GetProjectDetailsforAdmin();
                DisplayProject(dtProject);
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
            lblAboutCompany.Text = dtProject.Rows[0]["CompanyProfile"].ToString();

            lblTitle.Text = dtProject.Rows[0]["Title"].ToString();
            lblDescription.Text = dtProject.Rows[0]["Description"].ToString();

            int outSourceType = Convert.ToInt32(dtProject.Rows[0]["OutsourceType"].ToString());

            if (outSourceType == 2)
            {
                lblTypeofWork.Text = "Outsource Service";
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

            if (dtProject.Rows[0]["SkillRequired"] != DBNull.Value)
            {
                lblSkill.Text = dtProject.Rows[0]["SkillRequired"].ToString();
            }

            if (dtProject.Rows[0]["Budget"] != DBNull.Value)
            {
                lblBudget.Text = dtProject.Rows[0]["Budget"].ToString();
            }

            if (dtProject.Rows[0]["QueryForPartner"] != DBNull.Value)
            {
                if (dtProject.Rows[0]["BudgetType"].ToString() == "1")
                {
                    lblBudgetType.Text = "Fixed";
                }
                else
                {
                    lblBudgetType.Text = "Per Hour";
                }

            }

           

        }
        protected void btnPostBid_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/Projects.aspx");
        }
    }
}