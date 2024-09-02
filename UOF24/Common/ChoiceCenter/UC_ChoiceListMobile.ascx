<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UC_ChoiceListMobile.ascx.cs" Inherits="Ede.Uof.Common.ChoiceCenter.UC_ChoiceListMobile" %>
<input id="hiddenSelected" runat="server" type="hidden" value="" />
<input id="hiddenInitialData" runat="server" type="hidden" value="" />
<input id="hidDisplayAllDept" runat="server" type="hidden" value="0" />
<input id="hfLimitWithUserDeptAllSub" runat="server" type="hidden" value="" />

<asp:Label ID="Label1" runat="server" Text="請輸入關鍵字" meta:resourcekey="Label1Resource1" Visible="False" ></asp:Label>
<asp:Label ID="lblGroup" runat="server" Text="請輸入部門關鍵字" Visible="False" meta:resourcekey="lblGroupResource1" ></asp:Label>
<asp:Label ID="lblUser" runat="server" Text="請輸入帳號或姓名關鍵字" Visible="False" meta:resourcekey="lblUserResource1" ></asp:Label>
<asp:Label ID="lblTitle" runat="server" Text="請輸入職級關鍵字" Visible="False" meta:resourcekey="lblTitleResource1" ></asp:Label>
<asp:Label ID="lblFunction" runat="server" Text="請輸入職務關鍵字" Visible="False" meta:resourcekey="lblFunctionResource1" ></asp:Label>
<asp:Label ID="lblMemberGroup" runat="server" Text="請輸入群組關鍵字" Visible="False" meta:resourcekey="lblMemberGroupResource1" ></asp:Label>

<span id="choideCon" runat="server" editable="true" style="display:none" >   
    <templates>
        <template data-key="group">
            <div><div>[text]</div><p>[text2]</p></div>
        </template>
        <template data-key="memberGroup">
            <div><div>[text]</div><p>[text2]</p></div>
        </template>  
        <template data-key="user">
            <div><div>[text]</div></div>
        </template>  
        <template data-key="member">
            <div><div>[text]</div></div>
        </template>
        <template data-key="title">
            <div><div>[text]([text2])</div></div>
        </template>  
        <template data-key="function">
            <div><div>[text]</div></div>
        </template>        
    </templates>
</span>

<div style="display: none;">
    <asp:Button runat="server" ID="btnEdit" CausesValidation="false" OnClick="btnEdit_Click"/>
</div>

