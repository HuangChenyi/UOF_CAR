<%@ Control Language="C#" AutoEventWireup="true" Inherits="QUE_Common_UC_Qus" Codebehind="UC_Qus.ascx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="UC_QusItem.ascx" TagName="UC_QusItem" TagPrefix="uc1" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc2" TagName="UC_FileCenter" %>


<script type="text/javascript" id="igClientScript">

    function InitSize1() {
     var divItem = $('#<%= divItem.ClientID %>');
             if(divItem != null)
             {
                 divItem.css("width", ($(document.body).width() * 0.96) + 'px');
             }
    }
    
    function addSelectedItem(obj)
    {
        
        var hidenProperty = $('#<%= hiddenFillPropery.ClientID %>'); 
       
        if(obj.checked)
        {
          hidenProperty.val(hidenProperty.val() + obj.name +"," +obj.value + ","+obj.checked+"@");
       }
       else
       {
           var contents=obj.name +"," +obj.value + ","+"true"+"@";
            var regS = new RegExp(contents,"gi");
            hidenProperty.val(hidenProperty.val().replace(regS,""));
       }
       
    }


</script>
<style type="text/css">

 .GridItem
{
    color: #333333;
    background-color: #FFFFFF;
    height: 35px;
    line-height: 1.5em;
}
.GridItemAlternating > td
{
    padding: 2px;
    border-bottom-style:none;
    border-top-style:none;
    border-right-style:none;
    border-left-style:none;
}

.GridItem > td
{
    padding: 2px;
    border-bottom-style:none;
    border-top-style:none;
    border-right-style:none;
    border-left-style:none;
    
}

.GridPager > td
{
    border: none;
}

.GridPager > td > table td {
    padding: 0px 5px 0px 5px;
}

.GridPager > td > table a {
    text-decoration: underline !important;
}

.GridPager > td > table span{
    font-weight:bold;
}

</style>  
<%--<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>--%>
    <!-- Shanna 2011-05-03 PM 02:15新增linkButton => lbtnFile-->
<table id="tb_que" style="border-collapse:separate;">
            <tr>
                <td>
                    <table cellpadding="0" cellspacing="0" border="0" style="width: 820px;">
                        <tr id="trHead" runat="server" visible="false" >
                            <td style="height:100%;  background-image: url('../Common/Images/top_01.gif');background-repeat: no-repeat; background-position:100% 100%;  ">
                                &nbsp;</td>
                            <td style="height:100%; background-image: url('../Common/Images/top.gif');background-repeat: no-repeat;  background-position:100% 100% ;">
                            </td>
                            <td style=" height:100%; background-image: url('../Common/Images/top_02.gif');background-repeat: no-repeat;  background-position:100% 100%;">
                            </td>
                        </tr>
                        <tr id="trHead_3" runat="server" visible="false">
                            <td colspan="3" style="background-image: url('../Common/Images/middle.gif'); padding-left: 2px;
                                padding-right: 2px;">
                                <asp:Image ID="Image1" runat="server" ImageUrl="~/QUE/Common/Images/QueIcon.gif" />
                                <asp:Label ID="lblDesignName" runat="server" Font-Bold="True" Font-Size="Medium"
                                    ForeColor="White"></asp:Label>
                                <asp:Label ID="lblTime" runat="server" ForeColor="White"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" style="background-image: url('../Common/Images/middle_02.gif'); height: 30px; ">
                                <table cellpadding="0" cellspacing="0" border="0">
                                    <tr id="trHead_2" runat="server" align="left">
                                        <td style="background-image: url('../Common/Images/dd_12.gif'); background-repeat: repeat-y; 
                                            width: 815px">
                                            <asp:Image ID="Image5" runat="server" ImageUrl="~/QUE/Common/Images/56.gif" />
                                            <asp:Label ID="lblHead" ForeColor="White" runat="server" Font-Bold="True" meta:resourcekey="lblHeadResource1"
                                                Text="問卷說明"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding-top: 5px; padding-left: 7px; padding-right: 2px;" align="left">
                                            <div style="width: 800px; overflow-x: hidden;">
                                                <asp:TextBox ID="txtHeader" runat="server" Height="70px" meta:resourcekey="txtHeaderResource1"
                                                    TextMode="MultiLine" Width="800px"></asp:TextBox>
                                                <asp:Label ID="lblHeaderText" runat="server" meta:resourcekey="lblHeaderTextResource1"
                                                    Style="width: 800px; word-wrap: break-word;" Visible="False"></asp:Label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding-top: 5px; padding-left: 7px; padding-right: 7px;" align="left">                                            
                                            <uc2:UC_FileCenter runat="server" ID="UC_FileCenter" Editable="false" AllowedMultipleFileSelection="false" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" style="width:15px; height:100%;background-image: url('../Common/Images/bottom_01.gif'); background-repeat: no-repeat;background-position:100% 0%;">
                            &nbsp;</td>
                            <td valign="top" style="background-image: url('../Common/Images/bottom.gif'); background-repeat: no-repeat;background-position:100% 0% ; background-size:790px 16px; " >
                                &nbsp;</td>
                            <td valign="top" style="width:15px; height:100%;background-image: url('../Common/Images/bottom_02.gif'); background-repeat: no-repeat; background-position:100% 0%;">
                                &nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <%--<div runat="server" visible="false">
                <asp:TextBox ID="txtHeader" runat="server" Height="70px" TextMode="MultiLine" Width="100%"
                    meta:resourcekey="txtHeaderResource1"></asp:TextBox>
                <asp:Label ID="lblHeaderText" runat="server" Visible="False" Style="width: 800px;
                    word-wrap: break-word;" BorderColor="#336699" BorderStyle="Solid" BorderWidth="1px"
                    meta:resourcekey="lblHeaderTextResource1"></asp:Label></div>--%>
            <tr runat="server" id="TRHidden" >
                <td >
                    <table style="width: 820px; border: 1px solid gray; background-color: White; border-collapse:separate;">
                        <tr style="background-image: url('../Common/Images/dd_12.gif'); background-repeat: repeat-y; background-position:45% 100%;  width: 100%">
                            <td align="left" style="color: Black;">
                                <table>
                                    <tr>
                                        <td style="padding-top: 1px">
                                            <asp:Image ID="Image2" runat="server" ImageUrl="~/QUE/Common/Images/56.gif" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label4" runat="server" Font-Bold="True" Text="個人資料" ForeColor="White" meta:resourcekey="Label4Resource1"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding:2px 2px 2px 2px;">
                                <asp:DataList ID="listProperty" runat="server" meta:resourcekey="listPropertyResource1"
                                    OnItemDataBound="listProperty_ItemDataBound" RepeatColumns="1" RepeatDirection="Horizontal"
                                    Width="100%">
                                    <AlternatingItemStyle BorderWidth="0px" />
                                    <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="0px" />
                                    <SeparatorStyle BorderWidth="0px" />
                                    <ItemTemplate>
                                        <table cellspacing="0" width="814px" border="0">
                                            <tr>
                                                <td align="left" style="width: 15%;   background-color: #e6ebf1">
                                                    <asp:Label ID="lblSeq" ForeColor="Blue" runat="server" Text=""></asp:Label>
                                                    <asp:Label ID="lblItemName" runat="server" meta:resourcekey="lblItemNameResource1"
                                                        Text='<%# DataBinder.Eval(Container.DataItem,"PROPERTY_NAME") %>'></asp:Label>
                                                    <asp:Label ID="lblItemGuid" runat="server" meta:resourcekey="lblItemGuidResource1"
                                                        Text='<%# DataBinder.Eval(Container.DataItem,"PROPERTY_GUID") %>' Visible="False"></asp:Label>
                                                    <asp:Label ID="lblPropertyType" runat="server" meta:resourcekey="lblPropertyTypeResource1"
                                                        Text='<%# DataBinder.Eval(Container.DataItem,"PROPERTY_TYPE") %>' Visible="False"></asp:Label>
                                                    <asp:Label ID="lblRequired" runat="server" ForeColor="red" Style="margin-left: 10px;" meta:resourcekey="lblRequiredResource1"   Text="(必填)"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td id="td_que">
                                                    <asp:CheckBoxList ID="cblChoice" runat="server" meta:resourcekey="cblChoiceResource1"
                                                        RepeatDirection="Horizontal">
                                                    </asp:CheckBoxList>
                                                    <asp:RadioButtonList ID="rblChoice" runat="server" meta:resourcekey="rblChoiceResource1"
                                                        RepeatDirection="Horizontal">
                                                    </asp:RadioButtonList>
                                                    <div id="divItems" runat="server" style=" word-wrap: break-word; overflow-x: hidden">
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:DataList>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="left">
                    <table style="border: 1px solid gray; background-color: White; width:820px; border-collapse:separate;  " >
                        <tr style="background-image: url('../Common/Images/dd_12.gif'); background-repeat: repeat-y; background-position:45% 100%;
                            width: 100%">
                            <td align="left" style="color: Black;">
                                <table>
                                    <tr>
                                        <td style="padding-top: 1px">
                                            <asp:Image ID="Image3" runat="server" ImageUrl="~/QUE/Common/Images/61.gif" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label3" runat="server" Font-Bold="True" meta:resourcekey="Label3Resource1"
                                                Text="問卷題目" ForeColor="White"></asp:Label>
                                            <asp:Label ID="lblItemCount" runat="server" ForeColor="White" Text="(共{0}題)" meta:resourcekey="lblItemCountResource1"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr >
                            <td align="left" style="width: 820px;">
                                <div id="divItem" runat="server" style="overflow-x: auto; width: 818px; height: 100%;">
                                    <Fast:Grid ID="gridItem" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="True" CssClass="GridItem" PagerStyle-CssClass="GridPager"
                                        PagerStyle-HorizontalAlign="Right"
                                        AutoGenerateColumns="False" BorderWidth="0px" 
                                        DataKeyNames="ITEM_GUID" DataKeyOnClientWithCheckBox="False" 
                                        EnhancePager="False" HorizontalAlign="Center" 
                                        OnRowDataBound="gridItem_RowDataBound" PageSize="15"  ShowHeader="False"
                                         Width="100%" 
                                        onpageindexchanging="gridItem_PageIndexChanging">
                                        <EnhancePagerSettings ShowHeaderPager="false" />
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="序號" meta:resourcekey="TemplateFieldResource1" Visible="false">
                                                <ItemTemplate>
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="lblOrer" runat="server" meta:resourcekey="lblOrerResource1"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblShowRequire" runat="server" ForeColor="Red" meta:resourcekey="lblShowRequireResource1"
                                                                    Text="*"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                                <ItemStyle Width="0%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="問卷題目" meta:resourcekey="TemplateFieldResource2">
                                                <ItemTemplate>
                                                    <uc1:UC_QusItem ID="UC_QusItem1" runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle Width="100%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField meta:resourcekey="TemplateFieldResource3" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblItemGuid" runat="server" meta:resourcekey="lblItemGuidResource2"
                                                        Text='<%#: Eval("ITEM_GUID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField meta:resourcekey="TemplateFieldResource4" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblItemType" runat="server" meta:resourcekey="lblItemTypeResource1"
                                                        Text='<%#: Eval("ITEM_TYPE") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </Fast:Grid>
                                    <br /> 
                                </div>
                                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" EnablePaging="True" MaximumRowsParameterName="intMaxRows"
                                    OldValuesParameterFormatString="original_{0}" SelectCountMethod="QueryItems_Count"
                                    SelectMethod="QueryItems" SortParameterName="strSortExpression" StartRowIndexParameterName="intStartIndex"
                                    TypeName="Ede.Uof.EIP.QUE.QusItemUCO">
                                    <SelectParameters>
                                        <asp:Parameter Name="designMasterGuid" />
                                        <asp:Parameter Name="intStartIndex" />
                                        <asp:Parameter Name="intMaxRows" />
                                        <asp:Parameter Name="strSortExpression" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </td>
                        </tr>
                        <%--<tr><td> <hr  style=" border-style:dotted"/></td></tr>--%>                        <%--<tr><td style="  background-color:#edfafe">
                    <asp:Label ID="Label1" runat="server" Text="問卷到此結束，感謝您耐心填答，煩請檢查有否漏答。 " 
                        Font-Size="Medium"   ></asp:Label></td></tr>--%>
                        
                         <tr id="trRemark" runat="server" style="background-image: url('../Common/Images/dd_12.gif'); background-position:45% 100%;
                            background-repeat: repeat-y; width: 100%">
                            <td align="left" style=" color: White;">
                                <asp:Image ID="Image12" runat="server" ImageUrl="~/QUE/Common/Images/ProIcon.png" />
                                <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="填寫者備註" meta:resourcekey="Label2Resource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding:3px 3px 0px 3px">
                                <div style="width: 810px; overflow-x: hidden;">
                                    <asp:TextBox ID="txtUserRemark" runat="server" Height="70px"
                                        TextMode="MultiLine" Width="100%"></asp:TextBox>
                                   
                                </div>
                            </td>
                        </tr>
                        
                        
                        <tr id="trFoot" runat="server" style="background-image: url('../Common/Images/dd_12.gif');
                            background-repeat: repeat-y; width: 100%">
                            <td align="left" style=" color: White;">
                                <asp:Image ID="Image4" runat="server" ImageUrl="~/QUE/Common/Images/ProIcon.png" />
                                <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="問卷結束語" meta:resourcekey="Label1Resource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding:3px 3px 0px 3px">
                                <div style="width: 810px; overflow-x: hidden;">
                                    <asp:TextBox ID="txtFooter" runat="server" Height="70px" meta:resourcekey="txtFooterResource1"
                                        TextMode="MultiLine" Width="100%"></asp:TextBox>
                                    <asp:Label ID="lblFooterText" runat="server" ForeColor="Black" meta:resourcekey="lblFooterTextResource1"
                                        Style="width: 810px; background-color: #edfafe; word-wrap: break-word;" Visible="False"></asp:Label>
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <asp:HiddenField ID="hiddenDesignMasterGuid" runat="server" />
        <asp:HiddenField ID="hiddenOrder" runat="server" />
        <asp:HiddenField ID="hiddenAllowModifyItem" Value="true" runat="server" />
        <asp:HiddenField ID="hiddenAllowHeaderFooter" Value="true" runat="server" />
        <asp:HiddenField ID="hiddenAllowModifyProperty" Value="true" runat="server" />
        <asp:HiddenField ID="hiddenUserGuid" Value="true" runat="server" />
        <asp:HiddenField ID="hiddenIsShowAllAnsopt" Value="true" runat="server" />
        <asp:HiddenField ID="hiddenIsEdit" Value="true" runat="server" />
        <asp:HiddenField ID="hiddenIsView" Value="true" runat="server" />
        <asp:HiddenField ID="hiddenIsFill" Value="true" runat="server" />
        <asp:HiddenField ID="hiddenFillPropery" runat="server" />
        <asp:HiddenField ID="hiddenFillAns" Value="false" runat="server" />
        <asp:HiddenField ID="hiddenIsQueryItemDetail" Value="false" runat="server" />
        <asp:HiddenField ID="hiddenAllowPage" Value="false" runat="server" />        
       <asp:HiddenField ID="hidDetailGuid" runat="server" />
       <asp:HiddenField ID="hidShowUserRemark" runat="server" />
<asp:Label ID="lblItemCountFormat" runat="server" Visible="false" Text="(共{0}題)" meta:resourcekey="lblItemCountFormatResource1"></asp:Label>
<%--   </ContentTemplate>
</asp:UpdatePanel>--%>
