<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UC_DevolveForumArticle.ascx.cs" Inherits="Ede.Uof.Web.EIP.Calendar.DevolveForum.UC_DevolveForumArticle" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>

<script id="UC_DevolveForumArticle" type="text/javascript">
    var scrollTop = -1;
    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(ForumEndRequestHandler);

    function ForumEndRequestHandler(sender, args) {
        if (scrollTop != -1) {
            if (!$('html,body').scrollTop)
                $('html,body').animate({ scrollTop: scrollTop }, 'fast');
            else
                $('html,body').animate({ scrollTop: scrollTop }, 'fast');

            scrollTop = -1;
        }
    } 

    function SetScrollLocation(location) {
        scrollTop = location;
    }
</script>

<style type="text/css">
    div.JustAddBorder table tr td {
        border-width: 1px;
        border-style: solid;
    }
</style>
<table border="0" class="table2" style="width: 100%">
    <tr>
        <td colspan="2" style="width: 100%">
            <Ede:Grid ID="Grid1" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
                AutoGenerateColumns="False" Width="100%"
                OnRowDataBound="Grid1_RowDataBound" DataKeyNames="ARTICLE_GUID"
                OnRowDeleted="Grid1_RowDeleted" OnRowDeleting="Grid1_RowDeleting" AllowPaging="True"
                OnPageIndexChanging="Grid1_PageIndexChanging"
                SkinID="ForumStyle" DataKeyOnClientWithCheckBox="False" CustomDropDownListPage="False" DefaultSortDirection="Ascending" EmptyDataText="No data found" EnhancePager="True" KeepSelectedRows="False" meta:resourcekey="Grid1Resource1" SelectedRowColor="" UnSelectedRowColor="">
                <EnhancePagerSettings FirstImageUrl="" FirstAltImageUrl="" PreviousImageUrl="" NextImageUrl="" LastImageUrl="" LastAltImage="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageInfoCssClass="" PageRedirectCssClass="" NextIAltImageUrl="" PreviousAltImageUrl="" ShowHeaderPager="True"></EnhancePagerSettings>

                <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                <Columns>
                    <asp:TemplateField meta:resourcekey="TemplateFieldResource1">
                        <HeaderTemplate>
                            <table class="table2" style="width: 100%; background-image: url(<%=themePath %>/images/headerbg.gif);" border="0">
                                <tbody>
                                    <tr>
                                        <td class="td2" style="width: 250px; text-align: left">
                                            <asp:Label runat="server" Text="作者" class="j" ID="Label7" meta:resourcekey="Label7Resource1"></asp:Label>
                                        </td>
                                        <td class="td2">
                                            <table style="width: 100%; text-align: left" border="0">
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <asp:Label runat="server" Text="標題:" class="j" ID="label29" meta:resourcekey="label29Resource1"></asp:Label>
                                                            <asp:LinkButton runat="server" ID="lbtnSubject" class="j" meta:resourcekey="lbtnSubjectResource1"></asp:LinkButton>
                                                        </td>
                                                        <td>
                                                            <div style="text-align: right">
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table style="width: 100%; border: 0; color: #000000;">
                                <tbody>
                                    <tr>
                                        <td class="td2" style="text-align: left; vertical-align: top; background-color: #f6f6f6; width: 250px;">
                                            <table style="width: 250px;">
                                                <tr>
                                                    <td style="vertical-align: top; text-align: left; width: 95%;">
                                                        <asp:Image runat="server" Width="100px" Height="100px" ID="Image1" meta:resourcekey="Image1Resource1"></asp:Image>
                                                    </td>
                                                    <td style="vertical-align: top; text-align: right; width: 5%">
                                                        <asp:Label runat="server" ForeColor="#663333" Text='<%#:Eval("FLOOR") %>' ID="lblFloor" meta:resourcekey="lblFloorResource1"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label runat="server" Text="張貼者：" ID="Label2" meta:resourcekey="Label2Resource1"></asp:Label>
                                                        <asp:Label runat="server" ID="lblAnnounce" meta:resourcekey="lblAnnounceResource1"></asp:Label>
                                                        <br />
                                                        <asp:Label runat="server" Text="張貼時間：" ID="Label5" meta:resourcekey="Label5Resource1"></asp:Label>
                                                        <asp:Label runat="server" ID="lblPosttime" meta:resourcekey="lblPosttimeResource1"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td class="td2" style="vertical-align: top; text-align: right; width: 100%;">
                                            <table cellspacing="0" cellpadding="0" style="width: 100%; border: 0;">
                                                <tbody>
                                                    <tr>
                                                        <td style="text-align: left"></td>
                                                        <td style="width: 50%; text-align: right">
                                                            <asp:LinkButton runat="server" ID="lbtnReply" Text="回覆" OnClick="lbtnReply_Click" >
                                                                <img border="0" height="16" width="16" src="../../../Common/Images/Icon/icon_s02.gif" />
                                                                <asp:Label runat="server" Text="回覆" ID="Label1" meta:resourcekey="Label1Resource1"></asp:Label>
                                                            </asp:LinkButton>
                                                            <asp:LinkButton runat="server" ID="lbtnReply2" OnClick="lbtnReply2_Click" >
                                                                <img border="0" height="16" width="16" src="../../../Common/Images/Icon/icon_s03.gif" />
                                                                <asp:Label runat="server" Text="引言回覆" ID="Label3" meta:resourcekey="Label3Resource1"></asp:Label>
                                                            </asp:LinkButton>
                                                            <asp:LinkButton runat="server" ID="lbtnModify" OnClick="lbtnModify_Click" >
                                                                <img border="0" height="16" width="16" src="../../../Common/Images/Icon/icon_s04.gif" />
                                                                <asp:Label runat="server" Text="修改" ID="Label4" meta:resourcekey="Label4Resource1"></asp:Label>
                                                            </asp:LinkButton>
                                                            <asp:LinkButton runat="server" ID="lbtnDelete" CommandName="Delete" >
                                                                <img border="0" height="16" width="16" src="../../../Common/Images/Icon/icon_s05.gif" />
                                                                <asp:Label runat="server" Text="刪除" ID="Label6" meta:resourcekey="Label6Resource1"></asp:Label>
                                                            </asp:LinkButton>
                                                            <asp:HiddenField ID="hideDeleteStatus" runat="server" />
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <br />
                                            <div runat="server" id="div1" align="left" class="editorcontentstyle JustAddBorder">
                                                <asp:Label ID="lblContext" runat="server" meta:resourcekey="lblContextResource1"></asp:Label>
                                            </div>
                                            <br />
                                            <div style="text-align: left; vertical-align: bottom">
                                                <asp:Panel ID="lastModifyPanel" runat="server" meta:resourcekey="lastModifyPanelResource1">
                                                    <asp:Label runat="server" Text="最後修改：" ID="lblModifytimeText" meta:resourcekey="lblModifytimeTextResource1"></asp:Label>
                                                    <asp:Label runat="server" ID="lblModifier" meta:resourcekey="lblModifierResource1"></asp:Label>
                                                    <asp:Label runat="server" ID="lblModifytime" meta:resourcekey="lblModifytimeResource1"></asp:Label>
                                                </asp:Panel>
                                            </div>
                                            <br />
                                            <div style="text-align: left; vertical-align: bottom"></div>
                                            <br />
                                            <div align="left">
                                                <asp:Label runat="server" Text="附件：" ID="lblAttachText" meta:resourcekey="lblAttachTextResource1"></asp:Label>
                                                &nbsp;
                                                <uc1:UC_FileCenter runat="server" ID="Uc_FileCenter1" Editable="false" ModuleName="WKF" ProxyEnabled="true" />
                                            </div>
                                            <br />
                                            <table cellspacing="0" cellpadding="0" style="text-align: left" border="0">
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <img src="<%=themePath %>/images/pen.gif" border="0" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 500px; word-wrap: break-word">
                                                            <pre>                                                                <asp:Label runat="server" ID="lblSign" meta:resourcekey="lblSignResource1" ></asp:Label>
                                                            </pre>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </Ede:Grid>
        </td>
    </tr>
</table>


<asp:Label ID="lblReplayTitle" runat="server" Text="回覆討論" Visible="False" meta:resourcekey="lblReplayTitleResource1"></asp:Label>
<asp:Label ID="msgDelconfirm" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="msgDelconfirmResource1"></asp:Label>
<asp:Label ID="msgContentdeleted" runat="server" Text="內容已被刪除" Visible="False" meta:resourcekey="msgContentdeletedResource1"></asp:Label>
<asp:Label ID="msgAnonymous" runat="server" Text="匿名" Visible="False" meta:resourcekey="msgAnonymousResource1"></asp:Label>
<asp:HiddenField ID="hidRcdLock" runat="server" />
<asp:HiddenField ID="hidGoToLastArticle" runat="server" />
<asp:HiddenField ID="hidShowPage" runat="server" />
<asp:HiddenField ID="hidUserName" runat="server" />
<asp:HiddenField ID="hidUserGuid" runat="server" />
<asp:HiddenField ID="hidDevolveStatus" runat="server" />
<asp:HiddenField ID="hideBoardId" runat="server" />
<asp:HiddenField ID="hideBoardName" runat="server" />
<asp:HiddenField ID="hideDevolveGuid" runat="server" />
<asp:HiddenField ID="hideSubject" runat="server" />
<asp:HiddenField ID="hideSubjectType" runat="server"  Value="Default"/>
<asp:HiddenField ID="hideBoardChanged" runat="server" Value="0" />
<asp:HiddenField ID="hideSubjectChanged" runat="server" Value="0" />
<asp:HiddenField ID="hideUserGUID" runat="server" />
<asp:HiddenField ID="hideSort" runat="server" />
<asp:HiddenField ID="hideOrderColumn" runat="server" />
<asp:HiddenField ID="hideOrderDirection" runat="server" />
