using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;
using System.Threading;

namespace Benchkart
{
    public partial class Test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            

        }
        protected void Button1_Clicked(object sender, EventArgs e)
        {
            //Session["PartnerId"] = "56";
            //HttpCookie CookiePartnerId = new HttpCookie("PartnerId");
            //CookiePartnerId.Value = "55";
            //CookiePartnerId.Expires = DateTime.Now.AddHours(24);
            //Response.Cookies.Add(CookiePartnerId);
            //Response.Redirect("TestCookie.aspx");
            System.Threading.Thread emailThread = new System.Threading.Thread(delegate ()
            {
                string subject = "Great! Your Project is Live for Bidding";
                string body = "<p>Project Title - " + Title + "</p><p>Your Project is now live on benchkart.</p><p>Please <a href=\"https://benchkart.com/Customer/Signin\">login</a></p>";
                ClsMail.SendEmail("Anurag", "anuragrawat123@gmail.com", subject, body);
                ClsMail.SendEmail("Anurag", "anurag.rawat@benchkart.com", subject, body);

            });

            emailThread.IsBackground = true;
            emailThread.Start();

            Response.Write("<script>alert('Mail sent')</script>");

            //string body = string.Empty;
            //using (System.IO.StreamReader reader = new System.IO.StreamReader(Server.MapPath("~/Partner/AcknowledgeSignup.html")))
            //{
            //    body = reader.ReadToEnd();
            //}

            //ClsMail mail = new ClsMail();
            //mail.EmailTo = "anuragrawat123@gmail.com";
            //mail.Subject = "Welcome to benchkart!";
            //mail.Body = body;
            //System.Threading.Thread emailThread = new System.Threading.Thread(delegate ()
            //{
            //   mail.SendHTMLMail();
            //});
            // emailThread.IsBackground = true;
            //emailThread.Start();
            //Response.Write("<script>alert('Mail sent')</script>");
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            int a = 0;
            int b = 0;
            int c = a / b;
            //ClsMail mail = new ClsMail();
            //mail.EmailTo = "anuragrawat123@gmail.com";
            //mail.Subject = "Benchkart.com";
            //mail.Body = "Request is submit successfully";

            //mail.SendMail();

            ////ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Email sent.');", true);
            //Response.Redirect("~/Partner/Signup");
        }


    }
}