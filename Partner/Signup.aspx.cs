using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Net.Mail;
using System.Net;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace Benchkart.Partner
{
    public partial class Signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //try
            //{
               
                if (!IsPostBack)
                {

                    //Start - Get Partner Cookie 23 Jun
                    if (Request.Cookies["PartnerEmail"] != null && Request.Cookies["Password"] != null)
                    {
                        txtLogin.Text = Request.Cookies["PartnerEmail"].Value;
                        txtLoginpassword.Attributes["value"] = Request.Cookies["Password"].Value;
                    }
                    //End

                //ClientScript.RegisterStartupScript(GetType(), "Javascript", "javascript:print_state('sts'); ", true);

                    int year = 1950;
                    ddlCompanyStarted.Items.Insert(0, new ListItem("Select", ""));
                    for (int i = 1; i <= 71; i++)
                    {
                        ddlCompanyStarted.Items.Insert(i, new ListItem(year.ToString(), year.ToString()));
                        year = year + 1;
                    }

                    if(Request.QueryString["email"]!=null)
                    {
                        LoadCustomerSignupFields();
                    }
                    else
                    {
                        LoadSignupFields();
                    }              
                 

                }
                //If user reloads the page
                
           // }
           // catch (Exception ex)
           // {

           // }
        }
       
        public void LoadCustomerSignupFields()
        {
            //int stateId = Convert.ToInt32(ddlStates.SelectedValue);
            ClsCity ct = new ClsCity();
            string email = Request.QueryString["email"];
            string emailid = email;
            //DataTable dtStates = new DataTable();
            DataSet dsStatesandServices = new DataSet();
            dsStatesandServices = ct.LoadStatesandServicesSignup(emailid);


            ddlStates.DataSource = dsStatesandServices.Tables[0];
            ddlStates.DataTextField = "State";
            ddlStates.DataValueField = "StateId";
            ddlStates.DataBind();
            //ddlCities.Enabled = false;
            //ddlStates.Items.Insert(0, new ListItem("Select State", "0"));
            ddlStates.Items.Insert(0, new ListItem("Select State", "0"));
            ddlCities.Items.Insert(0, new ListItem("Select City", "0"));

            DataTable dtServices = dsStatesandServices.Tables[1];
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

            dataView.RowFilter = string.Empty;
            dataView.RowFilter = "ParentId IS NULL";

            //ddlPrimarySourceofRevenue.Items.Insert(0, new ListItem("Select", ""));
            ddlPrimarySourceofRevenue.DataSource = dataView;
            ddlPrimarySourceofRevenue.DataTextField = "Title";
            ddlPrimarySourceofRevenue.DataValueField = "ServiceId";
            ddlPrimarySourceofRevenue.DataBind();
            ddlPrimarySourceofRevenue.Items.Insert(0, new ListItem("Select", ""));


            if (dsStatesandServices.Tables[2].Rows.Count > 0)
            {
                txtPocFullName.Text = dsStatesandServices.Tables[2].Rows[0]["PocFullName"].ToString();
                txtEmail.Text = email.ToString();

                //txtPassword.Text = dsStatesandServices.Tables[2].Rows[0]["Password"].ToString();
                txtContactNumber.Text = dsStatesandServices.Tables[2].Rows[0]["ContactNumber"].ToString();
                txtCompanyName.Text = dsStatesandServices.Tables[2].Rows[0]["CompanyName"].ToString();
            }            

        }
        private void LoadSignupFields()
        {
            //int stateId = Convert.ToInt32(ddlStates.SelectedValue);
            ClsCity ct = new ClsCity();
           
            //DataTable dtStates = new DataTable();
            DataSet dsStatesandServices = new DataSet();
            dsStatesandServices = ct.LoadStatesandServices();
          

            ddlStates.DataSource = dsStatesandServices.Tables[0];
            ddlStates.DataTextField = "State";
            ddlStates.DataValueField = "StateId";
            ddlStates.DataBind();
            //ddlCities.Enabled = false;
            //ddlStates.Items.Insert(0, new ListItem("Select State", "0"));
            ddlStates.Items.Insert(0, new ListItem("Select State", "0"));
            ddlCities.Items.Insert(0, new ListItem("Select City", "0"));

            DataTable dtServices = dsStatesandServices.Tables[1];
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

            dataView.RowFilter = string.Empty;
            dataView.RowFilter = "ParentId IS NULL";

            //ddlPrimarySourceofRevenue.Items.Insert(0, new ListItem("Select", ""));
            ddlPrimarySourceofRevenue.DataSource = dataView;
            ddlPrimarySourceofRevenue.DataTextField = "Title";
            ddlPrimarySourceofRevenue.DataValueField = "ServiceId";
            ddlPrimarySourceofRevenue.DataBind();
            ddlPrimarySourceofRevenue.Items.Insert(0, new ListItem("Select", ""));          
          
        }

        protected void State_Changed(object sender, EventArgs e)
        {
            DataTable dtCities = new DataTable();
            ddlCities.Items.Clear();
            
            int stateId = int.Parse(ddlStates.SelectedItem.Value);
            if (stateId > 0)
            {
                ClsCity ct = new ClsCity();
                dtCities =  ct.BindCities(stateId);
                //ddlCities.Visible = true;
                ddlCities.DataSource = dtCities;
                ddlCities.DataTextField = "City";
                ddlCities.DataValueField = "CityId";
                ddlCities.DataBind();
            }
            ddlCities.Items.Insert(0, new ListItem("Select City", ""));
            pnlBasic.Attributes.Add("style", "display:none;");
        }


        protected void VerifyPartner(object sender, EventArgs e)
        {

            ClsPartner pv = new ClsPartner();
            pv.CompanyName = txtCompanyName.Text;
            pv.Website = txtWebsite.Text;
            pv.PocFullName = txtPocFullName.Text;
            pv.Email = txtEmail.Text;
            pv.ContactNumber = txtContactNumber.Text;
            pv.Password = txtPassword.Text;

            int verify = pv.VerifyPartner();

            if (verify == 0)
            {
                //lblEmailExists.Visible = true;
                lblEmailExists.Attributes.Add("style", "display:block;");
                pnlBasic.Attributes.Add("style", "display:none;");
                pnlSignup.Attributes.Add("style", "display:block;");
                //Response.Write("<script>alert('This Email Id already present in our database. Please login.')</script>");                
            }
            else
            {
                pnlBasic.Attributes.Add("style", "display:block;");
                pnlSignup.Attributes.Add("style", "display:none;");
                string Password = txtPassword.Text;
                txtPassword.Attributes.Add("value", Password);
                txtConfPassword.Attributes.Add("value", Password);
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //try
            //{
            //Start - Cookie Implementation for password - 23 Jun
            if (chkRememberMe.Checked)
            {
                Response.Cookies["PartnerEmail"].Expires = DateTime.Now.AddDays(30);
                Response.Cookies["Password"].Expires = DateTime.Now.AddDays(30);
            }
            else
            {
                Response.Cookies["PartnerEmail"].Expires = DateTime.Now.AddDays(-1);
                Response.Cookies["Password"].Expires = DateTime.Now.AddDays(-1);

            }
            Response.Cookies["PartnerEmail"].Value = txtEmail.Text.Trim();
            Response.Cookies["Password"].Value = txtPassword.Text.Trim();
            //End

            ClsPartner pv = new ClsPartner();

                pv.CompanyName = txtCompanyName.Text;
                pv.Website = txtWebsite.Text;
                pv.PocFullName = txtPocFullName.Text;
                pv.Email = txtEmail.Text;
                pv.ContactNumber = txtContactNumber.Text;
                pv.Password = txtPassword.Text;

               pv.CompanyStarted = ddlCompanyStarted.SelectedValue;
                pv.EmployeeCount = ddlEmployeeNumber.SelectedItem.Text;
                pv.CompanyDescribedAs = ddlDescribedAs.SelectedValue;
                pv.CompanyType = ddlCompanyType.SelectedValue;

                string companyClientFrom = string.Empty;
                foreach (ListItem lst in chkClientFrom.Items)
                {
                    if (lst.Selected == true)
                    {
                        companyClientFrom += lst.Text + ",";
                    }
                }
                pv.CompanyClientFrom = companyClientFrom.TrimEnd(',');

                string companyPrice = string.Empty;
                foreach (ListItem lst in rdoPricePositioning.Items)
                {
                    if (lst.Selected == true)
                    {
                        companyPrice += lst.Text + ",";
                    }
                }
                pv.CompanyPricePositioning = companyPrice.TrimEnd(',');

                string companyCustomerSegment = string.Empty;
                foreach (ListItem lst in chkCustomerSegment.Items)
                {
                    if (lst.Selected == true)
                    {
                        companyCustomerSegment += lst.Text + ",";
                    }
                }
                pv.CompanyCustomerSegment = companyCustomerSegment.TrimEnd(',');

                //if (txtMinimumProjectValue.Text != string.Empty)
                //{
                //    pv.CompanyMinimumProjectValue = Convert.ToInt32(txtMinimumProjectValue.Text);
                //}
                //else
                //{
                //    pv.CompanyMinimumProjectValue = 0;
                //}

                //pv.CompanyTitle = txtCompanyTitle.Text;
                pv.CompanyProfile = txtCompanyAbout.Text;

                pv.CompanyPrimarySourceOfRevenue = ddlPrimarySourceofRevenue.SelectedItem.Text;

                pv.CompanyAddress = txtCompanyAddress.Text;

                pv.CompanyState = ddlStates.SelectedItem.Text;

                pv.CompanyCity = ddlCities.SelectedItem.Text;

                pv.Pincode = Convert.ToInt32(txtPincode.Text);

                pv.Landline = txtLandline.Text;

                pv.OtherLocations = txtCities.Text;

                string serviceIdList = ListServicesandTech();

                String strSkills = txtSkills.Text.Trim().Trim(',');
                if (strSkills != string.Empty)
                {
                    strSkills = strSkills.Insert(0, ",");
                    strSkills = strSkills + ",";
                }

                pv.Skills = strSkills;

                pv.IsTalentShared = Convert.ToInt32(chkIsTalentShared.Checked);

                pv.Awards = txtAwards.Text;
            // krishan create bank details start

            //pv.AccountHolderName = txtAccountHoldername.Text;
            //pv.AccountNumber = txtAccountNumber.Text;

            //pv.AccountType = Convert.ToInt32(ddlAccountType.SelectedValue);
            //pv.BeneficiaryBank = txtBeneficiaryBank.Text;
            //pv.IfscCode = txtIfsccode.Text;
            //pv.SwiftCode = txtSwiftcode.Text;
            
            // end krishan 

            pv.CompanyGSTNumber = txtGSTNumber.Text;

                pv.CompanyRepresentativeName = txtRepresentativeName.Text;
                pv.CompanyRepresentativeContact = txtRepresentativeContactNumber.Text;
            pv.CompanyRepresentativeLoginEmail = txtRepresentativeEmail.Text;

               //krishan comments line 11-07-2020

            //pv.IsTrialOffered = Convert.ToInt32(chkFreeTrial.Checked);
            //    pv.IsBenchShared = Convert.ToInt32(chkBenchShare.Checked);

                // end krishan
                //pv.PartnerId = Convert.ToInt32(Session["PartnerId"].ToString());

                int verify = pv.RegisterPartner(serviceIdList);

                if (verify != 0)
                {             

                    //comment for developmenet
                    SendAcknowledgementEmail();
                    Response.Redirect("Acknowledgement?ID=" + verify, false);
                }
                else
                {
                    Response.Write("<script>alert('This Email Id already present in our database. Please login or just change email Id.)</script>");
                }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //Start - Cookie Implementation for password - 23 Jun
            if (chkRememberMeSignIn.Checked)
            {
                Response.Cookies["PartnerEmail"].Expires = DateTime.Now.AddDays(30);
                Response.Cookies["Password"].Expires = DateTime.Now.AddDays(30);
            }
            else
            {
                Response.Cookies["PartnerEmail"].Expires = DateTime.Now.AddDays(-1);
                Response.Cookies["Password"].Expires = DateTime.Now.AddDays(-1);

            }
            Response.Cookies["PartnerEmail"].Value = txtLogin.Text.Trim();
            Response.Cookies["Password"].Value = txtLoginpassword.Text.Trim();           
            //End

            ClsPartner pt = new ClsPartner();

            pt.Email = txtLogin.Text;
            pt.Password = txtLoginpassword.Text;

            int authenticate = pt.LoginPartner();

            if (authenticate == -1)            {
                lblLoginError.Visible = true;
            }
            else if (authenticate == 0)
            {
                lblLoginError.Text = "Your request is incomplete. Please sign up again.";
                lblLoginError.Visible = true;
            }
            else if (authenticate == 1)
            {
                lblLoginError.Text = "Your request is pending for approval.";
                lblLoginError.Visible = true;
            }
            else if (authenticate == 3)
            {
                lblLoginError.Text = "Your request is rejected.";
                lblLoginError.Visible = true;
            }

            else
            {
                Session["PartnerId"] = authenticate.ToString();
                Session["PartnerEmail"] = txtLogin.Text;

                //Cookie
                //HttpCookie CookiePartnerId = new HttpCookie("PartnerId");
                //CookiePartnerId.Value = authenticate.ToString();
                //CookiePartnerId.Expires = DateTime.Now.AddHours(24);
                //Response.Cookies.Add(CookiePartnerId);

                //HttpCookie CookiePartnerEmail = new HttpCookie("PartnerEmail");
                //CookiePartnerEmail.Value = txtLogin.Text;
                //CookiePartnerEmail.Expires = DateTime.Now.AddHours(24);
                //Response.Cookies.Add(CookiePartnerEmail);

                Response.Cookies["PartnerId"].Expires = DateTime.Now.AddDays(60);
                Response.Cookies["PartnerId"].Value = authenticate.ToString();

                Response.Redirect("Projects");
            }

        }



        protected void hplResend_Click(object sender, EventArgs e)
        {

            SendEmail();            
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
            Random rnd = new Random();
            int otp = rnd.Next(1000, 9999);
            ViewState["otpemail"] = otp;
            ViewState["Email"] = txtEmail.Text;
            string otpmessage = otp + " is otp from benchkart.com ";

            ClsMail mail = new ClsMail();
            mail.EmailTo = txtEmail.Text;
            mail.Subject = otpmessage;
            mail.Body = "Please enter the OTP"+ otp.ToString() + "in the OTP section during registration";
            mail.SendMail();
            
        }

        private void SendAcknowledgementEmail()
        {
            string body = string.Empty;
            using (System.IO.StreamReader reader = new System.IO.StreamReader(Server.MapPath("AcknowledgeSignup.html")))
            {
                body = reader.ReadToEnd();
            }
            
            ClsMail mail = new ClsMail();
            mail.EmailTo = txtEmail.Text;
            mail.Subject = "Welcome to benchkart!";
            mail.Body = body;
            mail.SendHTMLMail();
        }
    }
}