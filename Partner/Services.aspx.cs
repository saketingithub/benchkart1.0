using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Data;
using System.Web.UI.HtmlControls;

namespace Benchkart.Partner
{
    public partial class Services : System.Web.UI.Page
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


            HtmlAnchor a_Services = (HtmlAnchor)Master.FindControl("a_Services");
            a_Services.Style.Add("background-color", "white");


            if (!IsPostBack)
            {
                //LinkButton lnk = (LinkButton)this.ucHeader.FindControl("lnkServices");
                //lnk.BackColor = Color.FromArgb(76, 175, 80);
                DataSet dsServices = new DataSet();

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
                dsServices = sv.GetServicesforPartner(PartnerId);

                LoadServices(dsServices.Tables[0]);

                SetServices(dsServices.Tables[1]);
            }
                        
        }        
        private void SetServices(DataTable dtServices)
        {
            foreach (ListItem item in ddlGraphics.Items)
            {
                foreach (DataRow row in dtServices.Rows)
                {
                    if (item.Value == row["ServiceId"].ToString())
                    {
                        item.Selected = true;
                    }
                }
            }
            foreach (ListItem item in ddlWeb.Items)
            {
                foreach (DataRow row in dtServices.Rows)
                {
                    if (item.Value == row["ServiceId"].ToString())
                    {
                        item.Selected = true;
                    }
                }
            }
            //foreach (ListItem item in ddlEcommerce.Items)
            //{
            //    foreach (DataRow row in dtServices.Rows)
            //    {
            //        if (item.Value == row["ServiceId"].ToString())
            //        {
            //            item.Selected = true;
            //        }
            //    }
            //}
            foreach (ListItem item in ddlDigital.Items)
            {
                foreach (DataRow row in dtServices.Rows)
                {
                    if (item.Value == row["ServiceId"].ToString())
                    {
                        item.Selected = true;
                    }
                }
            }
            foreach (ListItem item in ddlApps.Items)
            {
                foreach (DataRow row in dtServices.Rows)
                {
                    if (item.Value == row["ServiceId"].ToString())
                    {
                        item.Selected = true;
                    }
                }
            }
            foreach (ListItem item in ddlCloud.Items)
            {
                foreach (DataRow row in dtServices.Rows)
                {
                    if (item.Value == row["ServiceId"].ToString())
                    {
                        item.Selected = true;
                    }
                }
            }
            foreach (ListItem item in ddlVoice.Items)
            {
                foreach (DataRow row in dtServices.Rows)
                {
                    if (item.Value == row["ServiceId"].ToString())
                    {
                        item.Selected = true;
                    }
                }
            }
            foreach (ListItem item in ddlKnowledge.Items)
            {
                foreach (DataRow row in dtServices.Rows)
                {
                    if (item.Value == row["ServiceId"].ToString())
                    {
                        item.Selected = true;
                    }
                }
            }
            foreach (ListItem item in ddlBackoffice.Items)
            {
                foreach (DataRow row in dtServices.Rows)
                {
                    if (item.Value == row["ServiceId"].ToString())
                    {
                        item.Selected = true;
                    }
                }
            }
        }
        private void LoadServices(DataTable dtServices)
        {
            DataView dataView = dtServices.DefaultView;

            dataView.RowFilter = "ParentId = 1";
            ddlGraphics.DataSource = dataView;
            ddlGraphics.DataTextField = "Title";
            ddlGraphics.DataValueField = "ServiceId";
            ddlGraphics.DataBind();

            dataView.RowFilter = string.Empty;
            dataView.RowFilter = "ParentId = 2";
            ddlWeb.DataSource = dataView;
            ddlWeb.DataTextField = "Title";
            ddlWeb.DataValueField = "ServiceId";
            ddlWeb.DataBind();

            // dataView.RowFilter = string.Empty;
            //  dataView.RowFilter = "ParentId = 3";
            // ddlEcommerce.DataSource = dataView;
            // ddlEcommerce.DataTextField = "Title";
            // ddlEcommerce.DataValueField = "ServiceId";
            // ddlEcommerce.DataBind();

            dataView.RowFilter = string.Empty;
            dataView.RowFilter = "ParentId = 3";
            ddlDigital.DataSource = dataView;
            ddlDigital.DataTextField = "Title";
            ddlDigital.DataValueField = "ServiceId";
            ddlDigital.DataBind();

            dataView.RowFilter = string.Empty;
            dataView.RowFilter = "ParentId = 4";
            ddlApps.DataSource = dataView;
            ddlApps.DataTextField = "Title";
            ddlApps.DataValueField = "ServiceId";
            ddlApps.DataBind();

            dataView.RowFilter = string.Empty;
            dataView.RowFilter = "ParentId = 5";
            ddlCloud.DataSource = dataView;
            ddlCloud.DataTextField = "Title";
            ddlCloud.DataValueField = "ServiceId";
            ddlCloud.DataBind();

            dataView.RowFilter = string.Empty;
            dataView.RowFilter = "ParentId = 6";
            ddlVoice.DataSource = dataView;
            ddlVoice.DataTextField = "Title";
            ddlVoice.DataValueField = "ServiceId";
            ddlVoice.DataBind();

            dataView.RowFilter = string.Empty;
            dataView.RowFilter = "ParentId = 7";
            ddlKnowledge.DataSource = dataView;
            ddlKnowledge.DataTextField = "Title";
            ddlKnowledge.DataValueField = "ServiceId";
            ddlKnowledge.DataBind();

            dataView.RowFilter = string.Empty;
            dataView.RowFilter = "ParentId = 8";
            ddlBackoffice.DataSource = dataView;
            ddlBackoffice.DataTextField = "Title";
            ddlBackoffice.DataValueField = "ServiceId";
            ddlBackoffice.DataBind();

        }
        protected void btnUpdateServices_Click(object sender, EventArgs e)
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

            string serviceIdList = ListServicesandTech();
            sv.UpdatePartnerServices(serviceIdList);
            Response.Write("<script>alert('Services have been updated successfully')</script>");
        }
        private string ListServicesandTech()
        {
            string serviceId = string.Empty;
            foreach (ListItem item in ddlGraphics.Items)
            {
                if (item.Selected)
                {
                    serviceId += "," + item.Value;
                }
            }
            foreach (ListItem item in ddlWeb.Items)
            {
                if (item.Selected)
                {
                    serviceId += "," + item.Value;
                }
            }
            //foreach (ListItem item in ddlEcommerce.Items)
            //{
            //    if (item.Selected)
            //    {
            //        serviceId += "," + item.Value;
            //    }
            //}
            foreach (ListItem item in ddlDigital.Items)
            {
                if (item.Selected)
                {
                    serviceId += "," + item.Value;
                }
            }
            foreach (ListItem item in ddlApps.Items)
            {
                if (item.Selected)
                {
                    serviceId += "," + item.Value;
                }
            }
            foreach (ListItem item in ddlCloud.Items)
            {
                if (item.Selected)
                {
                    serviceId += "," + item.Value;
                }
            }
            foreach (ListItem item in ddlVoice.Items)
            {
                if (item.Selected)
                {
                    serviceId += "," + item.Value;
                }
            }
            foreach (ListItem item in ddlKnowledge.Items)
            {
                if (item.Selected)
                {
                    serviceId += "," + item.Value;
                }
            }
            foreach (ListItem item in ddlBackoffice.Items)
            {
                if (item.Selected)
                {
                    serviceId += "," + item.Value;
                }
            }
            //foreach (ListItem item in ddl.Items)
            //{
            //    if (item.Selected)
            //    {
            //        serviceId += "," + item.Value;
            //    }
            //}
            serviceId = serviceId + ",";
            return serviceId;
        }
    }
}