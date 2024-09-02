using Lab.Lib.Data;
using Lab.Lib.PO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab.Lib.UCO
{
    public  class LabUCO
    {
        public DataTable GetProductList()
        {
            LabPO labPO = new LabPO();
            return labPO.GetProductList();
        }

        public DataTable GetOrderDetail(string orderId)
        {
            LabPO labPO = new LabPO();
            return labPO.GetOrderDetail(orderId);
        }

        public DataTable GetOrderList(string keyword)
        {
            LabPO labPO = new LabPO();
            return labPO.GetOrderList(keyword);
        }

        public void InsertLabFormData(LabFormDataSet.TB_LAB_DLL_FORMRow dr)
        {
            LabPO labPO = new LabPO();
            labPO.InsertLabFormData(dr);
        }

    }
}
