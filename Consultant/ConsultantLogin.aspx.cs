using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Benchkart.Consultant
{
    public partial class ConsultantLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            ClsConsultant cn = new ClsConsultant();
            cn.Email = txtLogin.Text;
            cn.Password = txtLoginpassword.Text;

            int authenticate = cn.LoginConsultant();

            if (authenticate != 0)
            {
                //Session["ConsultantId"] = authenticate;
                //Session["ConsultantEmail"] = cn.Email;

                HttpCookie CookieConsultantId = new HttpCookie("ConsultantId", authenticate.ToString());
                Response.Cookies.Add(CookieConsultantId);

                Response.Redirect("Requests.aspx?Email=" + cn.Email);
            }
            else
            {
                lblLoginError.Visible = true;
            }
        }
    }
}