using Ede.Uof.WKF.ExternalUtility;
using Lab.Lib.Data;
using Lab.Lib.UCO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;

namespace Lab.Lib.Tigger.LabForm
{
    public class EndFormTrigger :
        Ede.Uof.WKF.ExternalUtility.ICallbackTriggerPlugin
    {
        public void Finally()
        {
            // throw new NotImplementedException();
        }

        public string GetFormResult(ApplyTask applyTask)
        {
            //表單預計的XML結構
            //<Form formVersionId="6fd8fa9c-ecc2-41b3-8315-7c77d9e9e676">
            //  <FormFieldValue>
            //    <FieldItem fieldId="NO" fieldValue="" realValue="" enableSearch="True" />
            //    <FieldItem fieldId="type" fieldValue="C" realValue="" enableSearch="True" customValue="@null" fillerName="Tony" fillerUserGuid="c496e32b-0968-4de5-95fc-acf7e5a561c0" fillerAccount="Tony" fillSiteId="" />
            //    <FieldItem fieldId="item" fieldValue="AA" realValue="" enableSearch="True" fillerName="Tony" fillerUserGuid="c496e32b-0968-4de5-95fc-acf7e5a561c0" fillerAccount="Tony" fillSiteId="" />
            //    <FieldItem fieldId="amount" fieldValue="1234" realValue="" enableSearch="True" fillerName="Tony" fillerUserGuid="c496e32b-0968-4de5-95fc-acf7e5a561c0" fillerAccount="Tony" fillSiteId="" />
            //  </FormFieldValue>
            //</Form>

            var fields = applyTask.Task.CurrentDocument.Fields;

            LabFormDataSet ds = new LabFormDataSet();
            LabFormDataSet.TB_LAB_DLL_FORMRow dr = ds.TB_LAB_DLL_FORM.NewTB_LAB_DLL_FORMRow();

            //若要寫入的欄位是表單欄位的話可依下面參考方式寫入
            //若要寫入的欄位是表單資料的話，可依applyTask提供屬性寫入
            //dr.AMOUNT = Convert.ToDecimal(fields["amount"].FieldValue);
            //dr.CATEGORY_ID = ;
            //dr.ITEM_NAME = ;
            //dr.DOC_NBR = ;
            //dr.FORM_RESULT = ;
            //dr.TASK_ID = ;

            LabUCO uco = new LabUCO();
            uco.InsertLabFormData(dr);

          

            return "";
            // throw new NotImplementedException();
        }

        public void OnError(Exception errorException)
        {
            //   throw new NotImplementedException();
        }

        #region
        private void SendForm(ApplyTask applyTask)
        {
            //<Form formVersionId="a0762cba-777b-4473-b060-7fc22453b304">
            //  <FormFieldValue>
            //    <FieldItem fieldId="NO" fieldValue="" realValue="" enableSearch="True" />
            //    <FieldItem fieldId="A01" fieldValue="A" realValue="" enableSearch="True" fillerName="Tony" fillerUserGuid="c496e32b-0968-4de5-95fc-acf7e5a561c0" fillerAccount="Tony" fillSiteId="" />
            //    <FieldItem fieldId="A02" ConditionValue="" realValue="" fillerName="Tony" fillerUserGuid="c496e32b-0968-4de5-95fc-acf7e5a561c0" fillerAccount="Tony" fillSiteId="">
            //      <FormChooseInfo taskGuid="a3575a25-be21-4b84-a1df-693694a780e5" />
            //    </FieldItem>
            //    <FieldItem fieldId="A03" fieldValue="1" realValue="" enableSearch="True" fillerName="Tony" fillerUserGuid="c496e32b-0968-4de5-95fc-acf7e5a561c0" fillerAccount="Tony" fillSiteId="" />
            //  </FormFieldValue>
            //</Form>


            //申請者的帳號 USER_GUID 姓名  作為記錄填寫資訊用
            string account = applyTask.Task.Applicant.Account;
            string userGuid = applyTask.Task.Applicant.UserGUID;
            string userName = applyTask.Task.Applicant.UserName;
            //string account = "admin";
            //string userGuid = "admin";
            //string userName = "admin";

            //urgentLevel 緊急程度0:緊急 1:急 2:普通
            XmlDocument xmlDoc = new XmlDocument();
            XmlElement formElement = xmlDoc.CreateElement("Form");
            formElement.SetAttribute("formVersionId", "a0762cba-777b-4473-b060-7fc22453b304");
            formElement.SetAttribute("urgentLevel", "2");

            XmlElement applicantElement = xmlDoc.CreateElement("Applicant");

            //<!--account:申請者UOF帳號 groupId部門代號(可不填) jobTitleId:職稱代號(可不填)-->
            applicantElement.SetAttribute("account", account);
            applicantElement.SetAttribute("groupId", "");
            applicantElement.SetAttribute("jobTitleId", "");

            //申請者意見
            XmlElement commentElement = xmlDoc.CreateElement("Comment");
            commentElement.InnerText = "";

            applicantElement.AppendChild(commentElement);

            /*如果想要夾帶申請附件請取消註解此段
            XmlElement appachElement = xmlDoc.CreateElement("Attach");
            appachElement.SetAttribute("IsNeedTransfer", "true");
            appachElement.SetAttribute("IsDeleteTemp", "true");

            //如果多個附件請加入多個AttachItem
            XmlElement attachItemElement = xmlDoc.CreateElement("AttachItem");
            //放置檔案路徑(appSettings/wkfFileTransferTemp)
            attachItemElement.SetAttribute("filePath","");

            appachElement.AppendChild(attachItemElement);
            applicantElement.AppendChild(appachElement);
             */

            formElement.AppendChild(applicantElement);



            XmlElement formFieldValueElement = xmlDoc.CreateElement("FormFieldValue");
            formElement.AppendChild(formFieldValueElement);



            //表單編號節點
            //如果要用UOF系統的表單流水號
            //IsNeedAutoNbr 給 false，fieldValue 保持空白
            //如果要用外部系統的表單流水號
            //IsNeedAutoNbr 給 true，fieldValue 給對應的表單編號
            XmlElement Field_NOElement = xmlDoc.CreateElement("FieldItem");
            Field_NOElement.SetAttribute("fieldId", "NO");
            Field_NOElement.SetAttribute("fieldValue", "");
            Field_NOElement.SetAttribute("realValue", "");
            Field_NOElement.SetAttribute("IsNeedAutoNbr", "false");

            formFieldValueElement.AppendChild(Field_NOElement);

            //欄位名稱品項節點 
            //該欄位的欄位值若預期為空白，則fillerName、fillerUserGuid、fillerAccount屬性值保持空白
            //若有值保持原內容記錄填寫資訊
            XmlElement Field_A01Element = xmlDoc.CreateElement("FieldItem");
            Field_A01Element.SetAttribute("fieldId", "A01");
            Field_A01Element.SetAttribute("fieldValue", applyTask.Task.CurrentDocument.Fields["item"].FieldValue);
            Field_A01Element.SetAttribute("realValue", "");
            Field_A01Element.SetAttribute("fillerName", userName);
            Field_A01Element.SetAttribute("fillerUserGuid", userGuid);
            Field_A01Element.SetAttribute("fillerAccount", account);
            Field_A01Element.SetAttribute("fillSiteId", "");

            formFieldValueElement.AppendChild(Field_A01Element);


            //欄位名稱採購資訊節點  此為外掛欄位，
            //若外掛欄位有條件請放到ConditionValue
            //有配合組織站點請將UserSet指定到realValue
            //外掛欄位的值是放在InnerXml，不是fieldValue
            //該欄位的欄位值若預期為空白，則fillerName、fillerUserGuid、fillerAccount屬性值保持空白
            //若有值保持原內容記錄填寫資訊
            XmlElement Field_A02Element = xmlDoc.CreateElement("FieldItem");
            Field_A02Element.SetAttribute("fieldId", "A02");
            //      <FormChooseInfo taskGuid="a3575a25-be21-4b84-a1df-693694a780e5" />
            XmlElement FormChooseInfoElement = xmlDoc.CreateElement("FormChooseInfo");
            FormChooseInfoElement.SetAttribute("taskGuid", applyTask.TaskId);
            Field_A02Element.InnerXml = FormChooseInfoElement.OuterXml;
            Field_A02Element.SetAttribute("realValue", "");
            Field_A02Element.SetAttribute("ConditionValue", "");
            Field_A02Element.SetAttribute("fillerName", userName);
            Field_A02Element.SetAttribute("fillerUserGuid", userGuid);
            Field_A02Element.SetAttribute("fillerAccount", account);
            Field_A02Element.SetAttribute("fillSiteId", "");
            formFieldValueElement.AppendChild(Field_A02Element);

            //欄位名稱實際核可金額節點 ，此為數值欄位，注意fileValue對應的值也是數值格式的字串
            //該欄位的欄位值若預期為空白，則fillerName、fillerUserGuid、fillerAccount屬性值保持空白
            //若有值保持原內容記錄填寫資訊
            XmlElement Field_A03Element = xmlDoc.CreateElement("FieldItem");
            Field_A03Element.SetAttribute("fieldId", "A03");
            Field_A03Element.SetAttribute("fieldValue", "");
            Field_A03Element.SetAttribute("realValue", "");

            Field_A03Element.SetAttribute("fillSiteId", "");

            formFieldValueElement.AppendChild(Field_A03Element);


            XmlElement MessageContentElement = xmlDoc.CreateElement("MessageContent");
            XmlElement VersionFieldElement = xmlDoc.CreateElement("VersionField");
            MessageContentElement.AppendChild(VersionFieldElement);
            formElement.AppendChild(MessageContentElement);

            //欄位表單編號的郵件様板的值,請把該欄位的郵件様板的值塞入FieldValue的InnerXML
            XmlElement MsgFieldItem_NOElement = xmlDoc.CreateElement("FieldItem");
            XmlElement MsgFieldValue_NOElement = xmlDoc.CreateElement("FieldValue");
            MsgFieldItem_NOElement.SetAttribute("fieldId", "NO");
            MsgFieldItem_NOElement.SetAttribute("enableSearch", "true");
            MsgFieldValue_NOElement.InnerXml = "";
            VersionFieldElement.AppendChild(MsgFieldItem_NOElement);
            MsgFieldItem_NOElement.AppendChild(MsgFieldValue_NOElement);



            //欄位品項的郵件様板的值,請把該欄位的郵件様板的值塞入FieldValue的InnerXML
            XmlElement MsgFieldItem_A01Element = xmlDoc.CreateElement("FieldItem");
            XmlElement MsgFieldValue_A01Element = xmlDoc.CreateElement("FieldValue");
            MsgFieldItem_A01Element.SetAttribute("fieldId", "A01");
            MsgFieldItem_A01Element.SetAttribute("enableSearch", "true");
            MsgFieldValue_A01Element.InnerXml = "";
            VersionFieldElement.AppendChild(MsgFieldItem_A01Element);
            MsgFieldItem_A01Element.AppendChild(MsgFieldValue_A01Element);



            //欄位採購資訊的郵件様板的值,請把該欄位的郵件様板的值塞入FieldValue的InnerXML
            XmlElement MsgFieldItem_A02Element = xmlDoc.CreateElement("FieldItem");
            XmlElement MsgFieldValue_A02Element = xmlDoc.CreateElement("FieldValue");
            MsgFieldItem_A02Element.SetAttribute("fieldId", "A02");
            MsgFieldItem_A02Element.SetAttribute("enableSearch", "true");
            MsgFieldValue_A02Element.InnerXml = "";
            VersionFieldElement.AppendChild(MsgFieldItem_A02Element);
            MsgFieldItem_A02Element.AppendChild(MsgFieldValue_A02Element);



            //欄位實際核可金額的郵件様板的值,請把該欄位的郵件様板的值塞入FieldValue的InnerXML
            XmlElement MsgFieldItem_A03Element = xmlDoc.CreateElement("FieldItem");
            XmlElement MsgFieldValue_A03Element = xmlDoc.CreateElement("FieldValue");
            MsgFieldItem_A03Element.SetAttribute("fieldId", "A03");
            MsgFieldItem_A03Element.SetAttribute("enableSearch", "true");
            MsgFieldValue_A03Element.InnerXml = "";
            VersionFieldElement.AppendChild(MsgFieldItem_A03Element);
            MsgFieldItem_A03Element.AppendChild(MsgFieldValue_A03Element);

            Ede.Uof.WKF.Utility.TaskUtilityUCO uco = new Ede.Uof.WKF.Utility.TaskUtilityUCO();
            string result = uco.WebService_CreateTask(formElement.OuterXml);


            XmlDocument resultDoc = new XmlDocument();
            resultDoc.LoadXml(result);

            if (resultDoc.SelectSingleNode("./ReturnValue/Status").InnerText == "0")
            {
                string errorLog = resultDoc.SelectSingleNode("./ReturnValue/Exception/Message").InnerText;

                throw new Exception(errorLog);
            }

            //<ReturnValue>
            //  <Status>1</Status>
            //  <FormNumber>BUL211100002</FormNumber>
            //  <TaskId>796bb869-3967-42a6-adc1-b33c352c8745</TaskId>
            //</ReturnValue>

            //<ReturnValue>
            //  <Status>0</Status>
            //  <Exception>
            //    <Type>AccountJobTitleException</Type>
            //    <Message>起單失敗，申請者(admin)沒有設定職稱(級)!!</Message>
            //  </Exception>
            //</ReturnValue>

            // return formElement.OuterXml;

        }
        #endregion

       
    }


}
