using Ede.Uof.Utility.Page.Common;
using Ede.Uof.Utility.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using Ede.Uof.Utility.FileCenter.V3;

public partial class CDS_FileCenter_Default2 : Ede.Uof.Utility.Page.BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Setting setting = new Setting();
        ScriptManager.RegisterStartupScript(
            Page, GetType(), "download",
            string.Format("$uof.download('{0}/Common/FileCenter/DownloadFile.ashx?id={1}');", setting["SiteUrl"],"6999e215-25b4-410b-9b99-f59b591af1f2")
            
            , true);

    }

    private ArrayList upLoad(string fileGroupID, string newModule)
    {
        FileGroup fileGroup= Ede.Uof.Utility.FileCenter.V3.FileCenter.GetFileGroup(fileGroupID);
        FileCenterModel fcm = new FileCenterModel();
        SortedList<string, string> filePathList = new SortedList<string, string>();
        DataSet fileDs = fcm.GetFileCollection(fileGroupID);
        DataSet groupDs = fcm.GetFileGroup(fileGroupID);
        ArrayList newFileGroupIDs = new ArrayList();
        if (fileDs.Tables[0].Rows.Count == 0)
        {
            throw new Exception("檔案ID：" + fileGroupID + "的檔案不存在");
        }
        try
        {
            if (fileDs != null && fileDs.Tables.Count > 0 && groupDs != null && groupDs.Tables.Count > 0)
            {
                foreach (DataRow fileDr in fileDs.Tables[0].Rows)
                {
                    string newFileGroupID = Guid.NewGuid().ToString();
                    string id = (string)fileDr["FILE_ID"];
                    string name = (string)fileDr["FILE_NAME"];
                    string path = (string)fileDr["FILE_PATH"];
                    string contentType = (string)fileDr["FILE_CONTENT_TYPE"];
                    int length = (int)fileDr["FILE_LENGTH"];
                    bool isEncryption = (bool)fileDr["IS_ENCRYPTION"];
                    string createUser = fileDr.IsNull("CREATE_USER") ? null : (string)fileDr["CREATE_USER"];
                    string realName = fcm.GetRealFileName(id, name, isEncryption);
                    //建立新的實體檔案路徑
                    string newID = Guid.NewGuid().ToString();
                    string newRealName = fcm.GetRealFileName(newID, name, isEncryption);
                    string phyFilePath = System.IO.Path.Combine(FileCenterModel.FileCenterPath, newModule);
                    string newRealFilePath = System.IO.Path.Combine(phyFilePath, newRealName);
                    string sourcePhyFilePath = System.IO.Path.Combine(FileCenterModel.FileCenterPath, path);
                    string sourceRealFilePath = System.IO.Path.Combine(sourcePhyFilePath, realName);
                    filePathList.Add(sourceRealFilePath, newRealFilePath);
                    fcm.CreateFile(newFileGroupID, newID, name, newModule, contentType, long.Parse(Convert.ToString(length)), isEncryption, createUser);
                    foreach (DataRow groupDr in groupDs.Tables[0].Rows)
                    {
                        bool saveFlag = (bool)groupDr["SAVE_FLAG"];
                        string description = (string)groupDr["DESCRIPTION"];
                        fcm.SmartUpdateFileGroup(newFileGroupID, saveFlag ? "1" : "0", description);
                    }
                    newFileGroupIDs.Add(newFileGroupID);
                }

                for (int i = 0; i < filePathList.Count; i++)
                {//複製實體檔案
                    string org = filePathList.Keys[i];
                    string create = filePathList.Values[i];
                    System.IO.File.Copy(org, create, true);
                }
            }
            return newFileGroupIDs;
        }
        catch (Exception ex)
        {
            for (int i = 0; i < filePathList.Count; i++)
            {
                string create = filePathList.Values[i];
                if (System.IO.File.Exists(create))
                {
                    try
                    {
                        System.IO.File.Delete(create);
                    }
                    catch { }
                }
            }
            throw ex;
        }
    }
}