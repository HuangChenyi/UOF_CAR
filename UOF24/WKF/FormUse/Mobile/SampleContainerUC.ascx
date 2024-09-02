<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SampleContainerUC.ascx.cs" Inherits="Ede.Uof.Web.WKF.FormUse.Mobile.SampleContainerUC" %>
<%@ Register Src="~/WKF/FormUse/Mobile/SampleUC.ascx" TagPrefix="uc1" TagName="SampleUC" %>
<telerik:RadPageLayout runat="server" GridType="Fluid" ShowGrid="true" HtmlTag="None">
    <telerik:LayoutRow RowType="Container" WrapperHtmlTag="Div">
        <Columns>
            <telerik:CompositeLayoutColumn Span="12">
                <Content>
                    <uc1:SampleUC runat="server" ID="SampleUC" />
                </Content>
            </telerik:CompositeLayoutColumn>
        </Columns>
    </telerik:LayoutRow>
</telerik:RadPageLayout>


