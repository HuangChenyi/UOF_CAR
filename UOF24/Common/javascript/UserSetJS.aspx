<%@ Page Language="C#" %>
<script runat="server">

</script>

//
//  2006/9/12 更新
//

function UserSetObject(xmlText)
{    
    
    this.xmlDoc = new ActiveXObject("microsoft.xmldom");    
    if(this.xmlText=="" || this.xmlText==undefined || this.xmlText==null)
    {    
         this.xmlDoc.loadXML("<UserSet></UserSet>") ;
    }
    else
    { 
        this.xmlDoc.loadXML(xmlText);
    }   
    
    this.RootNode = this.xmlDoc.selectSingleNode("/UserSet");  
    this.GetLength = UserSetGetItemLength;
    this.GetXml= UserSetGetXmlString;
    
    this.AddUserNode=UsetSetAddUserNode;
    this.RemoveUserNode=UsetSetRemoveUserNode;
    this.ContainsUserNode=UsetSetContainsUserNode;
    
    this.AddGroupNode=UsetSetAddGroupNode;
    this.RemoveGroupNode=UsetSetRemoveGroupNode;
    this.ContainsGroupNode=UsetSetContainsGroupNode;
    
    this.AddJobTitleNode=UsetSetAddJobTitleNode;
    this.RemoveJobTitleNode=UsetSetRemoveJobTitleNode;
    this.ContainsJobTitleNode=UsetSetContainsJobTitleNode;
    
    this.AddJobFunctionNode=UsetSetAddJobFunctionNode;
    this.RemoveJobFunctionNode=UsetSetRemoveJobFunctionNode;
    this.ContainsJobFunctionNode=UsetSetContainsJobFunctionNode;
    
    this.AddJobTitleOfGroupNode=UsetSetAddJobTitleOfGroupNode;
    this.RemoveJobTitleOfGroupNode=UsetSetRemoveJobTitleOfGroupNode;
    this.ContainsJobTitleOfGroupNode=UsetSetContainsJobTitleOfGroupNode;
    
    this.AddJobFunctionOfGroupNode=UsetSetAddJobFunctionOfGroupNode;
    this.RemoveJobFunctionOfGroupNode=UsetSetRemoveJobFunctionOfGroupNode;
    this.ContainsJobFunctionOfGroupNode=UsetSetContainsJobFunctionOfGroupNode;
    
    this.AddMemberClassNode=UsetSetAddMemberClassNode;
    this.RemoveMemberClassNode=UsetSetRemoveMemberClassNode;
    this.ContainsMemberClassNode=UsetSetContainsMemberClassNode;
    
    this.AddMemberClassOfGroupNode=UsetSetAddMemberClassOfGroupNode;
    this.RemoveMemberClassOfGroupNode=UsetSetRemoveMemberClassOfGroupNode;
    this.ContainsMemberClassOfGroupNode=UsetSetContainsMemberClassOfGroupNode;
    
    this.AddCustomerNode=UsetSetAddCustomerNode;
    this.ContainsCustomerNode=UsetSetContainsCustomerNode;
    
    this.AddContactOfCustomerNode=UsetSetAddContactOfCustomerNode;
    this.RemoveContactOfCustomerNode=UsetSetRemoveContactOfCustomerNode;
    this.ContainsContactOfCustomerNode=UsetSetContainsContactOfCustomerNode;
    
    this.AddUserForMyAddrNode=UsetSetAddUserForMyAddrNode;
    this.RemoveUserForMyAddrNode=UsetSetRemoveUserForMyAddrNode;
    this.ContainsUserForMyAddrNode=UsetSetContainsUserForMyAddrNode;
}  
    
function UsetSetAddUserNode(userId)
{   
    var element= this.xmlDoc.createElement ("Element") ;
    var attr = this.xmlDoc.createAttribute("type");
    attr.value="user";
    element.setAttributeNode(attr);
    var newIdElement=this.xmlDoc.createElement("userId");
    var newIdText=this.xmlDoc.createTextNode(userId);
    
    newIdElement.appendChild(newIdText);   
    element.appendChild(newIdElement);
    this.RootNode.appendChild(element); 
    
}

function UsetSetRemoveUserNode(userId)
{
    var node=this.xmlDoc.selectSingleNode('//Element[@type = "user" && userId = "'+userId+'"]');
    if(node!=null)
    {
        node.parentNode.removeChild(node);
    }
}

function UsetSetContainsUserNode(userId)
{
    var node=this.xmlDoc.selectSingleNode('//Element[@type = "user" && userId = "'+userId+'"]');
    return node==null ? false : true ;
}

function UsetSetAddGroupNode(groupId,isDepth)
{   
    var element= this.xmlDoc.createElement ("Element") ;
    var attr = this.xmlDoc.createAttribute("type");
    attr.value="group";
    element.setAttributeNode(attr);    
    var isDepthAttr = this.xmlDoc.createAttribute("isDepth");
    isDepthAttr.value= isDepth==true ? "True" : "False";
    element.setAttributeNode(isDepthAttr);
    var newIdElement=this.xmlDoc.createElement("groupId");
    var newIdText=this.xmlDoc.createTextNode(groupId);
    
    newIdElement.appendChild(newIdText);   
    element.appendChild(newIdElement);
    this.RootNode.appendChild(element);     
    
}

function UsetSetRemoveGroupNode(groupId,isDepth)
{
    isDepth = (isDepth==true) ? "True" : "False";
    var node=this.xmlDoc.selectSingleNode('//Element[@type = "group" && @isDepth="'+isDepth+'" && groupId = "'+groupId+'"]');
    if(node!=null)
    {
        node.parentNode.removeChild(node);
    }
}

function UsetSetContainsGroupNode(groupId,isDepth)
{
    isDepth = (isDepth==true) ? "True" : "False";
    var node=this.xmlDoc.selectSingleNode('//Element[@type = "group" && @isDepth="'+isDepth+'"&& groupId = "'+groupId+'"]');
    return node==null ? false : true ;
}

function UsetSetAddJobTitleNode(jobTitleId)
{   
    var element= this.xmlDoc.createElement ("Element") ;
    var attr = this.xmlDoc.createAttribute("type");
    attr.value="jobTitle";
    element.setAttributeNode(attr);
    var newIdElement=this.xmlDoc.createElement("jobTitleId");
    var newIdText=this.xmlDoc.createTextNode(jobTitleId);
    
    newIdElement.appendChild(newIdText);   
    element.appendChild(newIdElement);
    this.RootNode.appendChild(element);   
    
}

function UsetSetRemoveJobTitleNode(jobTitleId)
{
    var node=this.xmlDoc.selectSingleNode('//Element[@type = "jobTitle" && jobTitleId = "'+jobTitleId+'"]');
    if(node!=null)
    {
        node.parentNode.removeChild(node);
    }
}

function UsetSetContainsJobTitleNode(jobTitleId)
{
    var node=this.xmlDoc.selectSingleNode('//Element[@type = "jobTitle" && jobTitleId = "'+jobTitleId+'"]');
    return node==null ? false : true ;
}

function UsetSetAddJobFunctionNode(jobFunctionId)
{   
    var element= this.xmlDoc.createElement ("Element") ;
    var attr = this.xmlDoc.createAttribute("type");
    attr.value="jobFunction";
    element.setAttributeNode(attr);
    var newIdElement=this.xmlDoc.createElement("jobFunctionId");
    var newIdText=this.xmlDoc.createTextNode(jobFunctionId);
    
    newIdElement.appendChild(newIdText);   
    element.appendChild(newIdElement);
    this.RootNode.appendChild(element);   
    
}

function UsetSetRemoveJobFunctionNode(jobFunctionId)
{
    var node=this.xmlDoc.selectSingleNode('//Element[@type = "jobFunction" && jobFunctionId = "'+jobFunctionId+'"]');
    if(node!=null)
    {
        node.parentNode.removeChild(node);
    }
}

function UsetSetContainsJobFunctionNode(jobFunctionId)
{
    var node=this.xmlDoc.selectSingleNode('//Element[@type = "jobFunction" && jobFunctionId = "'+jobFunctionId+'"]');
    return node==null ? false : true ;
}



function UsetSetAddMemberClassNode(membClassId)
{   
    var element= this.xmlDoc.createElement ("Element") ;
    var attr = this.xmlDoc.createAttribute("type");
    attr.value="membClass";
    element.setAttributeNode(attr);
    var newIdElement=this.xmlDoc.createElement("membClassId");
    var newIdText=this.xmlDoc.createTextNode(membClassId);
    
    newIdElement.appendChild(newIdText);   
    element.appendChild(newIdElement);
    this.RootNode.appendChild(element);   
    
}

function UsetSetRemoveMemberClassNode(membClassId)
{
    var node=this.xmlDoc.selectSingleNode('//Element[@type = "membClass" && membClassId = "'+membClassId+'"]');
    if(node!=null)
    {
        node.parentNode.removeChild(node);
    }
}

function UsetSetContainsMemberClassNode(membClassId)
{
    var node=this.xmlDoc.selectSingleNode('//Element[@type = "membClass" && membClassId = "'+membClassId+'"]');
    return node==null ? false : true ;
}

function UsetSetAddMemberClassOfGroupNode(groupId,isDepth,membClassId)
{   
    var element= this.xmlDoc.createElement ("Element") ;
    var attr = this.xmlDoc.createAttribute("type");
    attr.value="membClassOfGroup";
    element.setAttributeNode(attr);
    
    var isDepthAttr = this.xmlDoc.createAttribute("isDepth");
    isDepthAttr.value= isDepth==true ? "True" : "False";
    element.setAttributeNode(isDepthAttr);
    
    var newIdElement=this.xmlDoc.createElement("membClassId");
    var newIdText=this.xmlDoc.createTextNode(membClassId);    
    newIdElement.appendChild(newIdText);   
    element.appendChild(newIdElement);
    
    var groupIdElement=this.xmlDoc.createElement("groupId");
    var groupIdText=this.xmlDoc.createTextNode(groupId);    
    groupIdElement.appendChild(groupIdText);   
    element.appendChild(groupIdElement);
    
    this.RootNode.appendChild(element);   
    
}

function UsetSetRemoveMemberClassOfGroupNode(groupId,isDepth,membClassId)
{
    isDepth = (isDepth==true) ? "True" : "False";
    var node=this.xmlDoc.selectSingleNode('//Element[@type = "membClassOfGroup" && @isDepth="'+isDepth+'" && membClassId = "'+membClassId+'" && groupId = "'+groupId+'"]');
    if(node!=null)
    {
        node.parentNode.removeChild(node);
    }
}

function UsetSetContainsMemberClassOfGroupNode(groupId,isDepth,membClassId)
{
    isDepth = (isDepth==true) ? "True" : "False";
    var node=this.xmlDoc.selectSingleNode('//Element[@type = "membClassOfGroup" && @isDepth="'+isDepth+'" && membClassId = "'+membClassId+'" && groupId = "'+groupId+'"]');
    return node==null ? false : true ;
}


function UsetSetAddJobTitleOfGroupNode(groupId,isDepth,jobTitleId)
{   
    var element= this.xmlDoc.createElement ("Element") ;
    var attr = this.xmlDoc.createAttribute("type");
    attr.value="jobTitleOfGroup";
    element.setAttributeNode(attr);
    
    var isDepthAttr = this.xmlDoc.createAttribute("isDepth");
    isDepthAttr.value= isDepth==true ? "True" : "False";
    element.setAttributeNode(isDepthAttr);
    
    var newIdElement=this.xmlDoc.createElement("jobTitleId");
    var newIdText=this.xmlDoc.createTextNode(jobTitleId);    
    newIdElement.appendChild(newIdText);   
    element.appendChild(newIdElement);
    
    var groupIdElement=this.xmlDoc.createElement("groupId");
    var groupIdText=this.xmlDoc.createTextNode(groupId);    
    groupIdElement.appendChild(groupIdText);   
    element.appendChild(groupIdElement);
    
    this.RootNode.appendChild(element);   
    
}

function UsetSetRemoveJobTitleOfGroupNode(groupId,isDepth,jobTitleId)
{
    isDepth = (isDepth==true) ? "True" : "False";
    var node=this.xmlDoc.selectSingleNode('//Element[@type = "jobTitleOfGroup" && @isDepth="'+isDepth+'" && jobTitleId = "'+jobTitleId+'" && groupId = "'+groupId+'"]');
    if(node!=null)
    {
        node.parentNode.removeChild(node);
    }
}

function UsetSetContainsJobTitleOfGroupNode(groupId,isDepth,jobTitleId)
{
    isDepth = (isDepth==true) ? "True" : "False";
    var node=this.xmlDoc.selectSingleNode('//Element[@type = "jobTitleOfGroup" && @isDepth="'+isDepth+'" && jobTitleId = "'+jobTitleId+'" && groupId = "'+groupId+'"]');
    return node==null ? false : true ;
}

function UsetSetAddJobFunctionOfGroupNode(groupId,isDepth,jobFunctionId)
{   
    var element= this.xmlDoc.createElement ("Element") ;
    var attr = this.xmlDoc.createAttribute("type");
    attr.value="jobFunctionOfGroup";
    element.setAttributeNode(attr);
    
    var isDepthAttr = this.xmlDoc.createAttribute("isDepth");
    isDepthAttr.value= isDepth==true ? "True" : "False";
    element.setAttributeNode(isDepthAttr);
    
    var newIdElement=this.xmlDoc.createElement("jobFunctionId");
    var newIdText=this.xmlDoc.createTextNode(jobFunctionId);    
    newIdElement.appendChild(newIdText);   
    element.appendChild(newIdElement);
    
    var groupIdElement=this.xmlDoc.createElement("groupId");
    var groupIdText=this.xmlDoc.createTextNode(groupId);    
    groupIdElement.appendChild(groupIdText);   
    element.appendChild(groupIdElement);
    
    this.RootNode.appendChild(element);   
    
}

function UsetSetRemoveJobFunctionOfGroupNode(groupId,isDepth,jobFunctionId)
{
    isDepth = (isDepth==true) ? "True" : "False";
    var node=this.xmlDoc.selectSingleNode('//Element[@type = "jobFunctionOfGroup" && @isDepth="'+isDepth+'" && jobFunctionId = "'+jobFunctionId+'" && groupId = "'+groupId+'"]');
    if(node!=null)
    {
        node.parentNode.removeChild(node);
    }
}

function UsetSetContainsJobFunctionOfGroupNode(groupId,isDepth,jobFunctionId)
{
    isDepth = (isDepth==true) ? "True" : "False";
    var node=this.xmlDoc.selectSingleNode('//Element[@type = "jobFunctionOfGroup" && @isDepth="'+isDepth+'" && jobFunctionId = "'+jobFunctionId+'" && groupId = "'+groupId+'"]');
    return node==null ? false : true ;
}



function UserSetGetItemLength()
{
    return  this.xmlDoc.selectSingleNode("/UserSet").childNodes.length;
}

function UserSetGetXmlString()
{
    return this.xmlDoc.xml;
}

function UsetSetAddCustomerNode(customerId)
{   
//debugger;
    var element= this.xmlDoc.createElement ("Element") ;
    var attr = this.xmlDoc.createAttribute("type");
    attr.value="CustomerOfClass";
    element.setAttributeNode(attr);
    var newIdElement=this.xmlDoc.createElement("userId");
    var newIdText=this.xmlDoc.createTextNode(customerId);
    
    newIdElement.appendChild(newIdText);   
    element.appendChild(newIdElement);
    this.RootNode.appendChild(element);      
    
}

function UsetSetAddContactOfCustomerNode(contactId)
{   

    var element= this.xmlDoc.createElement ("Element") ;
    var attr = this.xmlDoc.createAttribute("type");
    attr.value="ContactOfCustomer";
    element.setAttributeNode(attr);
    var newIdElement=this.xmlDoc.createElement("userId");
    var newIdText=this.xmlDoc.createTextNode(contactId);
    
    newIdElement.appendChild(newIdText);   
    element.appendChild(newIdElement);
    this.RootNode.appendChild(element);  
}

function UsetSetAddUserForMyAddrNode(userId)
{   

    var element= this.xmlDoc.createElement ("Element") ;
    var attr = this.xmlDoc.createAttribute("type");
    attr.value="MyAddr";
    element.setAttributeNode(attr);
    var newIdElement=this.xmlDoc.createElement("userId");
    var newIdText=this.xmlDoc.createTextNode(userId);
    
    newIdElement.appendChild(newIdText);   
    element.appendChild(newIdElement);
    this.RootNode.appendChild(element);  
}

function UsetSetRemoveContactOfCustomerNode(contactId)
{
    var node=this.xmlDoc.selectSingleNode('//Element[@type = "ContactOfCustomer" && userId = "'+contactId+'"]');
    if(node!=null)
    {
        node.parentNode.removeChild(node);
    }
}

function UsetSetRemoveUserForMyAddrNode(userId)
{
    var node=this.xmlDoc.selectSingleNode('//Element[@type = "MyAddr" && userId = "'+userId+'"]');
    if(node!=null)
    {
        node.parentNode.removeChild(node);
    }
}

function UsetSetContainsCustomerNode(classId,isDepth,customerId)
{
    //debugger;
    isDepth = (isDepth==true) ? "True" : "False";
    var node=this.xmlDoc.selectSingleNode('//Element[@type = "CustomerOfClass" && @isDepth="'+isDepth+'" && classId = "'+classId+'" && customerId = "'+customerId+'"]');
    return node==null ? false : true ;
}

function UsetSetContainsContactOfCustomerNode(contactId)
{    
    //debugger;
    var node=this.xmlDoc.selectSingleNode('//Element[@type = "ContactOfCustomer" && userId = "'+ contactId+'"]');
    return node==null ? false : true ;
}

function UsetSetContainsUserForMyAddrNode(userId)
{    
    //debugger;
    var node=this.xmlDoc.selectSingleNode('//Element[@type = "MyAddr" && userId = "'+ userId+'"]');
    return node==null ? false : true ;
}