using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.HtmlControls;

namespace Benchkart.Partner
{
    public partial class BankDetails : System.Web.UI.Page
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


            HtmlAnchor a_BankDetails = (HtmlAnchor)Master.FindControl("a_BankDetails");
            a_BankDetails.Style.Add("background-color", "white");

            if (!IsPostBack)
            {
                DataTable dtBankDetails = new DataTable();

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

                ClsPartner pt = new ClsPartner();
                pt.PartnerId = PartnerId;
                dtBankDetails = pt.GetPartnerBankDetails();

                if (dtBankDetails.Rows.Count > 0)
                {

                    if (dtBankDetails.Rows[0]["AccountHolderName"] != DBNull.Value)
                    {
                        txtAccountHoldername.Text = dtBankDetails.Rows[0]["AccountHolderName"].ToString();
                        txtAccountHoldername.ReadOnly = true;
                        txtAccountHoldername.BorderWidth = 0;
                    }
                    if (dtBankDetails.Rows[0]["AccountNumber"] != DBNull.Value)
                    {
                        txtAccountNumber.Text = dtBankDetails.Rows[0]["AccountNumber"].ToString();
                        txtAccountNumber.ReadOnly = true;
                        txtAccountNumber.BorderWidth = 0;
                        txtConfAccountNumber.Visible = false;
                    }
                    if (dtBankDetails.Rows[0]["AccountType"] != DBNull.Value)
                    {
                        ddlAccountType.SelectedValue = dtBankDetails.Rows[0]["AccountType"].ToString();
                        ddlAccountType.Enabled = false;
                    }
                    if (dtBankDetails.Rows[0]["BeneficiaryBank"] != DBNull.Value)
                    {
                        txtBeneficiaryBank.Text = dtBankDetails.Rows[0]["BeneficiaryBank"].ToString();
                        txtBeneficiaryBank.ReadOnly = true;
                        txtBeneficiaryBank.BorderWidth = 0;
                    }
                    if (dtBankDetails.Rows[0]["SwiftCode"] != DBNull.Value)
                    {
                        txtSwiftcode.Text = dtBankDetails.Rows[0]["SwiftCode"].ToString();
                        txtSwiftcode.ReadOnly = true;
                        txtSwiftcode.BorderWidth = 0;
                    }
                    if (dtBankDetails.Rows[0]["IfscCode"] != DBNull.Value)
                    {
                        txtIfsccode.Text = dtBankDetails.Rows[0]["IfscCode"].ToString();
                        txtIfsccode.ReadOnly = true;
                        txtIfsccode.BorderWidth = 0;
                    }
                }

            }
        }
        protected void btnEdit_Click(object sender, EventArgs e)
        {
            txtAccountHoldername.ReadOnly = false;
            txtAccountHoldername.BorderWidth = 1;

            txtAccountNumber.ReadOnly = false;
            txtAccountNumber.BorderWidth = 1;

            ddlAccountType.Enabled = true;

            txtBeneficiaryBank.ReadOnly = false;
            txtBeneficiaryBank.BorderWidth = 1;

            txtSwiftcode.ReadOnly = false;
            txtSwiftcode.BorderWidth = 1;

            txtIfsccode.ReadOnly = false;
            txtIfsccode.BorderWidth = 1;
        }

        protected void btnUpdateAccount_Click(object sender, EventArgs e)
        {
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

            ClsPartner pt = new ClsPartner();
            pt.PartnerId = PartnerId;
            pt.AccountHolderName = txtAccountHoldername.Text;
            pt.AccountNumber = txtAccountNumber.Text;
            pt.AccountType = Convert.ToInt32(ddlAccountType.SelectedValue);
            pt.BeneficiaryBank = txtBeneficiaryBank.Text;
            pt.SwiftCode = txtSwiftcode.Text;
            pt.IfscCode = txtIfsccode.Text;
            pt.UpdatePartnerBankDetails();

            txtAccountHoldername.ReadOnly = true;
            txtAccountHoldername.BorderWidth = 0;

            txtAccountNumber.ReadOnly = true;
            txtAccountNumber.BorderWidth = 0;

            ddlAccountType.Enabled = false;

            txtBeneficiaryBank.ReadOnly = true;
            txtBeneficiaryBank.BorderWidth = 0;

            txtSwiftcode.ReadOnly = true;
            txtSwiftcode.BorderWidth = 0;

            txtIfsccode.ReadOnly = true;
            txtIfsccode.BorderWidth = 0;

            Response.Write("<script>alert('Bank details has been updated successfully.');</script>");
        }
    }
}