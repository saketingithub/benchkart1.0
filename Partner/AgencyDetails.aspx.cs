using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Data.SqlClient;
using System.Web.Services;
using System.Configuration;

namespace Benchkart.Partner
{
    public partial class AgencyDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
                    GetPartner();

                
            }
        }

        public void GetPartner()
        {
            DataTable dtpartner = new DataTable();
            ClsPartner clspt = new ClsPartner();
            clspt.PartnerId = Convert.ToInt32(Session["partnerId"]);
           dtpartner= clspt.GetPartnerQuickByPartnerId();
            if(dtpartner.Rows[0]["PocFullName"]!=DBNull.Value)
            {
                txtRepresentativeName.Text = dtpartner.Rows[0]["PocFullName"].ToString();
            }
            //if (dtpartner.Rows[0]["Images"] != DBNull.Value)
            //{
            //    imagePic.ImageUrl = dtpartner.Rows[0]["Images"].ToString();
            //    //imagePic.Attributes.Add("style", "width:120px; height:120px; margin-left:600px;");
            //}
            if (dtpartner.Rows[0]["CompanyCity"] != DBNull.Value)
            {
                txtLocation.Text = dtpartner.Rows[0]["CompanyCity"].ToString();
            }
            if (dtpartner.Rows[0]["EmployeeCount"] != DBNull.Value)
            {
                txtEmployeeCount.Text = "No. of Employees "+ dtpartner.Rows[0]["EmployeeCount"].ToString();
            }
            if (dtpartner.Rows[0]["CompanyStarted"] != DBNull.Value)
            {
                txtCompanyStarted.Text = "Completed Yrs. " + dtpartner.Rows[0]["CompanyStarted"].ToString();
            }
            if (dtpartner.Rows[0]["Description1"] != DBNull.Value)
            {
                txtDescribedAs.Text = dtpartner.Rows[0]["Description1"].ToString();
                pnlpackage.Attributes.Add("style", "display:block;");
                pnlagency.Attributes.Add("style", "display:none;");
                GetAgencyDetail();
                GetPackageData();
            }
            
            if (dtpartner.Rows[0]["Description2"] != DBNull.Value)
            {
                txtConsiderUsBecause.Text = dtpartner.Rows[0]["Description2"].ToString();
            }
            if (dtpartner.Rows[0]["Description3"] != DBNull.Value)
            {
                txtOurTopCustomersAre.Text = dtpartner.Rows[0]["Description3"].ToString();
            }
        }
        [WebMethod]
        public static List<string> GetAutoCompleteData(string username)
        {
            List<string> result = new List<string>();
            string dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(dbConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("proc_GetStateByLike", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    con.Open();
                    cmd.Parameters.AddWithValue("@name", username);
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        result.Add(dr["City"].ToString());
                    }
                    return result;
                }
            }
        }
        public void GetPackageType()
        {
            ClsPackageType clspk = new ClsPackageType();
            DataTable dt = new DataTable();
            clspk.SubCategoryId = Convert.ToInt32(ddlSubCategory.SelectedValue);
            dt = clspk.GetPackageData();
            ddlPackageType.DataTextField = "PackageTypeName";
            ddlPackageType.DataValueField = "PackageTypeId";
            ddlPackageType.DataSource = dt;
            ddlPackageType.DataBind();
            ddlPackageType.Items.Insert(0, new ListItem("Select Package Type", ""));

        }
        public void GetPackageTypeedit()
        {
            ClsPackageType clspk = new ClsPackageType();
            DataTable dt = new DataTable();
            clspk.SubCategoryId = Convert.ToInt32(ddlSubCategoryedit.SelectedValue);
            dt = clspk.GetPackageData();
            ddlPackageTypeedit.DataTextField = "PackageTypeName";
            ddlPackageTypeedit.DataValueField = "PackageTypeId";
            ddlPackageTypeedit.DataSource = dt;
            ddlPackageTypeedit.DataBind();
            ddlPackageTypeedit.Items.Insert(0, new ListItem("Select Package Type", ""));

        }
        public void GetAgencyDetail()
        {
            DataTable dt = new DataTable();
            ClsPartner clspt = new ClsPartner();
            clspt.PartnerId = Convert.ToInt32(Session["partnerId"]);
            dt = clspt.GetAgencyDetailsByPartnerId();
            if (dt.Rows.Count > 0)
            {
                grdAgencyDetails.Visible = true;
                grdAgencyDetails.DataSource = dt;
                grdAgencyDetails.DataBind();
            }
            else
            {
                grdAgencyDetails.Visible = false;
            }
        }
        public void GetPackageData()
        {
            DataTable dt = new DataTable();
            ClsQuickProject clsqp = new ClsQuickProject();
            clsqp.PartnerId = Convert.ToInt32(Session["partnerId"]);
            dt = clsqp.GetPartnerPackage();
            if(dt.Rows.Count>0)
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
        protected void btnsubmit_Click(object sender, EventArgs e)
        {
           
            string location = string.Empty;
            string[] city = txtLocation.Text.Split(',');
            for(int i = 0; i < city.Length; i++)
            {
                location += city[i]+",";
            }
            location = location.TrimEnd(',');
            ClsPartner clspt = new ClsPartner();
            clspt.PartnerId = Convert.ToInt32(Session["partnerId"]);
            clspt.PocFullName = txtRepresentativeName.Text;
            //if (imagePic.ImageUrl == "") {
            //string fileName = System.IO.Path.GetFileName(fileuploadPic.PostedFile.FileName);
            //fileuploadPic.PostedFile.SaveAs(Server.MapPath("~/Uploadfiles/Partners/" + fileName));
            //clspt.Images = "~/Uploadfiles/Partners/" + fileName;
            //}
            //else
            //{
            //    clspt.Images = imagePic.ImageUrl;
            //}
            clspt.CompanyCity = location;
            clspt.Description1 = txtDescribedAs.Text;
            clspt.Description2 = txtConsiderUsBecause.Text;
            clspt.Description3 = txtOurTopCustomersAre.Text;
            clspt.UpdatePartnerQuickByPartnerId();
            GetPackageData();
            GetAgencyDetail();
            pnlagency.Attributes.Add("style", "display:none;");
            pnlpackage.Attributes.Add("style", "display:block;");
           
        }

        public void SetSubCategory(int serviceId)
        {
            // ddlSubCategory.Items.Clear();

            ClsServiceMaster sm = new ClsServiceMaster();
            DataTable dtSubCategory = sm.GetSubCategory(serviceId);
            ddlSubCategory.DataSource = dtSubCategory;

            ddlSubCategory.DataTextField = "Title";
            ddlSubCategory.DataValueField = "ServiceId";

            ddlSubCategory.DataBind();
            ddlSubCategory.Items.Insert(0, new ListItem("Select Project Sub-Category", ""));
            //ddlSubCategory.Items.FindByValue("0").Selected = true;



        }
        public void SetSubCategoryedit(int serviceId)
        {
            ClsServiceMaster sm = new ClsServiceMaster();
            DataTable dtSubCategory = sm.GetSubCategory(serviceId);
            ddlSubCategoryedit.DataSource = dtSubCategory;

            ddlSubCategoryedit.DataTextField = "Title";
            ddlSubCategoryedit.DataValueField = "ServiceId";

            ddlSubCategoryedit.DataBind();
            ddlSubCategoryedit.Items.Insert(0, new ListItem("Select Project Sub-Category", ""));
            //ddlSubCategory.Items.FindByValue("0").Selected = true;
        }
        protected void btnadd_Click(object sender, EventArgs e)
        {
            ClsQuickProject clscpp = new ClsQuickProject();
            clscpp.PartnerId = Convert.ToInt32(Session["partnerId"]);
            clscpp.CategoryId =Convert.ToInt32( ddlCategory.SelectedValue);
            clscpp.SubCategoryId = Convert.ToInt32(ddlSubCategory.SelectedValue);
            clscpp.PackageType =Convert.ToInt32( ddlPackageType.SelectedValue);
            clscpp.PackageName = txtPackageName.Text;
            clscpp.PackageDescription = txtPackageDescription.Text;
            if(txtPackageCost1.Text != "")
            {
                clscpp.BasicPackageCost = Convert.ToInt32(txtPackageCost1.Text);
            }
            else
            {

                clscpp.BasicPackageCost = 0;
            }
            if (txtPackageCost2.Text != "")
            {
                clscpp.StandardPackageCost = Convert.ToInt32(txtPackageCost2.Text);
            }

            else
            {

                clscpp.StandardPackageCost = 0;
            }
            if (txtPackageCost3.Text != "")
            {
                clscpp.PremiumPackageCost = Convert.ToInt32(txtPackageCost3.Text);
            }
            else
            {

                clscpp.PremiumPackageCost = 0;
            }
           
           
            int partnerPackageId=  clscpp.CreatePartnerPackage();
            if (partnerPackageId > 0)
            {
                ClsQuickPackageDetails clsqk = new ClsQuickPackageDetails();


                if (txtParameter1.Text != "" || txtBasic1.Text != "" || txtStandard1.Text != "" || txtPremium.Text != "")
                {
                    clsqk.PartnerPackageId = Convert.ToInt32(partnerPackageId);
                    clsqk.Parameter = txtParameter1.Text;
                    clsqk.BasicDisplayText = txtBasic1.Text;
                    clsqk.StandardDisplayText = txtStandard1.Text;
                    clsqk.PremiumDisplayText = txtPremium.Text;
                    clsqk.CreatePartnerPackageDetails();
                }
                if (txtParameter2.Text != "" || txtBasic2.Text != "" || txtStandard2.Text != "" || txtPremium2.Text != "")
                {
                    clsqk.PartnerPackageId = Convert.ToInt32(partnerPackageId);
                    clsqk.Parameter = txtParameter2.Text;
                    clsqk.BasicDisplayText = txtBasic2.Text;
                    clsqk.StandardDisplayText = txtStandard2.Text;
                    clsqk.PremiumDisplayText = txtPremium2.Text;
                    clsqk.CreatePartnerPackageDetails();
                }
                if (txtParameter3.Text != "" || txtBasic3.Text != "" || txtStandard3.Text != "" || txtPremium3.Text != "")
                {
                    clsqk.PartnerPackageId = Convert.ToInt32(partnerPackageId);
                    clsqk.Parameter = txtParameter3.Text;
                    clsqk.BasicDisplayText = txtBasic3.Text;
                    clsqk.StandardDisplayText = txtStandard3.Text;
                    clsqk.PremiumDisplayText = txtPremium3.Text;
                    clsqk.CreatePartnerPackageDetails();
                }
                if (txtParameter4.Text != "" || txtBasic4.Text != "" || txtStandard4.Text != "" || txtPremium4.Text != "")
                {
                    clsqk.PartnerPackageId = Convert.ToInt32(partnerPackageId);
                    clsqk.Parameter = txtParameter4.Text;
                    clsqk.BasicDisplayText = txtBasic4.Text;
                    clsqk.StandardDisplayText = txtStandard4.Text;
                    clsqk.PremiumDisplayText = txtPremium4.Text;
                    clsqk.CreatePartnerPackageDetails();
                }
                if (txtParameter5.Text != "" || txtBasic5.Text != "" || txtStandard5.Text != "" || txtPremium5.Text != "")
                {
                    clsqk.PartnerPackageId = Convert.ToInt32(partnerPackageId);
                    clsqk.Parameter = txtParameter5.Text;
                    clsqk.BasicDisplayText = txtBasic5.Text;
                    clsqk.StandardDisplayText = txtStandard5.Text;
                    clsqk.PremiumDisplayText = txtPremium5.Text;
                    clsqk.CreatePartnerPackageDetails();
                }
                if (txtParameter6.Text != "" || txtBasic6.Text != "" || txtStandard6.Text != "" || txtPremium6.Text != "")
                {
                    clsqk.PartnerPackageId = Convert.ToInt32(partnerPackageId);
                    clsqk.Parameter = txtParameter6.Text;
                    clsqk.BasicDisplayText = txtBasic6.Text;
                    clsqk.StandardDisplayText = txtStandard6.Text;
                    clsqk.PremiumDisplayText = txtPremium6.Text;
                    clsqk.CreatePartnerPackageDetails();
                }
                if (txtParameter7.Text != "" || txtBasic7.Text != "" || txtStandard7.Text != "" || txtPremium7.Text != "")
                {

                    clsqk.PartnerPackageId = Convert.ToInt32(partnerPackageId);
                    clsqk.Parameter = txtParameter7.Text;
                    clsqk.BasicDisplayText = txtBasic7.Text;
                    clsqk.StandardDisplayText = txtStandard7.Text;
                    clsqk.PremiumDisplayText = txtPremium7.Text;
                    clsqk.CreatePartnerPackageDetails();
                }
                if (txtParameter8.Text != "" || txtBasic8.Text != "" || txtStandard8.Text != "" || txtPremium8.Text != "")
                {
                    clsqk.PartnerPackageId = Convert.ToInt32(partnerPackageId);
                    clsqk.Parameter = txtParameter8.Text;
                    clsqk.BasicDisplayText = txtBasic8.Text;
                    clsqk.StandardDisplayText = txtStandard8.Text;

                    clsqk.PremiumDisplayText = txtPremium8.Text;
                    clsqk.CreatePartnerPackageDetails();
                }
                GetPackageData();
                Response.Write("<script>alert('Your Package is sent for approval')</script>");
                
            }
            else
            {
                Response.Write("<script>alert('Error in saving Package')</script>");
            }
           

           
        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            int serviceId = Convert.ToInt32(ddlCategory.SelectedValue);
            SetSubCategory(serviceId);
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
                    GetPackageTypeedit();
                    ddlPackageTypeedit.SelectedValue = dt.Rows[0]["PackageType"].ToString();
                    txtPackageNameedit.Text = dt.Rows[0]["PackageName"].ToString();
                    txtPackageDescriptionedit.Text = dt.Rows[0]["PackageDescription"].ToString();
                    txtbasicpackagecostedit.Text = dt.Rows[0]["BasicPackageCost"].ToString();
                    txtstandardpackagecostedit.Text = dt.Rows[0]["StandardPackageCost"].ToString();
                    txtpremiumpackagecostedit.Text = dt.Rows[0]["PremiumPackageCost"].ToString();
                    ClsQuickPackageDetails clsqpd = new ClsQuickPackageDetails();
                    DataTable dtq = new DataTable();
                    clsqpd.PartnerPackageId= Convert.ToInt32(e.CommandArgument.ToString());
                    dtq = clsqpd.GetPartnerPackageDetailsByPartnerPackageId();
                    if (dtq.Rows.Count > 0)
                    {
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

        public void GetPatenrPackageDetails()
        {
            ClsQuickPackageDetails clsqp = new ClsQuickPackageDetails();
            clsqp.PartnerPackageId = Convert.ToInt32(ViewState["partnerPackageId"]);
            DataTable dtq = new DataTable();
            dtq = clsqp.GetPartnerPackageDetailsByPartnerPackageId();
            if (dtq.Rows.Count > 0)
            {
                grdpackagedetails.DataSource = dtq;
                grdpackagedetails.DataBind();
            }
            else
            {
                grdpackagedetails.Visible = false;
            }
        }
        protected void ddlCategoryedit_SelectedIndexChanged(object sender, EventArgs e)
        {
            int serviceId = Convert.ToInt32(ddlCategoryedit.SelectedValue);
            SetSubCategoryedit(serviceId);
        }

        protected void grdpackagedetails_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grdpackagedetails.EditIndex = e.NewEditIndex;
            GetPatenrPackageDetails();
        }

        protected void grdpackagedetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdpackagedetails.PageIndex = e.NewPageIndex;
            GetPatenrPackageDetails();
        }

        protected void grdpackagedetails_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grdpackagedetails.EditIndex = -1;
            GetPatenrPackageDetails();
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

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            ClsQuickProject clscpp = new ClsQuickProject();
            clscpp.PartnerPackageId = Convert.ToInt32(ViewState["partnerPackageId"]);
            clscpp.CategoryId = Convert.ToInt32(ddlCategoryedit.SelectedValue);
            clscpp.SubCategoryId = Convert.ToInt32(ddlSubCategoryedit.SelectedValue);
            clscpp.PackageType = Convert.ToInt32(ddlPackageTypeedit.SelectedValue);
            clscpp.PackageName = txtPackageNameedit.Text;
            clscpp.PackageDescription = txtPackageDescriptionedit.Text;

            if (txtbasicpackagecostedit.Text!="")
            {
                clscpp.BasicPackageCost = Convert.ToInt32(txtbasicpackagecostedit.Text);
            }
            else
            {
                clscpp.BasicPackageCost = 0;
            }
            if (txtstandardpackagecostedit.Text != "")
            {
                clscpp.StandardPackageCost = Convert.ToInt32(txtstandardpackagecostedit.Text);
            }
            else
            {
                clscpp.StandardPackageCost = 0;
            }
            if (txtpremiumpackagecostedit.Text != "")
            {
                clscpp.PremiumPackageCost = Convert.ToInt32(txtpremiumpackagecostedit.Text);
            }
            else
            {
                clscpp.PremiumPackageCost = 0;
            }

           
            
             clscpp.UpdatePartnerPackage();
            Response.Write("<script>alert('Edited Package is sent for approval')</script>");
            pnlMyModal.Attributes.Add("style", "display:none;");
            GetPackageData();
        }

        protected void grdpackagedetails_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void ddlSubCategoryedit_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetPackageTypeedit();
        }

        protected void ddlSubCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetPackageType();
        }

        protected void grdAgencyDetails_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EdtAgency")
            {
                pnlagency.Attributes.Add("style", "display:block;");
                DataTable dtpartner = new DataTable();
                ClsPartner clspt = new ClsPartner();
                clspt.PartnerId =Convert.ToInt32( e.CommandArgument.ToString());
                dtpartner = clspt.GetPartnerQuickByPartnerId();
                if (dtpartner.Rows[0]["PocFullName"] != DBNull.Value)
                {
                    txtRepresentativeName.Text = dtpartner.Rows[0]["PocFullName"].ToString();
                }
                //if (dtpartner.Rows[0]["Images"] != DBNull.Value)
                //{
                //    imagePic.ImageUrl = dtpartner.Rows[0]["Images"].ToString();
                //    //imagePic.Attributes.Add("style", "width:120px; height:120px; margin-left:600px;");
                //}
                if (dtpartner.Rows[0]["CompanyCity"] != DBNull.Value)
                {
                    txtLocation.Text = dtpartner.Rows[0]["CompanyCity"].ToString();
                }
                if (dtpartner.Rows[0]["EmployeeCount"] != DBNull.Value)
                {
                    txtEmployeeCount.Text = "No. of Employees " + dtpartner.Rows[0]["EmployeeCount"].ToString();
                }
                if (dtpartner.Rows[0]["CompanyStarted"] != DBNull.Value)
                {
                    txtCompanyStarted.Text = "Completed Yrs. " + dtpartner.Rows[0]["CompanyStarted"].ToString();
                }
                if (dtpartner.Rows[0]["Description1"] != DBNull.Value)
                {
                    txtDescribedAs.Text = dtpartner.Rows[0]["Description1"].ToString();
                   
                }

                if (dtpartner.Rows[0]["Description2"] != DBNull.Value)
                {
                    txtConsiderUsBecause.Text = dtpartner.Rows[0]["Description2"].ToString();
                }
                if (dtpartner.Rows[0]["Description3"] != DBNull.Value)
                {
                    txtOurTopCustomersAre.Text = dtpartner.Rows[0]["Description3"].ToString();
                }
            }
        }
    }
}