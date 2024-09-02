<%@ Page Language="C#" AutoEventWireup="true" Inherits="DMS_DocStore_DocStoreCommonList" Culture="auto"  UICulture="auto" Codebehind="DocStoreCommonList.aspx.cs" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" >
        <title></title>
        <style type="text/css">    				
            .action_over { CURSOR: hand; COLOR: red; TEXT-DECORATION: underline }
            .action_out { COLOR: #3366cc }
        </style>
    

    </head>
    <body style="background-color:transparent; padding-right: 0px; padding-left: 10px; padding-bottom: 0px; margin: 0px; padding-top: 0px;" >

        <script type="text/javascript">
            function CheckIsDownload(DocID)
            {
                var data = [DocID];
                var result = $uof.pageMethod.sync("CheckIsDownload", data);
                if (result == "false")
                {   
                    var Status = "false"
                    $uof.dialog.open2("~/DMS/DocStore/DocGrade.aspx", args.get_item(), "", 550, 600, function (returnValue) { return false; }, { "docid": DocID, "status": Status });
                    return false;
                }
                else
                {
                    var Status = "true"
                    $uof.dialog.open2("~/DMS/DocStore/DocGrade.aspx", args.get_item(), "", 550, 600, function (returnValue) { return false; }, { "docid": DocID, "status": Status });
                    return true;
                }
            }
        </script>
        <form id="form1" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:Image ID="imgCommonUse" runat="server" />
            <asp:Label ID="labCommon" runat="server" Font-Bold="True" Font-Italic="True" CssClass="SizeL" Text="常用文件" meta:resourcekey="labCommonResource1"></asp:Label><br />
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td>
                        <telerik:RadToolBar ID="RadFolderToolbar1" runat="server" Width="100%" OnButtonClick="RadFolderToolbar1_ButtonClicked" OnClientButtonClicking="RadFolderToolbar1_Click" meta:resourcekey="barMainResource1">
                            <Items>
                                <telerik:RadToolBarButton runat="server" Enabled="true" CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif" ImageUrl="~/Common/Images/Icon/icon_m03.gif" Text="取消" Value="Delete" meta:resourcekey="TBarButtonResource2">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s1" meta:resourcekey="RadToolBarButtonResource2" />
                            </Items>
                        </telerik:RadToolBar>
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <Fast:Grid ID="Grid2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="True"
                                    AutoGenerateColumns="False" DataKeyNames="DOC_ID"
                                    DataKeyOnClientWithCheckBox="False" OnPageIndexChanging="Grid2_PageIndexChanging"
                                    OnRowDataBound="Grid2_RowDataBound"
                                    Width="100%" EnhancePager="True" PageSize="15" OnSorting="Grid2_Sorting">
                                    <Columns>
                                        <asp:TemplateField HeaderText="文件編號" SortExpression="DOC_SERIAL" meta:resourcekey="TemplateFieldResource8">
                                            <EditItemTemplate>
                                                <asp:TextBox runat="server" Text='<%# Bind("DOC_SERIAL") %>' ID="TextBox1"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <span style="word-break: break-all; width: 80px;">
                                                    <asp:Label runat="server" Text='<%# Bind("DOC_SERIAL") %>' ID="Label1"></asp:Label>
                                                </span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="文件名稱" meta:resourcekey="TemplateFieldResource5" SortExpression="DOC_NAME">
                                            <ItemTemplate>
                                                <span style="word-break: break-all; width: 200px;">
                                                    <asp:Image ID="imgStar1" runat="server" ImageUrl="~/DMS/images/ratnull.gif"></asp:Image>
                                                    <asp:Image ID="docIcon" runat="server" ImageUrl="~/DMS/images/icon/unknown.gif" ></asp:Image>
                                                    &nbsp;
                                                    <asp:LinkButton ID="lbtnDLFile" runat="server" OnClick="lbtnDLFile_Click" Text='<%# Bind("DOC_NAME") %>'></asp:LinkButton></span>                                                    
                                            </ItemTemplate>
                                            <ItemStyle Width="200px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="作者" meta:resourcekey="TemplateFieldResource6" SortExpression="DOC_AUTHOR">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="lblAuthor" ></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="PUBLISH_MANUAL_VERSION" HeaderText="版本" meta:resourcekey="BoundFieldResource4" SortExpression="PUBLISH_MANUAL_VERSION" />
                                        <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource7">
                                            <EditItemTemplate>
                                                <asp:TextBox runat="server" ID="TextBox2" ></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" ID="lbtnInfo" Text="資訊" ForeColor="Blue" meta:resourcekey="lbtnInfoResource2"></asp:LinkButton>
                                                &nbsp;<asp:LinkButton runat="server" ID="lbtnSubscribe" Text="訂閱" ForeColor="Blue" meta:resourcekey="lbtnSubscribeResource2"></asp:LinkButton>
                                                &nbsp;&nbsp;<asp:LinkButton runat="server" ID="lbtnAnalysis" Text="統計" ForeColor="Blue" meta:resourcekey="lbtnAnalysisResource2"></asp:LinkButton>
                                                &nbsp;&nbsp;<asp:LinkButton runat="server" ID="lbtnScore" Text="評分" ForeColor="Blue" meta:resourcekey="lbtnScoreResource2"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <EnhancePagerSettings ShowHeaderPager="True" />
                                </Fast:Grid>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
            <asp:Label ID="lblConfirmDelete" runat="server" Text="確定要取消?" Visible="False" meta:resourcekey="lblConfirmDeleteResource2"></asp:Label>
            <asp:Label ID="lblConfirmDeleteUse" runat="server" Text="確定要將此常用列表取消?" Visible="False" meta:resourcekey="lblConfirmDeleteUseResource2"></asp:Label>            
            <asp:HiddenField ID="hdAppPath" runat="server" />
            <asp:HiddenField ID="FASTReturnValue" runat="server" Value="[DefaultNullValue]" />
        </form>
    </body>
    <script type="text/jscript">
    

    function RadFolderToolbar1_Click(sender, args) {
        //Add code to handle your event here.
        var toolBar = sender;
        var button = args.get_item();
        if (button.get_value() == "Delete") {
            if (confirm('<%=lblConfirmDelete.Text %>') == false)
                args.set_cancel(true);
        }
    }

    function ConfirmDel()
    {
        if(window.confirm("<%=lblConfirmDeleteUse.Text %>"))    
            return true;
        else
        return false;
      
    }
    
    </script>    
</html>
