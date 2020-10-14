using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Benchkart.Customer
{
    public partial class PaymentDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int paymentRequestId = Convert.ToInt32(Request.QueryString["PaymentRequestId"]);

            if (!IsPostBack)
            {
                ClsPayment py = new ClsPayment();
                py.PaymentRequestId = paymentRequestId;

                DataTable dtPayment = new DataTable();
                dtPayment = py.GetPaymentDetailsforCustomer();

                lblPaymentAmount.Text = dtPayment.Rows[0]["PaymentAmount"].ToString();

                lblDate.Text = dtPayment.Rows[0]["StatusUpdateDate"].ToString();

                if(dtPayment.Rows[0]["LastRemark"] != DBNull.Value)
                {
                    lblLastRemarks.Text = dtPayment.Rows[0]["LastRemark"].ToString();

                }

               // lblCompanyName.Text = dtPayment.Rows[0]["CompanyName"].ToString();

                foreach (DataRow row in dtPayment.Rows)
                {
                    foreach (DataColumn column in dtPayment.Columns)
                    {
                        if (Convert.ToInt32(row["PaymentStatus"]) == 1) 
                        {
                            pnlRequested.Visible = true;
                            lblRequestedDate.Text = row["CreationDate"].ToString();
                            lblRequestedRemarks.Text = row["Remarks"].ToString();
                        }
                        if (Convert.ToInt32(row["PaymentStatus"]) == 2)
                        {
                            pnlRejected.Visible = true;
                            lblRejectedDate.Text = row["CreationDate"].ToString();
                            lblRejectedRemarks.Text = row["Remarks"].ToString();
                        }
                        if (Convert.ToInt32(row["PaymentStatus"]) == 3)
                        {
                            pnlPaymentMade.Visible = true;
                            lblPaymentMadeDate.Text = row["CreationDate"].ToString();
                            lblPaymentMadeRemarks.Text = row["Remarks"].ToString();
                        }
                        if (Convert.ToInt32(row["PaymentStatus"]) == 4)
                        {
                            pnlPaymentReleaseRequest.Visible = true;
                            lblPaymentReleaseRequestDate.Text = row["CreationDate"].ToString();
                            lblPaymentReleaseRequestRemarks.Text = row["Remarks"].ToString();
                        }
                        if (Convert.ToInt32(row["PaymentStatus"]) == 5)
                        {
                            pnlPaymentReleased.Visible = true;
                            lblPaymentReleasedDate.Text = row["CreationDate"].ToString();
                            lblPaymentReleasedRemarks.Text = row["Remarks"].ToString();
                        }
                        if (Convert.ToInt32(row["PaymentStatus"]) == 6)
                        {
                            pnlFinalPaymentReleaseRequest.Visible = true;
                            lblFinalPaymentReleaseRequestDate.Text = row["CreationDate"].ToString();
                            lblFinalPaymentReleaseRequestRemarks.Text = row["Remarks"].ToString();
                        }
                        if (Convert.ToInt32(row["PaymentStatus"]) == 7)
                        {
                            pnlProjectClosedPaymentReleased.Visible = true;
                            lblProjectClosedPaymentReleasedDate.Text = row["CreationDate"].ToString();
                            lblProjectClosedPaymentReleasedRemarks.Text = row["Remarks"].ToString();
                        }
                        if (Convert.ToInt32(row["PaymentStatus"]) == 8)
                        {
                            pnlProjectReopenPaymentReleased.Visible = true;
                            lblProjectReopenPaymentReleasedDate.Text = row["CreationDate"].ToString();
                            lblProjectReopenPaymentReleasedRemarks.Text = row["Remarks"].ToString();
                        }
                    }
                }
               
            }
        }
    }
}