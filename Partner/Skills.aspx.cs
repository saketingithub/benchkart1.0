using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;

namespace Benchkart.Partner
{
    public partial class Skills : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HtmlAnchor a_proSubmenu = (HtmlAnchor)Master.FindControl("a_proSubmenu");
            a_proSubmenu.Style.Add("aria-expanded", "true");
            a_proSubmenu.Attributes.Add("class", "dropdown-toggle");
            a_proSubmenu.Attributes.Add("data-toggle", "");

            HtmlGenericControl proSubmenu = (HtmlGenericControl)Master.FindControl("proSubmenu");
            proSubmenu.Style.Add("aria-expanded", "true");
            proSubmenu.Attributes.Add("class", "list-unstyled collapse in show");


            HtmlAnchor a_Skills = (HtmlAnchor)Master.FindControl("a_Skills");
            a_Skills.Style.Add("background-color", "white");

            if (!IsPostBack)
            {
                DataTable dtSkills = new DataTable();

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

                ClsService sv = new ClsService();
                int isTalentShared = 0;
                txtSkills.Text = sv.GetSkillsforPartner(PartnerId, out isTalentShared);
                if (isTalentShared == 1)
                {
                    chkIsTalentShared.Checked = true;
                }
                else
                {
                    chkIsTalentShared.Checked = false;
                }
            }
        }

        protected void btnUpdateSkills_Click(object sender, EventArgs e)
        {
            ClsService sv = new ClsService();

            //sv.PartnerId = Convert.ToInt32(Session["PartnerId"].ToString());
            sv.PartnerId = 0;
            if (Session["PartnerId"] != null)
            {
                sv.PartnerId = Convert.ToInt32(Session["PartnerId"].ToString());
            }
            else
            {
                sv.PartnerId = Convert.ToInt32(Request.Cookies["PartnerId"].Value);
            }

            String strSkills = txtSkills.Text.Trim().Trim(',');
            strSkills = strSkills.Insert(0, ",");
            strSkills = strSkills + ",";
            int IsTalentShared =Convert.ToInt32(chkIsTalentShared.Checked == true ? "1" : "0");

            sv.UpdatePartnerSkills(strSkills, IsTalentShared);

            Response.Write("<script>alert('Skills has been updated successfully.');</script>");
        }
    }
}