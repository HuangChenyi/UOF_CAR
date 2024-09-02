var signedTaskId = "";
var signedNum = 0;
var taskIdInfo = new Array();
var refresFalg = false;
var m_count = 0;
var m_SignCount = 0;

function AllCheck(e) {
    var checkId = $(e).prop("id");
    var controls = $("input:checkbox");

    for (var i = 0; i < controls.length; i++) {

        var objEle = $(controls[i]);
        if (objEle.prop("id").split("_")[0] + '_' + objEle.prop("id").split("_")[1] + '_' + objEle.prop("id").split("_")[2] == checkId && objEle.prop("id") != checkId) {
            if (!objEle.prop("disabled")) {
                objEle.prop("checked", $(e).prop("checked"));

            }
        }

    }
}

function EnableRefreshButton(e, args) {
    $("#ctl00_DialogMasterPageWebImageButton2__3").attr('disabled', false);
    refresFalg = true;
}

function SignCheck(e, args) {
    $("#ctl00_DialogMasterPageWebImageButton2__3").attr('disabled', true);
    $("#ctl00_DialogMasterPageWebImageButton1__3").attr('disabled', true);
    args.IsValid = refresFalg;
}

function SignForm() {

    SetDropDownListStatus(true);
    m_count = 0;
    var controls = $("input:checkbox");

    for (var i = 0; i < controls.length; i++) {
        var objEle = $(controls[i]);

        objEle.prop("disabled", true);

        if (objEle.prop("checked")) {
            if (objEle.prop("name").indexOf("_") > 0) {
                var controlName = objEle.prop("name");

                controlName = controlName.replace("ctl00$ContentPlaceHolder1$", "ctl00_ContentPlaceHolder1_labels");
                taskIdInfo[m_count] = controlName;
                m_count++;
            }
        }

    }

    if (m_count == 0) {
        NoCheckRefresh();
        return;
    }

    //批次簽核開始後按鈕就消失
    $("#ctl00_PanelButton1").hide();

    for (var i = 0; i < controls.length; i++) {
        var objEle = $(controls[i]);

        if (objEle.prop("checked")) {
            if (signedTaskId.indexOf(objEle.prop("name")) == -1) {
                if (objEle.prop("name").indexOf("_") > 0) {
                    signedTaskId += objEle.prop("name");
                    var dataStatus = [objEle.prop("name")];
                    var dataVaule = [objEle.prop("name")];
                    $uof.pageMethod.async("SetStatus", dataStatus, callSet);
                    $uof.pageMethod.async("GetValue", dataStatus, callback);
                    signedNum++;

                    break;
                }
            }
        }

    }
}