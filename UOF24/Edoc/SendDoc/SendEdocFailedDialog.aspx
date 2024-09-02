<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="SendEdocFailedDialog.aspx.cs" Inherits="Ede.Uof.Web.Edoc.SendDoc.SendFailedDetailDailog" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <style type="text/css">
        /* 隱藏Grid內的欄位 */
        .cssHidden{
            display:none;
        }
    </style>

    <ede:grid id="grdFailedDetail" runat="server" width="100%" datakeynames="SEND_DOC_ID"
        emptydatatext="沒有資料" autogeneratecolumns="false" autogeneratecheckboxcolumn="false"
        onrowdatabound="grdFailedDetail_RowDataBound" allowsorting="false">
        <Columns>
            <asp:BoundField DataField="SEND_DOC_ID" HeaderText="發文代碼hidden" >
                <HeaderStyle CssClass="cssHidden" />
                <ItemStyle CssClass="cssHidden" />
            </asp:BoundField>  

            <asp:BoundField DataField="NUMBER_STRING" HeaderText="發文字號" HeaderStyle-Wrap="false">
                <ItemStyle Wrap="False" />
            </asp:BoundField>

            <asp:BoundField DataField="SUBJECT" HeaderText="主旨/事由" >
                <HeaderStyle Wrap="False" Width="300"/>
                <ItemStyle Wrap="False" />
            </asp:BoundField>
            
            <asp:TemplateField HeaderText="動作時間" SortExpression="ACTION_TIME">
                <ItemTemplate>
                    <asp:Label ID="lblActionTime" runat="server"></asp:Label>
                </ItemTemplate>
                <HeaderStyle Wrap="False" />
            </asp:TemplateField>
                        
            <asp:TemplateField HeaderText="製作結果" SortExpression="BUILD_STATUS" >
                <ItemTemplate>
                    <asp:Label ID="lblBuildStatusName" runat="server" ></asp:Label>
                </ItemTemplate>
                <HeaderStyle Wrap="False" />
            </asp:TemplateField>
                        
            <asp:BoundField DataField="ERROR_MESSAGE" HeaderText="訊息" >
                <HeaderStyle Wrap="false" Width="300"/>
            </asp:BoundField>
        </Columns>
    </ede:grid>
    
    <!-- BuildStatus中文字串 -->
    <asp:Label ID="lblNone" runat="server" Text="尚未產生" Visible="False" ></asp:Label>
    <asp:Label ID="lblProcessing" runat="server" Text="處理中" Visible="False" ></asp:Label>
    <asp:Label ID="lblSuccess" runat="server" Text="成功" Visible="False" ></asp:Label>
    <asp:Label ID="lblFailed" runat="server" Text="失敗" Visible="False" ></asp:Label>
</asp:Content>