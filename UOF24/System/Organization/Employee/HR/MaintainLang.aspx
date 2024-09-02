<%@ Page Title="語言能力維護" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="System_Organization_Employee_HR_MaintainLang" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="MaintainLang.aspx.cs" %>

<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table cellspacing="1" class="PopTable" width="100%">
        <tr>
            <td style="white-space:nowrap;">
                <font color="red">*</font><asp:Label ID="Label1" runat="server" Text="語言種類" 
                    meta:resourcekey="Label1Resource1"></asp:Label>
            </td>
            <td style=" white-space:nowrap;">
                <asp:DropDownList ID="ddlLangType" runat="server" 
                    meta:resourcekey="ddlLangTypeResource1">
                    <asp:ListItem Value="" meta:resourcekey="ListItemResource1">請選擇</asp:ListItem>
                    <asp:ListItem Value="ZH" meta:resourcekey="ListItemResource2">中文</asp:ListItem>
                    <asp:ListItem Value="EN" meta:resourcekey="ListItemResource3">英文</asp:ListItem>
                    <asp:ListItem Value="JA" meta:resourcekey="ListItemResource4">日文</asp:ListItem>
                    <asp:ListItem Value="KO" meta:resourcekey="ListItemResource5">韓文</asp:ListItem>
                    <asp:ListItem Value="FR" meta:resourcekey="ListItemResource6">法文</asp:ListItem>
                    <asp:ListItem Value="DE" meta:resourcekey="ListItemResource7">德文</asp:ListItem>
                    <asp:ListItem Value="ES" meta:resourcekey="ListItemResource8">西班牙文</asp:ListItem>
                    <asp:ListItem Value="RU" meta:resourcekey="ListItemResource9">俄文</asp:ListItem>
                    <asp:ListItem Value="IT" meta:resourcekey="ListItemResource10">義大利文</asp:ListItem>
                    <asp:ListItem Value="PT" meta:resourcekey="ListItemResource11">葡萄牙文</asp:ListItem>
                    <asp:ListItem Value="AR" meta:resourcekey="ListItemResource12">阿拉伯文</asp:ListItem>
                    <asp:ListItem Value="NL" meta:resourcekey="ListItemResource13">荷蘭文</asp:ListItem>
                    <asp:ListItem Value="VN" meta:resourcekey="ListItemResource14">越文</asp:ListItem>
                    <asp:ListItem Value="TH" meta:resourcekey="ListItemResource15">泰文</asp:ListItem>
                    <asp:ListItem Value="MY" meta:resourcekey="ListItemResource16">馬來文</asp:ListItem>
                    <asp:ListItem Value="ID" meta:resourcekey="ListItemResource17">印尼文</asp:ListItem>
                    <asp:ListItem Value="IN" meta:resourcekey="ListItemResource18">印度</asp:ListItem>
                    <asp:ListItem Value="PH" meta:resourcekey="ListItemResource19">菲律賓文</asp:ListItem>
                    <asp:ListItem Value="Other" meta:resourcekey="ListItemResource20">其他外文</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="ddlLangType" ErrorMessage="請選擇語言總類" InitialValue="請選擇" 
                    meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="white-space:nowrap;">
                <font color="red">*</font><asp:Label ID="Label2" runat="server" Text="聽" 
                    meta:resourcekey="Label2Resource1"></asp:Label>
            </td>
            <td style="white-space:nowrap;">
                <table style="width: 100%">
                    <tr>
                        <td style="white-space:nowrap; width:200px;">
                            <asp:RadioButtonList ID="rblListen" runat="server" 
                                RepeatDirection="Horizontal" meta:resourcekey="rblListenResource1">
                                <asp:ListItem Value="A" meta:resourcekey="ListItemResource21">精通</asp:ListItem>
                                <asp:ListItem Value="B" meta:resourcekey="ListItemResource22">中等</asp:ListItem>
                                <asp:ListItem Value="C" meta:resourcekey="ListItemResource23">略懂</asp:ListItem>
                                <asp:ListItem Value="D" meta:resourcekey="ListItemResource24">不會</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="rblListen" ErrorMessage="請選擇&quot;聽&quot;能力" 
                                meta:resourcekey="RequiredFieldValidator2Resource1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="white-space:nowrap;">
               <font color="red">*</font><asp:Label ID="Label3" runat="server" Text="說" 
                    meta:resourcekey="Label3Resource1"></asp:Label>
            </td>
            <td style="white-space:nowrap;">
                 <table style="width: 100%">
                    <tr>
                        <td style="white-space:nowrap;width:200px;">
                            <asp:RadioButtonList ID="rblSpeak" runat="server" 
                                RepeatDirection="Horizontal" meta:resourcekey="rblSpeakResource1">
                                <asp:ListItem Value="A" meta:resourcekey="ListItemResource25">精通</asp:ListItem>
                                <asp:ListItem Value="B" meta:resourcekey="ListItemResource26">中等</asp:ListItem>
                                <asp:ListItem Value="C" meta:resourcekey="ListItemResource27">略懂</asp:ListItem>
                                <asp:ListItem Value="D" meta:resourcekey="ListItemResource28">不會</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="rblSpeak" ErrorMessage="請選擇&quot;說&quot;能力" 
                                meta:resourcekey="RequiredFieldValidator3Resource1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="white-space:nowrap;">
                <font color="red">*</font><asp:Label ID="Label4" runat="server" Text="讀" 
                    meta:resourcekey="Label4Resource1"></asp:Label>
            </td>
            <td style="white-space:nowrap;">
                 <table style="width: 100%">
                    <tr>
                        <td style="white-space:nowrap;width:200px;">
                            <asp:RadioButtonList ID="rblRead" runat="server" 
                                RepeatDirection="Horizontal" meta:resourcekey="rblReadResource1">
                                <asp:ListItem Value="A" meta:resourcekey="ListItemResource29">精通</asp:ListItem>
                                <asp:ListItem Value="B" meta:resourcekey="ListItemResource30">中等</asp:ListItem>
                                <asp:ListItem Value="C" meta:resourcekey="ListItemResource31">略懂</asp:ListItem>
                                <asp:ListItem Value="D" meta:resourcekey="ListItemResource32">不會</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ControlToValidate="rblRead" ErrorMessage="請選擇&quot;讀&quot;能力" 
                                meta:resourcekey="RequiredFieldValidator4Resource1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="white-space:nowrap;">
                <font color="red">*</font><asp:Label ID="Label5" runat="server" Text="寫" 
                    meta:resourcekey="Label5Resource1"></asp:Label>
            </td>
            <td style="white-space:nowrap;">
                <table style="width: 100%">
                    <tr>
                        <td style="white-space:nowrap;width:200px;">
                            <asp:RadioButtonList ID="rblWrite" runat="server" 
                                RepeatDirection="Horizontal" meta:resourcekey="rblWriteResource1">
                                <asp:ListItem Value="A" meta:resourcekey="ListItemResource33">精通</asp:ListItem>
                                <asp:ListItem Value="B" meta:resourcekey="ListItemResource34">中等</asp:ListItem>
                                <asp:ListItem Value="C" meta:resourcekey="ListItemResource35">略懂</asp:ListItem>
                                <asp:ListItem Value="D" meta:resourcekey="ListItemResource36">不會</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                ControlToValidate="rblWrite" ErrorMessage="請選擇&quot;寫&quot;能力" 
                                meta:resourcekey="RequiredFieldValidator5Resource1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="white-space:nowrap;">
                <asp:Label ID="Label6" runat="server" Text="檢定資格或證書" 
                    meta:resourcekey="Label6Resource1"></asp:Label>
            </td>
            <td>
                <uc1:UC_FileCenter runat="server" ID="UC_FileCenter" AllowedMultipleFileSelection="false" />
            </td>
        </tr>
    </table>
    <asp:Label ID="lblExistSameData" runat="server" Text="該語言已新增過" Visible="False" 
        meta:resourcekey="lblExistSameDataResource1"></asp:Label>
    <asp:Label ID="lblExistSameLang" runat="server" Text="該語言已新增過" Visible="False" 
        meta:resourcekey="lblExistSameLangResource1"></asp:Label>
</asp:Content>



