using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Benchkart
{
    public class ClsMilestones
    {
        public int MilestoneId { get; set; }

        public int? ContractId { get; set; }

        public string MilestoneNumber { get; set; }

        public string Title { get; set; }

        public string Description { get; set; }

        public int? Amount { get; set; }

        public int? Duration { get; set; }

        public int? DurationType { get; set; }

        public DateTime? StartDate { get; set; }

        public DateTime? EndDate { get; set; }

        public DateTime? CreationDate { get; set; }


    }

}