using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Benchkart
{
    public class ClsProjectClosure
    {
        public int ProjectClosureId { get; set; }

        public int? ProjectId { get; set; }

        public int? PaymentReleaseId { get; set; }

        public DateTime? ClosureDate { get; set; }

        public string CustomerReview { get; set; }

        public byte? CustomerRating { get; set; }

    }
}