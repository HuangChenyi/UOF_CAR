using System;
using System.Collections.Generic;
using System.Data;
using System.Dynamic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ede.Uof.Utility.Page.Common;

public partial class CDS_WebPage_Default : Ede.Uof.Utility.Page.BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        //用ExpandoObject物件傳遞參數
        ExpandoObject param = new { Name = txtParam.Text }.ToExpando();
        //因為執行此行後，才會把JS的Event註冊到頁面上，所以過此行後下一次按btn元件的Event才會開窗並傳參數
        //故Dialog.Open2適合於參數為固定式的
        Dialog.Open2(btn, "~/CDS/WebPage/Dialog.aspx", "", 800, 600, Dialog.PostBackType.Allows, param);
       /// btn.Attributes.Add("onclick",".......");
        if (!IsPostBack)
        {
            BindGrid();
        }

    }

    private void BindGrid()
    {
        //建立Grid資料
        DataTable dt = new DataTable();
        dt.Columns.Add("NAME");
        dt.Columns.Add("ACCOUNT");


        dt.Rows.Add(new object[] { DateTime.Today.ToString("yyyyMMdd") + "001", "Tony" });
        dt.Rows.Add(new object[] { DateTime.Today.ToString("yyyyMMdd") + "002", "Mary" });
        dt.Rows.Add(new object[] { DateTime.Today.ToString("yyyyMMdd") + "003", "Wang" });


        //dt.Rows.Add(new object[] { $"{DateTime.Today.ToString("yyyyMMdd")}001" , "Tony" });
        //dt.Rows.Add(new object[] { $"{DateTime.Today.ToString("yyyyMMdd")}002", "Mary" });
        //dt.Rows.Add(new object[] { $"{DateTime.Today.ToString("yyyyMMdd")}003", "Wang" });

        Grid1.DataSource = dt;
        Grid1.DataBind();


    }
    protected void btn_Click(object sender, EventArgs e)
    {

        
        //開窗後回傳參數
        if (!string.IsNullOrEmpty(Dialog.GetReturnValue()))
        {
            txtReturnValue.Text = Dialog.GetReturnValue();
        }


    }
    protected void btn2_Click(object sender, EventArgs e)
    {
        //開窗後回傳參數
        if (!string.IsNullOrEmpty(Dialog.GetReturnValue()))
        {
            txtReturnValue.Text = Dialog.GetReturnValue();
        }

    }
    protected void btn3_Click(object sender, EventArgs e)
    {
        //開窗後回傳參數
        if (!string.IsNullOrEmpty(Dialog.GetReturnValue()))
        {
            txtReturnValue.Text = Dialog.GetReturnValue();
        }
    }
    protected void Grid1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DataRowView row =  (DataRowView)e.Row.DataItem;
            LinkButton lbtnName = (LinkButton)e.Row.FindControl("lbtnName");

            ExpandoObject param = new { Name =  row["NAME"].ToString() }.ToExpando();

            //Grid開窗是用RowDataBound事件再開窗
            Dialog.Open2(lbtnName, "~/CDS/WebPage/Dialog.aspx", "", 800, 600, Dialog.PostBackType.AfterReturn, param);
        }
    }
}