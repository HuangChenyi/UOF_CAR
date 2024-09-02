using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;
using Ede.Uof.EIP.Organization.Util;


namespace Training.PO
{
    public class ExeSite : Ede.Uof.WKF.CustomExternal.ICallExternalDllSites
    {
        public void Finally()
        {

        }

        public string GetExternalDllSites(string formInfo)
        {

           
//            - <ExternalFlowSite>
//  <ApplicantInfo taskId="69b17736-2a8d-4374-82c4-76fe43c97195" account="Tony" formId="b74ce04c-9eba-40de-86af-20fa7e54b209" formVersionId="99745df5-a2a0-46c0-8eb4-c93428413737" /> 
//- <FormFieldValue>
//  <FieldItem fieldId="NO" fieldValue="WKF141100007" realValue="" /> 
//- <FieldItem fieldId="A01" ConditionValue="<ReturnValue><A01>一般</A01><A02>500</A02></ReturnValue>" realValue="<ReturnValue><A01>&lt;UserSet&gt;&lt;Element type='user'&gt; &lt;userId&gt;admin&lt;/userId&gt;&lt;/Element&gt;&lt;/UserSet&gt; </A01><A02>&lt;UserSet&gt;&lt;Element type='user'&gt; &lt;userId&gt;c496e32b-0968-4de5-95fc-acf7e5a561c0&lt;/userId&gt;&lt;/Element&gt;&lt;/UserSet&gt; </A02></ReturnValue>">
//  <FieldValue type="一般" amount="500" purchase="<UserSet><Element type='user'> <userId>admin</userId></Element></UserSet>" keeper="<UserSet><Element type='user'> <userId>c496e32b-0968-4de5-95fc-acf7e5a561c0</userId></Element></UserSet>" applicant="c496e32b-0968-4de5-95fc-acf7e5a561c0" /> 
//  </FieldItem>
//  </FormFieldValue>
//- <SiteHistory>
//- <Site siteId="69b17736-2a8d-4374-82c4-76fe43c97195" siteType="0" order="0" signType="3">
//  <Signer account="Tony" comment="" signResult="0" signTime="2014/11/19 16:19" /> 
//  </Site>
//  <Site siteId="cf5f6555-964d-4642-8dcd-b57dabec059d" siteType="1" order="1" signType="0" /> 
//  </SiteHistory>
//  </ExternalFlowSite>

            XmlDocument formXmlDoc = new XmlDocument();
            formXmlDoc.LoadXml(formInfo);
            UserUCO userUCO= new UserUCO();
            string account = formXmlDoc.SelectSingleNode("/ExternalFlowSite/ApplicantInfo").Attributes["account"].Value;
            string userGuid = userUCO.GetGUID(account);

            EBUser ebUser = userUCO.GetEBUser(userGuid);

            string signer = "";

            if (ebUser.HasJobFunction("Superior"))
            {
                signer = "admin";
            }
            else
            {
                signer = "Tony";
            }



            XmlDocument xmlDoc = new XmlDocument();
            //<ReturnValue></ReturnValue>
            XmlElement returnValueElement = xmlDoc.CreateElement("ReturnValue");
            //<Flow></Flow>
            XmlElement flowElement = xmlDoc.CreateElement("Flow");
            //<Site></Site>
            XmlElement siteElement = xmlDoc.CreateElement("Site");
            //<Site order='' signType='' ></Site>
            siteElement.SetAttribute("order", "0");
            siteElement.SetAttribute("signType", "0");

            //<Signers></Signers>
            XmlElement signersElement = xmlDoc.CreateElement("Signers");
            //<Signer></Signer>
            XmlElement signerElement = xmlDoc.CreateElement("Signer");
            //<Signer account='' />
            signerElement.SetAttribute("account", signer);
            //<Signers>
            //  <Signer account='' />
            //</Signers>
            signersElement.AppendChild(signerElement);
            //<Site order='' signType='' >
            //  <Signers>
            //      <Signer account='' />
            //  </Signers>
            //</Site>
            siteElement.AppendChild(signersElement);

            flowElement.AppendChild(siteElement);



            //<ReturnValue>
            //  <Flow>
            //    <Site order="0" signType="0">
            //      <Signers>
            //        <Signer account ="Tony"/>
            //      </Signers>
            //    </Site>

            //  </Flow>
            //</ReturnValue>
            returnValueElement.AppendChild(flowElement);
            xmlDoc.AppendChild(returnValueElement);

            return xmlDoc.OuterXml;
        }

        public void OnError(Exception errorException)
        {

        }
    }
}
