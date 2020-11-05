using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace Benchkart
{
    public static class AppSettings
    {
        public static bool isDevelopmentMode()
        {
            bool status = false;
            status = ConfigurationManager.AppSettings["IsDevelopmentMode"].ToLower() == "true" ? true : false;
            return status;
        }
    }
}