<%@ Page Title="文件內容" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="DocChangeContentView.aspx.cs" Inherits="Ede.Uof.Web.DMS.DocStore.DocChangeContentView" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnContent" Visible="false" runat="server">
        <telerik:RadTabStrip ID="tabDms" MultiPageID="tabDmsView" runat="server" BackColor="White" Width="100%" SelectedIndex="0" meta:resourcekey="tabDmsResource1">
            <Tabs>
                <telerik:RadTab runat="server" Selected="True" Value="DocContent" Text="本文內容" PageViewID="ContentRadPageView" meta:resourcekey="RadTabResource1">
                </telerik:RadTab>
                <telerik:RadTab runat="server" Value="ContentFile" Text="附加檔案" PageViewID="AttachRadPageView" meta:resourcekey="RadTabResource2">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage ID="tabDmsView" runat="server" BackColor="White" Width="100%" Height="90%" SelectedIndex="0" meta:resourcekey="tabDmsViewResource1">
            <telerik:RadPageView runat="server" ID="ContentRadPageView" Height="100%" meta:resourcekey="ContentRadPageViewResource2" Selected="True">
                <table border="1" class="PopTable" style="width: 99.9%; height: 100%">
                    <tr style="height: 100%">
                        <td colspan="2" class="PopTableRightTD" style="text-align: left; height: 100%">
                            <div class="editorcontentstyle JustAddBorder" style="width: 100%; height: 100%">
                                <asp:Label ID="lblDocContent" Width="100%" Style="word-break: break-all; word-wrap: break-word;" runat="server" meta:resourcekey="lblDocContentResource1"></asp:Label>
                            </div>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="AttachRadPageView" meta:resourcekey="AttachRadPageViewResource1">
                <table border="1" class="PopTable" style="width: 99.9%; height: 100%; min-height: 150px">
                    <tr>
                        <td style="white-space: nowrap;">
                            <asp:Label ID="lblDocContentAttach" runat="server" Text="附加檔案" meta:resourcekey="lblDocContentAttachResource1"></asp:Label>
                        </td>
                        <td>
                            <uc1:UC_FileCenter runat="server" ID="fcDocContentAttach" ModuleName="DMS" ProxyEnabled="true"  Editable="false" MoreButtonVisible="true" UploadEnabled="false"/>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </asp:Panel>
    <asp:Panel ID="pnFile" Visible="false" runat="server">
        <table class="PopTable">
            <tr>
                <td class="PopTableLeftTD">
                    <asp:Label ID="lblFileTitle" runat="server" Text="文件內容" meta:resourcekey="lblFileTitleResource1"></asp:Label>
                </td>
                <td class="PopTableRightTD">
                    <uc1:UC_FileCenter runat="server" ID="UC_FileCenter" ModuleName="DMS" ProxyEnabled="true" Editable="false" MoreButtonVisible="true" UploadEnabled="false"/>
                </td>
            </tr>
            <tr>
                <td class="PopTableLeftTD">
                    <asp:Label ID="lblAttachTitle" runat="server" Text="附件" meta:resourcekey="lblAttachTitleResource1"></asp:Label>
                </td>
                <td class="PopTableRightTD">
                    <uc1:UC_FileCenter runat="server" ID="UC_FileAttachment" ModuleName="DMS" ProxyEnabled="true"  Editable="false"  MoreButtonVisible="true"  UploadEnabled="false"/>
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>
