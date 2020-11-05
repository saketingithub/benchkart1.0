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
    public partial class PaymentQuickProject : System.Web.UI.Page
    {
        public string razor_payment_key = RazorPayAppKeys.getKey();
        string razor_payment_secret = RazorPayAppKeys.getSecret();
        public string razorPayOrderId ;
        int transactionAmount = 100;

        protected void Page_Load(object sender, EventArgs e)
        {
            
            RazorpayClient razorPayClient = new RazorpayClient(razor_payment_key, razor_payment_secret);
            ClsPayment py = new ClsPayment();

            if (Request.QueryString["action"] == null)
            {
                setPageDetails();
                int iQuickProjectId = Convert.ToInt32(Request.QueryString["quickProjectId"]);
                hfPaymentRequestId.Value = iQuickProjectId.ToString();
                //Fetch Necessary details from DB

                ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072;
                Dictionary<string, object> input = new Dictionary<string, object>();

                int amount = Convert.ToInt32(transactionAmount);
                input.Add("amount", amount*100); // this amount should be same as transaction amount
                input.Add("currency", "INR");
                input.Add("receipt", "benchkart");
                input.Add("payment_capture", 1);               

                //Create RAZOR PAY ORDER
                Razorpay.Api.Order razorPayOrder = razorPayClient.Order.Create(input);
                razorPayOrderId = razorPayOrder["id"].ToString();             

            }
            else
            {
                string paymentId = Request.Form["razorpay_payment_id"];
                Razorpay.Api.Payment razorPayment = razorPayClient.Payment.Fetch(paymentId);

                py.PaymentRequestId = Convert.ToInt32(hfPaymentRequestId.Value);
                py.RazorpayRespnse = razorPayment.Attributes.ToString();
                py.RazorpayPaymentId = paymentId;
                py.RazorpayOrderId = razorPayment.Attributes["order_id"].ToString();
                
                py.LastRemark = txtCustomerRemarks.Text;

                //Save paymrnt made by Customer
                //py.SavePaymentMadebyCustomer();

                //ScriptManager.RegisterStartupScript(this, this.GetType(),"alert","alert('Your payment has beeen successfuly submitted.');window.location ='Projects_Dashboard';",true);
                Response.Write("<script>alert('Your payment for quick Project has been successfully submitted. Your payment will remain in the nodal account and released to agency after you approve their Payment Release Request.');</script>");
            }

        }

        private void setPageDetails()
        {
            lblPaymentAmount.Text = transactionAmount.ToString();
            lblDate.Text = DateTime.Now.ToString("dd-mm-yyyy");
            lblCompanyName.Text = "Test Inc.";
            txtCustomerRemarks.Text = "Test Remarks before making payment";
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