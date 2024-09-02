<%@ WebService Language="C#" Class="WebService" %>

using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Xml;

[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// 若要允許使用 ASP.NET AJAX 從指令碼呼叫此 Web 服務，請取消註解下列一行。
// [System.Web.Script.Services.ScriptService]
public class WebService  : System.Web.Services.WebService {

    [WebMethod]
    public string CheckedForm(string formInfo)
    {

        //<Form formVersionId="6fd8fa9c-ecc2-41b3-8315-7c77d9e9e676">
        //  <FormFieldValue>
        //    <FieldItem fieldId="NO" fieldValue="" realValue="" enableSearch="True" />
        //    <FieldItem fieldId="type" fieldValue="A" realValue="" enableSearch="True" customValue="@null" fillerName="Tony" fillerUserGuid="c496e32b-0968-4de5-95fc-acf7e5a561c0" fillerAccount="Tony" fillSiteId="" />
        //    <FieldItem fieldId="item" fieldValue="aaa" realValue="" enableSearch="True" fillerName="Tony" fillerUserGuid="c496e32b-0968-4de5-95fc-acf7e5a561c0" fillerAccount="Tony" fillSiteId="" />
        //    <FieldItem fieldId="amount" fieldValue="1000" realValue="" enableSearch="True" fillerName="Tony" fillerUserGuid="c496e32b-0968-4de5-95fc-acf7e5a561c0" fillerAccount="Tony" fillSiteId="" />
        //  </FormFieldValue>
        //</Form>
        formInfo = HttpUtility.UrlDecode(formInfo);

        XmlDocument xmlDoc = new XmlDocument();
        xmlDoc.LoadXml(formInfo);

        XmlDocument returnXmlDoc = new XmlDocument();
        XmlElement returnValueElement = returnXmlDoc.CreateElement("ReturnValue");
        XmlElement statusElement = returnXmlDoc.CreateElement("Status");
        XmlElement exceptionElement = returnXmlDoc.CreateElement("Exception");
        XmlElement messageElement = returnXmlDoc.CreateElement("Message");

        returnValueElement.AppendChild(statusElement);
        exceptionElement.AppendChild(messageElement);
        returnValueElement.AppendChild(exceptionElement);
        returnXmlDoc.AppendChild(returnValueElement);

        try
        {

            //自行解析XML取得類別(type)和金額欄位(amount),
            //EX:
            //int amount = int.Parse(
            //    xmlDoc.SelectSingleNode
            //    ("/Form/FormFieldValue/FieldItem[@fieldId='amount']")
            //    .Attributes["fieldValue"].Value);
            //
            //如果驗證失敗，Status要給0，在Message內放驗證失敗的原因 
            //EX:
            //returnValueElement.SelectSingleNode("/ReturnValue/Status").InnerText = "0";
            //returnValueElement.SelectSingleNode("/ReturnValue/Exception/Message").InnerText = "驗證失敗的原因";
            //如果驗證成功，Status給1就好
            //EX:
            //returnValueElement.SelectSingleNode("/ReturnValue/Status").InnerText = "1";
         

        }
        catch (Exception ce)
        {
            returnValueElement.SelectSingleNode("/ReturnValue/Status").InnerText = "0";
            returnValueElement.SelectSingleNode("/ReturnValue/Exception/Message").InnerText = ce.Message;
        }

        return returnValueElement.OuterXml;
    }


}