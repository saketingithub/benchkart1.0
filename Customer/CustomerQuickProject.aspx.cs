using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Benchkart.Customer
{
    public partial class CustomerQuickProject : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetAllPackage();
            }
        }
        public void GetAllPackage()
        {
            DataTable dt = new DataTable();
            ClsQuickProject clsqp = new ClsQuickProject();
            dt = clsqp.GetPartnerPackageAll();
            if (dt.Rows.Count > 0)
            {
                lblcount.Text = dt.Rows.Count.ToString(); 
                dlQuickProjects.Visible = true;
                dlQuickProjects.DataSource = dt;
                dlQuickProjects.DataBind();
            }
            else
            {
                lblcount.Text = "";
                dlQuickProjects.Visible = false;
            }
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            ClsQuickProject clsqp = new ClsQuickProject();
            string category = txtsearch.Text;
            string subcategory= txtsearch.Text;
            string packagetypename= txtsearch.Text;
           
            DataTable dt = new DataTable();
            dt = clsqp.GetPartnerPackageSearchor(category,subcategory,packagetypename);
            if (dt.Rows.Count > 0)
            {
                lblcount.Text = dt.Rows.Count.ToString();
                dlQuickProjects.Visible = true;
                dlQuickProjects.DataSource = dt;
                dlQuickProjects.DataBind();
               
            }
            else
            {
                lblcount.Text = "";
                dlQuickProjects.Visible = false;
                txtsearch.Text = "";
            }

        }

        protected void btnSearchRefilter_Click(object sender, EventArgs e)
        {
            ClsQuickProject clsqp = new ClsQuickProject();
           
           
            if (ddlCategoryIdRefilter.SelectedValue != "")
            {
                clsqp.CategoryId = Convert.ToInt32(ddlCategoryIdRefilter.SelectedValue);
            }
           

            if (ddlSubCategoryIdRefilter.SelectedValue != "")
            {
                clsqp.SubCategoryId = Convert.ToInt32(ddlSubCategoryIdRefilter.SelectedValue);
            }
           
            if (ddlPackageTypeRefilter.SelectedValue != "")
            {
                clsqp.PackageType = Convert.ToInt32(ddlPackageTypeRefilter.SelectedValue);
            }
           

            
          
            DataTable dt = new DataTable();
            dt = clsqp.GetPartnerPackageSearchand();
            if (dt.Rows.Count > 0)
            {
                lblcount.Text = dt.Rows.Count.ToString();
                dlQuickProjects.Visible = true;
                dlQuickProjects.DataSource = dt;
                dlQuickProjects.DataBind();
            }
            else
            {
                lblcount.Text = "";
                dlQuickProjects.Visible = false;
            }
        }
        public void SetSubCategory(int serviceId)
        {
            // ddlSubCategory.Items.Clear();

            ClsServiceMaster sm = new ClsServiceMaster();
            DataTable dtSubCategory = sm.GetSubCategory(serviceId);
            ddlSubCategoryIdRefilter.DataSource = dtSubCategory;
           // ddlSubCategory.DataSource = dtSubCategory;
            //ddlSubCategory.DataTextField = "Title";
            //ddlSubCategory.DataValueField = "ServiceId";
            ddlSubCategoryIdRefilter.DataTextField = "Title";
            ddlSubCategoryIdRefilter.DataValueField = "ServiceId";
           // ddlSubCategory.DataBind();
            //ddlSubCategory.Items.Insert(0, new ListItem("Select Project SubCategory", ""));
            ddlSubCategoryIdRefilter.DataBind();
            ddlSubCategoryIdRefilter.Items.Insert(0, new ListItem("Select Project SubCategory", ""));
            //ddlSubCategory.Items.FindByValue("0").Selected = true;



        }
        protected void ddlCategoryIdRefilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlCategoryIdRefilter.SelectedValue != "")
            {
                int serviceId = Convert.ToInt32(ddlCategoryIdRefilter.SelectedValue);
                SetSubCategory(serviceId);
            }
           
        }

        protected void dlQuickProjects_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "Edt")
            {
                int partnerPackageId = Convert.ToInt32(e.CommandArgument.ToString());
                DataTable dt = new DataTable();
                ClsQuickProject clsqp = new ClsQuickProject();
                ClsQuickPackageDetails clsqpd = new ClsQuickPackageDetails();
                clsqp.PartnerPackageId = partnerPackageId;
                dt = clsqp.GetPartnerPackageByCustomer();
                if (dt.Rows.Count > 0)
                {

                    //ddlCategory.SelectedValue = dt.Rows[0]["CategoryId"].ToString();

                    //    int serviceId = Convert.ToInt32(ddlCategory.SelectedValue);
                    //    SetSubCategory(serviceId);
                    //    ddlSubCategory.SelectedValue = dt.Rows[0]["SubCategoryId"].ToString();

                    //ddlPackageType.SelectedValue = dt.Rows[0]["PackageType"].ToString();
                    lbltitle.Text = dt.Rows[0]["CategoryId"].ToString();
                    lblsubtitle.Text= dt.Rows[0]["SubCategoryId"].ToString();
                    lblpackagetypename.Text=dt.Rows[0]["PackageTypeName"].ToString();
                    lblPackageName.Text = dt.Rows[0]["PackageName"].ToString();
                   lblbasiccost .Text= dt.Rows[0]["BasicPackageCost"].ToString();
                    lblstandatrdcost.Text= dt.Rows[0]["StandardPackageCost"].ToString();
                   lblpremiumcost.Text= dt.Rows[0]["PremiumPackageCost"].ToString();
                    ViewState["PartnerPackageId"]= dt.Rows[0]["PartnerPackageId"].ToString();
                    DataTable dtq = new DataTable();
                    clsqpd.PartnerPackageId = Convert.ToInt32(e.CommandArgument.ToString());
                    dtq = clsqpd.GetPartnerPackageDetailsByPartnerPackageId();
                    if (dtq.Rows.Count > 0)
                    {
                        rptCustomers.Visible = true;
                        rptCustomers.DataSource = dtq;
                        rptCustomers.DataBind();
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal();", true);
                        upModal.Update();
                    }
                    else
                    {
                        rptCustomers.Visible = false;
                    }
                }
            }
        }

        protected void btnbasiclink_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Customer/QuickProjectPayment.aspx?PartnerPackageId="+ViewState["PartnerPackageId"]);
        }

        protected void btnstandardlink_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Customer/QuickProjectPayment.aspx?PartnerPackageId=" + ViewState["PartnerPackageId"]);
        }

        protected void btnpremium_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Customer/QuickProjectPayment.aspx?PartnerPackageId=" + ViewState["PartnerPackageId"]);
        }



        //protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    if (ddlCategoryIdRefilter.SelectedValue != "")
        //    {
        //        int serviceId = Convert.ToInt32(ddlCategory.SelectedValue);
        //        SetSubCategory(serviceId);
        //    }
        //}


    }
}