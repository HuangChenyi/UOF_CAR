// JScript 檔

var itemType = new Array("Class", "Contact");
var SearchDepartmentResult = null;
var SearchDepartmentResultIndex = -1;
var SearchDepartmentTempKeyWord = null;

function SearchResult()
{
    this.Value = new Array();
    this.Index = 0;
    this.KeyWord = null;
    this.IsEmpty = true;
    this.GetNextResult = SearchResultGetNextResult;
    this.IsLast = SearchResultIsLast;
    this.SetResult = SearchResultSetResult;
}

function SearchResultGetNextResult()
{
    if (this.Value.length > this.Index)
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
    if (this.Value.length > this.Index)
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
    if (result != null && result.length > 0)
    {
        this.Value = result;
        this.IsEmpty = false;
        this.Index = 0;
    }
    else
    {
        this.IsEmpty = true;
    }
}


function SearchResultForAddressBook()
{
    this.Value = null;
    this.PageSize = 20;
    this.PageIndex = 0;
    this.PageCount = 0;
    this.Count = 0;
    this.KeyWord = null;
    this.IsEmpty = true;
    this.PageString = "0/0";
    this.GetPage = SRGetPage;
    this.SetResult = SRForAddressBookSetResult;
}


function SRForAddressBookSetResult(result)
{
    if (result != null && result.value.keys.length > 0)
    {
        this.Value = result;
        this.IsEmpty = false;
        this.PageIndex = 0;
        this.Count = result.value.keys.length;
        this.PageCount = Math.ceil(this.Count / this.PageSize);
        this.PageString = "1/" + this.PageCount;
    }
    else
    {
        this.IsEmpty = true;
    }
}

function SRForUserSetResult(result)
{
    if (result != null && result.value.length > 0)
    {
        this.Value = result;
        this.IsEmpty = false;
        this.PageIndex = 0;
        this.Count = result.value.length;
        this.PageCount = Math.ceil(this.Count / this.PageSize);
        this.PageString = "1/" + this.PageCount;
    }
    else
    {
        this.IsEmpty = true;
    }
}

function SRForUserItem()
{
    this.Guid;
    this.Name;
}

function SRGetPage(pageIndex)
{
    if (pageIndex >= 0 && pageIndex < this.PageCount)
    {
        var si = 0;
        var ei = 0;
        if (pageIndex == this.PageCount - 1)
        {
            si = pageIndex * this.PageSize;
            ei = si + (this.Count - si);
        }
        else
        {
            si = pageIndex * this.PageSize;
            ei = si + this.PageSize;
        }

        var result = new Array();
        var index = 0;
        for (var i = si; i < ei; i++)
        {
            var item = new SRForUserItem();
            item.Guid = this.Value.value.keys[i];
            item.Name = this.Value.value.values[i];
            result[index++] = item;
        }

        this.PageIndex = pageIndex;
        this.PageString = (this.PageIndex + 1) + "/" + this.PageCount;

        return result;


    }
    else
    {
        return null;
    }
}

var AddressBookSR = new SearchResultForAddressBook();


function Item(typeIndex)
{
    this.AllowSub = false;
    this.TypeIndex = typeIndex;
    this.Text = "";
    this.Key = "";
    this.Key2 = "";
    this.Tag = "";
    this.Icon = "";

    this.SetDataFromTag = SetDataFromTag;
    this.ResetTag = function()
    {
        this.Tag = this.Text + "|" + typeIndex + "|" + (this.AllowSub ? "1" : "0") + "|" + this.Key;
    }
 
    if (typeIndex != undefined)
    {
        var tree = null;
        switch (typeIndex)
        {
            case 0:           
                this.Icon = "icon_c08.gif";
                tree = igtree_getTreeById(treeContactID);
                break;
            case 1:
                this.Icon = "icon_c01.gif";
                tree = igtree_getTreeById(treeClassID);
                break;          
        }

        var sourceNode = tree.getSelectedNode();
        if (sourceNode != null)
        {
            this.Text = sourceNode.getText();
            this.Key = sourceNode.getTag();
            this.Tag = this.Text + "|" + typeIndex + "|" + (this.AllowSub ? "1" : "0") + "|" + this.Key;
        }
    }
}

function SetDataFromTag(tag)
{
    var datas = tag.split("|");
    this.Tag = tag;
    this.Text = datas[0];
    this.TypeIndex = parseInt(datas[1], 10);
    this.AllowSub = datas[2] == "1" ? true : false;
    this.Key = datas[3];

    if (datas.length == 5)
        this.Key2 = datas[4];

    switch (this.TypeIndex)
    {
        case 0:
            this.Icon = "icon_c08.gif";
            break;
        case 1:
            this.Icon = "icon_c01.gif";
            break;       
    }


}

function SetTreeContactNode(result)
{
    if (result.value == null)
    {
        alert("server error");
    }
    else
    {
        var treeContact = igtree_getTreeById(treeContactID);
        treeContact.clearNodes();

        AddressBookSR = new SearchResultForAddressBook();
        AddressBookSR.SetResult(result);

        SearchAddressBookPageSize.innerText = AddressBookSR.PageString;
        SearchAddressBookCount.innerText = AddressBookSR.Count;

        var items = AddressBookSR.GetPage(0);
        if (items != null)
        {
            for (var i = 0; i < items.length; i++)
            {
                var targetNode = treeContact.addRoot(items[i].Name, "");
                targetNode.setTag(items[i].Guid);                
            }
        }
    }
}

function AddNodeToTreeSelected(item)
{
    if (!FindExistSelectedNode(item))
    {
        var treeSelected = igtree_getTreeById(treeSelectedID);
        var sourceNode = treeSelected.addRoot(item.Text, null);
        sourceNode.setTag(item.Tag);
        setNodeImage(sourceNode, item);

        switch (item.TypeIndex)
        {            
            case 0:
                m_currentAddressBookSet.AddContactNode(item.Key);
                break;

            case 1:
                m_currentAddressBookSet.AddClassNode(item.Key);
                break;
        }

    }
    else
    {
        ShowMessage(1);
    }
}

function setNodeImage(node, item)
{

    var currentNode = node.getElement();
    var nodeSpan = igtree_getNodeSpan(currentNode);
    var SelImage = node.getElement("igSelImage");
    var image = nodeSpan.previousSibling;

    image.src = themePath + "/images/icon/" + item.Icon;
    SelImage.setAttribute("igSelImage", themePath + "/images/icon/" + item.Icon);


}


function FindExistSelectedNode(item)
{
    switch (item.TypeIndex)
    {
        case 0:
            return m_currentAddressBookSet.ContainsContactNode(item.Key);
            break;

        case 1:
            return m_currentAddressBookSet.ContainsClassNode(item.Key);
            break;    
    }
}

function ReomveRecordSelectedNode(item)
{


    switch (item.TypeIndex)
    {
        case 0:
            m_currentAddressBookSet.RemoveContactNode(item.Key);
            break;
        case 1:
            m_currentAddressBookSet.RemoveClassNode(item.Key);
            break;              
       
    }

}


function SetSearchAddressBookPage(val)
{
    var items = AddressBookSR.GetPage(AddressBookSR.PageIndex + val);

    if (items != null)
    {
        SearchAddressBookPageSize.innerText = AddressBookSR.PageString;

        var treeContact = igtree_getTreeById(treeContactID);
        treeContact.clearNodes();
        for (var i = 0; i < items.length; i++)
        {
            var targetNode = treeContact.addRoot(items[i].Name, "");
            targetNode.setTag(items[i].Guid);           
        }
    }
}

function SetChioceType(type)
{
    panelContact.style.display = 'none';
    panelClass.style.display = 'none';

    if (type == "Contact")
    {
        var treeClass = igtree_getTreeById(treeClassID);
        if (typeof (treeClass) != 'undefined')
        {
            treeClass.treeElement.style.background = '#EFEFEF';
        }
        panelContact.style.display = '';
        panelClass.style.display = '';
    }
    else if (type == "Class")
    {
        var treeClass = igtree_getTreeById(treeClassID);
        if (typeof (treeClass) != 'undefined')
        {
            treeClass.treeElement.style.background = '#FFFFFF';
        }
        panelClass.style.display = '';
    }   
}

function SetExpandToContact(result)
{
    if (result.value == null)
    {
        alert("server error");
    }
    else
    {
        if (result.value.keys.length == 0)
        {
            ShowMessage(2);
        }
        else
        {

            for (var i = 0; i < result.value.keys.length; i++)
            {
                var item = new Item(0);
                item.Key = result.value.keys[i];
                item.Text = result.value.values[i];
                item.ResetTag();
                item.AllowSub = false;
                
                AddNodeToTreeSelected(item);
            }
        }
    }
}





