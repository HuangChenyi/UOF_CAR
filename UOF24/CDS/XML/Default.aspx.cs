using Ede.Uof.Utility.Page.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

public partial class CDS_XML_Default : Ede.Uof.Utility.Page.BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        
        //<FieldValue>
        //  <Item id='A01' value='V01' />
        //  <Item id='A02' value='V02' >InnerText</Item>
        //  <Item id='A03' value='V03' />
        //<FieldValue>

        XmlDocument xmlDoc = new XmlDocument();
        //<FieldValue/>
        XmlElement fieldValueElement = xmlDoc.CreateElement("FieldValue");

        //  <Item id='A01' value='V01' ></Iteem>        //
        XmlElement item01Element = xmlDoc.CreateElement("Item");
        item01Element.SetAttribute("id" , "A01");
        item01Element.SetAttribute("value", "V01");

        //  <Item id='A02' value='V02' >InnerText</Iteem>        //
        XmlElement item02Element = xmlDoc.CreateElement("Item");
        item02Element.SetAttribute("id", "A02");
        item02Element.SetAttribute("value", "V02");
        item02Element.InnerText = "InnerTextxxxxx";

        //  <Item id='A03' value='V03' ></Iteem>        //
        XmlElement item03Element = xmlDoc.CreateElement("Item");
        item03Element.SetAttribute("id", "A03");
        item03Element.SetAttribute("value", "V<0>3");

        fieldValueElement.AppendChild(item01Element);
        fieldValueElement.AppendChild(item02Element);
        fieldValueElement.AppendChild(item03Element);

        xmlDoc.AppendChild(fieldValueElement);

        txtXML.Text = xmlDoc.OuterXml;



    }
    protected void btnGetValue_Click(object sender, EventArgs e)
    {
        XmlDocument xmlDoc = new XmlDocument();
        xmlDoc.LoadXml(txtXML.Text);

        //<FieldValue>
        //  <Item id='A01' value='V01' />
        //  <Item id='A02' value='V02' >InnerText</Item>
        //  <Item id='A03' value='V03' />
        //<FieldValue>

        txtValue.Text = xmlDoc.SelectSingleNode(string.Format("./FieldValue/Item[@id='{0}']", txtID.Text)).Attributes["value"].Value;
    }
}