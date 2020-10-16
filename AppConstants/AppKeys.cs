using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace Benchkart.AppConstants
{
    public static class RazorPayAppKeys
    {
        public static string getKey()
        {
            if(ConfigurationManager.AppSettings["IsLivePaymentMode"].ToString().ToLower() == "true")
            {
                return "rzp_live_zoPlr5o13JZG7T";
            }
            else
            {
                return "rzp_test_n0Go0s9iSZW1OA";
            }
        }

        public static string getSecret()
        {
            if (ConfigurationManager.AppSettings["IsLivePaymentMode"].ToString().ToLower() == "true")
            {
                return "fQyHIMW2ESJwkjsR2SZWRC6o";
            }
            else
            {
                return "WYU8IbCQaOYr9mNRhDq1bS93";
            }
        }
    }
}