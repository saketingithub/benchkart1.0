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
    public static class RazorPayAppKeys
    {
        public static string getKey()
        {
            if (AppSettings.isDevelopmentMode())
            {
                return "rzp_test_n0Go0s9iSZW1OA";
            }
            else
            {
                return "rzp_live_zoPlr5o13JZG7T";
            }
        }

        public static string getSecret()
        {
            if (AppSettings.isDevelopmentMode())
            {
                return "WYU8IbCQaOYr9mNRhDq1bS93";
            }
            else
            {
                return "fQyHIMW2ESJwkjsR2SZWRC6o";
            }
        }
    }
}