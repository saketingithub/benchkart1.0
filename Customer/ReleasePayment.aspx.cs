using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Benchkart.Customer
{
    public partial class ReleasePayment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int paymentRequestId = Convert.ToInt32(Request.QueryString["PaymentRequestId"]);

            if(Request.QueryString["action"] != null)
            {
                btnSubmit.Text = "Close Project & Release Payment";
                hfFinalPayment.Value = "1";
            }
            else
            {
                hfFinalPayment.Value = "0";
            }

            if (!IsPostBack)
            {
                ClsPayment py = new ClsPayment();
                py.PaymentRequestId = paymentRequestId;

                DataTable dtPayment = new DataTable();
                dtPayment = py.GetSinglePaymentDetails();

                hfPaymentRequestId.Value = dtPayment.Rows[0]["PaymentRequestId"].ToString();

                lblPaymentAmount.Text = dtPayment.Rows[0]["PaymentAmount"].ToString();

                lblDate.Text = dtPayment.Rows[0]["StatusUpdateDate"].ToString();

                lblCompanyName.Text = dtPayment.Rows[0]["CompanyName"].ToString();

                lblPaymentAmount.Text = dtPayment.Rows[0]["PaymentAmount"].ToString();

                lblRemarks.Text = dtPayment.Rows[0]["LastRemark"].ToString();

               // lblReleaseRemarks.Text = dtPayment.Rows[0]["PartnerReleaseRemarks"].ToString();
            }
        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            ClsPayment py = new ClsPayment();
            py.PaymentRequestId = Convert.ToInt32(hfPaymentRequestId.Value);
            py.LastRemark = txtReleaseRemarks.Text;
            py.IsFinalDelivery = Convert.ToInt32(hfFinalPayment.Value);

            int projectId = py.ReleasePaymentbyCustomer();

            if (hfFinalPayment.Value == "1")
            {
                Response.Redirect("Customer_Review?projectId=" + projectId);                
            }
            else
            {
                //Response.Redirect("Projects_Dashboard");
                Response.Write("<script>alert('Payment has been released to Agency!');window.location='../Customer/Projects_Dashboard';</script>");
            }

        }
    }
}