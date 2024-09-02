
using System.Collections.Generic;
public class SiteInfo
{
    public List<Site> Sites { get; set; }
    public string Status { get; set; }

    public SiteInfo()
    {
        this.Sites = new List<Site>();
    }
}

public class Site
{
    public string SITE_SEQ { get; set; }
    public object SUB_FLOW_NAME { get; set; }
    public string SIGNER { get; set; }
    public string SIGNER_GUID { get; set; }
    public string SIGN_TYPE { get; set; }
    public string ALLOW_END { get; set; }
    public object REMARK { get; set; }
    public object ALERT_NAME { get; set; }
}

