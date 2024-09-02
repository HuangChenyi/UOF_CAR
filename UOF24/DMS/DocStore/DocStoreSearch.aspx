<%@ Page Language="C#" AutoEventWireup="true" Inherits="DMS_DocStore_DocStoreSearch" Culture="auto" UICulture="auto" Codebehind="DocStoreSearch.aspx.cs" %>


<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
</head>


<body style="background-color: transparent; padding-right: 0px; padding-left: 10px; padding-bottom: 0px; margin: 0px; padding-top: 0px;">
    <script>
        function stopParentfn() {

            if (typeof parent.closeLoadDivForSearch != "undefined") {
                parent.closeLoadDivForSearch();
            }
        }
    </script>
    <form id="form1" runat="server">
        <div>
            <asp:Image ID="imgSearch" runat="server" />
            <asp:Label ID="labCommon" runat="server" Font-Bold="True" Font-Italic="True" CssClass="SizeL" Text="全文檢索" meta:resourcekey="labCommonResource1"></asp:Label>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                <asp:Label ID="labOrderType" runat="server" Text="排序：" meta:resourcekey="labOrderTypeResource1"></asp:Label><asp:DropDownList
                                    ID="ddlSearchOrder" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlSearchOrder_SelectedIndexChanged"
                                    Width="130px">
                                    <asp:ListItem Value="filename" meta:resourcekey="ListItemResource1">文件檔名</asp:ListItem>
                                    <asp:ListItem Value="docsize" meta:resourcekey="ListItemResource2">文件大小</asp:ListItem>
                                    <asp:ListItem Value="FolderPath" meta:resourcekey="ListItemResource3">文件路徑</asp:ListItem>
                                    <asp:ListItem Value="ModifyDate" meta:resourcekey="ListItemResource4">發佈時間</asp:ListItem>
                                    <asp:ListItem Value="docAuthor" meta:resourcekey="ListItemResource5">作者</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <Fast:Grid ID="dgSearchList" runat="server" AllowPaging="True" AllowSorting="True"
                                    AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False"
                                    DataKeyOnClientWithCheckBox="False" EnhancePager="True"
                                    OnPageIndexChanging="dgSearchList_PageIndexChanging" OnRowDataBound="dgSearchList_RowDataBound"
                                    PageSize="12" ShowHeader="False">
                                    <EnhancePagerSettings
                                        ShowHeaderPager="True" />
                                    <Columns>
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>

                                                <table style="TABLE-LAYOUT: fixed; WIDTH: 795px;" class="NormalPopTable" cellspacing="0" bordercolordark="#ffffff" bgcolor="#cccccc" bordercolorlight="#666666" border="1">
                                                    <tbody>
                                                        <tr>
                                                            <td style="WIDTH: 170px; BACKGROUND-COLOR: white; WORD-WRAP: break-word" height="156" rowspan="4">
                                                                <br />
                                                                <asp:Label ID="lanNum" runat="server" Text="1" Font-Bold="True">
                                                                </asp:Label>
                                                                <asp:Image ID="docIcon" runat="server" __designer:wfdid="w2"></asp:Image>&nbsp;
                                                                <asp:LinkButton ID="LinkBtTitle" runat="server" Text='<%# Bind("DOC_NAME") %>' __designer:wfdid="w3">
                                                                </asp:LinkButton>
                                                            </td>

                                                            <td style="WIDTH: 120px" class="PopTableLeftTD" align="right">
                                                                <asp:Label ID="Label5" runat="server" meta:resourcekey="Label5Resource1" Text="文件版本：" Font-Bold="True" ForeColor="Black" __designer:wfdid="w36"></asp:Label>
                                                            </td>
                                                            <td style="WIDTH: 180px" class="PopTableRightTD">
                                                                <asp:Image ID="imgVer" runat="server" __designer:wfdid="w5"></asp:Image>
                                                                <asp:Label ID="labVersion" runat="server" Text='<%# Bind("MANUAL_VERSION") %>' __designer:wfdid="w6"></asp:Label></td>
                                                            <td style="WIDTH: 120px" class="PopTableLeftTD" align="right">
                                                                <asp:Label ID="Label9" runat="server" meta:resourcekey="Label9Resource1" Text="文件作者：" Font-Bold="True" ForeColor="Black" __designer:wfdid="w7"></asp:Label>
                                                            </td>
                                                            <td style="WIDTH: 180px" class="PopTableRightTD">&nbsp;
                                                                <asp:Label ID="labDocAuthor" runat="server" __designer:wfdid="w8"></asp:Label></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="WIDTH: 120px" class="PopTableLeftTD" align="right">
                                                                <asp:Label ID="Label7" runat="server" meta:resourcekey="Label7Resource1" Text="文件大小：" Font-Bold="True" ForeColor="Black" __designer:wfdid="w9"></asp:Label>
                                                            </td>
                                                            <td style="WIDTH: 180px" class="PopTableRightTD">
                                                                <asp:Label ID="labDocSize" runat="server" Text='<%# Bind("DOC_SIZE") %>' __designer:wfdid="w10"></asp:Label></td>
                                                            <td style="WIDTH: 120px" class="PopTableLeftTD" align="right">
                                                                <asp:Label ID="Label8" runat="server" meta:resourcekey="Label8Resource1" Text="發佈時間：" Font-Bold="True" ForeColor="Black" __designer:wfdid="w11"></asp:Label>
                                                            </td>
                                                            <td style="WIDTH: 180px" class="PopTableRightTD">&nbsp;<asp:Label ID="labModifyTime" runat="server" __designer:wfdid="w12"></asp:Label></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="WIDTH: 120px" class="PopTableLeftTD" align="right">
                                                                <asp:Label ID="Label6" runat="server" meta:resourcekey="Label6Resource1" Text="文件路徑：" Font-Bold="True" ForeColor="Black" __designer:wfdid="w13"></asp:Label></td>
                                                            <td style="WIDTH: 180px" class="PopTableRightTD">
                                                                <img src="../images/closed.gif" />
                                                                <asp:Label ID="labFolderPath" runat="server" __designer:wfdid="w14" Visible="false"></asp:Label>
                                                                <asp:HyperLink ID="hyLinkFolderPath" runat="server"></asp:HyperLink>
                                                            </td>
                                                            <td style="width: 120px" class="PopTableLeftTD" align="right">
                                                                <asp:Label ID="Label10" runat="server" meta:resourcekey="Label10Resource1" Text="文件類別："
                                                                    Font-Bold="True" ForeColor="Black" __designer:wfdid="w13"></asp:Label>
                                                            </td>
                                                            <td style="width: 180px" class="PopTableRightTD">&nbsp;<asp:Label ID="lblClassName" runat="server" Text='<%# Bind("CLASS_NAME") %>' __designer:wfdid="w14"></asp:Label>

                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="HEIGHT: 70px" class="PopTableRightTD" colspan="4">
                                                                <asp:Label ID="labSample" runat="server" Text='<%# Bind("SAMPLE_TEXT") %>' __designer:wfdid="w15"></asp:Label></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <br />

                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </Fast:Grid>
                            </td>
                        </tr>
                    </table>

                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:Label ID="labError" runat="server" ForeColor="Red" Text="Index Server 發生錯誤"
                Visible="False" meta:resourcekey="labErrorResource1"></asp:Label><br />
            &nbsp;<asp:HiddenField ID="hdAppPath" runat="server" />
            <asp:HiddenField ID="hdChkAssDate" runat="server" />
            <asp:HiddenField ID="hdDateEnd" runat="server" />
            <asp:HiddenField ID="hdSearchAllClass" runat="server" />
            <asp:HiddenField ID="hdTmpclassValue" runat="server" />
            <asp:HiddenField ID="hdTxtSearch" runat="server" />
            <asp:HiddenField ID="hdSubFileName" runat="server" />
            <asp:HiddenField ID="hdChkSubname" runat="server" />
            <asp:HiddenField ID="hdDateStart" runat="server" />

            <asp:HiddenField ID="hdDocSearchStatus" runat="server" />
            <asp:Label ID="lblDocStatus" runat="server" Text="文件狀態：" Visible="false" meta:resourcekey="lblDocStatusResource1"></asp:Label>
            <asp:Label ID="lblPublish" runat="server" Text="已公佈" Visible="False" meta:resourcekey="lblPublishResource1"></asp:Label>
            <asp:Label ID="lblCheckin" runat="server" Text="已存回" Visible="False" meta:resourcekey="lblCheckinResource1"></asp:Label>
            <asp:Label ID="lblCheckOut" runat="server" Text="已取出" Visible="False" meta:resourcekey="lblCheckOutResource1"></asp:Label>
            <asp:Label ID="lblApproval" runat="server" Text="審核中" Visible="False" meta:resourcekey="lblApprovalResource1"></asp:Label>
            <asp:Label ID="lblDocDeny" runat="server" Text="發佈拒絕" Visible="False" meta:resourcekey="lblDocDenyResource1"></asp:Label>
            <asp:Label ID="lblUpdating" runat="server" Text="改版中" Visible="False" meta:resourcekey="lblUpdatingResource1" ></asp:Label>
            <asp:Label ID="lblDraft" runat="server" Text="草稿" Visible="False" meta:resourcekey="lblDraftResource1"></asp:Label>
    </form>
</body>


</html>
