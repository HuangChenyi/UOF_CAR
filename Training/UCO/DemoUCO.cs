using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Training.PO;
using Training.Data;

namespace Training.UCO
{
    public  class DemoUCO
    {
        DemoPO m_DemoPO = new DemoPO();


        public DataTable GetUserData(string groupId)
        {
            return m_DemoPO.GetUserData(groupId);
        }

        public void InsertTaskData(DataRow dr)
        {
            m_DemoPO.InsertTaskData(dr);
        }

      

        public DataTable GetUserData()
        {
            return m_DemoPO.GetUserData();
        }

        public void InsertWsEndFormData(DataRow dr)
        {
            m_DemoPO.InsertWsEndFormData(dr);
        }


        public void InsertDDLStartFormData(DemoDataSet.TB_DEMO_DLL_FORMRow dr)
        {
            m_DemoPO.InsertDDLStartFormData(dr);
        }

        public void UpdateFormStatus(string docNbr, string signStatus)
        {
            m_DemoPO.UpdateFormStatus(docNbr, signStatus);
        }

        public void UpdateFormResult(string docNbr, string formResult)
        {
            m_DemoPO.UpdateFormResult(docNbr, formResult);
        }

    }
}
