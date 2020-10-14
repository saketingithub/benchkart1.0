using System;
using System.Data;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace Benchkart.Partner
{
    public partial class BasicInfo : System.Web.UI.Page
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

            
            HtmlAnchor a_BasicInfo = (HtmlAnchor)Master.FindControl("a_BasicInfo");
            a_BasicInfo.Style.Add("background-color", "white");
            
            if (!IsPostBack)
                {
                    //ClientScript.RegisterStartupScript(GetType(), "Javascript", "javascript:print_state('sts'); ", true);

                    int year = 1950;
                    ddlIncorporation.Items.Insert(0, new ListItem("Select", ""));
                    for (int i = 1; i <= 71; i++)
                    {
                        ddlIncorporation.Items.Insert(i, new ListItem(year.ToString(), year.ToString()));
                        year = year + 1;
                    }
                    DataTable dt = new DataTable();
                    DisplayBindProfile();
                }
                //If user reloads the page

           
        }
         
    public void DisplayBindProfile()
    {
        DataTable dtCustomerProfile;

       //int partnerId = Convert.ToInt32(Session["PartnerId"].ToString());

            int partnerId = 0;
            if (Session["PartnerId"] != null)
            {
                partnerId = Convert.ToInt32(Session["PartnerId"].ToString());
            }
            else
            {
                partnerId = Convert.ToInt32(Request.Cookies["PartnerId"].Value);
            }

            ClsPartner pn = new ClsPartner();
        pn.PartnerId = partnerId;
        dtCustomerProfile = pn.GetPartnerProfileListBasic();
        DisplayRequest(dtCustomerProfile);

        // DisplayCustomerProfile(dtCustomerProfile);
    }
    public void DisplayRequest(DataTable dtRequest)
    {
            if (dtRequest.Rows[0]["CompanyName"] != DBNull.Value)
            {
                txtCompanyName.Text = dtRequest.Rows[0]["CompanyName"].ToString();
                txtCompanyName.BorderWidth = 0;
                txtCompanyName.ReadOnly = true;
            }
            if (dtRequest.Rows[0]["Website"] != DBNull.Value)
            {
                txtCompanyWebsideUrl.Text = dtRequest.Rows[0]["Website"].ToString();
                txtCompanyWebsideUrl.BorderWidth = 0;
                txtCompanyWebsideUrl.ReadOnly = true;
            }
            if (dtRequest.Rows[0]["PocFullName"] != DBNull.Value)
            {
                txtPrimaryContactPersonName.Text = dtRequest.Rows[0]["PocFullName"].ToString();
                txtPrimaryContactPersonName.BorderWidth = 0;
                txtPrimaryContactPersonName.ReadOnly = true;

            }
    //        if (dtRequest.Rows[0]["Email"] != DBNull.Value)
    //{
    //    txtWorkEmail.Text = dtRequest.Rows[0]["email"].ToString();
    //            txtWorkEmail.BorderWidth = 0;
    //            txtWorkEmail.ReadOnly = true;
    //}
            if (dtRequest.Rows[0]["ContactNumber"] != DBNull.Value)
    {
        txtContactNumber.Text = dtRequest.Rows[0]["ContactNumber"].ToString();
                txtContactNumber.BorderWidth = 0;
                txtContactNumber.ReadOnly = true;
    }
            if (dtRequest.Rows[0]["CompanyStarted"] != DBNull.Value)
            {
                ddlIncorporation.SelectedValue = dtRequest.Rows[0]["CompanyStarted"].ToString();
                ddlIncorporation.Enabled = false;
            }
            if (dtRequest.Rows[0]["DescribedAs"] != DBNull.Value)
            {
                ddlCompanyDescribed.SelectedValue = dtRequest.Rows[0]["DescribedAs"].ToString();
                ddlCompanyDescribed.Enabled = false;
            }
            if (dtRequest.Rows[0]["EmployeeCount"] != DBNull.Value)
            {
                ddlNumberofEmployee.SelectedValue = dtRequest.Rows[0]["EmployeeCount"].ToString();
                ddlNumberofEmployee.Enabled = false;
            }
            if (dtRequest.Rows[0]["CompanyType"] != DBNull.Value)
            {
                ddlCompanyType.SelectedValue = dtRequest.Rows[0]["CompanyType"].ToString();
                ddlCompanyType.Enabled = false;
            }
            if (dtRequest.Rows[0]["ClientFrom"] != DBNull.Value)
            {
                string[] arrClentfrom = dtRequest.Rows[0]["ClientFrom"].ToString().Split(',');
                foreach (ListItem lst in chkblClientPrimarilyFrom.Items)
                {
                    for (int j = 0; j <= arrClentfrom.Length-1; j++)
                    {
                        if (lst.Text.Trim() == arrClentfrom[j].Trim())
                        {
                            lst.Selected = true;
                            break;
                        }
                    }
                }
                chkblClientPrimarilyFrom.Enabled = false;
            }
            if (dtRequest.Rows[0]["PricePositioning"] != DBNull.Value)
            {
                rblPricePositioning.SelectedValue = dtRequest.Rows[0]["PricePositioning"].ToString().Trim();
                rblPricePositioning.Enabled = false;
            }
            if (dtRequest.Rows[0]["CustomerSegment"] != DBNull.Value)
            {
                string[] arrCustomerSegments = dtRequest.Rows[0]["CustomerSegment"].ToString().Split(',');
                foreach (ListItem lsts in chkblPrimaryCustomerSegments.Items)
                {
                    for (int m = 0; m <= arrCustomerSegments.Length-1; m++)
                    {
                        if (lsts.Text.Trim() == arrCustomerSegments[m].Trim())
                        {
                            lsts.Selected = true;
                            break;
                        }
                    }
                }
                chkblPrimaryCustomerSegments.Enabled = false;
            }
            if (dtRequest.Rows[0]["PrimarySourceOfRevenue"] != DBNull.Value)
            {
                ddlPrimarySourceofRevenue.SelectedValue = dtRequest.Rows[0]["PrimarySourceOfRevenue"].ToString();
                ddlPrimarySourceofRevenue.Enabled = false;
            }

            if (dtRequest.Rows[0]["CompanyProfile"] != DBNull.Value)
    {
        txtAboutCompany.Text = dtRequest.Rows[0]["CompanyProfile"].ToString();
                txtAboutCompany.BorderWidth = 0;
                txtAboutCompany.ReadOnly = true;
    }
            if (dtRequest.Rows[0]["CompanyAddress"] != DBNull.Value)
    {
        txtCompanyAddress.Text = dtRequest.Rows[0]["CompanyAddress"].ToString();
                txtCompanyAddress.BorderWidth = 0;
                txtCompanyAddress.ReadOnly = true;
    }
            //if (dtRequest.Rows[0]["CompanyState"] != DBNull.Value)
            //{
            //    sts.SelectedItem.Text = dtRequest.Rows[0]["CompanyState"].ToString();
            //}
            //if (dtRequest.Rows[0]["CompanyCity"] != DBNull.Value)
            //{
            //    state.SelectedItem.Text = dtRequest.Rows[0]["CompanyCity"].ToString();
            //    state.Enabled = false;
            //}
            if (dtRequest.Rows[0]["CompanyGSTNumber"] != DBNull.Value)
    {
        txtCompanyGSTNumber.Text = dtRequest.Rows[0]["CompanyGSTNumber"].ToString();
                txtCompanyGSTNumber.BorderWidth = 0;
                txtCompanyGSTNumber.ReadOnly = true;
    }
   
            if (dtRequest.Rows[0]["MinimumProjectValue"] != DBNull.Value)
    {
        txtProjectValue.Text = dtRequest.Rows[0]["MinimumProjectValue"].ToString();
                txtProjectValue.BorderWidth = 0;
                txtProjectValue.ReadOnly = true;
    }
            if (dtRequest.Rows[0]["RepresentativeName"] != DBNull.Value)
    {
        txtAlternateCompanyRepresentativeName.Text = dtRequest.Rows[0]["RepresentativeName"].ToString();
                txtAlternateCompanyRepresentativeName.BorderWidth = 0;
                txtAlternateCompanyRepresentativeName.ReadOnly = true;
    }
            if (dtRequest.Rows[0]["RepresentativeLoginEmail"] != DBNull.Value)
    {
        txtRepresentativeEmail.Text = dtRequest.Rows[0]["RepresentativeLoginEmail"].ToString();
                txtRepresentativeEmail.BorderWidth = 0;
                txtRepresentativeEmail.ReadOnly = true;
    }
            if (dtRequest.Rows[0]["RepresentativeContact"] != DBNull.Value)
    {
        txtRepresentativeContactNumber.Text = dtRequest.Rows[0]["RepresentativeContact"].ToString();
                txtRepresentativeContactNumber.ReadOnly = true;
                txtRepresentativeContactNumber.BorderWidth = 0;
    }
   


          
    }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            txtCompanyName.BackColor = System.Drawing.Color.White;
            txtCompanyWebsideUrl.BackColor = System.Drawing.Color.White;
            txtPrimaryContactPersonName.BackColor = System.Drawing.Color.White;
            txtContactNumber.BackColor = System.Drawing.Color.White;
            txtCompanyGSTNumber.BackColor = System.Drawing.Color.White;
            txtProjectValue.BackColor = System.Drawing.Color.White;
            txtCompanyAddress.BackColor = System.Drawing.Color.White;
            txtAlternateCompanyRepresentativeName.BackColor = System.Drawing.Color.White;
            txtRepresentativeContactNumber.BackColor = System.Drawing.Color.White;
            txtRepresentativeEmail.BackColor = System.Drawing.Color.White;

            txtAboutCompany.ReadOnly = false;
            txtAboutCompany.BorderWidth = 0;
            txtAlternateCompanyRepresentativeName.ReadOnly = false;
            txtAlternateCompanyRepresentativeName.BorderWidth = 1;
            txtCompanyAddress.ReadOnly = false;
            txtCompanyAddress.BorderWidth = 1;
            txtCompanyGSTNumber.ReadOnly = false;
            txtCompanyGSTNumber.BorderWidth = 1;
            txtCompanyName.ReadOnly = false;
            txtCompanyName.BorderWidth = 1;
            txtCompanyWebsideUrl.ReadOnly = false;
            txtCompanyWebsideUrl.BorderWidth = 1;
            txtContactNumber.ReadOnly = false; ;
            txtContactNumber.BorderWidth = 1;
            txtPrimaryContactPersonName.ReadOnly = false;
            txtPrimaryContactPersonName.BorderWidth=1;
            txtProjectValue.ReadOnly = false;
            txtProjectValue.BorderWidth = 1;
            txtRepresentativeContactNumber.ReadOnly = false;
            txtRepresentativeContactNumber.BorderWidth = 1;
            txtRepresentativeEmail.ReadOnly = false;
            txtRepresentativeEmail.BorderWidth = 1;
            //txtWorkEmail.ReadOnly = true;
            //txtWorkEmail.BorderWidth = 0;
            ddlCompanyDescribed.Enabled = true;
            ddlCompanyType.Enabled = true;
            ddlIncorporation.Enabled = true;
            ddlNumberofEmployee.Enabled = true;
            rblPricePositioning.Enabled = true;
            ddlPrimarySourceofRevenue.Enabled = true;
            chkblClientPrimarilyFrom.Enabled = true;
            chkblPrimaryCustomerSegments.Enabled = true;
            btnSubmit.Visible = true;
            btnEdit.Visible = false;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            ClsPartner pnt = new ClsPartner();
            string hob = "";
            foreach(ListItem lst in chkblClientPrimarilyFrom.Items)
            {
                if(lst.Selected==true)
                {
                    hob += lst.Text + ',';
                }
            }
            hob = hob.TrimEnd(',');
            string hobb = "";
            foreach (ListItem lsts in chkblPrimaryCustomerSegments.Items)
            {
                if (lsts.Selected == true)
                {
                    hobb += lsts.Text + ',';
                }
            }
            hobb = hobb.TrimEnd(',');

            //pnt.PartnerId = Convert.ToInt32(Session["PartnerId"].ToString());
            pnt.PartnerId = 0;
            if (Session["PartnerId"] != null)
            {
                pnt.PartnerId = Convert.ToInt32(Session["PartnerId"].ToString());
            }
            else
            {
                pnt.PartnerId = Convert.ToInt32(Request.Cookies["PartnerId"].Value);
            }

            pnt.CompanyName = txtCompanyName.Text;
            pnt.Website = txtCompanyWebsideUrl.Text;
            pnt.PocFullName = txtPrimaryContactPersonName.Text;
           // pnt.Email = txtWorkEmail.Text;
            pnt.ContactNumber = txtContactNumber.Text;
            pnt.CompanyStarted =  ddlIncorporation.SelectedValue;
            pnt.CompanyDescribedAs = ddlCompanyDescribed.SelectedValue;

            pnt.EmployeeCount = ddlNumberofEmployee.SelectedValue;
            pnt.CompanyType = ddlCompanyType.SelectedValue;
            pnt.CompanyClientFrom = hob;
            pnt.CompanyPricePositioning = rblPricePositioning.SelectedValue;
           
           
             pnt.CompanyCustomerSegment = hobb;
            pnt.CompanyPrimarySourceOfRevenue = ddlPrimarySourceofRevenue.SelectedValue;
            pnt.CompanyProfile = txtAboutCompany.Text;
            pnt.CompanyAddress = txtCompanyAddress.Text;
            pnt.CompanyGSTNumber = txtCompanyGSTNumber.Text;

            if (txtProjectValue.Text != string.Empty)
            {
                pnt.CompanyMinimumProjectValue = Convert.ToInt32(txtProjectValue.Text);
            }
            else
            {
                pnt.CompanyMinimumProjectValue = 0;
            }

            pnt.CompanyRepresentativeName = txtAlternateCompanyRepresentativeName.Text;
            pnt.CompanyRepresentativeContact = txtRepresentativeContactNumber.Text;
            pnt.CompanyRepresentativeLoginEmail = txtRepresentativeEmail.Text;
            pnt.GetPartnerProfileListBasicUpdate();
            Response.Write("<script>alert('Basic information updated successfully')</script>");
            btnEdit.Visible = true;
            btnSubmit.Visible = false;
            txtAboutCompany.ReadOnly = true;
            txtAboutCompany.BorderWidth = 0;
            txtAlternateCompanyRepresentativeName.ReadOnly = true;
            txtAlternateCompanyRepresentativeName.BorderWidth = 0;
            txtCompanyAddress.ReadOnly = true;
            txtCompanyAddress.BorderWidth = 0;
            txtCompanyGSTNumber.ReadOnly = true;
            txtCompanyGSTNumber.BorderWidth = 0;
            txtCompanyName.ReadOnly = true;
            txtCompanyName.BorderWidth = 0;
            txtCompanyWebsideUrl.ReadOnly = true;
            txtCompanyWebsideUrl.BorderWidth = 0;
            txtContactNumber.ReadOnly = true; ;
            txtContactNumber.BorderWidth = 0;
            txtPrimaryContactPersonName.ReadOnly = true;
            txtPrimaryContactPersonName.BorderWidth = 0;
            txtProjectValue.ReadOnly = true;
            txtProjectValue.BorderWidth = 0;
            txtRepresentativeContactNumber.ReadOnly = true;
            txtRepresentativeContactNumber.BorderWidth = 0;
            txtRepresentativeEmail.ReadOnly = true;
            txtRepresentativeEmail.BorderWidth = 0;
            //txtWorkEmail.ReadOnly = true;
            //txtWorkEmail.BorderWidth = 0;
            ddlCompanyDescribed.Enabled = false;
            ddlCompanyType.Enabled = false;
            ddlIncorporation.Enabled = false;
            ddlNumberofEmployee.Enabled = false;
            rblPricePositioning.Enabled = false;
            ddlPrimarySourceofRevenue.Enabled = false;
            chkblClientPrimarilyFrom.Enabled = false;
            chkblPrimaryCustomerSegments.Enabled = false;
          
        }

       
    }
}