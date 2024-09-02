<%@ Control Language="C#" AutoEventWireup="true" Inherits="Ede.Uof.Common.ChoiceCenter.UC_ChoiceList" Codebehind="UC_ChoiceList.ascx.cs" %>

<div style="margin: 5px">
    <telerik:RadButton ID="btnEdit" runat="server" SkinID="YellowButton" Text="選取人員" OnClientClicking="button1Click" OnClick="btnEdit_Click" CausesValidation="False" meta:resourcekey="btnEditResource2" style="position: relative;">
    </telerik:RadButton>
    <telerik:RadButton ID="btnEdit2" runat="server" SkinID="BlueButton" Text="選取人員" OnClientClicking="button1Click" OnClick="btnEdit2_Click" CausesValidation="False" meta:resourcekey="btnEdit2Resource2" style="position: relative;">
    </telerik:RadButton>
    <div class="UserSetBorder" id="listViewBorder" runat="server">
        <telerik:RadListView ID="RadListView1" runat="server" ItemPlaceholderID="ItemPlaceholderContainer" meta:resourcekey="RadListView1Resource1">
            <LayoutTemplate>
                <div id="itemContainer" runat="server">
                    <asp:PlaceHolder ID="ItemPlaceholderContainer" runat="server"></asp:PlaceHolder>
                </div>
            </LayoutTemplate>
            <ItemTemplate>
                <div class="UserSetItem">
                    <div>
                        <img src='<%#: Eval("image") %>' />
                    </div>
                    <div><%#: Eval("text")%></div>
                </div>
            </ItemTemplate>
            <ClientSettings>
                <DataBinding ItemPlaceHolderID="itemContainer">
                    <ItemTemplate>
                    

                    <div class="UserSetItem">
                        <div><img src="#= image #" /></div>
                        <div>#= text #</div>
                    </div>
                    </ItemTemplate>
                </DataBinding>
                <ClientEvents></ClientEvents>
            </ClientSettings>
        </telerik:RadListView>
    </div>
    <span style="display: none">
        <asp:Label ID="lbSelect" runat="server" Text="選取人員" Visible="False" meta:resourcekey="lbSelectResource1"></asp:Label>
        <asp:HiddenField ID="hiddenJSON" Value="" runat="server" />
        <asp:HiddenField ID="hideShowMember" Value="" runat="server" />
        <asp:HiddenField ID="hideShowSubDep" Value="true" runat="server" />
        <asp:HiddenField ID="hideShowEmployee" Value="" runat="server" />
        <asp:HiddenField ID="hideExpandToUser" Value="" runat="server" />
        <asp:HiddenField ID="hideShowChioceType" Value="" runat="server" />
        <asp:HiddenField ID="hideFavorite" Value="" runat="server" />
        <asp:HiddenField ID="hidLimitChoice" Value="" runat="server" />
        <asp:HiddenField ID="hidLimitXML" Value="" runat="server" />
        <asp:HiddenField ID="hidDisplayAllDept" runat="server" Value="0"/>
        <asp:HiddenField ID="hidDefaultTab" runat="server" Value="" />
        <asp:HiddenField ID="hfLimitWithUserDeptAllSub" runat="server" Value="" />
        <asp:HiddenField ID="hfIncludeSubDep" runat="server" Value="" />
    </span>
</div>
