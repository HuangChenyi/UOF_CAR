// JScript 檔

var itemType = new Array("Department", "Employee", "JobTitle", "JobFunction", "Department+JobTitle", "Department+JobFunction", "Group", "Member","MemberClass","Group+MemberClass");
var SearchDepartmentResult=null;
var SearchDepartmentResultIndex=-1;
var SearchDepartmentTempKeyWord=null;

function SearchResult()
{
    this.Value=new Array();
    this.Index=0;
    this.KeyWord=null;
    this.IsEmpty=true;
    this.GetNextResult=SearchResultGetNextResult;
    this.IsLast=SearchResultIsLast;
    this.SetResult=SearchResultSetResult;
}

function SearchResultGetNextResult()
{
    if(this.Value.length>this.Index)
    {
        return this.Value[this.Index++];
    }
    else
    {
        return null;
    }
    
}
function SearchResultIsLast()
{
    if(this.Value.length>this.Index)
    {
        return false;
    }
    else
    {
        return true;
    }
}
function SearchResultSetResult(result)
{
    if(result!=null && result.length>0)
    {
        this.Value=result; 
        this.IsEmpty=false;  
        this.Index=0; 
    }
    else
    {
        this.IsEmpty=true;
    }
}

var DeptSR = new SearchResult();
var GroupSR = new SearchResult();


function SearchResultForUser()
{
    this.Value=null;
    this.PageSize=20;
    this.PageIndex=0;
    this.PageCount=0;
    this.Count=0;
    this.KeyWord=null;
    this.IsEmpty=true;
    this.PageString="0/0";
    this.GetPage=SRGetPage;
    this.SetResult=SRForUserSetResult;
}

function SRForUserSetResult(result)
{
    if(result!=null && result.value.keys.length>0)
    {
        this.Value=result; 
        this.IsEmpty=false;  
        this.PageIndex=0; 
        this.Count=result.value.keys.length;
        this.PageCount= Math.ceil(this.Count / this.PageSize);
        this.PageString="1/" + this.PageCount;
    }
    else
    {
        this.IsEmpty=true;
    }
}

function SRForUserItem()
{
    this.Guid;
    this.Name;
}

function SRGetPage(pageIndex)
{
    if(pageIndex>=0 && pageIndex<this.PageCount)
    {
        var si=0;
        var ei=0;
        if(pageIndex==this.PageCount-1)
        {
            si=pageIndex*this.PageSize;
            ei=si + (this.Count - si);
        }
        else
        {
            si = pageIndex * this.PageSize ;
            ei = si + this.PageSize;
        }
        
        var result=new Array();
        var index=0;
        for(var i=si; i < ei ; i++)
        { 
            var item=new SRForUserItem();
            item.Guid=this.Value.value.keys[i];
            item.Name=this.Value.value.values[i] ;
            result[index++] = item ;
        }
                
        this.PageIndex=pageIndex;
        this.PageString=(this.PageIndex+1) + "/" + this.PageCount;
        
        return result;
        
    
    }
    else
    {
        return null;
    }
}

var EmployeeSR = new SearchResultForUser();
var MemberSR = new SearchResultForUser();

function Item(typeIndex)
{  
    this.AllowSub=false;
    this.TypeIndex=typeIndex;    
    this.Text="";
    this.Key="";
    this.Key2="";
    this.Tag="";
    this.Icon="";
    
    this.SetDataFromTag=SetDataFromTag;
    
    if(typeIndex==0 || typeIndex==4 || typeIndex==5)
    {
        if($get(cbAllowSubDeptID)!=null)
            this.AllowSub=$get(cbAllowSubDeptID).checked;
    }    
    else if(typeIndex==6 || typeIndex==9)
    {
        if($get(cbAllowSubGroupID)!=null)
            this.AllowSub=$get(cbAllowSubGroupID).checked;
    }    
    
    if(typeIndex==0 || typeIndex==1 || typeIndex==2 || typeIndex==3 || typeIndex==6 || typeIndex==7 || typeIndex==8 )
    {
        var tree=null;
        switch (typeIndex)
        {
            case 0:
                this.Icon= this.AllowSub ? "icon_m22.png" : "icon_m01.png";                
                tree=igtree_getTreeById(treeDeptID);
                break;
            case 1:                
                this.Icon="icon_m17.png";                
                tree=igtree_getTreeById(treeEmployeeID);
                break;
            case 2:
                this.Icon="icon_m18.png";
                tree=igtree_getTreeById(treeTitleID);
                break;
            case 3:
                this.Icon="icon_m19.png";
                tree=igtree_getTreeById(treeFuncID);
                break;
            case 6:
                this.Icon= this.AllowSub ? "icon_m137.png" : "icon_m05.png";                
                tree=igtree_getTreeById(treeGroupID);
                break;
            case 7:
                this.Icon="icon_m30.png"; 
                tree=igtree_getTreeById(treeMemberID);
                break;
            case 8:
                this.Icon="icon_m138.png"; 
                tree=igtree_getTreeById(treeMemberClassID);
                break;
         }
        
        var sourceNode=tree.getSelectedNode();
        if(sourceNode!=null)
        {
            this.Text=sourceNode.getText();
            this.Key=sourceNode.getTag();            
            this.Tag=this.Text+"|"+typeIndex+"|"+(this.AllowSub ? "1" : "0" )+"|"+this.Key;
        }       
     }
     else if(typeIndex==4 || typeIndex==5 || typeIndex==9)
     {
        var tree1=null;
        var tree2=null;
        switch (typeIndex)
        {            
            case 4:
                this.Icon= this.AllowSub ? "icon_m23.png" : "icon_m20.png";
                tree1=igtree_getTreeById(treeDeptID);
                tree2=igtree_getTreeById(treeTitleID);
                break;
            case 5:
                this.Icon= this.AllowSub ? "icon_m24.png" : "icon_m21.png";
                tree1=igtree_getTreeById(treeDeptID);
                tree2=igtree_getTreeById(treeFuncID);
                break;
            case 9:
                this.Icon= this.AllowSub ? "icon_m140.png" : "icon_m139.png";
                tree1=igtree_getTreeById(treeGroupID);
                tree2=igtree_getTreeById(treeMemberClassID);
                break;
         }
        
        var sourceNode=tree1.getSelectedNode();
        var sourceNode2=tree2.getSelectedNode();
        if(sourceNode!=null && sourceNode2!=null)
        {
            this.Text=sourceNode.getText()+"-"+sourceNode2.getText();
            this.Key=sourceNode.getTag();
            this.Key2=sourceNode2.getTag();
            this.Tag=this.Text+"|"+typeIndex+"|"+ (this.AllowSub ? "1" : "0" )+"|"+this.Key+"|"+this.Key2;
        }       
     }
    
}

function SetDataFromTag(tag)
{
    var datas=tag.split("|");
    this.Tag=tag;
    this.Text=datas[0];
    this.TypeIndex=parseInt(datas[1],10);
    this.AllowSub= datas[2]=="1" ? true : false;
    this.Key=datas[3];
    
    if(datas.length==5)
        this.Key2=datas[4];
    
    switch (this.TypeIndex)
    {
        case 0:
            this.Icon= this.AllowSub ? "icon_m22.png" : "icon_m01.png";    
            break;
        case 1:                
            this.Icon="icon_m17.png";                
            break;
        case 2:
            this.Icon="icon_m18.png";
            break;
        case 3:
            this.Icon="icon_m19.png";
            break;
        case 4:
            this.Icon= this.AllowSub ? "icon_m23.png" : "icon_m20.png";
            break;
        case 5:
            this.Icon= this.AllowSub ? "icon_m24.png" : "icon_m21.png";
            break;
        case 6:
            this.Icon= this.AllowSub ?"icon_m137.png" : "icon_m05.png"; 
            break;
        case 7:
            this.Icon="icon_m30.png"; 
            break;
        case 8:
            this.Icon="icon_m138.png"; 
            break;
         case 9:
            this.Icon= this.AllowSub ? "icon_m140.png" : "icon_m139.png"; 
            break;   
            
     }
    

}


function SetTreeEmployeeNode(result)
{
    if(result.value==null)
    {
        alert("server error");
    }
    else 
    {
       var treeEmployee= igtree_getTreeById(treeEmployeeID);
       treeEmployee.clearNodes();

         EmployeeSR = new SearchResultForUser();
         EmployeeSR.SetResult(result);
         
         SearchEmployeePageSize.innerText=EmployeeSR.PageString;
         SearchEmployeeCount.innerText=EmployeeSR.Count;
         
         var items=EmployeeSR.GetPage(0);
         if(items!=null)
         {
             for(var i=0; i<items.length ;i++)
             {
                var targetNode = treeEmployee.addRoot(items[i].Name,"");
                targetNode.setTag(items[i].Guid);
             }
         }
    }
}

function SetTreeMemberNode(result)
{
    //debugger;
    if(result.value==null)
    {
        alert("server error");
    }
    else 
    {
       var treeMember= igtree_getTreeById(treeMemberID);
       treeMember.clearNodes();

         MemberSR = new SearchResultForUser();
         MemberSR.SetResult(result);
         
         SearchMemberPageSize.innerText=MemberSR.PageString;
         SearchMemberCount.innerText=MemberSR.Count;
         
         var items=MemberSR.GetPage(0);
         if(items!=null)
         {
             for(var i=0; i<items.length ;i++)
             {
                var targetNode = treeMember.addRoot(items[i].Name,"");
                targetNode.setTag(items[i].Guid);
             }
         }
    }
}



function AddNodeToTreeSelected(item)
{   
   
    
    if(!FindExistSelectedNode(item))
    {   
        var treeSelected=igtree_getTreeById(treeSelectedID);
        var sourceNode=treeSelected.addRoot(item.Text,null);
        sourceNode.setTag(item.Tag);         
        setNodeImage(sourceNode,item);
        
        switch (item.TypeIndex)
        {
            case 0:   
            case 6:
                m_currentUserSet.AddGroupNode(item.Key,item.AllowSub);
                break;
            case 1:
            case 7:                       
                m_currentUserSet.AddUserNode(item.Key);
                break;

            case 2:
                m_currentUserSet.AddJobTitleNode(item.Key);
                break;

            case 3:        
               m_currentUserSet.AddJobFunctionNode(item.Key);
               break;

            case 4:
                m_currentUserSet.AddJobTitleOfGroupNode(item.Key,item.AllowSub,item.Key2);
                break;

            case 5:
                m_currentUserSet.AddJobFunctionOfGroupNode(item.Key,item.AllowSub,item.Key2);
               break;
            
            case 8:        
               m_currentUserSet.AddMemberClassNode(item.Key);
               break;

            case 9:
                m_currentUserSet.AddMemberClassOfGroupNode(item.Key,item.AllowSub,item.Key2);
                break;
        }
        
    }
    else
    {
        ShowMessage(1);
    }
}

function setNodeImage(node,item)
{

    var currentNode = node.getElement();
    var nodeSpan = igtree_getNodeSpan(currentNode);
    var SelImage = node.getElement("igSelImage");
    var image=nodeSpan.previousSibling;
    
    image.src = themePath + "/images/icon/"+item.Icon;
    SelImage.setAttribute("igSelImage",themePath + "/images/icon/"+item.Icon);
    
   
}


function FindExistSelectedNode(item)
{       
    switch (item.TypeIndex)
    {
        case 0:   
        case 6:
            return m_currentUserSet.ContainsGroupNode(item.Key,item.AllowSub);
        case 1:
        case 7:                       
            return m_currentUserSet.ContainsUserNode(item.Key);
        case 2:
            return m_currentUserSet.ContainsJobTitleNode(item.Key);

        case 3:        
           return m_currentUserSet.ContainsJobFunctionNode(item.Key);

        case 4:
            return m_currentUserSet.ContainsJobTitleOfGroupNode(item.Key,item.AllowSub,item.Key2);

        case 5:
            return m_currentUserSet.ContainsJobFunctionOfGroupNode(item.Key,item.AllowSub,item.Key2);
            
        case 8:        
           return m_currentUserSet.ContainsMemberClassNode(item.Key);

        case 9:
            return m_currentUserSet.ContainsMemberClassOfGroupNode(item.Key,item.AllowSub,item.Key2);
    }
}

function ReomveRecordSelectedNode(item)
{
    
     
    switch (item.TypeIndex)
    {
        case 0: 
        case 6:           
            m_currentUserSet.RemoveGroupNode(item.Key,item.AllowSub);
            break;

        case 1:        
        case 7:               
            m_currentUserSet.RemoveUserNode(item.Key);
            break;

        case 2:
            m_currentUserSet.RemoveJobTitleNode(item.Key);
            break;

        case 3:        
           m_currentUserSet.RemoveJobFunctionNode(item.Key);
           break;

        case 4:
            m_currentUserSet.RemoveJobTitleOfGroupNode(item.Key,item.AllowSub,item.Key2);
            break;

        case 5:
           m_currentUserSet.RemoveJobFunctionOfGroupNode(item.Key,item.AllowSub,item.Key2);
           break;
           
        case 8:        
           m_currentUserSet.RemoveMemberClassNode(item.Key);
           break;

        case 9:
            m_currentUserSet.RemoveMemberClassOfGroupNode(item.Key,item.AllowSub,item.Key2);
            break;
    }
    
}

function SearchDepartment(keyWord)
{
    //debugger;
    if(DeptSR.KeyWord!=keyWord)
    {
        DeptSR = new SearchResult();
        DeptSR.KeyWord=keyWord;
        Common_ChoiceCenter_ChoiceCenter.SearchDepartment(keyWord,SetSearchDepartmentResult);
        
    }
    else
    {   
        if(DeptSR.IsEmpty)
        {
            ShowMessage(2);            
        }
        else
        {           
             if(!DeptSR.IsLast())
             {
                ShowRearchResult(treeDeptID,DeptSR.GetNextResult());
             }
             else
             {
                 ShowMessage(3);
             }
        }
    }
}

function SetSearchDepartmentResult(result)
{
    if(result.value==null)
    {
        alert("server error");
    }
    else 
    {
       if(result.value.length==0)
       {
            ShowMessage(2);
            DeptSR = new SearchResult();
       }
       else
       {               
            DeptSR.SetResult(result.value);
            ShowRearchResult(treeDeptID,DeptSR.GetNextResult());
       }
    }
}

function SetSearchEmployeeResult(result)
{
    if(result.value==null)
    {
        alert("server error");
    }
    else 
    {
       if(result.value.keys.length==0)
       {
            ShowMessage(2);
       }
       else
       {               
           var treeEmployee= igtree_getTreeById(treeEmployeeID);
           treeEmployee.clearNodes();
             EmployeeSR = new SearchResultForUser();
             EmployeeSR.SetResult(result);
             
             SearchEmployeePageSize.innerText=EmployeeSR.PageString;
             SearchEmployeeCount.innerText=EmployeeSR.Count;
             
             var items=EmployeeSR.GetPage(0);
             if(items!=null)
             {
                 for(var i=0; i<items.length ;i++)
                 {
                    var targetNode = treeEmployee.addRoot(items[i].Name,"");
                    targetNode.setTag(items[i].Guid);
                 }
             }
       }
    }
}

function SetSearchEmployeePage(val)
{
    //debugger;
    var items= EmployeeSR.GetPage(EmployeeSR.PageIndex+val);
    
    if(items!=null)
    {
        SearchEmployeePageSize.innerText=EmployeeSR.PageString;
        
        var treeEmployee= igtree_getTreeById(treeEmployeeID);
        treeEmployee.clearNodes();
         for(var i=0; i<items.length ;i++)
         {
            var targetNode = treeEmployee.addRoot(items[i].Name,"");
            targetNode.setTag(items[i].Guid);
         }
    }
}

function SearchGroup(keyWord)
{
    //debugger;
    if(GroupSR.KeyWord!=keyWord)
    {
        GroupSR = new SearchResult();
        GroupSR.KeyWord=keyWord;
        Common_ChoiceCenter_ChoiceCenter.SearchGroup(keyWord,SetSearchGroupResult);
        
    }
    else
    {   
        if(GroupSR.IsEmpty)
        {
            ShowMessage(2);            
        }
        else
        {           
             if(!GroupSR.IsLast())
             {
                ShowRearchResult(treeGroupID,GroupSR.GetNextResult());
             }
             else
             {
                 ShowMessage(3);
             }
        }
    }
}

function SetSearchGroupResult(result)
{
    if(result.value==null)
    {
        alert("server error");
    }
    else 
    {
       if(result.value.length==0)
       {
            ShowMessage(2);
            GroupSR = new SearchResult();
       }
       else
       {               
            GroupSR.SetResult(result.value);
            ShowRearchResult(treeGroupID,GroupSR.GetNextResult());
       }
    }
}

function SetSearchMemberResult(result)
{
    if(result.value==null)
    {
        alert("server error");
    }
    else 
    {
       if(result.value.keys.length==0)
       {
            ShowMessage(2);
       }
       else
       {
           var treeMember= igtree_getTreeById(treeMemberID);
           treeMember.clearNodes();
             MemberSR = new SearchResultForUser();
             MemberSR.SetResult(result);
             
             SearchMemberPageSize.innerText=MemberSR.PageString;
             SearchMemberCount.innerText=MemberSR.Count;
             
             var items=MemberSR.GetPage(0);
             if(items!=null)
             {
                 for(var i=0; i<items.length ;i++)
                 {
                    var targetNode = treeMember.addRoot(items[i].Name,"");
                    targetNode.setTag(items[i].Guid);
                 }
             }
        }
    }
}

function SetSearchMemberPage(val)
{
    //debugger;
    var items= MemberSR.GetPage(MemberSR.PageIndex+val);
    
    if(items!=null)
    {
        SearchMemberPageSize.innerText=MemberSR.PageString;
        
        var treeMember= igtree_getTreeById(treeMemberID);
        treeMember.clearNodes();
         for(var i=0; i<items.length ;i++)
         {
            var targetNode = treeMember.addRoot(items[i].Name,"");
            targetNode.setTag(items[i].Guid);
         }
    }
}

function SetFavoriteNode(result)
{
    if(result.value==null)
    {
        alert("server error");
    }
    else 
    {
        if(result.value.length==0)
        {
            ShowMessage(2);
        }
        else
        {
            for(var i=0;i<result.value.length;i++)
            {
                var item=new Item();
                item.SetDataFromTag(result.value[i]);
                AddNodeToTreeSelected(item);
            }
        }
    }
}

function ShowRearchResult(treeId,nodeId)
{
    var node=igtree_getNodeById(treeId+nodeId);
    node.setSelected(true);
    //node.scrollIntoView();
    
    if(selectedMode=="Employee")
    {	
        Common_ChoiceCenter_ChoiceCenter.GetEmployee(node.getTag(),SetTreeEmployeeNode);
    }
    else if(selectedMode=="Member")
    {	
        Common_ChoiceCenter_ChoiceCenter.GetMember(node.getTag(),SetTreeMemberNode);
    }
}

function SetChioceType(type)
{
    panelDepartment.style.display='none';
    panelEmployee.style.display='none';
    panelJobTitle.style.display='none';
    panelJobFunction.style.display='none';
    panelGroup.style.display='none';
    panelMember.style.display='none';
    panelMemberClass.style.display='none';
    panelFavorite.style.display='none';
    
   
    if(type=="Department")
    {
       panelDepartment.style.display='';
       
       var treeDept= igtree_getTreeById(treeDeptID);
       treeDept.treeElement.style.background='';
       
       divPanelAllowSubDept.style.display='';
    }
    else if(type=="Employee")
    {	    
        var treeDept= igtree_getTreeById(treeDeptID);
        treeDept.treeElement.style.background='#EFEFEF';
        divPanelAllowSubDept.style.display='none';
        
        var node=treeDept.getSelectedNode();
        if(node!=null)
        {
            Common_ChoiceCenter_ChoiceCenter.GetEmployee(node.getTag(),SetTreeEmployeeNode);
        }
        
        panelDepartment.style.display=''; 
        panelEmployee.style.display='';
       
    }
    else if(type=="JobTitle")
    {
        var treeDept= igtree_getTreeById(treeDeptID);
        if(typeof(treeDept)!='undefined')
        {
            treeDept.treeElement.style.background='#EFEFEF';
        }
        divPanelAllowSubDept.style.display='none';
        
        panelJobTitle.style.display='';
    }
    else if(type=="JobFunction")
    {
        var treeDept= igtree_getTreeById(treeDeptID);
        if(typeof(treeDept)!='undefined')
        {
            treeDept.treeElement.style.background='#EFEFEF';
        }
        divPanelAllowSubDept.style.display='none';
        
        panelJobFunction.style.display='';
    }
    else if(type=="Department+JobTitle")
    {
        var treeDept= igtree_getTreeById(treeDeptID);
        treeDept.treeElement.style.background='#EFEFEF';
        divPanelAllowSubDept.style.display='none';
        
        panelDepartment.style.display='';
        panelJobTitle.style.display='';
        divPanelAllowSubDept.style.display='';
    }
    else if(type=="Department+JobFunction")
    {
        var treeDept= igtree_getTreeById(treeDeptID);
        treeDept.treeElement.style.background='#EFEFEF';
        divPanelAllowSubDept.style.display='none';
        
        panelDepartment.style.display='';
        panelJobFunction.style.display='';
        divPanelAllowSubDept.style.display='';
    }
    else if(type=="Group")
    {
        var treeGroup= igtree_getTreeById(treeGroupID);
        treeGroup.treeElement.style.background='';
        panelGroup.style.display='';
        divPanelAllowSubGroup.style.display='';
    }
    else if(type=="Member")
    {
        var treeGroup= igtree_getTreeById(treeGroupID);
        treeGroup.treeElement.style.background='#EFEFEF';
        divPanelAllowSubGroup.style.display='none';
        
        var node=treeGroup.getSelectedNode();
        if(node!=null)
        {
            Common_ChoiceCenter_ChoiceCenter.GetMember(node.getTag(),SetTreeMemberNode);
        }
        
        panelGroup.style.display='';
        panelMember.style.display='';
    }
    else if(type=="MemberClass")
    {
        var treeGroup= igtree_getTreeById(treeGroupID);
        treeGroup.treeElement.style.background='#EFEFEF';
        divPanelAllowSubGroup.style.display='none';
        
        panelMemberClass.style.display='';
        
    }
    else if(type=="Group+MemberClass")
    {
        var treeGroup= igtree_getTreeById(treeGroupID);
        treeGroup.treeElement.style.background='#EFEFEF';	   
        
        panelGroup.style.display='';
        panelMemberClass.style.display='';
        divPanelAllowSubGroup.style.display='';
    }
    else if(type=="Favorite")
    {
        panelFavorite.style.display='';
    }
}

function SetExpandToUser(result)
{
    
    if(result.value==null)
    {
        alert("server error");
    }
    else 
    {
       if(result.value.length==0)
       {
            ShowMessage(2);
       }
       else
       {
           
           for(var i=0;i<result.value.length ;i++)
           {
                var item=new Item();
                item.SetDataFromTag(result.value[i]); 
                AddNodeToTreeSelected(item);
           }
        }
    }
}

