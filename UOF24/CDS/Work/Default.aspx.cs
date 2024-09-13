using DocumentFormat.OpenXml.EMMA;
using Ede.Uof.EIP.Organization.Util;
using Ede.Uof.EIP.Schedule.Devolve;
using Ede.Uof.EIP.Schedule.Work;
using Ede.Uof.Utility.Page;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CDS_Work_Default : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        DevolveManagementUCO dmData = new DevolveManagementUCO();

        DevolveDataSet devolveDs = null;
        DevolveDataSet.DevolveRow row = null;

        string tonyGuid=new UserUCO().GetGUID("tony");
        string maryGuid = new UserUCO().GetGUID("mary");
        string hrGuid = new UserUCO().GetGUID("hr");
        string wangGuid = new UserUCO().GetGUID("wang");
        devolveDs = new DevolveDataSet();
        row = devolveDs.Devolve.NewDevolveRow();

        row.CREATE_TIME = UserTime.GetSystemNowForDb();//建立時間
        row.CREATE_USER = "admin";//建立者GUID
        row.OWNER = tonyGuid;   //擁有者GUID
        row.DEVOLVE_GUID = Guid.NewGuid().ToString();


        row.SOURCE_TYPE = DevolveSourceType.Self.ToString();



        row.SUBJECT = "這是標題";
        row.DESCRIPTION = "這是內容";


        UserSet usetSet = new UserSet();
        UserSetUser user = new UserSetUser();
        user.USER_GUID = wangGuid;
        usetSet.Items.Add(user);

        row.USER_SET = usetSet.GetXML();//負責人

        usetSet = new UserSet();
         user = new UserSetUser();
        user.USER_GUID = hrGuid;
        usetSet.Items.Add(user);

        row.COMP_INFO_USER_SET = usetSet.GetXML(); ;//知會人員
        row.DIRECTOR = maryGuid;//交辦人GUID
        row.WORK_STATE = WorkState.NotYetBegin.ToString();

        row.SetFILE_GROUP_IDNull();


        //指定人的時區
       var startTime= UserTime.SetZone("admin").FromUi(Convert.ToDateTime("2024/9/13 09:00")).ToDb();
        var endTime = UserTime.SetZone("admin").FromUi(Convert.ToDateTime("2024/9/13 18:00")).ToDb();
        row.START_TIME = startTime;
        row.END_TIME = endTime;

        //row.REPEAT_GUID = "";//選擇週期,先把週期寫入
        // row.IS_REPEAT = "N";//是否重複週期
        // row.All_Day = false;


        devolveDs.Devolve.Rows.Add(row);
        dmData.CreateDevolve(devolveDs);
    }
}