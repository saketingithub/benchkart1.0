using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Benchkart.Partner
{
    public partial class Acknowledgement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblReferenceId.Text = Request.QueryString["ID"].ToString();
        }
    }
}