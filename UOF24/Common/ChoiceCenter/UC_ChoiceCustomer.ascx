<%@ Control Language="C#" AutoEventWireup="true" Inherits="Common_ChoiceCenter_UC_ChoiceCustomer" Codebehind="UC_ChoiceCustomer.ascx.cs" %>
        <div style="margin: 5px">
            <telerik:RadButton ID="rdbtnEdit" runat="server" Text="" SkinID="BlueButton" OnClick="rdbtnEdit_Click" CausesValidation="False"></telerik:RadButton>
            <div class="UserSetBorder" id="listViewBorder" runat="server">
                <telerik:RadListView ID="RadListView1" runat="server" ItemPlaceholderID="ItemPlaceholderContainer">
                    <LayoutTemplate>
                        <div id="itemContainer" runat="server">
                            <asp:PlaceHolder ID="ItemPlaceholderContainer" runat="server"></asp:PlaceHolder>
                        </div>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <div class="UserSetItem">
                            <div>
                                <img src="<%#: Eval("image")%>" />
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
        </div>
        <asp:Label ID="lbSelect" runat="server" Text="選擇客戶聯絡人" Visible="False" meta:resourcekey="lbSelectResource1"></asp:Label>
        <asp:Label ID="lbAutoResize" runat="server" Visible="False" meta:resourcekey="lbAutoResizeResource1"></asp:Label>
        <input id="hiddenXML" runat="server" type="hidden" />
        <input id="hideShowChioceType" runat="server" type="hidden" />
        <asp:HiddenField runat="server" ID="hiddenJSON"></asp:HiddenField>
