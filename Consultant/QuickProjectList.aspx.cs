using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Net.Mail;
using System.Net;

namespace Benchkart.Consultant
{
    public partial class QuickProjectList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["ConsultantId"] == null)
            {
                Response.Redirect("ConsultantLogin.aspx");
            }
            if (!IsPostBack)
            {
                GetPartnerPackageData();
            }
           
        }
        public void GetPartnerPackageData()
        {
            DataTable dt = new DataTable();
            ClsQuickProject clsqp = new ClsQuickProject();
            if (Request.QueryString["PartnerIdAll"] != null)
            {
                clsqp.PartnerId = Convert.ToInt32(Request.QueryString["PartnerIdAll"]);
                dt = clsqp.GetPartnerPackage();
                if (dt.Rows.Count > 0)
                {
                    grdPackage.Visible = true;
                    grdPackage.DataSource = dt;
                    grdPackage.DataBind();
                }
                else
                {
                    grdPackage.Visible = false;
                }
            }
            else if(Request.QueryString["PartnerIdActive"] != null)
            {
                clsqp.PartnerId = Convert.ToInt32(Request.QueryString["PartnerIdActive"]);
                dt = clsqp.GetPartnerPackageActive();
                if (dt.Rows.Count > 0)
                {
                    grdPackage.Visible = true;
                    grdPackage.DataSource = dt;
                    grdPackage.DataBind();
                }
                else
                {
                    grdPackage.Visible = false;
                }
            }
            else if (Request.QueryString["PartnerIdInActive"] != null)
            {
                clsqp.PartnerId = Convert.ToInt32(Request.QueryString["PartnerIdInActive"]);
                dt = clsqp.GetPartnerPackageInActive();
                if (dt.Rows.Count > 0)
                {
                    grdPackage.Visible = true;
                    grdPackage.DataSource = dt;
                    grdPackage.DataBind();
                }
                else
                {
                    grdPackage.Visible = false;
                }
            }
            else if (Request.QueryString["PartnerIdReject"] != null)
            {
                clsqp.PartnerId = Convert.ToInt32(Request.QueryString["PartnerIdReject"]);
                dt = clsqp.GetPartnerPackageReject();
                if (dt.Rows.Count > 0)
                {
                    grdPackage.Visible = true;
                    grdPackage.DataSource = dt;
                    grdPackage.DataBind();
                }
                else
                {
                    grdPackage.Visible = false;
                }
            }
        }
        public void SetSubCategoryedit(int serviceId)
        {
            ClsServiceMaster sm = new ClsServiceMaster();
            DataTable dtSubCategory = sm.GetSubCategory(serviceId);
            ddlSubCategoryedit.DataSource = dtSubCategory;

            ddlSubCategoryedit.DataTextField = "Title";
            ddlSubCategoryedit.DataValueField = "ServiceId";

            ddlSubCategoryedit.DataBind();
            ddlSubCategoryedit.Items.Insert(0, new ListItem("Select Project SubCategory", ""));
            //ddlSubCategory.Items.FindByValue("0").Selected = true;
        }
        protected void grdPackage_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            pnlMyModal.Attributes.Add("style", "display:block;");
            ClsQuickProject clsqp = new ClsQuickProject();

            clsqp.PartnerPackageId = Convert.ToInt32(e.CommandArgument.ToString());
            if (e.CommandName == "Edt")
            {
                DataTable dt = new DataTable();
                dt = clsqp.GetPartnerPackageByPartnerPackageId();
                if (dt.Rows.Count > 0)
                {
                    ddlCategoryedit.SelectedValue = dt.Rows[0]["CategoryId"].ToString();
                    int serviceId = Convert.ToInt32(ddlCategoryedit.SelectedValue);
                    SetSubCategoryedit(serviceId);
                    ddlSubCategoryedit.SelectedValue = dt.Rows[0]["SubCategoryId"].ToString();
                    GetPackageType();
                    ddlPackageTypeedit.SelectedValue = dt.Rows[0]["PackageType"].ToString();
                    txtPackageNameedit.Text = dt.Rows[0]["PackageName"].ToString();
                    txtPackageDescriptionedit.Text = dt.Rows[0]["PackageDescription"].ToString();
                    ddlIsActive.SelectedValue = dt.Rows[0]["IsActive"].ToString();
                    txtbasicpackagecostedit.Text = dt.Rows[0]["BasicPackageCost"].ToString();
                    txtstandardpackagecostedit.Text = dt.Rows[0]["StandardPackageCost"].ToString();
                    txtpremiumpackagecostedit.Text = dt.Rows[0]["PremiumPackageCost"].ToString();
                    ClsQuickPackageDetails clsqpd = new ClsQuickPackageDetails();
                    DataTable dtq = new DataTable();
                    clsqpd.PartnerPackageId = Convert.ToInt32(e.CommandArgument.ToString());
                    dtq = clsqpd.GetPartnerPackageDetailsByPartnerPackageId();
                    if (dtq.Rows.Count > 0)
                    {
                        grdpackagedetails.Visible = true;
                        grdpackagedetails.DataSource = dtq;
                        grdpackagedetails.DataBind();
                    }
                    else
                    {
                        grdpackagedetails.Visible = false;
                    }

                    ViewState["partnerPackageId"] = e.CommandArgument.ToString();
                }
            }
        }

        protected void ddlCategoryedit_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlCategoryedit.SelectedValue != "")
            {
                int serviceId = Convert.ToInt32(ddlCategoryedit.SelectedValue);
                SetSubCategoryedit(serviceId);
            }
           
        }
        public void GetPatenrPackageDetails()
        {
            ClsQuickPackageDetails clsqp = new ClsQuickPackageDetails();
            clsqp.PartnerPackageId = Convert.ToInt32(ViewState["partnerPackageId"]);
            DataTable dtq = new DataTable();
            dtq = clsqp.GetPartnerPackageDetailsByPartnerPackageId();
            if (dtq.Rows.Count > 0)
            {
                grdpackagedetails.Visible = true;
                grdpackagedetails.DataSource = dtq;
                grdpackagedetails.DataBind();
            }
            else
            {
                grdpackagedetails.Visible = false;
            }
        }

        protected void grdpackagedetails_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int partnerPackageDetailsId = Convert.ToInt32(grdpackagedetails.DataKeys[e.RowIndex].Values[0]);
            GridViewRow row = grdpackagedetails.Rows[e.RowIndex];

            string parameter = (row.FindControl("txtparameteredit") as TextBox).Text;
            string basic = (row.FindControl("txtbasicedit") as TextBox).Text;
            string standard = (row.FindControl("txtstandardedit") as TextBox).Text;
            string premiumedit = (row.FindControl("txtpremiumedit") as TextBox).Text;
            ClsQuickPackageDetails clsqk = new ClsQuickPackageDetails();
            clsqk.PartnerPackageDetailsId = partnerPackageDetailsId;
            clsqk.Parameter = parameter;
            clsqk.BasicDisplayText = basic;
            clsqk.StandardDisplayText = standard;
            clsqk.PremiumDisplayText = premiumedit;
            clsqk.UpdatePartnerPackageDetails();
            grdpackagedetails.EditIndex = -1;
            GetPatenrPackageDetails();
        }

        protected void grdpackagedetails_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grdpackagedetails.EditIndex = -1;
            GetPatenrPackageDetails();
        }

        protected void grdpackagedetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdpackagedetails.PageIndex = e.NewPageIndex;
            GetPatenrPackageDetails();
        }

        protected void grdpackagedetails_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grdpackagedetails.EditIndex = e.NewEditIndex;
            GetPatenrPackageDetails();
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            ClsQuickProject clscpp = new ClsQuickProject();
            clscpp.PartnerPackageId = Convert.ToInt32(ViewState["partnerPackageId"]);
            clscpp.CategoryId = Convert.ToInt32(ddlCategoryedit.SelectedValue);
            clscpp.SubCategoryId = Convert.ToInt32(ddlSubCategoryedit.SelectedValue);
            clscpp.PackageType = Convert.ToInt32(ddlPackageTypeedit.SelectedValue);
            clscpp.PackageName = txtPackageNameedit.Text;
            clscpp.PackageDescription = txtPackageDescriptionedit.Text;
            clscpp.BasicPackageCost = Convert.ToInt32(txtbasicpackagecostedit.Text);
            clscpp.StandardPackageCost = Convert.ToInt32(txtstandardpackagecostedit.Text);
            clscpp.PremiumPackageCost = Convert.ToInt32(txtpremiumpackagecostedit.Text);
            clscpp.IsActive = Convert.ToInt32(ddlIsActive.SelectedValue);
            clscpp.UpdatePartnerPackageByAdmin();
            pnlMyModal.Attributes.Add("style", "display:none;");
            GetPartnerPackageData();
        }

        protected void grdpackagedetails_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        public void GetPackageType()
        {
            ClsPackageType clspk = new ClsPackageType();
            DataTable dt = new DataTable();
            clspk.SubCategoryId = Convert.ToInt32(ddlSubCategoryedit.SelectedValue);
            dt = clspk.GetPackageData();
            ddlPackageTypeedit.DataTextField = "PackageTypeName";
            ddlPackageTypeedit.DataValueField = "PackageTypeId";
            ddlPackageTypeedit.DataSource = dt;
            ddlPackageTypeedit.DataBind();
            ddlPackageTypeedit.Items.Insert(0, new ListItem("Select PackageType", ""));

        }
        protected void ddlSubCategoryedit_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetPackageType();
        }
    }
}