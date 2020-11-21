using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Benchkart.Handlers
{
    /// <summary>
    /// Summary description for PaymentResponse
    /// </summary>
    public class PaymentResponse : IHttpHandler, System.Web.SessionState.IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            //string method = context.Request.QueryString["MethodName"].ToString();
            context.Response.ContentType = "text/json";

            int customerId = Convert.ToInt32(context.Session["CustomerId"]);
            if (customerId != 0 && context.Session["PaymentRequestId"] != null && Convert.ToString(context.Session["PaymentRequestId"]) != "")
            {
                ClsPayment py = new ClsPayment();
                py.PaymentRequestId = Convert.ToInt32(context.Session["PaymentRequestId"]);
                py.RazorpayOrderId = Convert.ToString(context.Session["OrderId"]);

                //py.Signature = Request["RazorpaySignature"].ToString();
                py.RazorpayRespnse = string.Empty;
                py.RazorpayPaymentId = context.Request["RazorpayPaymentId"].ToString();

                py.LastRemark = "";
                py.SavePaymentMadebyCustomer();
                context.Response.Write(GetData(context));
            }
            else
            {
                context.Response.Write(@"{""status"":""false"", ""description"":""Invalid session state""}");
            }

            //switch (method)
            //{
            //    case "GetData":
            //        context.Response.Write(GetData());
            //        break;
            //}
        }

        protected string GetData(HttpContext context)
        {
            //return (@"{""FirstName"":""Ravi"", ""LastName"":""Baghel"", 
            //   ""Blog"":""ravibaghel.wordpress.com""}");

            //return (@"{""CustomerId"":" + Convert.ToString(context.Session["CustomerId"]) + @", ""PaymentRequestId"":" + Convert.ToString(context.Session["PaymentRequestId"]) + @", 
            //   ""OrderId"":" + Convert.ToString(context.Session["OrderId"]) + @"}");

            return (@"{""status"":""true"", ""description"":""""}");
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}