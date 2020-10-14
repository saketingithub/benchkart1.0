using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Benchkart.Customer
{
    public partial class Message_Details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtMessage.Focus();
                //lblEmail.Text = Session["PartnerEmail"].ToString();
                //hdnPartnerId.Value = Session["PartnerId"].ToString();
                //hdnPartnerId.Value = "39";
                int messageId = Convert.ToInt32(Request.QueryString["id"].ToString());
                ClsMessage ms = new ClsMessage();
                DataTable dtMessages = new DataTable();
                dtMessages = ms.GetMessageDetails(messageId);

                if (dtMessages.Rows.Count > 0)
                {
                    CreateControls(dtMessages);
                }
                DisplayDownloads(messageId);

            }

        }

        public void DisplayDownloads(int messageId)
        {
            if (Directory.Exists(Server.MapPath("~/Uploadfiles/MessageAttachments/" + messageId + "/")))
            {
                DirectoryInfo di = new DirectoryInfo(Server.MapPath("~/Uploadfiles/MessageAttachments/" + messageId + "/"));
                int i = 0;
                foreach (FileInfo fi in di.GetFiles())
                {
                    HyperLink HL = new HyperLink();
                    HL.ID = "HyperLink" + i++;
                    HL.Text = fi.Name;
                    HL.NavigateUrl = "~/Download.ashx?file=" + fi.FullName;
                    HL.Attributes.Add("style", "color: blue; text-decoration: underline; line-height: 2;");
                    pnlDownloads.Controls.Add(HL);
                    pnlDownloads.Controls.Add(new LiteralControl("<br/>"));
                }
            }

        }

        private void CreateControls(DataTable dtMessages)
        {
            lblSubject.Text = dtMessages.Rows[0]["ProjectTitle"].ToString();
            int i = 1;
            foreach (DataRow dr in dtMessages.Rows)
            {
                if (dr["Sender"].ToString() == "1")
                {
                    Label lblSender = new Label();
                    lblSender.ID = "lblSender_" + i;
                    lblSender.Text = "From : " + dr["CustomerCompanyName"].ToString();
                    lblSender.Attributes.Add("style", "color: gray;font-size: .85em;line-height: 1.5; ");
                    placeMessageDetails.Controls.Add(lblSender);

                }
                else
                {
                    Label lblSender = new Label();
                    lblSender.ID = "lblSender_" + i;
                    lblSender.Text = "From : You";
                    lblSender.Attributes.Add("style", "color: gray;font-size: .85em;line-height: 1.5; ");
                    placeMessageDetails.Controls.Add(lblSender);

                }
                placeMessageDetails.Controls.Add(new LiteralControl("<br />"));

                Label lblSentDate = new Label();
                lblSentDate.ID = "lblSentDate_" + i;
                lblSentDate.Text = "Date : " + dr["CreationDate"].ToString();
                lblSentDate.Attributes.Add("style", "color: gray;font-size: .85em;line-height: 1.5; ");
                placeMessageDetails.Controls.Add(lblSentDate);
                placeMessageDetails.Controls.Add(new LiteralControl("<br />"));

                Label lblBody = new Label();
                lblBody.ID = "lblBody_" + i;
                lblBody.Text = dr["Message"].ToString();
                lblBody.Attributes.Add("style", "line-height: 2; ");
                placeMessageDetails.Controls.Add(lblBody);
                placeMessageDetails.Controls.Add(new LiteralControl("<br /><br />"));

                i = i + 1;
            }

        }


        protected void btnMessage_Click(object sender, EventArgs e)
        {
            ClsMessage ms = new ClsMessage();
            ms.MessageId = Convert.ToInt32(Request.QueryString["id"].ToString());
            ms.Message = txtMessage.Text;

            //Email
            string partnerName = string.Empty;
            string partnerEmail = string.Empty;
            string customerName = string.Empty;
            string customerEmail = string.Empty;

            int newMessageId = ms.SendMessagebyCustomer();

            string newPath = string.Empty;
            HttpFileCollection fileCollection = Request.Files;
            if (Request.Files.Count > 0 && Request.Files[0].ContentLength > 0)
            {
                // Mention the directory name where you want to create sub directories.
                string strMainFolderPath = Server.MapPath("~/UploadFiles/MessageAttachments/");

                //Create a new subfolder in the main folder.
                newPath = System.IO.Path.Combine(strMainFolderPath, newMessageId.ToString());

                DirectoryInfo objDirectory = new DirectoryInfo(newPath);
                if (!objDirectory.Exists)
                {
                    System.IO.Directory.CreateDirectory(newPath);
                }

                for (int i = 0; i < fileCollection.Count; i++)
                {
                    HttpPostedFile uploadfile = fileCollection[i];
                    string fileName = Path.GetFileName(uploadfile.FileName);
                    //if (uploadfile.ContentLength > 0)
                    //{
                    uploadfile.SaveAs(newPath + "\\" + fileName);
                    //}
                }
            }

            Response.Redirect("~/Customer/Messages?action=inbox");
        }

       
    }
}