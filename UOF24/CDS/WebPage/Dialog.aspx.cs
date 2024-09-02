using Ede.Uof.Utility.Page.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class CDS_WebPage_Dialog : Ede.Uof.Utility.Page.BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

      
       
        //設定回傳值
        Dialog.SetReturnValue2("");

        //註冊Dialog的Button 狀態
        ((Master_DialogMasterPage)this.Master).Button1CausesValidation = false;
        ((Master_DialogMasterPage)this.Master).Button1AutoCloseWindow = false;
        ((Master_DialogMasterPage)this.Master).Button1OnClick += CDS_WebPage_Dialog_Button1OnClick;
        ((Master_DialogMasterPage)this.Master).Button2ClientOnClick = "Button2OnClick";




        if (!IsPostBack)
        {
            //接收主頁面傳遞之參數
            lblParam.Text = Request["Name"];
        }
        
    }





    void CDS_WebPage_Dialog_Button1OnClick()
    {
        //設定回傳值並關閉視窗
        Dialog.SetReturnValue2(txtReturnValue.Text);
        Dialog.Close(this);
    }



    protected void btn_Click(object sender, EventArgs e)
    {
        //設定按紐的文字
        ((Master_DialogMasterPage)this.Master).Button1Text = txtButton1.Text;
        ((Master_DialogMasterPage)this.Master).Button2Text = txtButton2.Text;
        ((Master_DialogMasterPage)this.Master).Button3Text = txtButton3.Text;
        ((Master_DialogMasterPage)this.Master).Button4Text = txtButton4.Text;
        ((Master_DialogMasterPage)this.Master).Button5Text = txtButton5.Text;
        ((Master_DialogMasterPage)this.Master).Button6Text = txtButton6.Text;

    }


}
