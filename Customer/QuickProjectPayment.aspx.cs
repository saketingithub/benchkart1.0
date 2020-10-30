using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Benchkart.Customer
{
    public partial class QuickProjectPayment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetData();
            }
        }

        public void GetData()
        {
            int partnerPackageId = Convert.ToInt32(Request.QueryString["PartnerPackageId"]);
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
                lblpackagecost.Text = dt.Rows[0]["BasicPackageCost"].ToString();
            }
            if (dt.Rows[0]["StandardPackageCost"] != DBNull.Value)
            {
                lblpackagecost.Text = dt.Rows[0]["StandardPackageCost"].ToString();
            }
            if (dt.Rows[0]["PremiumPackageCost"] != DBNull.Value)
            {
                lblpackagecost.Text = dt.Rows[0]["PremiumPackageCost"].ToString();
            }
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
            if (customerId != 0)
            {   

                clspay.CustomerId = Convert.ToInt32(customerId);
                clspay.PartnerPackageId = Convert.ToInt32(Request.QueryString["PartnerPackageId"]);
                clspay.PaymentAmount = Convert.ToInt32(lblpackagecost.Text);
                int paymentid = clspay.CreatePaymentRequestQuick();
                if (paymentid > 0)
                {
                    Response.Write("<script>alert('Payment is successfully ')</script>");
                }
            }





        }
    }
}