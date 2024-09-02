using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls;
using Ede.Uof.Utility.Page.Common;
using Ede.Uof.Utility.FileCenter.V3;
using System.IO;

public partial class CDS_FileCenter_FileCenterV3 : Ede.Uof.Utility.Page.BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //顯示元件目前狀態
            lblFileGroupId.Text = UC_FileCenter.FileGroupId;
            lblAllowMultiFileSelection.Text = UC_FileCenter.AllowedMultipleFileSelection.ToString();
            lblEditable.Text = UC_FileCenter.Editable.ToString();
            lblEnable.Text = UC_FileCenter.Enabled.ToString();
            lblFileLinkEnabled.Text = UC_FileCenter.FileLinkEnabled.ToString();

           
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //將上傳的檔案確認寫入到SERVER
        UC_FileCenter.SubmitChanges();
    }
    protected void btnEnable_Click(object sender, EventArgs e)
    {
        //設定是否可使用檔案上傳元件
        UC_FileCenter.Enabled = !UC_FileCenter.Enabled;
        lblEnable.Text = UC_FileCenter.Enabled.ToString();
    }
    protected void btnEditable_Click(object sender, EventArgs e)
    {
        //設定是否可上傳檔案
        UC_FileCenter.Editable = !UC_FileCenter.Editable;
        lblEditable.Text = UC_FileCenter.Editable.ToString();
    }
    protected void btnFileLinkEnabled_Click(object sender, EventArgs e)
    {
        //設定是否顯示下載連結
        UC_FileCenter.FileLinkEnabled = !UC_FileCenter.FileLinkEnabled;
        lblFileLinkEnabled.Text = UC_FileCenter.FileLinkEnabled.ToString();
    }
    protected void btnAllowMultiFileSelection_Click(object sender, EventArgs e)
    {
        //設定是否可多檔上傳
        UC_FileCenter.AllowedMultipleFileSelection = !UC_FileCenter.AllowedMultipleFileSelection;
        lblAllowMultiFileSelection.Text = UC_FileCenter.AllowedMultipleFileSelection.ToString();
    }
    protected void lbtnLoad_Click(object sender, EventArgs e)
    {
        //將檔案群組ID載入到上元件

        UC_FileCenter.LoadByFileGroup(txtFileGroupId.Text);
        lblFileGroupId.Text = txtFileGroupId.Text;
    }
}