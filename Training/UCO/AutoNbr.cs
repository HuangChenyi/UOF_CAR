using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Training.UCO
{
    public class AutoNbr : Ede.Uof.WKF.ExternalUtility.IFormAutoNumber
    {
        public void Finally()
        {
         //   throw new NotImplementedException();
        }

        public string GetFormNumber(string formId, string userGroupId, string formValueXML)
        {
            //   throw new NotImplementedException();

            return "";
        }

        public void OnError()
        {
       //     throw new NotImplementedException();
        }

        public void OnExecption(Exception errorException)
        {
         //   throw new NotImplementedException();
        }
    }
}
