using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace Training
{
    public class CarAutoNbr : Ede.Uof.WKF.ExternalUtility.IFormAutoNumber
    {
        public void Finally()
        {
         //   throw new NotImplementedException();
        }

        public string GetFormNumber(string formId, string userGroupId, string formValueXML)
        {
            // throw new NotImplementedException();
            //<Form formVersionId="6fd8fa9c-ecc2-41b3-8315-7c77d9e9e676">
            //  <FormFieldValue>
            //    <FieldItem fieldId="NO" fieldValue="" realValue="" enableSearch="True" />
            //    <FieldItem fieldId="type" fieldValue="A" realValue="" enableSearch="True" customValue="@null" fillerName="Tony" fillerUserGuid="c496e32b-0968-4de5-95fc-acf7e5a561c0" fillerAccount="Tony" fillSiteId="" />
            //    <FieldItem fieldId="item" fieldValue="AAA" realValue="" enableSearch="True" fillerName="Tony" fillerUserGuid="c496e32b-0968-4de5-95fc-acf7e5a561c0" fillerAccount="Tony" fillSiteId="" />
            //    <FieldItem fieldId="amount" fieldValue="1234" realValue="" enableSearch="True" fillerName="Tony" fillerUserGuid="c496e32b-0968-4de5-95fc-acf7e5a561c0" fillerAccount="Tony" fillSiteId="" />
            //  </FormFieldValue>
            //</Form>

            XElement xe = XElement.Parse(formValueXML);
            //   string type = xe.Elements("FieldItem").Where(x => x.Attribute("fieldId").Value == "type").Select(x => x.Attribute("fieldValue").Value).FirstOrDefault();
            string type = xe.Element("FormFieldValue").Elements("FieldItem").
                Where(x => x.Attribute("fieldId").Value == "type").Select(x => x.Attribute("fieldValue").Value).FirstOrDefault();
            return type+ DateTime.Now.ToString("yyyyMMddHHmmss");
        }

        public void OnError()
        {
           // throw new NotImplementedException();
        }

        public void OnExecption(Exception errorException)
        {
           // throw new NotImplementedException();
        }
    }
}
