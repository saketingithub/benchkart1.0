using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.Routing;


namespace Benchkart
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            //RouteConfig.RegisterRoutes(System.Web.Routing.RouteTable.Routes);
            RegisterRoutes(RouteTable.Routes);
            //RouteTable.Routes.Ignore("{resource}.axd/{*pathInfo}");

        }
        static void RegisterRoutes(RouteCollection routes)
        {
            //General
            routes.MapPageRoute("Categories", "Category", "~/Category.aspx");
            //General
            routes.MapPageRoute("About-Us", "About", "~/About.aspx");
            //routes.MapPageRoute("Home", "Default", "~");
            routes.MapPageRoute("Covid", "Post-COVID", "~/Post-COVID.aspx");
            routes.MapPageRoute("Case-studies", "Case-Study", "~/CaseStudy.aspx");
            routes.MapPageRoute("ITServices", "ITServices", "~/ITServices.aspx");
            routes.MapPageRoute("DigitalTransformation", "DigitalTransformation", "~/DigitalTransformation.aspx");
            //Customer
            routes.MapPageRoute("Customer-Bid-Details", "Customer/Bid-Details", "~/Customer/Bid-Details.aspx");
            routes.MapPageRoute("Customer-Customer_Review", "Customer/Customer_Review", "~/Customer/Customer_Review.aspx");
            routes.MapPageRoute("Customer-CustomerProfile", "Customer/CustomerProfile", "~/Customer/CustomerProfile.aspx");

            routes.MapPageRoute("Customer-ForgetPassword", "Customer/ForgetPassword", "~/Customer/ForgetPassword.aspx");
            routes.MapPageRoute("Customer-Message_Details", "Customer/Message_Details", "~/Customer/Message_Details.aspx");
            routes.MapPageRoute("Customer-Messages", "Customer/Messages", "~/Customer/Messages.aspx");
            routes.MapPageRoute("Customer-Notifications", "Customer/Notifications", "~/Customer/Notifications.aspx");
            routes.MapPageRoute("Customer-Payment", "Customer/Payment", "~/Customer/Payment.aspx");
            routes.MapPageRoute("Customer-PaymentDetails", "Customer/PaymentDetails", "~/Customer/PaymentDetails.aspx");
            routes.MapPageRoute("Customer-Post_Project", "Customer/Post_Project", "~/Customer/Post_Project.aspx");
            //routes.MapPageRoute("Customer-Post_Project", "Customer/Post-Project", "~/Customer/Post-Project.aspx");
            //routes.MapPageRoute("Customer-Post_Talent", "Customer/Post_Talent", "~/Customer/Post_Talent.aspx");

            routes.MapPageRoute("Customer-Project_Details", "Customer/Project_Details", "~/Customer/Project_Details.aspx");
            routes.MapPageRoute("Customer-Projects_Dashboard", "Customer/Projects_Dashboard", "~/Customer/Projects_Dashboard.aspx");
            routes.MapPageRoute("Customer-RejectPayment", "Customer/RejectPayment", "~/Customer/RejectPayment.aspx");
            routes.MapPageRoute("Customer-ReleasePayment", "Customer/ReleasePayment", "~/Customer/ReleasePayment.aspx");

            routes.MapPageRoute("Customer-ResetPassword", "Customer/ResetPassword", "~/Customer/ResetPassword.aspx");
            routes.MapPageRoute("Customer-Signin_Post_Project", "Customer/Signin_Post_Project", "~/Customer/Signin_Post_Project.aspx");
            routes.MapPageRoute("Customer-Signin_Post_Talent", "Customer/Signin_Post_Talent", "~/Customer/Signin_Post_Talent.aspx");

            routes.MapPageRoute("Customer-Signin", "Customer/Signin", "~/Customer/Signin.aspx");
            routes.MapPageRoute("Customer-Signup", "Customer/Signup", "~/Customer/Signup.aspx");
            routes.MapPageRoute("Customer-Support", "Customer/Support", "~/Customer/Support.aspx");

            routes.MapPageRoute("Customer-Book_Consultation", "Customer/Book_Consultation", "~/Customer/Book_Consultation.aspx");


            //Partner
            routes.MapPageRoute("Partner-Acknowledgement", "Partner/Acknowledgement", "~/Partner/Acknowledgement.aspx");
            routes.MapPageRoute("Partner-BankDetails", "Partner/BankDetails", "~/Partner/BankDetails.aspx");
            routes.MapPageRoute("Partner-BasicInfo", "Partner/BasicInfo", "~/Partner/BasicInfo.aspx");
            routes.MapPageRoute("Partner-Bid-Details", "Partner/Bid-Details", "~/Partner/Bid-Details.aspx");

            routes.MapPageRoute("Partner-Bids", "Partner/Bids", "~/Partner/Bids.aspx");
            routes.MapPageRoute("Partner-Create-Contract", "Partner/Create-Contract", "~/Partner/Create-Contract.aspx");
            routes.MapPageRoute("Partner-Create-Payment-Request", "Partner/Create-Payment-Request", "~/Partner/Create-Payment-Request.aspx");
            routes.MapPageRoute("Partner-ForgetPassword", "Partner/ForgetPassword", "~/Partner/ForgetPassword.aspx");


            routes.MapPageRoute("Partner-Message_Details", "Partner/Message_Details", "~/Partner/Message_Details.aspx");
            routes.MapPageRoute("Partner-Messages", "Partner/Messages", "~/Partner/Messages.aspx");
            routes.MapPageRoute("Partner-Notifications", "Partner/Notifications", "~/Partner/Notifications.aspx");
            routes.MapPageRoute("Partner-OtherServices", "Partner/OtherServices", "~/Partner/OtherServices.aspx");

            routes.MapPageRoute("Partner-Partner_Review", "Partner/Partner_Review", "~/Partner/Partner_Review.aspx");
            routes.MapPageRoute("Partner-PaymentDetails", "Partner/PaymentDetails", "~/Partner/PaymentDetails.aspx");
            routes.MapPageRoute("Partner-Project_Details", "Partner/Project_Details", "~/Partner/Project_Details.aspx");


            routes.MapPageRoute("Partner-Projects", "Partner/Projects", "~/Partner/Projects.aspx");
            routes.MapPageRoute("Partner-Projects_Dashboard", "Partner/Projects_Dashboard", "~/Partner/Projects_Dashboard.aspx");
            routes.MapPageRoute("Partner-ReleasePayment", "Partner/ReleasePayment", "~/Partner/ReleasePayment.aspx");
            routes.MapPageRoute("Partner-ResetPassword", "Partner/ResetPassword", "~/Partner/ResetPassword.aspx");


            routes.MapPageRoute("Partner-Services", "Partner/Services", "~/Partner/Services.aspx");
            routes.MapPageRoute("Partner-Signup", "Partner/Signup", "~/Partner/Signup.aspx");
            routes.MapPageRoute("Partner-Skills", "Partner/Skills", "~/Partner/Skills.aspx");
            routes.MapPageRoute("Partner-Support", "Partner/Support", "~/Partner/Support.aspx");
            routes.MapPageRoute("Partner-AgencyDetails", "Partner/AgencyDetails", "~/Partner/AgencyDetails.aspx");

            routes.MapPageRoute("QuickProject-Payment", "QuickProject/Payment", "~/Customer/PaymentQuickProject.aspx");
            routes.MapPageRoute("payment-response", "PaymentResponse", "~/PaymentResponse.aspx");
        }


        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {
            //String fullOrigionalpath = Request.Url.ToString();
            //String[] sElements = fullOrigionalpath.Split('/');
            //String[] sFilePath = sElements[sElements.Length - 1].Split('.');

            //if (!fullOrigionalpath.Contains(".aspx") && sFilePath.Length == 1)
            //{
            //    if (!string.IsNullOrEmpty(sFilePath[0].Trim()))
            //        Context.RewritePath(sFilePath[0] + ".aspx");
            //}

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }
        //Development comment
        protected void Application_Error(object sender, EventArgs e)
        {
            //Comment during development
            //ClsLogError.LogErrorToText(Server.GetLastError().GetBaseException());
            //Response.Redirect("~/");
        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}