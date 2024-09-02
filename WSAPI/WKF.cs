using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WSAPI
{
    public class WKFAPI
    {
        public string m_Token;
         public string Token { get{return m_Token; }  }
        public string SiteUrl { get; set; }

        public WKFAPI(string token)
        {
            SiteUrl = System.Configuration.ConfigurationManager.AppSettings["UOFSite"];
            m_Token = token;
        }

        public string SimulationFlowByScript(string formContent)
        {
            WKF.Wkf wkf = new WKF.Wkf();
            wkf.Url = SiteUrl + "/PublicAPI/WKF/WKF.asmx";
            return wkf.SimulationFlowByScript(m_Token, formContent);
        }
    }
}
