using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Benchkart
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            ClsCustomer cs = new ClsCustomer();
            cs.FullName = txtFullName.Text;
            cs.Email = txtEmail.Text;
            cs.ContactNumber = txtContactNumber.Text;
            //cs.CompanyIndustry = ddlIndustry.SelectedItem.Text;

            int auth = cs.SubmitCustomer();

            if (auth != 0)
            {
                Session["Email"] = txtEmail.Text;
                Session["CustomerId"] = auth.ToString();
                //Session["IndustryVertical"] = ddlIndustry.SelectedItem.Text + "+" + ddlService.SelectedValue;
                if (rblWorkType.SelectedValue == "service")
                {
                    Response.Redirect("Customer/Service.aspx?id="+ ddlService.SelectedValue);
                }
                else if (rblWorkType.SelectedValue == "talent")
                {
                    Response.Redirect("Customer/Talent.aspx?id=" + ddlService.SelectedValue);
                }
                else
                {
                    Response.Redirect("Customer/Consult.aspx");
                }
            }
            else
            {
                lblError.Text = "Email Id Already Exist! Please Login";
                lblError.Attributes.Add("style", "display:block;");
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CalldisplayContactDetails", "displayContactDetails()", true);
                //pnlContactDetails.Attributes.Add("style", "display:block;");
                //pnlCheck.Attributes.Add("style", "display:none;");
            }


        }
    }
}