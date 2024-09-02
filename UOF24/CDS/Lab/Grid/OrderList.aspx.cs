using Ede.Uof.Utility.Page;
using Ede.Uof.Utility.Page.Common;
using Lab.Lib.UCO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class CDS_Lab_Grid_OrderList : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnQuery_Click(object sender, EventArgs e)
    {
        LabUCO uco = new LabUCO();
        var dt = uco.GetOrderList(txtKeyword.Text);
        
        //從資料庫撈出來的TABLE塞給
        //Grid的DataSource
        //再用Grid的  DataBind 將資料建出來

    }

    protected void Grid1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //用e.Row.FindControl的方法找到Grid內的LinkButton
            //找到後用Dialog.Open2 去開訂單明細  ~/CDS/Lab/Grid/OrderDetail.aspx
            //並且將OrderID欄位的值帶到對話視窗中 (用 ExpandoObject )
            //可參考~/CDS/WebPage/Default.aspx

        }
    }
}