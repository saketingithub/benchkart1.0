﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Net.Mail;
using System.Threading;
using System.Configuration;
using System.Net.Mime;
using System.IO;

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
            ////Create the msg object to be sent
            //MailMessage msg = new MailMessage();
            ////Add your email address to the recipients
            //msg.To.Add(EmailTo);
            ////Configure the address we are sending the mail from
            //MailAddress address = new MailAddress("outsource@benchkart.com", "Benchkart");
            //msg.From = address;
            //msg.Subject = Subject;
            //msg.Body = Body;

            ////Configure an SmtpClient to send the mail.
            //SmtpClient client = new SmtpClient();
            //client.DeliveryMethod = SmtpDeliveryMethod.Network;
            //client.EnableSsl = false;
            //client.Host = "relay-hosting.secureserver.net";
            //client.Port = 25;

            ////Setup credentials to login to our sender email address ("UserName", "Password")
            //NetworkCredential credentials = new NetworkCredential("outsource@benchkart.com", "Benchkart191119");
            //client.UseDefaultCredentials = true;
            //client.Credentials = credentials;

            ////Send the msg
            
            //Thread email = new Thread(delegate ()
            //{
            //    client.Send(msg);
            //});

            //email.IsBackground = true;
            //email.Start();


            //New Code implementation
            List<string> toAddress = new List<string>();
            toAddress.Add(EmailTo);
            List<string> bccAddress = new List<string>();
            List<string> ccAddress = new List<string>();
            List<string> filesToAttach = new List<string>();
            string mailBody = Body;
            string mailSubject = Subject;
            bool IsBodyHtml = false;

            ClsMail.ExecuteSendEmail(mailBody, mailSubject, toAddress, bccAddress, ccAddress, filesToAttach, IsBodyHtml);

        }

        public void SendHTMLMail()
        {
            ////Create the msg object to be sent
            //MailMessage msg = new MailMessage();
            ////Add your email address to the recipients
            //msg.To.Add(EmailTo);
            ////Configure the address we are sending the mail from
            //MailAddress address = new MailAddress("outsource@benchkart.com", "Benchkart");
            //msg.From = address;
            //msg.Subject = Subject;
            //msg.Body = Body;
            //msg.IsBodyHtml = true;

            ////Configure an SmtpClient to send the mail.
            //SmtpClient client = new SmtpClient();
            //client.DeliveryMethod = SmtpDeliveryMethod.Network;
            //client.EnableSsl = false;
            //client.Host = "relay-hosting.secureserver.net";
            //client.Port = 25;

            ////Setup credentials to login to our sender email address ("UserName", "Password")
            //NetworkCredential credentials = new NetworkCredential("outsource@benchkart.com", "Benchkart191119");
            //client.UseDefaultCredentials = true;
            //client.Credentials = credentials;

            ////Send the msg
            ////client.Send(msg);
            //Thread email = new Thread(delegate ()
            //{
            //    client.Send(msg);
            //});

            //email.IsBackground = true;
            //email.Start();

            //New Code implementation
            List<string> toAddress = new List<string>();
            toAddress.Add(EmailTo);
            List<string> bccAddress = new List<string>();
            List<string> ccAddress = new List<string>();
            List<string> filesToAttach = new List<string>();
            string mailBody = Body;
            string mailSubject = Subject;
            bool IsBodyHtml = true;

            ClsMail.ExecuteSendEmail(mailBody, mailSubject, toAddress, bccAddress, ccAddress, filesToAttach, IsBodyHtml);

        }

        public static void SendEmail(string name, string email, string subject, string body)
        {
            //Create the msg object to be sent
            //MailMessage msg = new MailMessage();
            //Add your email address to the recipients
            //msg.To.Add(email);
            //msg.Bcc.Add("outsource@benchkart.com");
            //Configure the address we are sending the mail from
            //MailAddress address = new MailAddress("outsource@benchkart.com", "Benchkart");
            //msg.From = address;

            //msg.Subject = subject;
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

            //msg.Body = strbody;
            //msg.IsBodyHtml = true;

            //Configure an SmtpClient to send the mail.
            //SmtpClient client = new SmtpClient();
            //client.DeliveryMethod = SmtpDeliveryMethod.Network;
            //client.EnableSsl = false;
            //client.Host = "relay-hosting.secureserver.net";
            //client.Port = 25;

            //Setup credentials to login to our sender email address ("UserName", "Password")
            //NetworkCredential credentials = new NetworkCredential("outsource@benchkart.com", "Benchkart191119");
            //client.UseDefaultCredentials = true;
            //client.Credentials = credentials;

            //client.Send(msg);


            //New Code implementation
            List<string> toAddress = new List<string>();
            toAddress.Add(email);
            List<string> bccAddress = new List<string>();
            List<string> ccAddress = new List<string>();
            List<string> filesToAttach = new List<string>();
            string mailBody = strbody;
            string mailSubject = subject;
            bool IsBodyHtml = true;

            ClsMail.ExecuteSendEmail(mailBody, mailSubject, toAddress, bccAddress, ccAddress, filesToAttach, IsBodyHtml);
        }

        public static void SendBccEmail(string bcc, string subject, string body)
        {
            //MailMessage msg = new MailMessage();
            //Add your email address to the recipients
            //string[] bccEmail = bcc.Split(',');
            //foreach (string bccEmailId in bccEmail)
            //{
            //    msg.Bcc.Add(new MailAddress(bccEmailId)); //Adding Multiple BCC email Id
            //}
            //msg.Bcc.Add("outsource@benchkart.com");
            //Configure the address we are sending the mail from
            //MailAddress address = new MailAddress("outsource@benchkart.com", "Benchkart");
            //msg.From = address;

            //msg.Subject = subject;
            string strbody = string.Empty;
            using (System.IO.StreamReader reader = new System.IO.StreamReader(System.Web.Hosting.HostingEnvironment.MapPath("~/EmailTemplates/General_template.html")))
            {
                strbody = reader.ReadToEnd();
            }
            strbody = strbody.Replace("{name}", string.Empty);
            
            strbody = strbody.Replace("{body}", body);

            //msg.Body = strbody;
            //msg.IsBodyHtml = true;

            //Configure an SmtpClient to send the mail.
            //SmtpClient client = new SmtpClient();
            //client.DeliveryMethod = SmtpDeliveryMethod.Network;
            //client.EnableSsl = false;
            //client.Host = "relay-hosting.secureserver.net";
            //client.Port = 25;

            //Setup credentials to login to our sender email address ("UserName", "Password")
            //NetworkCredential credentials = new NetworkCredential("outsource@benchkart.com", "Benchkart191119");
            //client.UseDefaultCredentials = true;
            //client.Credentials = credentials;

            //client.Send(msg);

            //New Code implementation
            List<string> toAddress = new List<string>();
            List<string> bccAddress = bcc.Split(',').ToList();
            List<string> ccAddress = new List<string>();
            List<string> filesToAttach = new List<string>();
            string mailBody = strbody;
            string mailSubject = subject;
            bool IsBodyHtml = true;

            ClsMail.ExecuteSendEmail(mailBody, mailSubject, toAddress, bccAddress, ccAddress, filesToAttach, IsBodyHtml);
        }


        /// <summary>
        /// 
        /// </summary>
        /// <param name="mailBody"></param>
        /// <param name="mailSubject"></param>
        /// <param name="toAddress">atleast toAddress, bccAddress, ccAddress - one has to have values</param>
        /// <param name="bccAddress"></param>
        /// <param name="ccAddress"></param>
        /// <param name="relativeFilePathsToBeAttached">~/TEMP FILES/IMG_20200621_0001.jpg</param>
        /// <param name="IsBodyHtml"></param>
        public static void ExecuteSendEmail(string mailBody, string mailSubject, List<string> toAddress, List<string> bccAddress, List<string> ccAddress, List<string> relativeFilePathsToBeAttached, bool IsBodyHtml)
        {

            //--------------------START SAMPLE CODE

            //List<string> toAddress = new List<string>();
            //List<string> bccAddress = new List<string>();
            //List<string> ccAddress = new List<string>();
            //List<string> filesToAttach = new List<string>();

            //toAddress.Add("email_1@gmail.com");
            //bccAddress.Add("email_2@gmail.com");
            //filesToAttach.Add("~/Uploadfiles/MessageAttachments/11119/Benchkart_Mockup_4Jan.pdf");

            //ClsMail.ExecuteSendEmail("Hi sending attachments", "Mail with attachments -" + DateTime.Now, toAddress, bccAddress,ccAddress, filesToAttach, true );

            //--------------------END SAMPLE CODE

            string EmailFrom = ConfigurationManager.AppSettings["EmailFrom"];
            string EmailFromDisplayName = ConfigurationManager.AppSettings["EmailFromDisplayName"];
            string EmailFromPwd = ConfigurationManager.AppSettings["EmailFromPwd"];
            string EmailBcc = ConfigurationManager.AppSettings["EmailBcc"];
            bool EmailIsSSL = Convert.ToBoolean(ConfigurationManager.AppSettings["EmailIsSSL"]);
            int EmailPort = Convert.ToInt32(ConfigurationManager.AppSettings["EmailPort"]);
            string EmailHost = ConfigurationManager.AppSettings["EmailHost"];

            //Create the msg object to be sent
            MailMessage mailMessage = new MailMessage();
            //Default email message 
            mailMessage.Bcc.Add(EmailBcc);
           


            //Configure the address we are sending the mail from
            MailAddress address = new MailAddress(EmailFrom, EmailFromDisplayName);
            mailMessage.From = address;

            //Loop all to recepients
            foreach(string emailTo in toAddress)
            {
                mailMessage.To.Add(emailTo);
            }
            //Loop to add all Bcc addresses...
            foreach (string emailBcc in bccAddress)
            {
                mailMessage.Bcc.Add(emailBcc);
            }
            //Loop to add all CC addresses...
            foreach (string emailCc in ccAddress)
            {
                mailMessage.CC.Add(emailCc);
            }
            //Add attachments...
            foreach (string filePathWithName in relativeFilePathsToBeAttached)
            {
                if (File.Exists(System.Web.HttpContext.Current.Server.MapPath(filePathWithName)))
                {
                    Attachment data = new Attachment(
                       System.Web.HttpContext.Current.Server.MapPath(filePathWithName),
                       MediaTypeNames.Application.Octet);
                    // your path may look like Server.MapPath("~/file.ABC")
                    mailMessage.Attachments.Add(data);
                }
            }



            mailMessage.Subject = mailSubject;
            mailMessage.Body = mailBody;
            mailMessage.IsBodyHtml = IsBodyHtml;

            //Configure an SmtpClient to send the mail.
            SmtpClient client = new SmtpClient();
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.EnableSsl = EmailIsSSL;
            client.Host = EmailHost;
            client.Port = EmailPort;

            //Setup credentials to login to our sender email address ("UserName", "Password")
            NetworkCredential credentials = new NetworkCredential(EmailFrom, EmailFromPwd);
            client.UseDefaultCredentials = true;
            client.Credentials = credentials;
            if (ConfigurationManager.AppSettings["IsMailEnabled"].ToString() == "true")
            {
                client.Send(mailMessage);
            }
        }


    }
}