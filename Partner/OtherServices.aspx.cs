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
    public partial class OtherServices : System.Web.UI.Page
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


            HtmlAnchor a_OtherServices = (HtmlAnchor)Master.FindControl("a_OtherServices");
            a_OtherServices.Style.Add("background-color", "white");

            if (!IsPostBack)
            {
                DataTable dtOtherServices = new DataTable();

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

                dtOtherServices = sv.GetPartnerOtherServicesOffers(PartnerId);

                if (dtOtherServices.Rows.Count > 0)
                {
                    if (dtOtherServices.Rows[0]["isTrialOffered"] != DBNull.Value)
                    {
                        chkFreeTrial.Checked = Convert.ToBoolean(dtOtherServices.Rows[0]["isTrialOffered"]);
                    }
                    else
                    {
                        chkFreeTrial.Checked = false;
                    }

                    if (dtOtherServices.Rows[0]["isBenchShared"] != DBNull.Value)
                    {
                        chkBenchShared.Checked = Convert.ToBoolean(dtOtherServices.Rows[0]["isBenchShared"]);
                    }
                    else
                    {
                        chkBenchShared.Checked = false;
                    }

                    if (dtOtherServices.Columns.Count > 2)
                    {
                        if (dtOtherServices.Rows.Count > 0)
                        {
                            if (dtOtherServices.Rows[0]["ServiceId"] != DBNull.Value)
                            {
                                ddlCategory1.SelectedValue = dtOtherServices.Rows[0]["ServiceId"].ToString();
                            }
                            if (dtOtherServices.Rows[0]["SubService"] != DBNull.Value)
                            {
                                txtSubcategory1.Text = dtOtherServices.Rows[0]["SubService"].ToString();
                            }
                            if (dtOtherServices.Rows[0]["Description"] != DBNull.Value)
                            {
                                txtSubcategoryDesc1.Text = dtOtherServices.Rows[0]["Description"].ToString();
                            }
                        }
                        if (dtOtherServices.Rows.Count > 1)
                        {
                            if (dtOtherServices.Rows[1]["ServiceId"] != DBNull.Value)
                            {
                                ddlCategory2.SelectedValue = dtOtherServices.Rows[1]["ServiceId"].ToString();
                            }
                            if (dtOtherServices.Rows[1]["SubService"] != DBNull.Value)
                            {
                                txtSubcategory2.Text = dtOtherServices.Rows[1]["SubService"].ToString();
                            }
                            if (dtOtherServices.Rows[1]["Description"] != DBNull.Value)
                            {
                                txtSubcategoryDesc2.Text = dtOtherServices.Rows[1]["Description"].ToString();
                            }
                        }
                        if (dtOtherServices.Rows.Count > 2)
                        {
                            if (dtOtherServices.Rows[2]["ServiceId"] != DBNull.Value)
                            {
                                ddlCategory3.SelectedValue = dtOtherServices.Rows[2]["ServiceId"].ToString();
                            }
                            if (dtOtherServices.Rows[2]["SubService"] != DBNull.Value)
                            {
                                txtSubcategory3.Text = dtOtherServices.Rows[2]["SubService"].ToString();
                            }
                            if (dtOtherServices.Rows[2]["Description"] != DBNull.Value)
                            {
                                txtSubcategoryDesc3.Text = dtOtherServices.Rows[2]["Description"].ToString();
                            }
                        }

                    }
                }
            }

        }

        protected void btnOtherServices_Click(object sender, EventArgs e)
        {
            //try
            //{
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

                ClsPartner pv = new ClsPartner();
                pv.PartnerId = PartnerId;
                //Update other services and offers
                int category1 = Convert.ToInt32(ddlCategory1.SelectedValue);
                string strSubCategory1 = txtSubcategory1.Text;
                string strSubCategoryDesc1 = txtSubcategoryDesc1.Text;

                int category2 = Convert.ToInt32(ddlCategory2.SelectedValue);
                string strSubCategory2 = txtSubcategory2.Text;
                string strSubCategoryDesc2 = txtSubcategoryDesc2.Text;

                int category3 = Convert.ToInt32(ddlCategory3.SelectedValue);
                string strSubCategory3 = txtSubcategory3.Text;
                string strSubCategoryDesc3 = txtSubcategoryDesc3.Text;

                int isBenchShared = Convert.ToInt32(chkBenchShared.Checked);

                int isTrialOffered = Convert.ToInt32(chkFreeTrial.Checked);

                pv.UpdatePartnerOtherServicesOffers(category1, strSubCategory1, strSubCategoryDesc1, category2, strSubCategory2, strSubCategoryDesc2, 
                    category3, strSubCategory3, strSubCategoryDesc3, isBenchShared, isTrialOffered);

                Response.Write("<script>alert('Other services has been updated successfully.');</script>");
            //}
            //catch (Exception ex)
            //{
                //Response.Redirect("Acknowledgement", false);
            //}
        }
    }
}