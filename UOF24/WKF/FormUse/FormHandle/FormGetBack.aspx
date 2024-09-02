<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormUse_FormHandle_FormGetBack" Title="取回" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="FormGetBack.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table width="100%" class="PopTable" cellspacing="0" cellpadding="0">
        <tr>
            <td class="PopTableHeader" colspan="4" style="height: 25px; text-align: center;" >
                <center>
                    <asp:Label ID="lblTitle" runat="server" Text="作廢表單" meta:resourcekey="lblTitleResource1"></asp:Label>
                </center>
            </td>
        </tr>
        <tr>
            <td class="PopTableLeftTD" style="width: 20px; height: 25px;">
                <div style="text-align: left; width: 20px;">
                    <asp:RadioButton ID="rbSaveApplyForm" runat="server" GroupName="rbGetBack" Checked="True"
                        meta:resourcekey="rbSaveApplyFormResource1" />
                </div>
            </td>
            <td class="PopTableRightTD" style="height: 25px">
                <asp:Label ID="lblSysFormCannotSave" runat="server" Text="系統表單不允許存回草稿匣" ForeColor="Red"
                    Visible="False" meta:resourcekey="lblSysFormCannotSaveResource1"></asp:Label>
                <asp:Label ID="lblSaveSciprt" runat="server" Text="作廢後存回草稿匣" meta:resourcekey="lblSaveSciprtResource1"></asp:Label>
            </td>
            <td class="PopTableLeftTD"  nowrap=nowrap >
                <asp:Label ID="lblScriptName" runat="server" Text="※草稿名稱：" meta:resourcekey="lblScriptNameResource1"></asp:Label>
            </td>
            <td  class="PopTableRightTD">
                <asp:TextBox ID="tbScriptName" runat="server" meta:resourcekey="tbScriptNameResource1"
                    Width="120px"></asp:TextBox>&nbsp;
            </td>
        </tr>
    <tr>
        <td class="PopTableLeftTD" style="width: 20px; height: 25px;">
            <div style="text-align: left; width: 20px;">
                <asp:RadioButton ID="rbDeleteApplyForm" runat="server" GroupName="rbGetBack" meta:resourcekey="rbDeleteApplyFormResource1" />
            </div>
        </td>
        <td class="PopTableRightTD" style="height: 25px" nowrap=nowrap>
            <asp:Label ID="lblDeleteApplyForm" runat="server" Text="作廢此申請表單" meta:resourcekey="lblDeleteApplyFormResource1"></asp:Label>
        </td>
        <td class="PopTableLeftTD">
            <asp:Label ID="Label1" runat="server" Text="※作廢原因："  meta:resourcekey="Label1Resource1"></asp:Label>
        </td>
        <td class="PopTableRightTD">
            <asp:TextBox ID="txtReason" runat="server" MaxLength="50" Width="120px" ></asp:TextBox>
        </td>
    </tr>
    </table>

    <table>
        <tr>
            <td>
                <asp:CustomValidator ID="cvError" runat="server" Display="Dynamic" ErrorMessage="請輸入草稿名稱" meta:resourcekey="cvErrorResource1"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:CustomValidator ID="cvCancelForm" runat="server" Display="Dynamic" ErrorMessage="作廢原因必填" meta:resourcekey="cvCancelFormResource1"></asp:CustomValidator>
 
            </td>
        </tr>
    </table>



    <asp:Label ID="lblFormLocked" runat="server" meta:resourcekey="lblFormLockedResource1"
        Text="此表單已鎖定，無法取回" Visible="False"></asp:Label>
    <asp:Label ID="lblFormEnd" runat="server" Text="此表單已結案，故無法作廢" Visible="False" meta:resourcekey="lblFormEndResource1"></asp:Label>
    <asp:Label ID="lblNonScript" runat="server" Text="*此表單不允許存回草稿匣" ForeColor="Red" meta:resourcekey="lblNonScriptFormEndResource1"
        Visible="false"></asp:Label>
    <asp:Label ID="lblFormGetBackExaminedForBackgoundProcessing" runat="server" Text="此表單正在進行背景簽核，無法作廢" Visible="False" meta:resourcekey="lblFormGetBackExaminedForBackgoundProcessingResource1"></asp:Label>
</asp:Content>

