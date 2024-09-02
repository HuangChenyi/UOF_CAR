using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WSAPI
{
    public class DMSS
    {
         public string m_Token;
         public string Token { get{return m_Token; }  }
        public string SiteUrl { get; set; }

        public DMSS(string token)
        {
            SiteUrl = System.Configuration.ConfigurationManager.AppSettings["UOFSite"];
            m_Token = token;
        }

        /// <summary>
        /// 新增文件
        /// </summary>
        public string  AddNewDOC(string folderId, string fileName ,string fileGroupId )
        {
            DMS.Dms service = new DMS.Dms();
            service.Url = SiteUrl + "/PublicAPI/DMS/DMS.asmx";
            return service.AddNewDoc(m_Token, folderId, fileName ,fileName, true, fileGroupId);
        }
    }
}
