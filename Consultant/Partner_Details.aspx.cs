using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;
using System.Net;

namespace Benchkart.Consultant
{
    public partial class Partner_Details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["ConsultantId"] == null)
            {
                Response.Redirect("ConsultantLogin.aspx");
            }

            if (!IsPostBack) 
            {
                DataSet dsServices = new DataSet();
                int partnerId = Convert.ToInt32(Request.QueryString["id"].ToString());
               
                ClsService sv = new ClsService();
                dsServices = sv.GetServicesforPartnerConsultant(partnerId);

                LoadServices(dsServices.Tables[0]);

                SetServices(dsServices.Tables[1]);
                DataTable dt = new DataTable();
            DisplayBindProfile();
            }
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
            if(dtRequest.Rows[0]["PocFullName"]!=DBNull.Value)
            {
                lblFullName.Text = dtRequest.Rows[0]["PocFullName"].ToString();

            }
            if(dtRequest.Rows[0]["Email"]!=DBNull.Value)
            {
                lblEmail.Text = dtRequest.Rows[0]["email"].ToString();
            }
            if (dtRequest.Rows[0]["ContactNumber"] != DBNull.Value)
            {
                lblContactNumber.Text = dtRequest.Rows[0]["ContactNumber"].ToString();
            }
            //if (dtRequest.Rows[0]["Password"] != DBNull.Value)
            //{
            //    lblPassword.Text = dtRequest.Rows[0]["Password"].ToString();
            //}
            if (dtRequest.Rows[0]["CompanyName"] != DBNull.Value)
            {
                lblCompanyName.Text = dtRequest.Rows[0]["CompanyName"].ToString();
            }
            if(dtRequest.Rows[0]["CreationDate"]!=DBNull.Value)
            {
                lblCreationDate.Text = dtRequest.Rows[0]["CreationDate"].ToString();
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
            //if (dtRequest.Rows[0]["LogoName"] != DBNull.Value)
            //{
            //    lblLogoName.Text = dtRequest.Rows[0]["LogoName"].ToString();
            //}
            //if (dtRequest.Rows[0]["OtherServices"] != DBNull.Value)
            //{
            //    lblOtherServices.Text = dtRequest.Rows[0]["OtherServices"].ToString();
            //}
            //if (dtRequest.Rows[0]["OtherTechnologies"] != DBNull.Value)
            //{
            //    lblOtherTechnologies.Text = dtRequest.Rows[0]["OtherTechnologies"].ToString();

            //}
            //if (dtRequest.Rows[0]["BenchTalent"] != DBNull.Value)
            //{
            //    lblBenchTalent.Text = dtRequest.Rows[0]["BenchTalent"].ToString();
            //}
            //if (dtRequest.Rows[0]["Reviewed"] != DBNull.Value)
            //{
            //    lblReviewed.Text = dtRequest.Rows[0]["Reviewed"].ToString();
            //}
            //if (dtRequest.Rows[0]["CompanyTitle"] != DBNull.Value)
            //{
            //    lblCompanyTitle.Text = dtRequest.Rows[0]["CompanyTitle"].ToString();
            //}
            if (dtRequest.Rows[0]["IsTalentShared"] != DBNull.Value)
            {
                lblIsTalentAvailable.Text = dtRequest.Rows[0]["IsTalentShared"].ToString();
            }
            //if (dtRequest.Rows[0]["Services"] != DBNull.Value)
            //{
                //txtServices.Text = dtRequest.Rows[0]["Services"].ToString();
            //}
            if (dtRequest.Rows[0]["OtherServices"] != DBNull.Value)
            {
                txtOtherServices.Text = dtRequest.Rows[0]["OtherServices"].ToString();
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
            if(dtRequest.Rows[0]["IsActive"]!=DBNull.Value)
            {
                ddlStatus.SelectedValue = dtRequest.Rows[0]["IsActive"].ToString();
            }
            if(dtRequest.Rows[0]["StatusComments"]!=DBNull.Value)
            {
                txtStatusComment.Text = dtRequest.Rows[0]["StatusComments"].ToString();
            }
            if (dtRequest.Rows[0]["PartnerType"] != DBNull.Value)
            {
                rblpartnertype.SelectedValue = dtRequest.Rows[0]["PartnerType"].ToString();
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
        protected void btnSave_Click(object sender, EventArgs e)
        {
            DataTable dtNextRequest = new DataTable();
			
			ClsPartner pn = new ClsPartner();
            pn.PartnerId = Convert.ToInt32(lblPartnerId.Text);
            pn.IsActive = Convert.ToInt32(ddlStatus.SelectedValue);
            pn.StatusComments = txtStatusComment.Text;
				
            if(ddlStatus.SelectedValue =="0" || ddlStatus.SelectedValue == "1" || ddlStatus.SelectedValue == "3")
            {
                
                //Krishan - 2/6
                pn.RejactPartnerProfileByPartnerId();
                 SendEmailStatusReject();
                Response.Redirect("PartnerList.aspx");
                // Response.Write("<script>alert('Please select status')</script>");
            }         
           else if(ddlStatus.SelectedValue=="2")
            {
                ClsService sv = new ClsService();
                sv.PartnerId= Convert.ToInt32(lblPartnerId.Text);
                string serviceIdList = ListServicesandTech();
                sv.UpdatePartnerServicesConsultant(serviceIdList);
                pn.OtherServices = serviceIdList;
                
                pn.PartnerType =Convert.ToInt32(rblpartnertype.SelectedValue);
                //Krishan - 2/6
                pn.UpdatePartnerProfileByPartnerId();
                SendEmail();
                Response.Redirect("PartnerList.aspx");
                //DisplayBindProfile();

            }
        
           
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
        private void SendEmail()
        {
            //Email
            System.Threading.Thread email = new System.Threading.Thread(delegate ()
            {
                string subject = "All good to go!";

                string body = "We have reviewed your proposal and would be happy to have you on-board as a partner! Please note that there may be some details that may still be required before you can bid for projects. Do keep your profile & bank details updated in the dashboard, if not done already.";

                ClsMail.SendEmail(string.Empty, lblEmail.Text, subject, body);
            });
            email.IsBackground = true;
            email.Start();

            //End - Email

        }
        private void SendEmailStatusReject()
        {
            //Email
            System.Threading.Thread email = new System.Threading.Thread(delegate ()
            {
                string subject = "We cant accept your proposal right now";
                string body = "We have reviewed your proposal and are unable to accept the same. If you need more details, please contact your Relationship Manager.";

                ClsMail.SendEmail(string.Empty, lblEmail.Text, subject, body);
            });

            email.IsBackground = true;
            email.Start();
            //End Email
        }
        protected void btncancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Consultant/PartnerList.aspx");
        }
    }
}