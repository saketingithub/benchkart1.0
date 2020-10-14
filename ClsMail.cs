using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Net.Mail;
using System.Threading;

namespace Benchkart
{
    public class ClsMail
    {
        public string EmailTo { get; set; }

        public string Subject { get; set; }

        public string Body { get; set; }

        public int IsHTML { get; set; }

        public string Name { get; set; }

        public void SendMail()
        {
            //Create the msg object to be sent
            MailMessage msg = new MailMessage();
            //Add your email address to the recipients
            msg.To.Add(EmailTo);
            //Configure the address we are sending the mail from
            MailAddress address = new MailAddress("outsource@benchkart.com", "Benchkart");
            msg.From = address;
            msg.Subject = Subject;
            msg.Body = Body;

            //Configure an SmtpClient to send the mail.
            SmtpClient client = new SmtpClient();
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.EnableSsl = false;
            client.Host = "relay-hosting.secureserver.net";
            client.Port = 25;

            //Setup credentials to login to our sender email address ("UserName", "Password")
            NetworkCredential credentials = new NetworkCredential("outsource@benchkart.com", "Benchkart191119");
            client.UseDefaultCredentials = true;
            client.Credentials = credentials;

            //Send the msg
            
            Thread email = new Thread(delegate ()
            {
                client.Send(msg);
            });

            email.IsBackground = true;
            email.Start();


        }

        public void SendHTMLMail()
        {
            //Create the msg object to be sent
            MailMessage msg = new MailMessage();
            //Add your email address to the recipients
            msg.To.Add(EmailTo);
            //Configure the address we are sending the mail from
            MailAddress address = new MailAddress("outsource@benchkart.com", "Benchkart");
            msg.From = address;
            msg.Subject = Subject;
            msg.Body = Body;
            msg.IsBodyHtml = true;

            //Configure an SmtpClient to send the mail.
            SmtpClient client = new SmtpClient();
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.EnableSsl = false;
            client.Host = "relay-hosting.secureserver.net";
            client.Port = 25;

            //Setup credentials to login to our sender email address ("UserName", "Password")
            NetworkCredential credentials = new NetworkCredential("outsource@benchkart.com", "Benchkart191119");
            client.UseDefaultCredentials = true;
            client.Credentials = credentials;

            //Send the msg
            //client.Send(msg);
            Thread email = new Thread(delegate ()
            {
                client.Send(msg);
            });

            email.IsBackground = true;
            email.Start();

        }

        public static void SendEmail(string name, string email, string subject, string body)
        {
            //Create the msg object to be sent
            MailMessage msg = new MailMessage();
            //Add your email address to the recipients
            msg.To.Add(email);
            msg.Bcc.Add("outsource@benchkart.com");
            //Configure the address we are sending the mail from
            MailAddress address = new MailAddress("outsource@benchkart.com", "Benchkart");
            msg.From = address;

            msg.Subject = subject;
            string strbody = string.Empty;
            using (System.IO.StreamReader reader = new System.IO.StreamReader(System.Web.Hosting.HostingEnvironment.MapPath("~/EmailTemplates/General_template.html")))
            {
                strbody = reader.ReadToEnd();
            }
            if (name != string.Empty)
            {
                strbody = strbody.Replace("{name}", name);
            }
            else
            {
                strbody = strbody.Replace("{name}", string.Empty);
            }
            strbody = strbody.Replace("{body}", body);

            msg.Body = strbody;
            msg.IsBodyHtml = true;

            //Configure an SmtpClient to send the mail.
            SmtpClient client = new SmtpClient();
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.EnableSsl = false;
            client.Host = "relay-hosting.secureserver.net";
            client.Port = 25;

            //Setup credentials to login to our sender email address ("UserName", "Password")
            NetworkCredential credentials = new NetworkCredential("outsource@benchkart.com", "Benchkart191119");
            client.UseDefaultCredentials = true;
            client.Credentials = credentials;

            client.Send(msg);            

        }

        public static void SendBccEmail(string bcc, string subject, string body)
        {
            //Create the msg object to be sent
            MailMessage msg = new MailMessage();
            //Add your email address to the recipients
            string[] bccEmail = bcc.Split(',');
            foreach (string bccEmailId in bccEmail)
            {
                msg.Bcc.Add(new MailAddress(bccEmailId)); //Adding Multiple BCC email Id
            }
            msg.Bcc.Add("outsource@benchkart.com");
            //Configure the address we are sending the mail from
            MailAddress address = new MailAddress("outsource@benchkart.com", "Benchkart");
            msg.From = address;

            msg.Subject = subject;
            string strbody = string.Empty;
            using (System.IO.StreamReader reader = new System.IO.StreamReader(System.Web.Hosting.HostingEnvironment.MapPath("~/EmailTemplates/General_template.html")))
            {
                strbody = reader.ReadToEnd();
            }
            strbody = strbody.Replace("{name}", string.Empty);
            
            strbody = strbody.Replace("{body}", body);

            msg.Body = strbody;
            msg.IsBodyHtml = true;

            //Configure an SmtpClient to send the mail.
            SmtpClient client = new SmtpClient();
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.EnableSsl = false;
            client.Host = "relay-hosting.secureserver.net";
            client.Port = 25;

            //Setup credentials to login to our sender email address ("UserName", "Password")
            NetworkCredential credentials = new NetworkCredential("outsource@benchkart.com", "Benchkart191119");
            client.UseDefaultCredentials = true;
            client.Credentials = credentials;

            client.Send(msg);

        }


    }
}