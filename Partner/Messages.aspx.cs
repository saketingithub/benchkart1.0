using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Data;
using System.Web.UI.HtmlControls;

namespace Benchkart.Partner
{
    public partial class Messages : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //try
            //{
            string action = Request.QueryString["action"].ToString();

            HtmlAnchor a_msgSubmenu = (HtmlAnchor)Master.FindControl("a_msgSubmenu");
            a_msgSubmenu.Style.Add("aria-expanded", "true");
            a_msgSubmenu.Attributes.Add("class", "dropdown-toggle");
            a_msgSubmenu.Attributes.Add("data-toggle", "");

            HtmlGenericControl msgSubmenu = (HtmlGenericControl)Master.FindControl("msgSubmenu");
            msgSubmenu.Style.Add("aria-expanded", "true");
            msgSubmenu.Attributes.Add("class", "list-unstyled collapse in show");

            if (action == "inbox")
            {
                HtmlAnchor a_Messages_Inbox = (HtmlAnchor)Master.FindControl("a_Messages_Inbox");
                a_Messages_Inbox.Style.Add("background-color", "white");
            }
            else
            {
                HtmlAnchor a_Messages_Sent = (HtmlAnchor)Master.FindControl("a_Messages_Sent");
                a_Messages_Sent.Style.Add("background-color", "white");
            }

            DataTable dtMessages = new DataTable();

                //int partnerId = Convert.ToInt32(Session["PartnerId"].ToString());
                int partnerId = 0;
                if (Session["PartnerId"] != null)
                {
                    partnerId = Convert.ToInt32(Session["PartnerId"].ToString());
                }
                else
                {
                    partnerId = Convert.ToInt32(Request.Cookies["PartnerId"].Value);
                }

                if (!IsPostBack)
                {
                   
                    ClsMessage ms = new ClsMessage();

                    dtMessages = ms.GetMessagesforPartner(partnerId, action);
                    rptMessages.DataSource = dtMessages;
                    rptMessages.DataBind();
                }
            //}
            //catch (Exception ex)
            //{ 
            
            //}
        }
        

        protected void rptMessages_ItemDateBound(object source, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Header)
            {
                Label lblSender = e.Item.FindControl("lblSender") as Label;
                if (Request.QueryString["action"].ToString() == "inbox")
                {
                    lblSender.Text = "From";
                }
                else
                {
                    lblSender.Text = "To";
                }
            }
        }
    }
}