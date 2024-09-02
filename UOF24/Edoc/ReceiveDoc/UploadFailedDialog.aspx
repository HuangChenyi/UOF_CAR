<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="UploadFailedDialog.aspx.cs" Inherits="Ede.Uof.Web.Edoc.ReceiveDoc.UploadFailedDialog" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style type="text/css">
        /* 隱藏Grid內的欄位 */
        .cssHidden{
            display:none;
        }
    </style>

    <Ede:grid ID="grdUploadFailed" runat="server" Width="100%" DataKeyNames="RECEIVE_DOC_ID"
        EmptyDataText="沒有資料" AutoGenerateColumns="false" AutoGenerateCheckBoxColumn="false"
        OnRowDataBound="grdUploadFailed_RowDataBound" AllowSorting="false">
        <Columns>
            <asp:BoundField DataField="RECEIVE_DOC_ID" HeaderText="收文代碼hidden" >
                <HeaderStyle CssClass="cssHidden" />
                <ItemStyle CssClass="cssHidden" />
            </asp:BoundField>  

            <asp:BoundField DataField="NUMBER_STRING" HeaderText="發文字號" HeaderStyle-Wrap="false">
                <ItemStyle Wrap="False" />
            </asp:BoundField>

            <asp:BoundField DataField="SUBJECT" HeaderText="主旨/事由" >
                <HeaderStyle Wrap="false"  Width="300"/>
            </asp:BoundField>
            
            <asp:BoundField DataField="MODIFY_DATE" HeaderText="起單時間hidden" >
                <HeaderStyle CssClass="cssHidden" />
                <ItemStyle CssClass="cssHidden" />
            </asp:BoundField>  
            <asp:TemplateField HeaderText="起單時間">
                <ItemTemplate>
                    <asp:Label ID="lblUploadTime" runat="server"></asp:Label>
                </ItemTemplate>
                <HeaderStyle Wrap="False" />
                <ItemStyle Wrap="False" />
            </asp:TemplateField>
                        
            <asp:TemplateField HeaderText="起單狀態">
                <ItemTemplate>
                    <asp:Label ID="lblFormStatus" runat="server" Text="起單失敗"></asp:Label>
                </ItemTemplate>
                <HeaderStyle Wrap="False" />
            </asp:TemplateField>
                        
            <asp:BoundField DataField="UPLOAD_ERROR_MESSAGE" HeaderText="訊息" >
                <HeaderStyle Wrap="false" Width="300"/>
            </asp:BoundField>
        </Columns>
    </Ede:grid>

</asp:Content>
