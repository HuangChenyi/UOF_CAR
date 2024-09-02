<%@ WebService Language="C#" Class="WebService" %>

using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Data;
using System.Xml;

[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// 若要允許使用 ASP.NET AJAX 從指令碼呼叫此 Web 服務，請取消註解下列一行。
// [System.Web.Script.Services.ScriptService]
public class WebService  : System.Web.Services.WebService {

    [WebMethod]
    public string GetFieldValue(string formInfo)
    {

        //- <Form VersionId="a642e5cc-1cdc-448d-9d2a-4d77bdbc472d" Name="WS範例">
        //- <FormItem>
        //  <Item fieldId="NO" fieldValue="" realValue="" fieldText="" /> 
        //  <Item fieldId="A01" fieldValue="5" realValue="" fieldText="5" /> 
        //  <Item fieldId="A02" fieldValue="6" realValue="" fieldText="6" /> 
        //  <Item fieldId="A03" fieldValue="" realValue="" fieldText="" /> 
        //  <Item fieldId="A04" fieldValue="" realValue="" fieldText="" /> 
        //  </FormItem>
        //- <SystemItem>
        //  <Item fieldId="scriptId" fieldValue="397f97ea-72a5-4293-8057-65d2a91eb126" /> 
        //  <Item fieldId="user_id" fieldValue="c496e32b-0968-4de5-95fc-acf7e5a561c0" /> 
        //  <Item fieldId="user_account" fieldValue="Tony" /> 
        //  <Item fieldId="user_name" fieldValue="研發部 Tony" /> 
        //  <Item fieldId="user_email" fieldValue="" /> 
        //  <Item fieldId="user_group" fieldValue="d8406752-c83a-e4d9-127e-6b1d31a8f0c1" /> 
        //  <Item fieldId="user_dept1" fieldValue="研發部|員工" /> 
        //  <Item fieldId="user_dept2" fieldValue="無|無" /> 
        //  <Item fieldId="user_dept3" fieldValue="無|無" /> 
        //  <Item fieldId="user_dept4" fieldValue="無|無" /> 
        //  <ApplicantInfo ApplicantUserId="c496e32b-0968-4de5-95fc-acf7e5a561c0" ApplicantGroupId="d8406752-c83a-e4d9-127e-6b1d31a8f0c1" /> 
        //  </SystemItem>
        //  </Form>

        formInfo = HttpUtility.UrlDecode(formInfo);

        XmlDocument xmlDoc = new XmlDocument();
        xmlDoc.LoadXml(formInfo);

        int price = int.Parse(xmlDoc.SelectSingleNode("/Form/FormItem/Item[@fieldId='A01']").Attributes["fieldValue"].Value);
        int qty = int.Parse(xmlDoc.SelectSingleNode("/Form/FormItem/Item[@fieldId='A02']").Attributes["fieldValue"].Value);

        int total = price * qty;

        XmlDocument returnXmlDoc = new XmlDocument();

        //<Form returnStatus="regular|fault">
        XmlElement formElement = returnXmlDoc.CreateElement("Form");
        XmlAttribute returnStatusAtt = returnXmlDoc.CreateAttribute("returnStatus");
        returnStatusAtt.Value = "regular";
        formElement.Attributes.Append(returnStatusAtt);

        //<item fieldText="成功回傳的資料" fieldValue="成功回傳的資料" />
        XmlElement itemElement = returnXmlDoc.CreateElement("item");
        XmlAttribute fieldTextAtt = returnXmlDoc.CreateAttribute("fieldText");
        XmlAttribute fieldValueAtt = returnXmlDoc.CreateAttribute("fieldValue");
        itemElement.Attributes.Append(fieldTextAtt);
        itemElement.Attributes.Append(fieldValueAtt);

        fieldTextAtt.Value = total.ToString();
        fieldValueAtt.Value = total.ToString();

        XmlElement msgElement = returnXmlDoc.CreateElement("msg");
        msgElement.InnerText = "Test Exception";
        formElement.AppendChild(itemElement);
        formElement.AppendChild(msgElement);

        return formElement.OuterXml;

        //<Form returnStatus="regular">
        //    <!--除了下拉式選單外，其餘欄位只回傳一筆item即可-->
        //    <item fieldText="30" fieldValue="30" />
        //    <msg>錯誤回傳字串</msg>
        //</Form>
    }



    [WebMethod]
    public string GetFieldValueByDDL(string formInfo)
    {

        XmlDocument returnXmlDoc = new XmlDocument();

        //<Form returnStatus="regular|fault">
        XmlElement formElement = returnXmlDoc.CreateElement("Form");
        XmlAttribute returnStatusAtt = returnXmlDoc.CreateAttribute("returnStatus");
        returnStatusAtt.Value = "regular";
        formElement.Attributes.Append(returnStatusAtt);

        //<item fieldText="成功回傳的資料" fieldValue="成功回傳的資料" />
        XmlElement itemElement = returnXmlDoc.CreateElement("item");
        XmlAttribute fieldTextAtt = returnXmlDoc.CreateAttribute("fieldText");
        XmlAttribute fieldValueAtt = returnXmlDoc.CreateAttribute("fieldValue");
        itemElement.Attributes.Append(fieldTextAtt);
        itemElement.Attributes.Append(fieldValueAtt);

        XmlElement msgElement = returnXmlDoc.CreateElement("msg");


        XmlNode node1 = itemElement.Clone();
        node1.Attributes["fieldText"].Value = "高雄廠";
        node1.Attributes["fieldValue"].Value = "高雄廠";

        XmlNode node2 = itemElement.Clone();
        node2.Attributes["fieldText"].Value = "新竹廠";
        node2.Attributes["fieldValue"].Value = "新竹廠";

        XmlNode node3 = itemElement.Clone();
        node3.Attributes["fieldText"].Value = "台中廠";
        node3.Attributes["fieldValue"].Value = "台中廠";

        XmlNode node4 = itemElement.Clone();
        node4.Attributes["fieldText"].Value = "越南廠";
        node4.Attributes["fieldValue"].Value = "越南廠";

        formElement.AppendChild(node1);
        formElement.AppendChild(node2);
        formElement.AppendChild(node3);
        formElement.AppendChild(node4);
        formElement.AppendChild(msgElement);

        //Training.UCO.DemoUCO uco = new Training.UCO.DemoUCO();
        //System.Data.DataTable dt = uco.GetUserData();

        //foreach (DataRow dr in dt.Rows)
        //{
        //    XmlNode node1 = itemElement.Clone();
        //    node1.Attributes["fieldText"].Value = dr["NAME"].ToString();
        //    node1.Attributes["fieldValue"].Value = dr["NAME"].ToString();

        //    formElement.AppendChild(node1);
        //}

        formElement.AppendChild(msgElement);

        return formElement.OuterXml;

        //<Form returnStatus="regular|fault">
        //    <!--除了下拉式選單外，其餘欄位只回傳一筆item即可-->
        //    <item fieldText="品項一" fieldValue="品項一" />
        //    <item fieldText="品項二" fieldValue="品項二" />
        //    <item fieldText="品項三" fieldValue="品項三" />
        //    <msg>錯誤回傳字串</msg>
        //</Form>
    }


    [WebMethod]
    public string CheckedForm(string formInfo)
    {

        // - <Form formVersionId="684034be-3cf5-4d47-9710-2ae8a090875c">
        //- <FormFieldValue>
        //  <FieldItem fieldId="NO" fieldValue="" realValue="" /> 
        //  <FieldItem fieldId="A01" fieldValue="1" realValue="" fillerName="湯尼" fillerUserGuid="cb7b9862-6591-4b28-a6e6-c54d57eb00c7" fillerAccount="Tony" fillSiteId="" /> 
        //  <FieldItem fieldId="A02" fieldValue="1" realValue="" fillerName="湯尼" fillerUserGuid="cb7b9862-6591-4b28-a6e6-c54d57eb00c7" fillerAccount="Tony" fillSiteId="" /> 
        //  <FieldItem fieldId="A03" fieldValue="1" realValue="" fillerName="湯尼" fillerUserGuid="cb7b9862-6591-4b28-a6e6-c54d57eb00c7" fillerAccount="Tony" fillSiteId="" /> 
        //  <FieldItem fieldId="A04" fieldValue="" realValue="" /> 
        //  </FormFieldValue>
        //  </Form>
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

            int price = int.Parse(xmlDoc.SelectSingleNode("/Form/FormFieldValue/FieldItem[@fieldId='A01']").Attributes["fieldValue"].Value);

            if (price > 50)
            {
                returnValueElement.SelectSingleNode("/ReturnValue/Status").InnerText = "0";
                returnValueElement.SelectSingleNode("/ReturnValue/Exception/Message").InnerText = "單價不可大於50";
            }
            else
            {
                returnValueElement.SelectSingleNode("/ReturnValue/Status").InnerText = "1";

            }

        }
        catch (Exception ce)
        {
            returnValueElement.SelectSingleNode("/ReturnValue/Status").InnerText = "0";
            returnValueElement.SelectSingleNode("/ReturnValue/Exception/Message").InnerText = ce.Message;
        }

        return returnValueElement.OuterXml;
    }

    
      [WebMethod]
    public string FormSignEvent(string formInfo)
    {
        formInfo = HttpUtility.UrlDecode(formInfo);

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

            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.LoadXml(formInfo);

            Ede.Uof.EIP.PrivateMessage.PrivateMessageUCO msgUco = new Ede.Uof.EIP.PrivateMessage.PrivateMessageUCO();

            Ede.Uof.EIP.Organization.Util.UserUCO userUco = new Ede.Uof.EIP.Organization.Util.UserUCO();
            string recevierGuid = userUco.GetGUID("Mary");
            string senderGuid = "admin";
            string topic = "採購處理通知:";
            string formNbr = xmlDoc.SelectSingleNode("/FormResult/FormFieldValue/FieldItem[@fieldId='NO']").Attributes["fieldValue"].Value;
            string content = string.Format("您有一筆採購待採購，單號:{0}", formNbr);
            msgUco.SendOneNewMessage(senderGuid, topic, content, recevierGuid);
            returnValueElement.SelectSingleNode("/ReturnValue/Status").InnerText = "1";


        }
        catch (Exception ce)
        {
            returnValueElement.SelectSingleNode("/ReturnValue/Status").InnerText = "0";
            returnValueElement.SelectSingleNode("/ReturnValue/Exception/Message").InnerText = ce.Message;
        }

        return returnValueElement.OuterXml;
    }


    [WebMethod]
    public string EndFormEvent(string formInfo)
    {

        formInfo = HttpUtility.UrlDecode(formInfo);

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
            Training.UCO.DemoUCO uco = new Training.UCO.DemoUCO();

            DataTable dt = new DataTable();
            dt.Columns.Add("ID");
            dt.Columns.Add("DOC_NBR");
            dt.Columns.Add("ITEM_PRICE");
            dt.Columns.Add("ITEM_QTY");
            dt.Columns.Add("ITEM");
            dt.Columns.Add("FORM_RESULT");

            DataRow dr = dt.NewRow();

            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.LoadXml(formInfo);

            dr["ID"] = Guid.NewGuid().ToString();
            dr["DOC_NBR"] = xmlDoc.SelectSingleNode("/FormResult/FormFieldValue/FieldItem[@fieldId='NO']").Attributes["fieldValue"].Value;
            dr["ITEM_PRICE"] = int.Parse(xmlDoc.SelectSingleNode("/FormResult/FormFieldValue/FieldItem[@fieldId='A01']").Attributes["fieldValue"].Value);
            dr["ITEM_QTY"] = int.Parse(xmlDoc.SelectSingleNode("/FormResult/FormFieldValue/FieldItem[@fieldId='A02']").Attributes["fieldValue"].Value);
            dr["ITEM"] = xmlDoc.SelectSingleNode("/FormResult/FormFieldValue/FieldItem[@fieldId='A04']").Attributes["fieldValue"].Value;
            dr["FORM_RESULT"] = xmlDoc.SelectSingleNode("/FormResult/Applicant/Result").InnerText;

            uco.InsertWsEndFormData(dr);

            returnValueElement.SelectSingleNode("/ReturnValue/Status").InnerText = "1";


        }
        catch (Exception ce)
        {
            returnValueElement.SelectSingleNode("/ReturnValue/Status").InnerText = "0";
            returnValueElement.SelectSingleNode("/ReturnValue/Exception/Message").InnerText = ce.Message;
        }

        return returnValueElement.OuterXml;
    }
}
    
