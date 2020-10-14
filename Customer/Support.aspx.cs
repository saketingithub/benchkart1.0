﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Benchkart.Customer
{
    public partial class Support : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            ClsCustomer cst = new ClsCustomer();

            //int CustomerId =Convert.ToInt32(Session["CustomerId"]);
            int CustomerId = 0;
            if (Session["CustomerId"] != null)
            {
                CustomerId = Convert.ToInt32(Session["CustomerId"].ToString());
            }
            else
            {
                CustomerId = Convert.ToInt32(Request.Cookies["CustomerId"].Value);
            }

            cst.CustomerId = CustomerId;
            string query = txtMessage.Text;
            cst.SupportSubmitCustomer(query);
            txtMessage.Text = "";
            Response.Write("<script>alert('Your query has been successfully sent.');</script>");
        }
    }
}