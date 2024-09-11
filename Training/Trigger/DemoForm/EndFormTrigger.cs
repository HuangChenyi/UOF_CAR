using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;
using Ede.Uof.Utility.Log;
using Ede.Uof.WKF.Design;
using Ede.Uof.WKF.ExternalUtility;
using Training.Data;
using Training.PO;
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


            var gridField = (FieldDataGrid)applyTask.Task.CurrentDocument.Fields["AAA"];
            DemoDataSet ds = new DemoDataSet();
            foreach (var row in gridField.FieldDataGridValue.RowValueList)
            {
                DemoDataSet.TB_DEMO_DLL_FORMRow dr = ds.TB_DEMO_DLL_FORM.NewTB_DEMO_DLL_FORMRow();
       

                foreach(FieldDataGrid.GridCellValue cv in row.CellValueList)
                {
                    if(cv.fieldId=="A01")
                    {
                        dr.ITEM = cv.fieldValue;
                    }
                    else if (cv.fieldId == "A02")
                    {
                        dr.ITEM_PRICE = int.Parse(cv.fieldValue);
                    }
                    else if (cv.fieldId == "A03")
                    {
                        dr.ITEM_QTY = int.Parse(cv.fieldValue);
                    }
                    else if (cv.fieldId == "A04")
                    {
                        dr.REMARK = cv.fieldValue;
                    }
                }

            }

            uco.UpdateFormResult(docNbr, signStatus);

            if(applyTask.FormResult == Ede.Uof.WKF.Engine.ApplyResult.Adopt)
            {

                //<Form formVersionId="5f702733-2dae-46ec-9e81-023c02f8208b">
                //      <FormFieldValue>
                //        <FieldItem fieldId="NO" fieldValue="" realValue="" enableSearch="True" />
                //        <FieldItem fieldId="RefForm" ConditionValue="" realValue="" fillerName="Tony" fillerUserGuid="c496e32b-0968-4de5-95fc-acf7e5a561c0" fillerAccount="Tony" fillSiteId="">
                //          <FormChooseInfo taskGuid="14ae17c9-114e-4933-ae95-5f6eb33974c5" />
                //        </FieldItem>
                //        <FieldItem fieldId="type" fieldValue="" realValue="" enableSearch="True" customValue="@null" />
                //        <FieldItem fieldId="item" fieldValue="AA" realValue="" enableSearch="True" fillerName="Tony" fillerUserGuid="c496e32b-0968-4de5-95fc-acf7e5a561c0" fillerAccount="Tony" fillSiteId="" />
                //        <FieldItem fieldId="amount" fieldValue="123" realValue="" enableSearch="True" fillerName="Tony" fillerUserGuid="c496e32b-0968-4de5-95fc-acf7e5a561c0" fillerAccount="Tony" fillSiteId="" />
                //      </FormFieldValue>
                //    </Form>
                //抓取附件 先複製到C:\UOF_Temp\WKF_TempFile
                FileInfo fileInfo = new FileInfo("D:\\採購資訊.pdf");
                fileInfo.CopyTo(
                    ConfigurationManager.AppSettings["wkfFileTransferTemp"]
                    + fileInfo.Name, true);


                DemoPO po = new DemoPO();
                string formVersionId = po.GetUsingFormVersionId("LabForm");

                var applicantInfo = applyTask.Task.Applicant;
                var fields= applyTask.Task.CurrentDocument.Fields;

                XElement formXE = new XElement("Form");
                formXE.Add(new XAttribute("formVersionId",
                    formVersionId));
                formXE.Add(new XAttribute("urgentLevel", "2"));

                XElement applicantXE = new XElement("Applicant");
                applicantXE.Add(new XAttribute("account", applicantInfo.Account));
                applicantXE.Add(new XAttribute("groupId", ""));
                applicantXE.Add(new XAttribute("jobTitleId", ""));

                XElement attachXE = new XElement("Attach");
                attachXE.Add(new XAttribute("IsNeedTransfer", "true"));
                attachXE.Add(new XAttribute("IsDeleteTemp", "true"));

                XElement attachItemXE = new XElement("AttachItem");
                attachItemXE.Add(new XAttribute("filePath", "採購資訊.pdf"));
                attachXE.Add(attachItemXE);
                applicantXE.Add(attachXE);
                //          <Attach IsNeedTransfer="true" IsDeleteTemp="false">
                //  <AttachItem filePath="採購資訊.pdf" />
                //</Attach>
                XElement commentXE = new XElement("Comment", "");

                XElement formFieldValueXE = new XElement("FormFieldValue");

                XElement noXE = new XElement("FieldItem", new XAttribute("fieldId", "NO"),
                                   new XAttribute("fieldType", "autoNumber"),
                                                  new XAttribute("fieldName", "表單編號"),
                                                                 new XAttribute("IsNeedAutoNbr", "True")
                                                                 , new XAttribute("fieldValue", "A001"));


                XElement typeXE = new XElement("FieldItem",
                    new XAttribute("fieldId", "type"),
                    new XAttribute("fieldValue", ""));

                XElement itemXE = new XElement("FieldItem",
                                  new XAttribute("fieldId", "item"),
                    new XAttribute("fieldValue", fields["A01"].FieldValue));

                XElement amountXE = new XElement("FieldItem",
                                  new XAttribute("fieldId", "amount"),
                    new XAttribute("fieldValue", fields["A02"].FieldValue));

                //        <FieldItem fieldId="RefForm" ConditionValue="" realValue="" fillerName="Tony" fillerUserGuid="c496e32b-0968-4de5-95fc-acf7e5a561c0" fillerAccount="Tony" fillSiteId="">
                //          <FormChooseInfo taskGuid="14ae17c9-114e-4933-ae95-5f6eb33974c5" />
                //        </FieldItem>
                XElement refFormXE = new XElement("FieldItem",
                new XAttribute("fieldId", "RefForm"),
                new XAttribute("ConditionValue", ""),
                new XAttribute("realValue", ""));
             
                XElement FormChooseInfoXE = new XElement("FormChooseInfo",
                    new XAttribute("taskGuid", applyTask.TaskId));
                refFormXE.Add(FormChooseInfoXE);

                formXE.Add(applicantXE, formFieldValueXE);
                applicantXE.Add(commentXE);

                formFieldValueXE.Add(noXE, typeXE, itemXE, amountXE, refFormXE);

                Ede.Uof.WKF.Utility.TaskUtilityUCO taskUtilityUCO = new Ede.Uof.WKF.Utility.TaskUtilityUCO();
                string result = taskUtilityUCO.WebService_CreateTask(formXE.ToString());

                Logger.Write("CarFormInfo",
                    formXE.ToString());

                XElement xElement = XElement.Parse(result);

                if (xElement.Element("Status").Value == "1")
                {

                }
                else
                {
                    string error = xElement.Element("Exception")
                        .Element("Message").Value;

                    Ede.Uof.EIP.PrivateMessage.PrivateMessageUCO privateMessageUCO = new Ede.Uof.EIP.PrivateMessage.PrivateMessageUCO();
                    privateMessageUCO.SendOneNewMessage("admin", "排程外部起單失敗", error, "admin");
                    throw new Exception(error);
                }

            }


            return "";
        }

        public void OnError(Exception errorException)
        {
            //  throw new NotImplementedException();
        }
    }
}
