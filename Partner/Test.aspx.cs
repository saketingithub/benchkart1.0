using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;
using System.Threading;

namespace Benchkart.Partner
{
    public partial class Test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            

        }
        protected void Button1_Clicked(object sender, EventArgs e)
        {
            //System.Threading.Thread.Sleep(5000);
            //Response.Redirect("Default.aspx");
            int a = 0;
            int b = 0;
            int c = a / b;
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