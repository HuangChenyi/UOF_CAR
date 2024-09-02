<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="CDS_Choice_Default" %>

<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_BtnChoiceOnce.ascx" TagPrefix="uc1" TagName="UC_BtnChoiceOnce" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">



    <table class="PopTable">
        <tr>
            <td nowrap>
                <asp:Label ID="Label1" runat="server" Text="選人元件(不展開使用者) ExpandToUser=false"></asp:Label>
                

            </td>
            <td>

                <uc1:UC_ChoiceList ID="UC_ChoiceList1" ExpandToUser="false" runat="server" />
                <asp:TextBox ID="TextBox1" TextMode="MultiLine" Width="300px"
                    Height="300px" runat="server"></asp:TextBox>

            </td>
         
        </tr>
        <tr>
            <td nowrap>
                <asp:Label ID="Label2" runat="server" Text="選人元件(展開使用者) ExpandToUser=true" ></asp:Label>
                

            </td>
            <td>
                <uc1:UC_ChoiceList ID="UC_ChoiceList2" ExpandToUser="true" runat="server" />
                <asp:TextBox ID="TextBox2" TextMode="MultiLine" Width="300px"
                    Height="300px" runat="server"></asp:TextBox>

            </td>

        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="單選人"></asp:Label>

            </td>
            <td>
                <uc1:UC_BtnChoiceOnce runat="server" ID="UC_BtnChoiceOnce"   ButtonText="選取人員" OnEditButtonOnClick="UC_BtnChoiceOnce_EditButtonOnClick"/>
                 <asp:TextBox ID="TextBox3" TextMode="MultiLine" Width="300px"
                    Height="300px" runat="server"></asp:TextBox>
            </td>
        </tr>
    </table>
    
</asp:Content>

