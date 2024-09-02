function AddressBookSetObject(xmlText)
{

    this.xmlDoc = new ActiveXObject("microsoft.xmldom");
    if (this.xmlText == "" || this.xmlText == undefined || this.xmlText == null)
    {
        this.xmlDoc.loadXML("<UserSet></UserSet>");
    }
    else
    {
        this.xmlDoc.loadXML(xmlText);
    }

    this.RootNode = this.xmlDoc.selectSingleNode("/UserSet");
    this.GetLength = AddressBookSetGetItemLength;
    this.GetXml = AddressBookSetGetXmlString;

    this.AddContactNode = AddressBookSetAddContactNode;
    this.RemoveContactNode = AddressBookSetRemoveContactNode;
    this.ContainsContactNode = AddressBookSetContainsContactNode;

    this.AddClassNode = AddressBookSetAddClassNode;
    this.RemoveClassNode = AddressBookSetRemoveClassNode;
    this.ContainsClassNode = AddressBookSetContainsClassNode;

}

function AddressBookSetGetItemLength()
{
    return this.xmlDoc.selectSingleNode("/UserSet").childNodes.length;
}

function AddressBookSetGetXmlString()
{
    return this.xmlDoc.xml;
}

function AddressBookSetAddContactNode(contactId)
{
    var element = this.xmlDoc.createElement("Element");
    var attr = this.xmlDoc.createAttribute("type");
    attr.value = "contact";
    element.setAttributeNode(attr);
    var newIdElement = this.xmlDoc.createElement("contactId");
    var newIdText = this.xmlDoc.createTextNode(contactId);

    newIdElement.appendChild(newIdText);
    element.appendChild(newIdElement);
    this.RootNode.appendChild(element);

}

function AddressBookSetRemoveContactNode(contactId)
{
    var node = this.xmlDoc.selectSingleNode('//Element[@type = "contact" && contactId = "' + contactId + '"]');
    if (node != null)
    {
        node.parentNode.removeChild(node);
    }
}

function AddressBookSetContainsContactNode(contactId)
{
    var node = this.xmlDoc.selectSingleNode('//Element[@type = "contact" && contactId = "' + contactId + '"]');
    return node == null ? false : true;
}

function AddressBookSetAddClassNode(classId)
{
    var element = this.xmlDoc.createElement("Element");
    var attr = this.xmlDoc.createAttribute("type");
    attr.value = "class";
    element.setAttributeNode(attr);
    var newIdElement = this.xmlDoc.createElement("classId");
    var newIdText = this.xmlDoc.createTextNode(classId);

    newIdElement.appendChild(newIdText);
    element.appendChild(newIdElement);
    this.RootNode.appendChild(element);

}

function AddressBookSetRemoveClassNode(classId)
{
    var node = this.xmlDoc.selectSingleNode('//Element[@type = "class" && classId = "' + classId + '"]');
    if (node != null)
    {
        node.parentNode.removeChild(node);
    }
}

function AddressBookSetContainsClassNode(classId)
{
    var node = this.xmlDoc.selectSingleNode('//Element[@type = "class" && classId = "' + classId + '"]');
    return node == null ? false : true;
}
