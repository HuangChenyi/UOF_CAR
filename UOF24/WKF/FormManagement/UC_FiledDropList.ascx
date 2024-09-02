<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_FormManagement_UC_FiledDropList" Codebehind="UC_FiledDropList.ascx.cs" %>

<script>
    Sys.Application.add_load(function () {
        var ddlFieldType = $("#ctl00_ContentPlaceHolder1_UC_FiledDropList1_ddlFieldType");
        var lblFieldSeq = $("#ctl00_ContentPlaceHolder1_lblFieldSeq");
        var lblSeq = $("#ctl00_ContentPlaceHolder1_lblSeq");
        var masterButton2 = $("#ctl00_PanelButton2");

        if (typeof (ddlFieldType) != "undefined" && ddlFieldType != null &&
            typeof (lblFieldSeq) != "undefined" && lblFieldSeq != null &&
            typeof (lblSeq) != "undefined" && lblSeq != null) {

            ddlFieldType.closest("td").attr("colspan", "3");
            lblFieldSeq.closest("td").hide();
            lblSeq.closest("td").hide();

        }

        if (typeof (masterButton2) != "undefined" && masterButton2 != null)
        {
            masterButton2.hide();
        }
    });

    function ResetValue()
    {
        var fieldId = $('#ctl00_ContentPlaceHolder1_txtFieldId').val();
        var fieldName = $('#ctl00_ContentPlaceHolder1_txtFieldName').val();
        $("#<%=hfFieldId.ClientID%>").val(fieldId);
        $("#<%=hfFieldName.ClientID%>").val(fieldName);
    }
</script>

<asp:UpdatePanel ID="updatepanel1" runat="server">
    <ContentTemplate>
<asp:DropDownList ID="ddlFieldType" runat="server" AutoPostBack="True" meta:resourcekey="ddlFieldTypeResource1"
    OnSelectedIndexChanged="ddlFieldType_SelectedIndexChanged" onchange="ResetValue();">
    <asp:ListItem meta:resourceKey="ListItemResource1" Value="singleLineText" Text="單行文字欄位"></asp:ListItem>
    <asp:ListItem meta:resourceKey="ListItemResource2" Value="multiLineText" Text="多行文字欄位"></asp:ListItem>
    <asp:ListItem meta:resourceKey="ListItemResource3" Value="numberText" Text="數值欄位"></asp:ListItem>
    <asp:ListItem meta:resourceKey="ListItemResource4" Value="fileButton" Text="檔案選取欄位"></asp:ListItem>
    <asp:ListItem meta:resourceKey="ListItemResource5" Value="dateSelect" Text="日期欄位"></asp:ListItem>
    <asp:ListItem meta:resourceKey="ListItemResource6" Value="timeSelect" Text="時間欄位"></asp:ListItem>
    <asp:ListItem meta:resourceKey="ListItemResource7" Value="checkBox" Text="核選方塊"></asp:ListItem>
    <asp:ListItem meta:resourceKey="ListItemResource8" Value="radioButton" Text="單選鈕"></asp:ListItem>
    <asp:ListItem meta:resourceKey="ListItemResource9" Value="dropDownList" Text="下拉式選單"></asp:ListItem>
    <asp:ListItem meta:resourcekey="ListItemResource21" Value="htmlEditor" Text="文字編輯欄位"></asp:ListItem>
    <asp:ListItem meta:resourceKey="ListItemResource10" Value="dataGrid" Text="明細欄位"></asp:ListItem>
    <asp:ListItem meta:resourceKey="ListItemResource11" Value="hyperLink" Text="超連結"></asp:ListItem>
    <asp:ListItem meta:resourceKey="ListItemResource13" Value="calculateText" Text="表單計算欄位"></asp:ListItem>
    <asp:ListItem meta:resourcekey="ListItemResource12" Value="aggregateText" Text="加總平均欄位"></asp:ListItem>
    <asp:ListItem meta:resourcekey="CanvasListItemResource1" Value="canvas" Text="手寫簽名"></asp:ListItem>
    <asp:ListItem meta:resourceKey="ListItemResource14" Value="userProposer" Text="申請者"></asp:ListItem>
    <asp:ListItem meta:resourceKey="ListItemResource15" Value="userDept" Text="申請者部門"></asp:ListItem>
    <asp:ListItem meta:resourceKey="ListItemResource16" Value="userRank" Text="申請者職級"></asp:ListItem>
    <asp:ListItem meta:resourceKey="ListItemResource36" Value="userFunction" Text="申請者職務"></asp:ListItem>
    <asp:ListItem meta:resourceKey="ListItemResource32" Value="userAgent" Text="申請者代理人"></asp:ListItem>
    <asp:ListItem meta:resourceKey="ListItemResource17" Value="allDept" Text="所有部門"></asp:ListItem>
    <asp:ListItem meta:resourceKey="ListItemResource18" Value="allRank" Text="所有職級"></asp:ListItem>
    <asp:ListItem meta:resourceKey="ListItemResource19" Value="allFunction" Text="所有職務"></asp:ListItem>
    <asp:ListItem meta:resourceKey="ListItemResource20" Value="allUser" Text="所有人員"></asp:ListItem>
    <asp:ListItem meta:resourceKey="ListItemResource34" Value="allMember" Text="所有會員"></asp:ListItem>
    <asp:ListItem meta:resourceKey="ListItemResource35" Value="allMemberGroup" Text="所有群組"></asp:ListItem>
    <asp:ListItem meta:resourceKey="ListItemResource31" Value="userSetField" Text="人員組織欄位"></asp:ListItem>
    <asp:ListItem meta:resourceKey="ListItemResource33" Value="displayField" Text="純顯示欄位"></asp:ListItem>
    <asp:ListItem meta:resourceKey="ListItemResource30" Value="hiddenField" Text="隱藏欄位"></asp:ListItem> 
</asp:DropDownList>
<asp:CustomValidator ID="cvConditionErrorMsg" runat="server" Display=Dynamic 
    ErrorMessage="錯誤!此欄位有被用於表單條件，不允許變更欄位型態" 
    meta:resourcekey="cvConditionErrorMsgResource1"></asp:CustomValidator>
<asp:CustomValidator ID="cvDisplayTitleErrorMsg" runat="server" Display=Dynamic 
    ErrorMessage="錯誤!此欄位有被用於顯示標題，不允許變更欄位型態" 
    meta:resourcekey="cvDisplayTitleErrorMsgResource1"></asp:CustomValidator>
<asp:CustomValidator ID="cvAggregateUsed" runat="server" Display=Dynamic 
    ErrorMessage="錯誤!有加總平均欄位作用在此明細欄位，不允許變更欄位型態" meta:resourcekey="cvAggregateUsedResource1" ></asp:CustomValidator>
<asp:Label ID="lblModifyCalcOpErrorMsg" runat="server" Text='錯誤!此欄位有被用於計算欄位的運算元，變更型態只能變更為"數值","計算","加總平均"' Visible="False" meta:resourcekey="lblModifyCalcOpErrorMsgResource1"></asp:Label>
<asp:Label ID="lblModifyAggeOpErrorMsg" runat="server" Text='錯誤!此欄位有被用於加總平均欄位的運算元，變更型態只能變更為"數值","計算"' Visible="False" meta:resourcekey="lblModifyAggeOpErrorMsgResource1"></asp:Label>
<asp:HiddenField ID="hfFieldId" runat="server" />
<asp:HiddenField ID="hfFieldName" runat="server" />
    </ContentTemplate>
</asp:UpdatePanel>
