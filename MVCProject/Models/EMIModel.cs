using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVCProject.Models
{
    public class EMIModel
    {
        public int id { get; set; }
        public double Opening { get; set; }
        public double Principal { get; set; }
        public double Interest { get; set; }
        public double EMI { get; set; }
        public double Closing { get; set; }
        public double CummulativeInterest { get; set; }
      
    }


}