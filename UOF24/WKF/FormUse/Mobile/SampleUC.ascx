<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SampleUC.ascx.cs" Inherits="Ede.Uof.Web.WKF.FormUse.Mobile.WebUserControl1" %>
<telerik:RadPageLayout runat="server" GridType="Fluid" ShowGrid="true" HtmlTag="None">
    <telerik:LayoutRow RowType="Generic" CssClass="content">
        <Columns>
            <telerik:LayoutColumn Span="12">
                <label>
                    <asp:Literal ID="Literal1" runat="server" Text="申請者"></asp:Literal></label>
            </telerik:LayoutColumn>
            <telerik:LayoutColumn Span="12">
                <telerik:RadTextBox ID="lblApplicant" runat="server" Text="" Width="100%" ReadOnly="true"></telerik:RadTextBox>
            </telerik:LayoutColumn>
        </Columns>
    </telerik:LayoutRow>
</telerik:RadPageLayout>
