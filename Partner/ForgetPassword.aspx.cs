using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Benchkart.Partner
{
    public partial class ForgetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEmailIdGenrateOtp_Click(object sender, EventArgs e)
        {
            ClsPartner sk = new ClsPartner();

            sk.Email = txtEmailidForgetPassword.Text;

            int authenticate = sk.PartnerEmailVerify();

            if (authenticate != 0)
            {
                sendemail();
                //Session["CustomerId"] = authenticate.ToString();
                //Session["emailId"] = txtEmailidForgetPassword.Text;
                pnlForgetPassword.Attributes.Add("Style", "display:block");
            }
            else
            {
                Response.Write("<script>alert('Email Id not registered with us')</script>");
            }
        }
        public void sendemail()
        {

            Random rnd = new Random();
            int otp = rnd.Next(1000, 9999);
            ViewState["otpemail"] = otp;
            //ViewState["Email"] = txtEmailidForgetPassword.Text;
            string otpmessage = otp + " is otp from benchkart.com ";

            ClsMail mail = new ClsMail();
            mail.EmailTo = txtEmailidForgetPassword.Text;
            mail.Subject = otpmessage;
            mail.Body = otpmessage;
            mail.SendMail();
            Response.Write("<script>alert('OTP sent to your email. Please do check spam.')</script>");
            txtEmailidForgetPassword.Enabled = false;            
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            ClsPartner sk = new ClsPartner();
            sk.Email = txtEmailidForgetPassword.Text;
            sk.Password = txtForgetPassword.Text;
            if (txtOtp.Text == ViewState["otpemail"].ToString())
            {

                sk.PartnerSetPassword();

                Response.Write("<script>alert('Password reset successfully');window.location='../Partner/Signup';</script>");
            }
            else
            {
                Response.Write("<script>alert('Otp is not matching. Try again !')</script>");

            }

        }
    }
}