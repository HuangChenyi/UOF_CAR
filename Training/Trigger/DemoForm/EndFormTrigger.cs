using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Ede.Uof.WKF.ExternalUtility;
using Training.UCO;

namespace Training.Trigger.DemoForm
{
    public class EndFormTrigger : ICallbackTriggerPlugin
    {
        public void Finally()
        {
            //  throw new NotImplementedException();
        }

        public string GetFormResult(ApplyTask applyTask)
        {
            // throw new NotImplementedException();

            //<Form formVersionId="30d33f52-802f-49b3-933e-f93a9c5d61cb">
            //  <FormFieldValue>
            //    <FieldItem fieldId="NO" fieldValue="" realValue="" />
            //    <FieldItem fieldId="A01" fieldValue="xxx" realValue="" fillerName="黃建龍" fillerUserGuid="07a00c72-270e-403e-b9df-20b530ba45e8" fillerAccount="Howard_Huang" fillSiteId="" />
            //    <FieldItem fieldId="A02" fieldValue="3" realValue="" fillerName="黃建龍" fillerUserGuid="07a00c72-270e-403e-b9df-20b530ba45e8" fillerAccount="Howard_Huang" fillSiteId="" />
            //    <FieldItem fieldId="A03" fieldValue="4" realValue="" fillerName="黃建龍" fillerUserGuid="07a00c72-270e-403e-b9df-20b530ba45e8" fillerAccount="Howard_Huang" fillSiteId="" />
            //    <FieldItem fieldId="A04" fieldValue="222" realValue="" fillerName="黃建龍" fillerUserGuid="07a00c72-270e-403e-b9df-20b530ba45e8" fillerAccount="Howard_Huang" fillSiteId="" />
            //  </FormFieldValue>
            //</Form>

            DemoUCO uco = new DemoUCO();
            string docNbr = applyTask.FormNumber;
            string signStatus = applyTask.FormResult.ToString();

            uco.UpdateFormResult(docNbr, signStatus);
            return "";
        }

        public void OnError(Exception errorException)
        {
            //  throw new NotImplementedException();
        }
    }
}
