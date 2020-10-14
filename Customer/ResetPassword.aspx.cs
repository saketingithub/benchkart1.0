using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Benchkart.Customer
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            ClsCustomer cs = new ClsCustomer();

            //int CustomerId = Convert.ToInt32(Session["CustomerId"].ToString());
            int CustomerId = 0;
            if (Session["CustomerId"] != null)
            {
                CustomerId = Convert.ToInt32(Session["CustomerId"].ToString());
            }
            else
            {
                CustomerId = Convert.ToInt32(Request.Cookies["CustomerId"].Value);
            }

            cs.CustomerId = CustomerId;
            cs.Password = txtOldPassword.Text;

            int verifyOldPassword = 0;

            verifyOldPassword = cs.CustomerReSetPassword(txtNewPassword.Text);

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