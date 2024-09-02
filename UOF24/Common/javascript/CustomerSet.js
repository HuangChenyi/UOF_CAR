function CustomerSetObject(xmlText)
{

    this.xmlDoc = new ActiveXObject("microsoft.xmldom");
    if (this.xmlText == "" || this.xmlText == undefined || this.xmlText == null)
    {
        this.xmlDoc.loadXML("<CustomerSet></CustomerSet>");
    }
    else
    {
        this.xmlDoc.loadXML(xmlText);
    }

    this.RootNode = this.xmlDoc.selectSingleNode("/CustomerSet");
    this.GetLength = CustomerSetGetItemLength;
    this.GetXml = CustomerSetGetXmlString;

    this.AddContactNode = CustomerSetAddContactNode;
    this.RemoveContactNode = CustomerSetRemoveContactNode;
    this.ContainsContactNode = CustomerSetContainsContactNode;

    this.AddAreaNode = CustomerSetAddAreaNode;
    this.RemoveAreaNode = CustomerSetRemoveAreaNode;
    this.ContainsAreaNode = CustomerSetContainsAreaNode;

    this.AddClassNode = CustomerSetAddClassNode;
    this.RemoveClassNode = CustomerSetRemoveClassNode;
    this.ContainsClassNode = CustomerSetContainsClassNode;

    this.AddIndustryNode = CustomerSetAddIndustryNode;
    this.RemoveIndustryNode = CustomerSetRemoveIndustryNode;
    this.ContainsIndustryNode = CustomerSetContainsIndustryNode;
}

function CustomerSetGetItemLength()
{
    return this.xmlDoc.selectSingleNode("/CustomerSet").childNodes.length;
}

function CustomerSetGetXmlString()
{
    return this.xmlDoc.xml;
}

function CustomerSetAddContactNode(contactId)
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

function CustomerSetRemoveContactNode(contactId)
{
    var node = this.xmlDoc.selectSingleNode('//Element[@type = "contact" && contactId = "' + contactId + '"]');
    if (node != null)
    {
        node.parentNode.removeChild(node);
    }
}

function CustomerSetContainsContactNode(contactId)
{
    var node = this.xmlDoc.selectSingleNode('//Element[@type = "contact" && contactId = "' + contactId + '"]');
    return node == null ? false : true;
}

function CustomerSetAddAreaNode(areaId, isDepth)
{
    var element = this.xmlDoc.createElement("Element");
    var attr = this.xmlDoc.createAttribute("type");
    attr.value = "area";
    element.setAttributeNode(attr);
    var isDepthAttr = this.xmlDoc.createAttribute("isDepth");
    isDepthAttr.value = isDepth == true ? "True" : "False";
    element.setAttributeNode(isDepthAttr);
    var newIdElement = this.xmlDoc.createElement("areaId");
    var newIdText = this.xmlDoc.createTextNode(areaId);

    newIdElement.appendChild(newIdText);
    element.appendChild(newIdElement);
    this.RootNode.appendChild(element);

}

function CustomerSetRemoveAreaNode(areaId, isDepth)
{
    isDepth = (isDepth == true) ? "True" : "False";
    var node = this.xmlDoc.selectSingleNode('//Element[@type = "area" && @isDepth="' + isDepth + '" && areaId = "' + areaId + '"]');
    if (node != null)
    {
        node.parentNode.removeChild(node);
    }
}

function CustomerSetContainsAreaNode(areaId, isDepth)
{
    isDepth = (isDepth == true) ? "True" : "False";
    var node = this.xmlDoc.selectSingleNode('//Element[@type = "area" && @isDepth="' + isDepth + '"&& areaId = "' + areaId + '"]');
    return node == null ? false : true;
}

function CustomerSetAddClassNode(classId)
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

function CustomerSetRemoveClassNode(classId)
{
    var node = this.xmlDoc.selectSingleNode('//Element[@type = "class" && classId = "' + classId + '"]');
    if (node != null)
    {
        node.parentNode.removeChild(node);
    }
}

function CustomerSetContainsClassNode(classId)
{
    var node = this.xmlDoc.selectSingleNode('//Element[@type = "class" && classId = "' + classId + '"]');
    return node == null ? false : true;
}

function CustomerSetAddIndustryNode(industryId)
{
    var element = this.xmlDoc.createElement("Element");
    var attr = this.xmlDoc.createAttribute("type");
    attr.value = "industry";
    element.setAttributeNode(attr);
    var newIdElement = this.xmlDoc.createElement("industryId");
    var newIdText = this.xmlDoc.createTextNode(industryId);

    newIdElement.appendChild(newIdText);
    element.appendChild(newIdElement);
    this.RootNode.appendChild(element);

}

function CustomerSetRemoveIndustryNode(industryId)
{
    var node = this.xmlDoc.selectSingleNode('//Element[@type = "industry" && industryId = "' + industryId + '"]');
    if (node != null)
    {
        node.parentNode.removeChild(node);
    }
}

function CustomerSetContainsIndustryNode(industryId)
{
    var node = this.xmlDoc.selectSingleNode('//Element[@type = "industry" && industryId = "' + industryId + '"]');
    return node == null ? false : true;
}
