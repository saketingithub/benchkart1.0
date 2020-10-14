using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Benchkart.Partner
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            ClsPartner pt = new ClsPartner();

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

            pt.PartnerId = PartnerId;
            pt.Password = txtOldPassword.Text;

            int verifyOldPassword = 0;

            verifyOldPassword = pt.PartnerReSetPassword(txtNewPassword.Text);

            if(verifyOldPassword == 1)
            { 
                Response.Write("<script>alert('Password reset successfully')</script>");
            }
            else
            {
                Response.Write("<script>alert('Current password is not correct')</script>");

            }

        }
    }
}