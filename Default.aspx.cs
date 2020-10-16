using Elmah;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Benchkart
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //try
            //{
            //    string subject = "Thanks for posting your company requirement";
            //    string body = "<p>Congratulations! Hundreds of companies are getting their projects executed end-to-end on Benchkart & you are joining them. Projects executed on Benchkart not only get you quality while saving your time & money, they also ensure that you have complete Peace Of Mind on matters related to security, payments & accountability.</p><p>Right now, your project is undergoing a short review & then will be live on platform. In case we require additional information, we may reach out to you on the email/phone number provided by you.</p><p>From now on, your Benchkart account becomes the place for action! Your shortlisted bids, contracts, project management, payments & reviews will all happen in your account.</p>";

            //    ClsMail.SendEmail("SAKET", "saket@cwl.co.in", subject, body);
            //}
            //catch (Exception ex)
            //{
            //    ErrorSignal.FromCurrentContext().Raise(ex);
            //}


            //try
            //{
            //    string num = "2343x";
            //    int x = Convert.ToInt32(num);
            //}
            //catch (Exception ex)
            //{
            //    ErrorSignal.FromCurrentContext().Raise(ex);
            //}
        }

        //protected void btnSendMessage_Click(object sender, EventArgs e)
        //{
        //    ClsMail mail = new ClsMail();
        //    mail.EmailTo = "outsource@benchkart.com";
        //    mail.Subject = subject.Text;
        //    mail.Body = "Name: " + name.Text + " Email: " + email.Text + " Message:" + message.Text;            
        //    mail.SendMail();
        //    Response.Write("<script>alert('Your message has been sent. Thank you!')</script>");

        //}
    }
}