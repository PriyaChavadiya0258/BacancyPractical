using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MVCProject.Models;
using System.Data;
using System.Data.SqlClient;

namespace MVCProject.Repository
{
    public class EMIRepository
    {
        public static IEnumerable<EMIModel> GetGridList(double loanAmount, double intRate, double numPay, double monPmt)
        {
            List<EMIModel> emidata = new List<EMIModel>();

            try
            {
                double Opening = loanAmount;
                double Closing = loanAmount;
                intRate = (intRate / 100) / 12;
                double Principal = monPmt;
                double OInterest = 0;
                double CumInterest = 0;
                double DisplayInterest = 0; ;


                for (var i = 1; i <= numPay; i++)
                {
                    EMIModel emigriddata = new EMIModel();

                    OInterest = Closing * intRate;
                    DisplayInterest = Math.Round((OInterest), 2);
                    CumInterest = CumInterest + OInterest;
                    // Test for the final payment
                    if (i < numPay)
                    {
                        Principal = Math.Round((monPmt - DisplayInterest), 2);
                        Opening = Closing;
                        Closing = Math.Round((Opening - Principal), 2);
                    }
                    else
                    {
                        Principal = (Opening - Principal) + OInterest;
                        Opening = Closing;
                        Closing = 0;
                        Principal = Math.Round((Principal), 2);
                    }
                    emigriddata.id = i;
                    emigriddata.Opening = Convert.ToDouble(Opening);
                    emigriddata.Principal = Convert.ToDouble(Principal);
                    emigriddata.Interest = Convert.ToDouble(DisplayInterest);
                    emigriddata.EMI = Convert.ToDouble(monPmt);
                    emigriddata.Closing = Convert.ToDouble(Closing);
                    emigriddata.CummulativeInterest = Convert.ToDouble(Math.Round(CumInterest, 2));
                    emidata.Add(emigriddata);


                }
            }
            catch (Exception ex)
            {
                ErrorHandle.WriteError(ex);
                return emidata;
            }

            return emidata;

        }
        public static string SaveGridData(string loanname, double loanAmount, double intRate, double numPay, double monPmt, double rate, List<EMIModel> EMIData)
        {

            string OutputResult = "test";
            try
            {
                DataTable dtGridData;
                dtGridData = null;
                dtGridData = new DataTable();
                dtGridData.Columns.Add("Id", typeof(int));
                dtGridData.Columns.Add("Opening", typeof(double));
                dtGridData.Columns.Add("Principal", typeof(double));
                dtGridData.Columns.Add("Interest", typeof(double));
                dtGridData.Columns.Add("EMI", typeof(double));
                dtGridData.Columns.Add("Closing", typeof(double));
                dtGridData.Columns.Add("CummulativeInterest", typeof(double));

                for (int i = 0; i < EMIData.Count; i++)
                {
                    DataRow dr = dtGridData.NewRow();

                    dr["Id"] = Convert.ToInt32(EMIData[i].id);
                    dr["Opening"] = Convert.ToDouble(EMIData[i].Opening);
                    dr["Principal"] = Convert.ToDouble(EMIData[i].Principal);
                    dr["Interest"] = Convert.ToDouble(EMIData[i].Interest);
                    dr["EMI"] = Convert.ToDouble(EMIData[i].EMI);
                    dr["Closing"] = Convert.ToDouble(EMIData[i].Closing);
                    dr["CummulativeInterest"] = Convert.ToDouble(EMIData[i].CummulativeInterest);
                    dtGridData.Rows.Add(dr);
                }
                DBConnection con = new DBConnection();
                var cmd = new SqlCommand();
                {
                    cmd.CommandText = "spSaveEmiData";
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@dtGridData", dtGridData);
                    cmd.Parameters.AddWithValue("@loanname", loanname);
                    cmd.Parameters.AddWithValue("@loanAmount", loanAmount);
                    cmd.Parameters.AddWithValue("@intRate", intRate);
                    cmd.Parameters.AddWithValue("@numPay", numPay);
                    cmd.Parameters.AddWithValue("@monPmt", monPmt);   //added
                    cmd.Parameters.AddWithValue("@rate", rate);
                    DataTable dt = new DataTable();
                    dt = new DBConnection().GetDataTable(cmd);
                    if (dt != null)
                    {
                        if (Convert.ToString(dt.Rows[0]["outputresult"]) == "1")
                        {

                            OutputResult = "Submitted Successfully";
                        }
                        else if (Convert.ToString(dt.Rows[0]["outputresult"]) == "0")
                        {
                            OutputResult = "Something went wrong";
                        }
                        else
                        {

                            OutputResult = "Data already exists.";
                        }
                    }

                }


            }
            catch (Exception ex)
            {
                ErrorHandle.WriteError(ex);
                return OutputResult;
            }

            return OutputResult;

        }

    }
}