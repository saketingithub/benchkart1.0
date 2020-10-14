using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Benchkart.Admin
{
    public partial class Partner_Details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            DataTable dt = new DataTable();
            DisplayBindProfile();
        }

        public void DisplayBindProfile()
        {
            DataTable dtCustomerProfile;
            int partnerId = Convert.ToInt32(Request.QueryString["id"].ToString());
            ClsPartner pn = new ClsPartner();
            pn.PartnerId = partnerId;
            dtCustomerProfile = pn.GetPartnerProfileList();
            DisplayRequest(dtCustomerProfile);

            // DisplayCustomerProfile(dtCustomerProfile);
        }
        public void DisplayRequest(DataTable dtRequest)
        {
            if (dtRequest.Rows[0]["PartnerId"] != DBNull.Value)
            {
                lblPartnerId.Text = dtRequest.Rows[0]["PartnerId"].ToString();
            }
            if (dtRequest.Rows[0]["PocFullName"] != DBNull.Value)
            {
                lblFullName.Text = dtRequest.Rows[0]["PocFullName"].ToString();

            }
            if (dtRequest.Rows[0]["Email"] != DBNull.Value)
            {
                lblEmail.Text = dtRequest.Rows[0]["email"].ToString();
            }
            if (dtRequest.Rows[0]["ContactNumber"] != DBNull.Value)
            {
                lblContactNumber.Text = dtRequest.Rows[0]["ContactNumber"].ToString();
            }
            if (dtRequest.Rows[0]["Password"] != DBNull.Value)
            {
                lblPassword.Text = dtRequest.Rows[0]["Password"].ToString();
            }
            if (dtRequest.Rows[0]["CompanyName"] != DBNull.Value)
            {
                lblCompanyName.Text = dtRequest.Rows[0]["CompanyName"].ToString();
            }
            if (dtRequest.Rows[0]["CompanyIndustry"] != DBNull.Value)
            {
                lblCompanyIndustry.Text = dtRequest.Rows[0]["CompanyIndustry"].ToString();
            }
            if (dtRequest.Rows[0]["CompanyProfile"] != DBNull.Value)
            {
                lblCompanyProfile.Text = dtRequest.Rows[0]["CompanyProfile"].ToString();
            }
            if (dtRequest.Rows[0]["CompanyAddress"] != DBNull.Value)
            {
                lblAddress.Text = dtRequest.Rows[0]["CompanyAddress"].ToString();
            }
            if (dtRequest.Rows[0]["CompanyGSTNumber"] != DBNull.Value)
            {
                lblCompanyGSTNumber.Text = dtRequest.Rows[0]["CompanyGSTNumber"].ToString();
            }
            if (dtRequest.Rows[0]["EmployeeCount"] != DBNull.Value)
            {
                lblEmployeeCount.Text = dtRequest.Rows[0]["EmployeeCount"].ToString();
            }
            if (dtRequest.Rows[0]["Website"] != DBNull.Value)
            {
                lblWebsite.Text = dtRequest.Rows[0]["Website"].ToString();
            }
            if (dtRequest.Rows[0]["LogoName"] != DBNull.Value)
            {
                lblLogoName.Text = dtRequest.Rows[0]["LogoName"].ToString();
            }
            if (dtRequest.Rows[0]["OtherServices"] != DBNull.Value)
            {
                lblOtherServices.Text = dtRequest.Rows[0]["OtherServices"].ToString();
            }
            if (dtRequest.Rows[0]["OtherTechnologies"] != DBNull.Value)
            {
                lblOtherTechnologies.Text = dtRequest.Rows[0]["OtherTechnologies"].ToString();

            }
            if (dtRequest.Rows[0]["BenchTalent"] != DBNull.Value)
            {
                lblBenchTalent.Text = dtRequest.Rows[0]["BenchTalent"].ToString();
            }
            if (dtRequest.Rows[0]["Reviewed"] != DBNull.Value)
            {
                lblReviewed.Text = dtRequest.Rows[0]["Reviewed"].ToString();
            }
            if (dtRequest.Rows[0]["CompanyTitle"] != DBNull.Value)
            {
                lblCompanyTitle.Text = dtRequest.Rows[0]["CompanyTitle"].ToString();
            }
            if (dtRequest.Rows[0]["IsTalentShared"] != DBNull.Value)
            {
                lblIsTalentAvailable.Text = dtRequest.Rows[0]["IsTalentShared"].ToString();
            }
            if (dtRequest.Rows[0]["Services"] != DBNull.Value)
            {
                lblServices.Text = dtRequest.Rows[0]["Services"].ToString();
            }
            if (dtRequest.Rows[0]["Location"] != DBNull.Value)
            {
                lblLocation.Text = dtRequest.Rows[0]["Location"].ToString();
            }
            if (dtRequest.Rows[0]["CompanyStarted"] != DBNull.Value)
            {
                lblCompanyStarted.Text = dtRequest.Rows[0]["CompanyStarted"].ToString();
            }
            if (dtRequest.Rows[0]["DescribedAs"] != DBNull.Value)
            {
                lblDescribedAs.Text = dtRequest.Rows[0]["DescribedAs"].ToString();
            }
            if (dtRequest.Rows[0]["CompanyType"] != DBNull.Value)
            {
                lblCompanyType.Text = dtRequest.Rows[0]["CompanyType"].ToString();
            }
            if (dtRequest.Rows[0]["Clientfrom"] != DBNull.Value)
            {
                lblClientFrom.Text = dtRequest.Rows[0]["Clientfrom"].ToString();
            }
            if (dtRequest.Rows[0]["PricePositioning"] != DBNull.Value)
            {
                lblPricePositioning.Text = dtRequest.Rows[0]["PricePositioning"].ToString();
            }
            if (dtRequest.Rows[0]["CustomerSegment"] != DBNull.Value)
            {
                lblCustomerSegment.Text = dtRequest.Rows[0]["CustomerSegment"].ToString();
            }
            if (dtRequest.Rows[0]["PrimarySourceOfRevenue"] != DBNull.Value)
            {
                lblPrimarySourceOfRevenue.Text = dtRequest.Rows[0]["PrimarySourceOfRevenue"].ToString();
            }
            if (dtRequest.Rows[0]["MinimumProjectValue"] != DBNull.Value)
            {
                lblMinimumProjectValue.Text = dtRequest.Rows[0]["MinimumProjectValue"].ToString();
            }
            if (dtRequest.Rows[0]["RepresentativeName"] != DBNull.Value)
            {
                lblRepresentativeName.Text = dtRequest.Rows[0]["RepresentativeName"].ToString();
            }
            if (dtRequest.Rows[0]["RepresentativeLoginEmail"] != DBNull.Value)
            {
                lblRepresentativeLoginEmail.Text = dtRequest.Rows[0]["RepresentativeLoginEmail"].ToString();
            }
            if (dtRequest.Rows[0]["RepresentativeContact"] != DBNull.Value)
            {
                lblRepresentativeContact.Text = dtRequest.Rows[0]["RepresentativeContact"].ToString();
            }
            if (dtRequest.Rows[0]["CompanyCity"] != DBNull.Value)
            {
                lblCompanyCity.Text = dtRequest.Rows[0]["CompanyCity"].ToString();
            }
            if (dtRequest.Rows[0]["IsActive"] != DBNull.Value)
            {
                ddlStatus.SelectedValue = dtRequest.Rows[0]["IsActive"].ToString();
            }
            if (dtRequest.Rows[0]["StatusComments"] != DBNull.Value)
            {
                txtStatusComment.Text = dtRequest.Rows[0]["StatusComments"].ToString();
            }

        }



        protected void btncancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/Partners.aspx");
        }
    }
}

