using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Benchkart
{
    public class ClsService
    {
        public int ServiceId { get; set; }

        public int PartnerId { get; set; }

        public DateTime? CreationDate { get; set; }
    }
}