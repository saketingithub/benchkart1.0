using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Benchkart.Admin
{
    public partial class AdminDashBoard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                ClsCustomer cst = new ClsCustomer();
                int requestCount = 0, projectCount=0, partnerCount=0, customerCount=0;
                cst.GetAdminDashboard(ref requestCount, ref projectCount, ref partnerCount, ref customerCount);
                lblRequest.Text = requestCount.ToString();
                lblProjectList.Text = projectCount.ToString();
                lblPartnerList.Text = partnerCount.ToString();
                lblCustomerList.Text = customerCount.ToString();
                
            }
            
        }

    }
}