using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Razorpay.Api;
using System.Net;

namespace Benchkart.Customer
{
    public partial class Payment : System.Web.UI.Page
    {
        public string orderId;
        protected void Page_Load(object sender, EventArgs e)
        {
            //Test Keys
            string key = "rzp_test_n0Go0s9iSZW1OA";
            string secret = "WYU8IbCQaOYr9mNRhDq1bS93";

            //Live Keys
            //string key = "rzp_live_zoPlr5o13JZG7T";
            //string secret = "fQyHIMW2ESJwkjsR2SZWRC6o";

            RazorpayClient client = new RazorpayClient(key, secret);
            ClsPayment py = new ClsPayment();

            if (Request.QueryString["action"] == null)
            {
                int paymentRequestId = Convert.ToInt32(Request.QueryString["PaymentRequestId"]);

                hfPaymentRequestId.Value = paymentRequestId.ToString();
                py.PaymentRequestId = paymentRequestId;

                DataTable dtPayment = new DataTable();
                dtPayment = py.GetSinglePaymentDetails();

                lblPaymentAmount.Text = dtPayment.Rows[0]["PaymentAmount"].ToString();

                lblDate.Text = dtPayment.Rows[0]["StatusUpdateDate"].ToString();

                lblCompanyName.Text = dtPayment.Rows[0]["CompanyName"].ToString();

                lblRemarks.Text = dtPayment.Rows[0]["LastRemark"].ToString();

                ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072;
                Dictionary<string, object> input = new Dictionary<string, object>();

                int amount = Convert.ToInt32(lblPaymentAmount.Text);
                input.Add("amount", amount*100); // this amount should be same as transaction amount
                input.Add("currency", "INR");
                input.Add("receipt", "benchkart");
                input.Add("payment_capture", 1);               

                Razorpay.Api.Order order = client.Order.Create(input);
                orderId = order["id"].ToString();             

            }
            else
            {
                string paymentId = Request.Form["razorpay_payment_id"];
                Razorpay.Api.Payment payment = client.Payment.Fetch(paymentId);

                py.PaymentRequestId = Convert.ToInt32(hfPaymentRequestId.Value);
                py.RazorpayRespnse = payment.Attributes.ToString();
                py.RazorpayPaymentId = paymentId;
                py.RazorpayOrderId = payment.Attributes["order_id"].ToString();
                
                py.LastRemark = txtCustomerRemarks.Text;

                py.SavePaymentMadebyCustomer();

                //ScriptManager.RegisterStartupScript(this, this.GetType(),"alert","alert('Your payment has beeen successfuly submitted.');window.location ='Projects_Dashboard';",true);
                Response.Write("<script>alert('Your payment has been successfully submitted. Your payment will remain in the nodal account and released to agency after you approve their Payment Release Request.');window.location='../Customer/Projects_Dashboard';</script>");

                //Dictionary<string, object> options = new Dictionary<string, object>();
                //options.Add("amount", 100);
                //options.Add("currency", "INR");
                //Razorpay.Api.Payment paymentCaptured = payment.Capture(options);
            }

        }

        protected void lnkSignOut_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            Session.RemoveAll();
            Response.Redirect("~/");
        }

    }
}