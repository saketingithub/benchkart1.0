using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace Benchkart.Customer
{
    public partial class Send_Message : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnMessage_Click(object sender, EventArgs e)
        {
            ClsMessage ms = new ClsMessage();
            int contractId = Convert.ToInt32(Request.QueryString["ID"].ToString());
            ms.Message = txtMessage.Text;

            //Email
            string partnerName = string.Empty;
            string partnerEmail = string.Empty;
            string customerName = string.Empty;
            string customerEmail = string.Empty;

            int newMessageId = ms.SendMessagetoPartner(contractId);

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

            Response.Redirect("~/Customer/Projects_Dashboard");
        }

    }
}