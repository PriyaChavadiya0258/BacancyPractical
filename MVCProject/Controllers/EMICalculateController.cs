using MVCProject.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MVCProject.Repository;

namespace MVCProject.Controllers
{
    
    public class EMICalculateController : Controller
    {
        EMIRepository er = new EMIRepository();
        // GET: EMICalculate 
        public ActionResult EMI()
        {
            return View();
        }

        [HttpPost]
        public ActionResult EMIGridTable(double loanAmount, double intRate, double numPay, double monPmt)
        {
            List<EMIModel> emidata = EMIRepository.GetGridList(loanAmount, intRate, numPay, monPmt).ToList();
            TempData["EMIGridTable"] = emidata;
            return Json(emidata, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult EMISaveGridData(string loanname,double loanAmount, double intRate, double numPay, double monPmt)
        {
            double rate = Math.Round(intRate / 12, 2);
            List<EMIModel> emidata = TempData["EMIGridTable"] as List<EMIModel>;
            string output = EMIRepository.SaveGridData(loanname, loanAmount, intRate, numPay, monPmt, rate, emidata);
            return Json(output, JsonRequestBehavior.AllowGet);
        }
        
    }
}