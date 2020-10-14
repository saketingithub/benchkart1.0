using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Benchkart.Partner
{
    public partial class Support : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            ClsPartner pt = new ClsPartner();

            //int PartnerId = Convert.ToInt32(Session["PartnerId"]);
            int PartnerId = 0;
            if (Session["PartnerId"] != null)
            {
                PartnerId = Convert.ToInt32(Session["PartnerId"].ToString());
            }
            else
            {
                PartnerId = Convert.ToInt32(Request.Cookies["PartnerId"].Value);
            }

            pt.PartnerId = PartnerId;
            string query = txtMessage.Text;
            pt.SupportSubmitPartner(query);
            txtMessage.Text = "";
            Response.Write("<script>alert('Your query has been successfully sent');</script>");
        }
    }
}