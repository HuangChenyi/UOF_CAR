<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UC_QusMobile.ascx.cs" Inherits="QUE_Common_UC_QusMobile" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc2" TagName="UC_FileCenter" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="UC_QusItem.ascx" TagName="UC_QusItem" TagPrefix="uc1" %>

    <style type="text/css">
        .formTitle {
            background-image: url(../../App_Themes/DefaultTheme/images/po_06.gif);
            text-align: center;
            height: 20px;
        }

        .formInfo {
            background-color: White;
            vertical-align: top;
        }
        /*common*/

        .RadForm_MetroTouch .rfdSelect, .RadForm_Silk .rfdSelect, .RadForm_Silk .rfdSelectBox {
            font-size: 100% !important;
        }

        .rfdSelectBox li {
            height: 1.8em;
            line-height: 1em;
        }

        .RadForm_MetroTouch label {
            font-size: 100% !important;
        }

            .RadForm_MetroTouch label.title {
                font-size: 100% !important;
                font-weight: 700 !important;
                margin: 0 0 .28571429rem !important;
            }

        .pageLayout {
        }

            .pageLayout h1,
            .pageLayout h2 {
                font-weight: normal;
            }

            .pageLayout h1 {
                margin: 0;
                font-size: 133%;
            }

            .pageLayout h2 {
                font-size: 180%;
            }

            .pageLayout h3 {
                font-size: 133%;
            }

            .pageLayout .riTextBox {
                width: 100%;
                -moz-box-sizing: border-box;
                -webkit-box-sizing: border-box;
                box-sizing: border-box;
            }

            .pageLayout .radios td {
                padding-right: 15px;
            }

            .pageLayout .t-row {
                padding-bottom: 15px;
            }
            /*header*/
            .pageLayout .header {
                /*background-color: #e2e2dc;*/
                /*background-color: #ee6e73;*/
                background-color: #F6511D;
                color: #ffffff;
                line-height: 40px;
                width: 100%;
            }

                .pageLayout .header p {
                    font-size: 1.43em;
                }

                .pageLayout .header img {
                    width: 100%;
                    display: block;
                }

        /*content*/
        /*.content {
    text-align: center;
}*/
        .blockheader {
            padding: .5rem 1rem;
            box-shadow: none;
            border-top: 1px solid #d4d4d5;
            border-left: 1px solid #d4d4d5;
            border-right: 1px solid #d4d4d5;
            margin: 20px 0 0 0;
            border-radius: .28571429rem .28571429rem 0 0;
            background: #7FB800;
            color: #fff;
        }

            .blockheader + .content {
                border: 1px solid #d4d4d5;
                border-radius: 0 0 .28571429rem .28571429rem;
                padding: 1em;
            }

        .content.nopadding {
            padding: 1em 0;
        }

        .content .t-container {
            padding: 0;
        }

        .t-container .t-container-static .t-col {
            padding: 0px;
        }

        .t-container.t-container-static {
            padding: 15px 0px 0px 0px !important;
        }



        @media only screen and (min-width: 769px) {

            /*.pageLayout .header {
                padding: 4% 4% 0;
            }*/
            .pageLayout .header {
                text-align: center;
            }
        }

        @media only screen and (max-width: 768px) {

            .pageLayout .header {
                text-align: center;
            }
        }

        .MobileFormList {
            background-clip: padding-box;
            border-bottom-left-radius: 5px;
            border-bottom-right-radius: 5px;
            border-top-left-radius: 5px;
            border-top-right-radius: 5px;
            color: rgb(51, 51, 51);
            display: block;
            font-family: sans-serif;
            font-size: 14px;
            line-height: 20.8px;
            list-style-image: none;
            list-style-position: outside;
            list-style-type: none;
            margin-bottom: 0px;
            margin-left: 0px;
            margin-right: 0px;
            margin-top: 0px;
            padding-bottom: 0px;
            padding-left: 0px;
            padding-right: 0px;
            padding-top: 0px;
            text-shadow: rgb(243, 243, 243) 0px 1px 0px;
        }

            .MobileFormList .group {
                cursor: default;
                display: block;
                font-size: 1.0em;
                font-weight: bold;
                line-height: 1.3em;
                list-style-image: none;
                list-style-position: outside;
                list-style-type: none;
                margin-bottom: 0px;
                margin-left: 0px;
                margin-right: 0px;
                margin-top: 0px;
                outline-color: rgb(51, 51, 51);
                outline-style: none;
                outline-width: 0px;
                overflow-x: hidden;
                overflow-y: hidden;
                padding-bottom: 7px;
                padding-left: 4px;
                padding-right: 8px;
                padding-top: 7px;
                position: relative;
                text-align: left;
                border-bottom-color: #999;
                border-bottom-style: solid;
                border-bottom-width: 1.5px;
            }

            .MobileFormList .item {
                font-size: 1em;
                line-height: 1.0em;
                display: block;
                list-style-image: none;
                list-style-position: outside;
                list-style-type: none;
                margin-bottom: 0px;
                margin-left: 0px;
                margin-right: 0px;
                margin-top: 0px;
                overflow-x: visible;
                overflow-y: visible;
                padding-bottom: 0px;
                padding-left: 0px;
                padding-right: 0px;
                padding-top: 0px;
                position: relative;
                text-align: left;
                text-shadow: rgb(243, 243, 243) 0px 1px 0px;
            }

                .MobileFormList .item div {
                    border-top-color: rgb(221, 221, 221);
                    border-top-style: solid;
                    border-top-width: 1px;
                    color: rgb(51, 51, 51);
                    display: block;
                    font-size: 16px;
                    line-height: 20.8px;
                    list-style-image: none;
                    list-style-position: outside;
                    list-style-type: none;
                    margin-bottom: 0px;
                    margin-left: 0px;
                    margin-right: 0px;
                    margin-top: 0px;
                    overflow-x: hidden;
                    overflow-y: hidden;
                    padding-bottom: 11.2px;
                    padding-left: 16px;
                    padding-right: 8px;
                    padding-top: 11.2px;
                    position: relative;
                    text-align: left;
                    text-decoration: none;                    
                }

                    .MobileFormList .item div span:nth-child(1) {
                        display: block;
                        font-size: 95%;
                        float: left;
                        margin-bottom: 3px;
                        text-shadow: rgb(243, 243, 243) 0px 1px 0px;
                        font-weight: 600;
                    }

                    .MobileFormList .item div span:nth-child(2) {
                        display: block;
                        font-size: 95%;
                        float: right;
                       font-weight: normal;
                    }

                    .MobileFormList .item div span:nth-child(3) {
                        display: block;
                        font-size: 90%;
                        clear: both;
                        color:rgba(51,51,51,0.9);
                    }

                    .MobileFormList .item div span:nth-child(4) {
                        display: block;
                        font-size: 90%;
                        font-weight: normal;
                    }
    </style>
<script type="text/javascript">
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
<div class="pageLayout" id="layout" runat="server">
<telerik:RadPageLayout runat="server"  GridType="Fluid" ShowGrid="True" HtmlTag="None" ID="rplTable" EnableAjaxSkinRendering="False" EnableEmbeddedBaseStylesheet="True" EnableEmbeddedScripts="False" EnableEmbeddedSkins="False" meta:resourcekey="rplTableResource1" RegisterWithScriptManager="True" RenderMode="Classic">
    <telerik:LayoutRow RowType="Generic" ID="layoutTable" runat="server">
        <Rows>
            <telerik:LayoutRow RowType="Generic" CssClass="header">
                <Rows>
                    <telerik:LayoutRow RowType="Container" WrapperHtmlTag="Div">
                        <Columns>
                            <telerik:LayoutColumn Span="12">
                                    <h1 style="text-align:left">
                                        <asp:Label ID="lblDesignName" runat="server"></asp:Label>
                                        <asp:Label ID="lblTime" runat="server" Visible="false"></asp:Label>
                                    </h1>
                            </telerik:LayoutColumn>
                        </Columns>
                    </telerik:LayoutRow>
                </Rows>
            </telerik:LayoutRow>
            <telerik:LayoutRow RowType="Generic" CssClass="content">
                <Rows>
                    <telerik:LayoutRow RowType="Container" WrapperHtmlTag="Div" ID="trHead_2">
                        <Columns>
                            <telerik:CompositeLayoutColumn Span="12">
                                <Content>
                                    <h3 class="blockheader">
                                        <asp:Label ID="lblHead" runat="server" Font-Bold="True" Text="問卷說明" meta:resourcekey="lblHeadResource1"></asp:Label>               
                                    </h3>   
                                </Content>
                                <Rows>
                                    <telerik:LayoutRow RowType="Container" CssClass="content">
                                        <Columns>
                                            <telerik:LayoutColumn Span="12">
                                                <asp:TextBox ID="txtHeader" runat="server" Rows="5" meta:resourcekey="txtHeaderResource1" TextMode="MultiLine" Width="100%"></asp:TextBox>
                                            </telerik:LayoutColumn>
                                            <telerik:LayoutColumn Span="12">
                                                <asp:Label ID="lblHeaderText" runat="server" Style="word-wrap: break-word;" Visible="False"></asp:Label>
                                            </telerik:LayoutColumn>
                                            <telerik:LayoutColumn Span="12">
                                                <uc2:UC_FileCenter runat="server" ID="UC_FileCenter" Editable="false" AllowedMultipleFileSelection="false" />
                                            </telerik:LayoutColumn>
                                        </Columns>
                                    </telerik:LayoutRow>
                                 </Rows>
                            </telerik:CompositeLayoutColumn>
                        </Columns>
                    </telerik:LayoutRow>
                    <telerik:LayoutRow RowType="Container" WrapperHtmlTag="Div" ID="TRHidden">
                        <Columns>
                            <telerik:CompositeLayoutColumn Span="12">
                                <Content>
                                    <h3 class="blockheader">
                                        <asp:Label ID="Label4" runat="server" Font-Bold="True" Text="個人資料" meta:resourcekey="Label4Resource1"></asp:Label>
                                    </h3>
                                </Content>
                                <Rows>
                                    <telerik:LayoutRow RowType="Container" CssClass="content">
                                        <Columns>
                                            <telerik:CompositeLayoutColumn Span="12">
                                                <Content>
                                                    <asp:DataList ID="listProperty" runat="server" meta:resourcekey="listPropertyResource1"
                                                    OnItemDataBound="listProperty_ItemDataBound" RepeatColumns="1" RepeatDirection="Vertical"
                                                    Width="100%">
                                                    <AlternatingItemStyle BorderWidth="0px" />
                                                    <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="0px" />
                                                    <SeparatorStyle BorderWidth="0px" />
                                                    <ItemTemplate>
                                                        <table cellspacing="0" width="100%" border="0">
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
                                                                        RepeatDirection="Vertical">
                                                                    </asp:CheckBoxList>
                                                                    <asp:RadioButtonList ID="rblChoice" runat="server" meta:resourcekey="rblChoiceResource1"
                                                                        RepeatDirection="Vertical">
                                                                    </asp:RadioButtonList>
                                                                    <div id="divItems" runat="server" style="width: 100%; word-wrap: break-word;">
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ItemTemplate>
                                                </asp:DataList>
                                                </Content>
                                            </telerik:CompositeLayoutColumn>
                                        </Columns>
                                    </telerik:LayoutRow>
                                </Rows>
                            </telerik:CompositeLayoutColumn>
                        </Columns>
                    </telerik:LayoutRow>
                    <telerik:LayoutRow RowType="Container" WrapperHtmlTag="Div">
                        <Columns>
                            <telerik:CompositeLayoutColumn Span="12">
                                <Content>
                                    <h3 class="blockheader">                                                
                                        <asp:Label ID="Label3" Text="問卷題目"  runat="server" meta:resourcekey="Label3Resource1"></asp:Label>
                                        <asp:Label ID="lblItemCount" runat="server"></asp:Label>
                                    </h3>
                                </Content>
                                <Rows>
                                    <telerik:LayoutRow RowType="Container" CssClass="content">
                                        <Columns>
                                            <telerik:CompositeLayoutColumn Span="12">
                                                <Content>
                                                    <Fast:Grid ID="gridItem" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="True" PagerStyle-CssClass="GridPager"
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
                                                </Content>
                                            </telerik:CompositeLayoutColumn>
                                        </Columns>
                                    </telerik:LayoutRow>
                                </Rows>
                            </telerik:CompositeLayoutColumn>
                        </Columns>
                    </telerik:LayoutRow>
                    <telerik:LayoutRow RowType="Container" WrapperHtmlTag="Div" ID="trRemark">
                        <Columns>
                            <telerik:CompositeLayoutColumn Span="12">
                                <Content>
                                    <h3 class="blockheader">
                                        <asp:Label ID="Label2" runat="server" Text="填寫者備註" meta:resourcekey="Label2Resource1"></asp:Label>
                                    </h3>
                                </Content>
                                <Rows>
                                    <telerik:LayoutRow RowType="Container" CssClass="content">
                                        <Columns>
                                            <telerik:CompositeLayoutColumn Span="12">
                                                <Content>
                                                    <asp:TextBox ID="txtUserRemark" runat="server" Rows="5" TextMode="MultiLine" Width="100%"></asp:TextBox>
                                                </Content>
                                            </telerik:CompositeLayoutColumn>
                                        </Columns>
                                    </telerik:LayoutRow>
                                </Rows>
                            </telerik:CompositeLayoutColumn>
                        </Columns>      
                    </telerik:LayoutRow>
                    <telerik:LayoutRow RowType="Container" WrapperHtmlTag="Div" ID="trFoot">
                        <Columns>
                            <telerik:CompositeLayoutColumn Span="12">
                                <Content ID="qusEndTitle">
                                    <h3 class="blockheader">
                                        <asp:Label ID="Label1" runat="server" Text="問卷結束語" meta:resourcekey="Label1Resource1"></asp:Label>
                                    </h3>
                                </Content>
                                <Rows>
                                    <telerik:LayoutRow RowType="Container" CssClass="content">
                                        <Columns>
                                            <telerik:CompositeLayoutColumn Span="12">
                                                <Content>
                                                    <asp:TextBox ID="txtFooter" runat="server" Rows="5" TextMode="MultiLine" Visible="false"></asp:TextBox>
                                                     <asp:Label ID="lblFooterText" runat="server" ForeColor="Black" meta:resourcekey="lblFooterTextResource1"
                                                        Style="word-wrap: break-word;" Visible="False"></asp:Label>
                                                </Content>
                                            </telerik:CompositeLayoutColumn>
                                        </Columns>
                                    </telerik:LayoutRow>
                                </Rows>
                            </telerik:CompositeLayoutColumn>
                        </Columns>
                     </telerik:LayoutRow>              
                </Rows>
            </telerik:LayoutRow>
        </Rows>
    </telerik:LayoutRow>
</telerik:RadPageLayout>
</div>

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
<asp:Label ID="lblItemCountFormat" runat="server" Visible="False" Text="(共{0}題)" meta:resourcekey="lblItemCountFormatResource1"></asp:Label>