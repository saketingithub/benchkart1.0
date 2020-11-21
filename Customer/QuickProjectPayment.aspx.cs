using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Razorpay.Api;
using System.Net;
using System.Configuration;

namespace Benchkart.Customer
{
    public partial class QuickProjectPayment : System.Web.UI.Page
    {
        //private int _paymentPercentage = 0;
        private string _packageDisplayCost;
        public string orderId;
        public string razorPaymentId;
        public string razor_payment_key = RazorPayAppKeys.getKey();
        string razor_payment_secret = RazorPayAppKeys.getSecret();
        RazorpayClient _client;
        ClsPayment _py = new ClsPayment();
        protected void Page_Load(object sender, EventArgs e)
        {
            _client = new RazorpayClient(razor_payment_key, razor_payment_secret);
           
           
            if (!IsPostBack)
            {
                GetData();
            }
        }

        public void GetData()
        {
            int partnerPackageId = Convert.ToInt32(Request.QueryString["PartnerPackageId"]);
            string PackageAmount = "";
            ViewState["paymentPercentage"] = "10";
            
            if (Request.QueryString["action"] == "1")
            {
                ClsQuickProject clsqp = new ClsQuickProject();
                clsqp.PartnerPackageId = partnerPackageId;
                DataTable dt = new DataTable();
                dt = clsqp.GetPartnerPackageByCustomer();
                if (dt.Rows[0]["PackageName"] != DBNull.Value)
                {
                    lblpackagenamepay.Text = dt.Rows[0]["PackageName"].ToString();
                }
                if (dt.Rows[0]["PartnerId"] != DBNull.Value)
                {
                    lblagencycode.Text = dt.Rows[0]["PartnerId"].ToString();
                }
                if (dt.Rows[0]["BasicPackageCost"] != DBNull.Value)
                {
                    lblpackagecost.Text = PackageAmount = dt.Rows[0]["BasicPackageCost"].ToString();
                    _packageDisplayCost = string.Format(new System.Globalization.CultureInfo("hi-IN"), "{0:#,#}", decimal.Parse(dt.Rows[0]["BasicPackageCost"].ToString(), System.Globalization.CultureInfo.InvariantCulture));
                }
                //if (dt.Rows[0]["StandardPackageCost"] != DBNull.Value)
                //{
                //    lblpackagecost.Text = dt.Rows[0]["StandardPackageCost"].ToString();
                //}
                //if (dt.Rows[0]["PremiumPackageCost"] != DBNull.Value)
                //{
                //    lblpackagecost.Text = dt.Rows[0]["PremiumPackageCost"].ToString();
                //}
            }
            else if (Request.QueryString["action"] == "2")
            {
                ClsQuickProject clsqp = new ClsQuickProject();
                clsqp.PartnerPackageId = partnerPackageId;
                DataTable dt = new DataTable();
                dt = clsqp.GetPartnerPackageByCustomer();
                if (dt.Rows[0]["PackageName"] != DBNull.Value)
                {
                    lblpackagenamepay.Text = dt.Rows[0]["PackageName"].ToString();
                }
                if (dt.Rows[0]["PartnerId"] != DBNull.Value)
                {
                    lblagencycode.Text = dt.Rows[0]["PartnerId"].ToString();
                }
                //if (dt.Rows[0]["BasicPackageCost"] != DBNull.Value)
                //{
                //    lblpackagecost.Text = dt.Rows[0]["BasicPackageCost"].ToString();
                //}
                if (dt.Rows[0]["StandardPackageCost"] != DBNull.Value)
                {
                    lblpackagecost.Text = PackageAmount = dt.Rows[0]["StandardPackageCost"].ToString();
                    _packageDisplayCost = string.Format(new System.Globalization.CultureInfo("hi-IN"), "{0:#,#}", decimal.Parse(dt.Rows[0]["StandardPackageCost"].ToString(), System.Globalization.CultureInfo.InvariantCulture));

                }
                //if (dt.Rows[0]["PremiumPackageCost"] != DBNull.Value)
                //{
                //    lblpackagecost.Text = dt.Rows[0]["PremiumPackageCost"].ToString();
                //}
            }
            else if (Request.QueryString["action"] == "3")
            {
                ClsQuickProject clsqp = new ClsQuickProject();
                clsqp.PartnerPackageId = partnerPackageId;
                DataTable dt = new DataTable();
                dt = clsqp.GetPartnerPackageByCustomer();
                if (dt.Rows[0]["PackageName"] != DBNull.Value)
                {
                    lblpackagenamepay.Text = dt.Rows[0]["PackageName"].ToString();
                }
                if (dt.Rows[0]["PartnerId"] != DBNull.Value)
                {
                    lblagencycode.Text = dt.Rows[0]["PartnerId"].ToString();
                }
                //if (dt.Rows[0]["BasicPackageCost"] != DBNull.Value)
                //{
                //    lblpackagecost.Text = dt.Rows[0]["BasicPackageCost"].ToString();
                //}
                //if (dt.Rows[0]["StandardPackageCost"] != DBNull.Value)
                //{
                //    lblpackagecost.Text = dt.Rows[0]["StandardPackageCost"].ToString();
                //}
                if (dt.Rows[0]["PremiumPackageCost"] != DBNull.Value)
                {
                    lblpackagecost.Text = PackageAmount = dt.Rows[0]["PremiumPackageCost"].ToString();
                    _packageDisplayCost = string.Format(new System.Globalization.CultureInfo("hi-IN"), "{0:#,#}", decimal.Parse(dt.Rows[0]["PremiumPackageCost"].ToString(), System.Globalization.CultureInfo.InvariantCulture));

                }
            }
            tbPaymentAmount.Text = string.Format(new System.Globalization.CultureInfo("hi-IN"), "{0:#,#}", decimal.Parse(_packageDisplayCost, System.Globalization.CultureInfo.InvariantCulture));
            ViewState["packageDisplayCost"] = tbPaymentAmount.Text;
            tbPaymentAmount.Attributes["disabled"] = "disabled";
        }
        
        protected void btnPay_Click(object sender, EventArgs e)
        {

            ClsCustomer clscm = new ClsCustomer();
            ClsPayment clspay = new ClsPayment();
            clscm.FullName = txtFullName.Text;
            clscm.Email = txtEmailid.Text;
            clscm.Password = txtPassword.Text;
            clscm.ContactNumber = txtContactNumber.Text;
            clscm.CompanyName = txtCompanyName.Text;
            int customerId = clscm.New_QuickCustomer();
            Session["CustomerId"] = Convert.ToInt32(customerId);
            if (customerId != 0)
            {
               

                clspay.CustomerId = Convert.ToInt32(customerId);
                clspay.PartnerPackageId = Convert.ToInt32(Request.QueryString["PartnerPackageId"]);
                clspay.PaymentAmount = Convert.ToInt32(lblpackagecost.Text);
                //clspay.PaymentAmount = Convert.ToInt32(_packageCost);
                int paymentid = clspay.CreatePaymentRequestQuick();
                if (paymentid > 0)
                {
                    hfPaymentRequestId.Value = paymentid.ToString();
                   
                    _py.PaymentRequestId = paymentid;

                    DataTable dtPayment = new DataTable();
                    dtPayment = _py.GetSinglePaymentDetails();
                    ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072;
                    Dictionary<string, object> input = new Dictionary<string, object>();

                    int amount = Convert.ToInt32(clspay.PaymentAmount);
                    int amountPayable = (amount * Convert.ToInt32(ViewState["paymentPercentage"]))/ 100;
                    input.Add("amount", amountPayable * 100); // this amount should be same as transaction amount
                    input.Add("currency", "INR");
                    input.Add("receipt", "benchkart");
                    input.Add("payment_capture", 1);

                    Razorpay.Api.Order order = _client.Order.Create(input);
                    orderId = order["id"].ToString();


                    string redirectURL = "/Customer/Projects_Dashboard";
                    string paymentUrl = "/Handlers/PaymentResponse.ashx";


                    tbPaymentAmount.Text = string.Format(new System.Globalization.CultureInfo("hi-IN"), "{0:#,#}", decimal.Parse(ViewState["packageDisplayCost"].ToString(), System.Globalization.CultureInfo.InvariantCulture));

                    //set session values to capture after resposne..
                    Session["PaymentRequestId"] = Convert.ToInt32(hfPaymentRequestId.Value);
                    Session["OrderId"] = orderId;

                    String scriptText =
                        "<script src='https://checkout.razorpay.com/v1/checkout.js'></script> " +
                        "<script> " +
                        "var options = " +
                        "{ " +
                        "   'key': '" + razor_payment_key + "', " +
                        "   'amount': '" + amountPayable * 100 + "'," +
                        "   'currency': 'INR', " +
                        "   'name': 'Benchkart', " +
                        "   'description': 'Quick Project Payment', " +
                        "   'image': 'https://razorpay.com/favicon.png', " +
                        "   'order_id': '" + orderId + "', " +
                        "   'handler': function (response) { " +
                        "       if(response && response.razorpay_signature && response.razorpay_signature != ''){ " +
                        "           console.log(response);" +
                        "           $('#modalpayresp').modal('show'); " +
                        "           processPymResp(response); " +
                        "           setTimeout(function(){ " +
                        "               window.location.href= '" + redirectURL + "';" +
                        "           }, 3000);" +
                        "       }" +
                        "   }, " +
                        "   'prefill': { " +
                        "       'name': '', " +
                        "       'email': '" + clscm.Email + "', " +
                        "       'contact': '" + clscm.ContactNumber + "' " +
                        "   }, " +
                        "   'notes': { " +
                        "   'address': '' " +
                        "   }, " +
                        "   'theme': { 'color': '#F37254' } " +
                        "}; " +
                        "" +
                        "" +
                        "var rzp1 = new Razorpay(options); " +
                        "rzp1.on('payment.failed', function (response) { " +
                        "   /*" +
                        "   alert(response.error.code); " +
                        "   alert(response.error.description); " +
                        "   alert(response.error.source); " +
                        "   alert(response.error.step); " +
                        "   alert(response.error.reason); " +
                        "   alert(response.error.metadata.order_id); " +
                        "   alert(response.error.metadata.payment_id); " +
                        "   */" +
                        "}); " +
                        "" +
                        "rzp1.open();  " +
                        "function processPymResp(RazorpayResponse) { " +
                        "   $.ajax({ " +
                        "       type: 'POST', " +
                        "       url: '"+ paymentUrl + "?RazorpaySignature=' + RazorpayResponse.razorpay_signature + '&RazorpayPaymentId=' + RazorpayResponse.razorpay_payment_id, " +
                        "       contentType: 'json', " +
                        "       dataType: 'json', " +
                        "       data: {  }, " +
                        "       success: function (data) { " +
                        "       }, " +
                        "       error: function (xhr) { " +
                        "       } " +
                        "   }); " +
                        "}" +
                        "</script>";

                
                 ClientScript.RegisterClientScriptBlock(this.GetType(), "RazorScript", scriptText);

                    //Response.Write("<script>alert('Payment is successfully ')</script>");
                    //Response.Redirect("Projects_Dashboard");
                }
            }
            else
            {
                Response.Write("<script>alert('Email Id already exist !')</script> ");
            }




        }
    }
}