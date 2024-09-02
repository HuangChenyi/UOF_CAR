using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ede.Uof.Utility.Page.Common;
public partial class CDS_Editor_MaintainEditor : Ede.Uof.Utility.Page.BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ((Master_DialogMasterPage)this.Master).Button1AutoCloseWindow = false;
        ((Master_DialogMasterPage)this.Master).Button1OnClick += CDS_Editor_MaintainEditor_Button1OnClick;
        ((Master_DialogMasterPage)this.Master).Button2Text = "";

        if (!IsPostBack)
        {
            //顯示元件狀態
            DisplayStatus();
        }

       
    }

    void CDS_Editor_MaintainEditor_Button1OnClick()
    {
        //將編輯的內容帶回主視窗，並關閉視窗　
        Dialog.SetReturnValue2(UC_HtmlEditor.Content);
        Dialog.Close(this);

    }

    /// <summary>
    /// 顯示元件狀態
    /// </summary>
    private void DisplayStatus()
    {
        lblEnableInsertCusImage.Text = UC_HtmlEditor.EnableInsertCusImage.ToString();
        lblEnableInsertDMS.Text = UC_HtmlEditor.EnableInsertDMS.ToString();
        lblEnableInsertEmotions.Text = UC_HtmlEditor.EnableInsertEmotions.ToString();
        lblEnableInsertFiles.Text = UC_HtmlEditor.EnableInsertFiles.ToString();
        lblEnableInsertImage.Text = UC_HtmlEditor.EnableInsertImage.ToString();
      //  lblModultName.Text = UC_HtmlEditor.ModuleName.ToString();
       // lblSubFolder.Text = UC_HtmlEditor.SubFolder;
        lblUploadFileGroupId.Text = UC_HtmlEditor.UploadFileGroupID;
    }
    /// <summary>
    /// 變更是否顯示插入文管連結狀態
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnEnableInsertDMS_Click(object sender, EventArgs e)
    {
        
        UC_HtmlEditor.EnableInsertDMS = !UC_HtmlEditor.EnableInsertDMS;
        DisplayStatus();
    }
    /// <summary>
    /// 變更是否顯示插入圖片狀態
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnEnableInsertImage_Click(object sender, EventArgs e)
    {
        UC_HtmlEditor.EnableInsertImage = !UC_HtmlEditor.EnableInsertImage;
        DisplayStatus();
    }
    /// <summary>
    /// 變更是否顯示插入附件狀態
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnEnableInsertFiles_Click(object sender, EventArgs e)
    {
        UC_HtmlEditor.EnableInsertFiles = !UC_HtmlEditor.EnableInsertFiles;
        DisplayStatus();
    }
    /// <summary>
    /// 變更是否插入表情符號狀態
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnEnableInsertEmotions_Click(object sender, EventArgs e)
    {
        UC_HtmlEditor.EnableInsertEmotions = !UC_HtmlEditor.EnableInsertEmotions;
        DisplayStatus();
    }

    /// <summary>
    /// 變更是否插入自訂圖示狀態
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnEnableInsertCusImage_Click(object sender, EventArgs e)
    {
        UC_HtmlEditor.EnableInsertCusImage = !UC_HtmlEditor.EnableInsertCusImage;
        DisplayStatus();
    }
}