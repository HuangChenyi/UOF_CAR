using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;
using Training.Data;
using Training.UCO;

namespace Training.Trigger.DemoForm
{
    public class StartFormTrigger : Ede.Uof.WKF.ExternalUtility.ICallbackTriggerPlugin
    {
        public void Finally()
        {

        }

        public string GetFormResult(Ede.Uof.WKF.ExternalUtility.ApplyTask applyTask)
        {
            
            //<Form formVersionId="3288492d-db7d-4a28-bae9-e304d2bde854">
            //  <FormFieldValue>
            //    <FieldItem fieldId="NO" fieldValue="" realValue="" />
            //    <FieldItem fieldId="A01" fieldValue="品名A" realValue="" fillerName="Tony" fillerUserGuid="c496e32b-0968-4de5-95fc-acf7e5a561c0" fillerAccount="Tony" fillSiteId="" />
            //    <FieldItem fieldId="A02" fieldValue="40" realValue="" fillerName="Tony" fillerUserGuid="c496e32b-0968-4de5-95fc-acf7e5a561c0" fillerAccount="Tony" fillSiteId="" />
            //    <FieldItem fieldId="A03" fieldValue="5" realValue="" fillerName="Tony" fillerUserGuid="c496e32b-0968-4de5-95fc-acf7e5a561c0" fillerAccount="Tony" fillSiteId="" />
            //    <FieldItem fieldId="A04" fieldValue="備註A" realValue="" fillerName="Tony" fillerUserGuid="c496e32b-0968-4de5-95fc-acf7e5a561c0" fillerAccount="Tony" fillSiteId="" />
            //  </FormFieldValue>
            //</Form>

            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.LoadXml(applyTask.CurrentDocXML);
           // applyTask.Task.CurrentSite.SiteId
               // applyTask.Task.TaskDs.TB_WKF_TASK_NODE.ACTUAL_SIGNERColumn
            DemoDataSet ds = new DemoDataSet();
            DemoDataSet.TB_DEMO_DLL_FORMRow dr = ds.TB_DEMO_DLL_FORM.NewTB_DEMO_DLL_FORMRow();
            dr.ID = Guid.NewGuid().ToString();
            dr.DOC_NBR = applyTask.FormNumber;
            dr.ITEM = applyTask.Task.CurrentDocument.Fields["A01"].FieldValue;
            dr.ITEM_PRICE = int.Parse(applyTask.Task.CurrentDocument.Fields["A02"].FieldValue);
            dr.ITEM_QTY = int.Parse(applyTask.Task.CurrentDocument.Fields["A03"].FieldValue);
            dr.REMARK = applyTask.Task.CurrentDocument.Fields["A04"].FieldValue;
            dr.SIGN_STATIS = applyTask.SiteCode;

            DemoUCO uco = new DemoUCO();

            uco.InsertDDLStartFormData(dr);

            return "";
        }

        public void OnError(Exception errorException)
        {

        }
    }
}
