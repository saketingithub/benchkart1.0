using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Benchkart
{
    public partial class PaymentResponse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //string RazorpayRespnse = Request["RazorpayRespnse"].ToString();
            int customerId = Convert.ToInt32(Session["CustomerId"]);
            if (customerId != 0 && Session["PaymentRequestId"] != null && Convert.ToString(Session["PaymentRequestId"]) != "")
            {
                ClsPayment py = new ClsPayment();
                py.PaymentRequestId = Convert.ToInt32(Session["PaymentRequestId"]);
                py.RazorpayOrderId = Convert.ToString(Session["OrderId"]);

                //py.Signature = Request["RazorpaySignature"].ToString();
                py.RazorpayRespnse = string.Empty;
                py.RazorpayPaymentId = Request["RazorpayPaymentId"].ToString();
                
                py.LastRemark = "";
                py.SavePaymentMadebyCustomer();
                Response.Write("{ status: 200 }");
            }
        }
    }
}