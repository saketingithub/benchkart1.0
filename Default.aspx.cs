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
            //List<string> toAddress = new List<string>();
            //toAddress.Add("saket.@cwl.co.in");
            //List<string> fileList = new List<string>();
            //fileList.Add("TEMP FILES/IMG_20200621_0001.jpg");
            //fileList.Add("TEMP FILES/IMG_20200621_0002.pdf");
            //ClsMail.ExecuteSendEmail("<html><body><h3>hey we are sending attachments as wel..</h3> <p>So the idea is to provide path and send the files as attachments</p></body></html>", "Email with attachments - " + DateTime.Now, toAddress, fileList, true);
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