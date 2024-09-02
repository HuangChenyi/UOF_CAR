<%@ Control Language="C#" AutoEventWireup="true" Inherits="Common_ChoiceCenter_UC_ChoiceListByView" Codebehind="UC_ChoiceListByView.ascx.cs" %>

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <telerik:RadListView ID="RadListView1" runat="server" ItemPlaceholderID="ItemPlaceholderContainer">
            <LayoutTemplate>
                <div id="itemContainer" runat="server">
                    <asp:PlaceHolder ID="ItemPlaceholderContainer" runat="server"></asp:PlaceHolder>
                </div>
            </LayoutTemplate>
            <ItemTemplate>
                <div class="UserSetItem">
                    <div style="float: left; margin-right: 3px">
                        <img src="<%#: Eval("image")%>" /></div>
                    <div style="white-space: nowrap; display: inline-block;"><%#: Eval("text")%></div>
                </div>
            </ItemTemplate>
            <ClientSettings>
                <DataBinding ItemPlaceHolderID="itemContainer">
                    <ItemTemplate>
                    <div class="UserSetItem">
                        <div style="float:left;margin-right:3px"><img src="#= image #" /></div>
                        <div style="white-space:nowrap;display:inline-block;">#= text #</div>
                    </div>
                    </ItemTemplate>
                </DataBinding>
                <ClientEvents></ClientEvents>
            </ClientSettings>
        </telerik:RadListView>
    </ContentTemplate>
</asp:UpdatePanel>

<input id="hiddenXML" runat="server" type="hidden" />
<input id="hideShowMember" runat="server" type="hidden" />
<input id="hideShowSubDep" runat="server" type="hidden" />
<input id="hideShowEmployee" runat="server" type="hidden" />
<input id="hideExpandToUser" runat="server" type="hidden" />
<input id="hideShowChioceType" runat="server" type="hidden" />
<input id="hideFavorite" runat="server" type="hidden" />
<input id="hidLimitChoice" runat="server" type="hidden" />
<input id="hidLimitXML" runat="server" type="hidden" />