using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.OleDb;
using System.IO;

public partial class Home : System.Web.UI.Page
{

    static string connstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    //static string connstr = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=F:\\IS Files\\Summer_Training\\learn\\App_Data\\employee.accdb";
    OleDbConnection dbconn = new OleDbConnection(connstr);
    OleDbCommand dbCMD = new OleDbCommand();
   
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Employeelog.aspx");
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        Response.Redirect("Employeelog.aspx");
    }
    protected void doclog_Click(object sender, EventArgs e)
    {
        Response.Redirect("Doctorlog.aspx");
    }
}
