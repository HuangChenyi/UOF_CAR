using Ede.Uof.Utility.Task;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Xml.Linq;

namespace Training.Task
{
    public class CreateFormTask : BaseTask
    {
        public override void Run(params string[] args)
        {


            //抓取附件 先複製到C:\UOF_Temp\WKF_TempFile
            FileInfo fileInfo = new FileInfo("D:\\採購資訊.pdf");
            fileInfo.CopyTo("C:\\UOF_Temp\\WKF_TempFile\\" + fileInfo.Name, true);


            XElement formXE = new XElement("Form");
            formXE.Add(new XAttribute("formVersionId",
                "6fd8fa9c-ecc2-41b3-8315-7c77d9e9e676"));
            formXE.Add(new XAttribute("urgentLevel", "2"));

            XElement applicantXE = new XElement("Applicant");
            applicantXE.Add(new XAttribute("account", "tony"));
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
                new XAttribute("fieldValue", "A"));

            XElement itemXE = new XElement("FieldItem",
                              new XAttribute("fieldId", "item"),
                new XAttribute("fieldValue", "A"));

            XElement amountXE = new XElement("FieldItem",
                              new XAttribute("fieldId", "amount"),
                new XAttribute("fieldValue", "100"));

            formXE.Add(applicantXE, formFieldValueXE);
            applicantXE.Add(commentXE);

            formFieldValueXE.Add(noXE, typeXE, itemXE, amountXE);

            Ede.Uof.WKF.Utility.TaskUtilityUCO taskUtilityUCO = new Ede.Uof.WKF.Utility.TaskUtilityUCO();
            string result=taskUtilityUCO.WebService_CreateTask(formXE.ToString());
        
            XElement xElement = XElement.Parse(result);

            if(xElement.Element("Status").Value=="1")
            {

            }
            else
            {
                string error = xElement.Element("Exception")
                    .Element("Message").Value;

                Ede.Uof.EIP.PrivateMessage.PrivateMessageUCO privateMessageUCO = new Ede.Uof.EIP.PrivateMessage.PrivateMessageUCO();   
                privateMessageUCO.SendOneNewMessage("admin", "排程外部起單失敗", error, "admin");  

            }
        
        }
    }
}
