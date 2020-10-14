using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;

namespace Benchkart
{
    /// <summary>
    /// Summary description for Download
    /// </summary>
    public class Download : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string file = context.Request.QueryString["file"];

            if (!string.IsNullOrEmpty(file) && File.Exists(file))
            {
                context.Response.Clear();
                context.Response.ContentType = "application/octet-stream";
                context.Response.AddHeader("content-disposition", "attachment;filename=" + Path.GetFileName(file));
                context.Response.WriteFile(file);
                // This would be the ideal spot to collect some download statistics and / or tracking  
                // also, you could implement other requests, such as delete the file after download  
                context.Response.End();

            }
            else
            {
                context.Response.ContentType = "text/plain";
                context.Response.Write("File not be found!");


            }
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