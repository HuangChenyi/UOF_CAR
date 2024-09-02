
using System.Collections.Generic;
public class PunchData
{
    public List<PunchDataItem> Items { get; set; }

    public PunchData()
    {
        this.Items = new List<PunchDataItem>();
    }
}

public class PunchDataItem
{
    public string Seq { get; set; }
    public string CardNo { get; set; }
    public string PunchTime { get; set; }
    public string Type { get; set; }
    public string IpAddress { get; set; }
    public string ClockCode { get; set; }
}
