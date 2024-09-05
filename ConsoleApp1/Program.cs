using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace ConsoleApp1
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");
            string publicKey = "PFJTQUtleVZhbHVlPjxNb2R1bHVzPnlLVFpYTVhZa29MTStYVkpmU2YvWnNOZ0F1NVJ6STZPbXZiMkZ2UElCTmx1U0ZCdDN0U2hmaElpcWFCVFNTSzByRzBQRXhTc2JxZXhoZFVJUkh6TG5sK0lMN1ZCVWVRSDkvdVhBdk9kRCtlSC9BQlV3SXNqS0dWblZEcmIvUHJWVkMvV2dlSytzZ1J4VzJiMUFvanVNOExRRStYeGtoVE45NWZGY0wwMVlMVT08L01vZHVsdXM+PEV4cG9uZW50PkFRQUI8L0V4cG9uZW50PjwvUlNBS2V5VmFsdWU+";
            Auth.Authentication auth = new Auth.Authentication();
            auth.Url = "http://localhost/UOF_CAR"+"/PublicAPI/System/Authentication.asmx";

            string token = auth.GetToken(
                "ERP",
                RSAEncrypt(publicKey,"admin"),
                RSAEncrypt(publicKey,"123456"));

            Console.WriteLine(token);

            WKF.Wkf wkf = new WKF.Wkf();
            wkf.Url = "http://localhost/UOF_CAR/PublicAPI/WKF/Wkf.asmx";

            string result = "";
            // result = wkf.GetFormList(token);

            //   result=wkf.GetFormStructure(token, "6fd8fa9c-ecc2-41b3-8315-7c77d9e9e676");

            // Console.WriteLine(result);

            //抓取附件 先複製到C:\UOF_Temp\WKF_TempFile
            FileInfo fileInfo = new FileInfo("D:\\採購資訊.pdf");
            fileInfo.CopyTo("C:\\UOF_Temp\\WKF_TempFile\\" + fileInfo.Name, true);


            XElement formXE = new XElement("Form");
            formXE.Add(new XAttribute("formVersionId", 
                "6fd8fa9c-ecc2-41b3-8315-7c77d9e9e676"));
            formXE.Add(new XAttribute("urgentLevel", "2"));

            XElement applicantXE = new XElement("Applicant");
            applicantXE.Add(new XAttribute("account", "Tony"));
            applicantXE.Add(new XAttribute("groupId", ""));
            applicantXE.Add(new XAttribute("jobTitleId", ""));

            XElement attachXE= new XElement("Attach");
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
                                                             , new XAttribute("fieldValue","A001"));


            XElement typeXE = new XElement("FieldItem",
                new XAttribute("fieldId", "type"),
                new XAttribute("fieldValue","A"));

            XElement itemXE = new XElement("FieldItem",
                              new XAttribute("fieldId", "item"),
                new XAttribute("fieldValue", "A"));

            XElement amountXE = new XElement("FieldItem",
                              new XAttribute("fieldId", "amount"),
                new XAttribute("fieldValue", "100"));

            formXE.Add(applicantXE, formFieldValueXE);
            applicantXE.Add(commentXE);

            formFieldValueXE.Add(noXE, typeXE, itemXE, amountXE);

            //  Console.WriteLine(formXE.ToString());
            result = wkf.SendForm(token, formXE.ToString());
            Console.WriteLine(formXE.ToString());
            Console.WriteLine(result);

            //            <Form urgentLevel="2" formVersionId="6fd8fa9c-ecc2-41b3-8315-7c77d9e9e676">
            //  <FormFieldValue>
            //            <Applicant account="Tony" groupId="" jobTitleId="">
            //  <Comment />

            //</Applicant>
            //    <FieldItem fieldId="NO" fieldType="autoNumber" fieldName="表單編號" IsNeedAutoNbr="True" />
            //    <FieldItem fieldId="type" fieldType="radioButton" fieldName="類別" />
            //    <FieldItem fieldId="item" fieldType="singleLineText" fieldName="品項" />
            //    <FieldItem fieldId="amount" fieldType="numberText" fieldName="金額" />
            //  </FormFieldValue>
            //</Form> 

        }

        /// <summary>
        /// RSA 加密
        /// </summary>
        /// <param name="privateKey"></param>
        /// <param name="crTexturlparam>
        /// <returns></returns>
        private static string RSAEncrypt(string publicKey, string crText)
        {

            RSACryptoServiceProvider rsa = new RSACryptoServiceProvider();

            byte[] base64PublicKey = Convert.FromBase64String(publicKey);
            rsa.FromXmlString(System.Text.Encoding.UTF8.GetString(base64PublicKey));


            byte[] ctTextArray = Encoding.UTF8.GetBytes(crText);


            byte[] decodeBs = rsa.Encrypt(ctTextArray, false);

            return Convert.ToBase64String(decodeBs);
        }
    }
}
