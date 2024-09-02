<%@ Page Title="欄位權限設定說明" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="FieldPermissionExample.aspx.cs" Inherits="FieldPermissionExample" Culture="auto" UICulture="auto" meta:resourcekey="PageResource1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Panel ID="pnlEmployee" runat="server" meta:resourcekey="pnlEmployeeResource1">
        <table class="PopTable" cellspacing="1" width="100%">
            <tr>
                <td style="white-space: nowrap">
                    <asp:Label ID="lblEmpDisplayTitle" runat="server" Text="可顯示" meta:resourcekey="lblEmpDisplayTitleResource1"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblEmpDisplayContent" runat="server" Text="勾選後，使用者查看他人的個人詳細資訊時，可觀看到欄位內容，反之則會看到&quot;不顯示&quot;。​" meta:resourcekey="lblEmpDisplayContentResource1"></asp:Label>
                    <br />
                    <asp:Label ID="lblEmpDisplayContentTip" runat="server" Text="*系統管理員不受此限，皆可觀看​" ForeColor="Blue" meta:resourcekey="lblEmpDisplayContentTipResource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="white-space: nowrap">
                    <asp:Label ID="lblLimitViewTitle" runat="server" Text="限制觀看" meta:resourcekey="lblLimitViewTitleResource1"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblLimitViewContent" runat="server"
                        Text="當欄位設定為&quot;可顯示&quot;並勾選&quot;限制觀看&quot;，
                    使用者在查看他人的個人詳細資訊時，會依「系統管理→一般組態設定」中的【內部員工個人資訊】設定，
                    來判斷使用者是否可觀看該人員的欄位內容。​" meta:resourcekey="lblLimitViewContentResource1"></asp:Label>
                    <br />
                    <asp:LinkButton ID="lbtnGoToBasicModuleSetting" runat="server" Text="前往一般組態設定" meta:resourcekey="lbtnGoToBasicModuleSettingResource1"></asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td style="white-space: nowrap">
                    <asp:Label ID="lblEmpUserModifyTitle" runat="server" Text="使用者可修改" meta:resourcekey="lblEmpUserModifyTitleResource1"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblEmpUserModifyContent" runat="server" Text="勾選後，使用者才可在「個人設定」的[基本資料設定]中修改該欄位內容。​" meta:resourcekey="lblEmpUserModifyContentResource1"></asp:Label>
                </td>
            </tr>
        </table>
    </asp:Panel>

    <asp:Panel ID="pnlMember" runat="server" meta:resourcekey="pnlMemberResource1">
        <table class="PopTable" cellspacing="1" width="100%">
            <tr>
                <td style="white-space: nowrap">
                    <asp:Label ID="lblMbrDisplayTitle" runat="server" Text="可顯示" meta:resourcekey="lblMbrDisplayTitleResource1"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblMbrDisplayContent" runat="server"
                        Text="勾選後，內部員工查看外部會員的個人詳細資訊時，可觀看到欄位內容，反之則會看到&quot;不顯示&quot;。​" meta:resourcekey="lblMbrDisplayContentResource1"></asp:Label>
                    <br />
                    <asp:Label ID="lblMbrDisplayContentTip" runat="server"
                        Text="*當「系統管理→一般組態設定」中有啟用【外部會員群組選取權限】時，
                        外部會員的個人資料查詢權限會再依「系統管理→設定外部群組維護權限」內所設定的內容為準，不開放所有內部員工查詢​"
                        ForeColor="Blue" meta:resourcekey="lblMbrDisplayContentTipResource1"></asp:Label>
                    <br />
                    <asp:Label ID="lblMbrDisplayContentTip2" runat="server" Text="*系統管理員不受此限，皆可觀看​" ForeColor="Blue" meta:resourcekey="lblMbrDisplayContentTip2Resource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="white-space: nowrap">
                    <asp:Label ID="lblMbrUserModifyTitle" runat="server" Text="使用者可修改" meta:resourcekey="lblMbrUserModifyTitleResource1"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblMbrUserModifyContent" runat="server" Text="勾選後，外部會員才可在「個人設定」的[基本資料設定]中修改該欄位內容。​​" meta:resourcekey="lblMbrUserModifyContentResource1"></asp:Label>
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:content>