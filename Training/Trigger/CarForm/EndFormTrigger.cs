using Ede.Uof.WKF.ExternalUtility;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Training.Trigger.CarForm
{
    public class EndFormTrigger : Ede.Uof.WKF.ExternalUtility.
        ICallbackTriggerPlugin
    {
        public void Finally()
        {
         //   throw new NotImplementedException();
        }

        public string GetFormResult(ApplyTask applyTask)
        {
            return "";
           // throw new NotImplementedException();
        }

        public void OnError(Exception errorException)
        {
           // throw new NotImplementedException();
        }
    }
}
