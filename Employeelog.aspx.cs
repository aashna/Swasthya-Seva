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


public partial class Employeelog : System.Web.UI.Page
{
    static string connstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    //static string connstr = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=F:\\IS Files\\Summer_Training\\learn\\App_Data\\employee.accdb";
    OleDbConnection dbconn = new OleDbConnection(connstr);
    OleDbCommand dbCMD = new OleDbCommand();
    OleDbDataReader dtr;




    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {

        try
        {
            dbconn.Open();
            dbCMD.Connection = dbconn;
                
                    
                    dbCMD.CommandText = ("insert into employee(empno,name,department,dob,designation) values (:empno,:name,:TextBoxdep,:TextBoxdob,:TextBoxdes)");
                    dbCMD.Parameters.Clear();
                    dbCMD.Parameters.Add("empno", empno.Text);
                    dbCMD.Parameters.Add("name", name.Text);
                    dbCMD.Parameters.Add("department", TextBoxdep.Text);

                    dbCMD.Parameters.Add("dob", TextBoxdob.Text);

                    dbCMD.Parameters.Add("designation", TextBoxdes.Text);
                    //if (dt.Text != "")
                    //     dbCMD.Parameters.Add("dt",dt.Text );    
                    //else
                    //     dbCMD.Parameters.Add("dt", DBNull.Value);    
                    dbCMD.ExecuteNonQuery();

                    Labelresult.Text = "Data successfully Inserted";
                }
            
        
        catch (OleDbException ex)
        {
            Label_err.Text = ex.ToString();

        }
        finally
        {
            dbconn.Close();
            //GridView1.DataBind();
        }

        
        
        
    
    }
    protected void Buttonfet_Click(object sender, EventArgs e)
    {
        try
        {

            dbconn.Open();
            dbCMD = new OleDbCommand("select * from employee where empno='" + empno.Text + "'", dbconn);
            dtr = dbCMD.ExecuteReader();
            while (dtr.Read())
            {
                name.Text = dtr["name"].ToString();
                TextBoxdob.Text = dtr["dob"].ToString();
                TextBoxdes.Text = dtr["designation"].ToString();
                TextBoxdep.Text = dtr["department"].ToString();
            }

        }
        catch (OleDbException ex)
        {
            Label_err.Text = ex.ToString();
        }
        finally
        {

            dtr.Close();
            dbconn.Close();
        }
        //GridView1.DataBind();
    }
}