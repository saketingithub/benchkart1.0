using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Benchkart
{
    /// <summary>
    /// Summary description for fileuploadhandler
    /// </summary>
    public class fileuploadhandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            HttpPostedFile file = context.Request.Files[0];
            string fname = context.Server.MapPath("~/Files" + file.FileName);
            file.SaveAs(fname);
            context.Response.ContentType = "text/plain";
            context.Response.Write("File Uploaded Successfully!");
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}