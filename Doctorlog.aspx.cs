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



public partial class Doctorlog : System.Web.UI.Page
{
    static string connstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    //static string connstr = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=F:\\IS Files\\Summer_Training\\learn\\App_Data\\employee.accdb";
    OleDbConnection dbconn = new OleDbConnection(connstr);
    OleDbCommand dbCMD = new OleDbCommand();
    OleDbDataReader dtr;


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            TextBoxemp.Text = "";

        }
        

        DateTime d = DateTime.Now;
        Label_date.Text = d.ToShortDateString();
        Label_err.Text = "";
        Labelresult.Text = "";
                
       
    }
    protected void Button_fetch_Click(object sender, EventArgs e)
    {
        try
        {
            

            dbconn.Open();
            dbCMD = new OleDbCommand("select empno,dob, name from employee where empno='" + TextBoxemp.Text + "'", dbconn);
            dtr = dbCMD.ExecuteReader();
            while (dtr.Read())
            {
                TextBoxname.Text = dtr["name"].ToString();
                DateTime dt = Convert.ToDateTime((dtr["dob"].ToString()));
                TextBoxdob.Text = dt.ToShortDateString();
                TimeSpan tm = (DateTime.Now - dt);
                int a = (tm.Days / 365);
                TextBoxage.Text = a.ToString();
                Session["user"] = TextBoxemp.Text;
                Session["date"] = Label_date.Text;
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
    }
    protected void Button_submit_Click(object sender, EventArgs e)
    {

        try
        {
            dbconn.Open();
            dbCMD.Connection = dbconn;

            dbCMD.CommandText = "insert into emp_details(empno,low_bp,high_bp,blood_sugar_1,blood_sugar_2,weight,remarks)" +  
                         " values(:empno,:TextBoxlbp, :TextBoxhbp,:TextBoxsugar,:TextBoxsugar2,:TextBoxwt,:TextBoxremark)";
                dbCMD.Parameters.Clear();
                dbCMD.Parameters.AddWithValue("empno", TextBoxemp.Text);                                                                                                                                                                                                                                                                                                                                          
                dbCMD.Parameters.AddWithValue("low_bp", TextBoxlbp.Text);   
                dbCMD.Parameters.AddWithValue("high_bp", TextBoxhbp.Text);
                dbCMD.Parameters.AddWithValue("blood_sugar_1", TextBoxsugar.Text);
                dbCMD.Parameters.AddWithValue("blood_sugar_2", TextBoxsugar2.Text);
                dbCMD.Parameters.AddWithValue("weight", TextBoxwt.Text);
                dbCMD.Parameters.AddWithValue("remarks", TextBoxremark.Text);

                //if (dt.Text != "")
                //     dbCMD.Parameters.Add("dt",dt.Text );    
                //else
                //     dbCMD.Parameters.Add("dt", DBNull.Value);    


            dbCMD.ExecuteNonQuery();
        
            Label_err.Text = "Data successfully Inserted";


        }
        catch (OleDbException ex)
        {
            Label_err.Text=ex.StackTrace;

        }
        finally
        { 
                dbconn.Close();
                

        }
       
    }

        
    protected void DropDownListmedi_textchange(object sender, EventArgs e)
    {
        Response.Redirect("Doctorlog.aspx");
    }


    protected void DropDownListmedi_SelectedIndexChanged1(object sender, EventArgs e)
    {
        DropDownList DropDownListmedi = (DropDownList)sender;
        if (DropDownListmedi.SelectedValue == "other")
        {
           textbox.Enabled = true;
           textbox.Text = string.Empty;
           textbox.Visible = true;
        }
        else
        {
            textbox.Visible = false;
            textbox.Enabled = false;
            textbox.Text = DropDownListmedi.SelectedValue;
        }
       
    }
    
    
    protected void Button_cancel_Click(object sender, EventArgs e)
    {
        TextBoxemp.Text = "";
        TextBoxname.Text = "";
        TextBoxdob.Text = "";
        TextBoxlbp.Text = "";
        TextBoxhbp.Text = "";
        TextBoxsugar.Text = "";
        TextBoxsugar2.Text = "";
        TextBoxwt.Text = "";
        TextBoxremark.Text = "";
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        try
        {
            dbconn.Open();
            dbCMD.Connection = dbconn;

            if (DropDownListmedi.SelectedValue == "other")
            {
                //dbCMD.CommandText = ("insert into employee(empno,emp_name,dt) values (system_date,empno,medicines)");
                dbCMD.CommandText = ("insert into emp_medicines(system_date,empno,medicines) values (system_date,empno,medicines)");
                dbCMD.Parameters.Clear();
                dbCMD.Parameters.Add("system_date", Label_date.Text);
                dbCMD.Parameters.Add("empno", TextBoxemp.Text);
                dbCMD.Parameters.Add("medicines", textbox.Text);

                //if (dt.Text != "")
                //     dbCMD.Parameters.Add("dt",dt.Text );    
                //else
                //     dbCMD.Parameters.Add("dt", DBNull.Value);    
                dbCMD.ExecuteNonQuery();
                GridView2.DataBind();
            }
            else
            {
                textbox.Text = DropDownListmedi.SelectedValue;
                dbCMD.CommandText = ("insert into emp_medicines(system_date,empno,medicines) values (system_date,empno,medicines)");
                dbCMD.Parameters.Clear();
                dbCMD.Parameters.Add("system_date", Label_date.Text);
                dbCMD.Parameters.Add("empno", TextBoxemp.Text);
                dbCMD.Parameters.Add("medicines", textbox.Text);

                //if (dt.Text != "")
                //     dbCMD.Parameters.Add("dt",dt.Text );    
                //else
                //     dbCMD.Parameters.Add("dt", DBNull.Value);    
                dbCMD.ExecuteNonQuery();
                GridView2.DataBind(); 
            }
            

            Labelresult.Text = "Data successfully Inserted";
        }
        catch (OleDbException ex)
        {
            

        }
        finally
        {
            dbconn.Close();
            GridView2.DataBind();
        }
        }
        

    
    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            dbconn.Open();
            dbCMD.Connection = dbconn;
            for (int i = 0; i < CheckBoxList1.Items.Count ; i++)
            {
                String str = "";
                if (CheckBoxList1.Items[i].Selected == true)
                {

                    str = str + CheckBoxList1.Items[i].Text ;
                    dbCMD.CommandText = ("insert into emp_medicines(system_date,empno,medicines) values (system_date,empno,medicines)");
                    dbCMD.Parameters.Clear();
                    dbCMD.Parameters.Add("system_date", Label_date.Text);
                    dbCMD.Parameters.Add("empno", TextBoxemp.Text);
                    dbCMD.Parameters.Add("medicines", str);
                    dbCMD.ExecuteNonQuery();
                    GridView2.DataBind();

                }

            }
           
        }
        catch (OleDbException ex)
        {


        }
        finally
        {
            dbconn.Close();
            GridView2.DataBind();
        }

    }
    
    protected void Button3_Click(object sender, EventArgs e)
    {
        try
        {
            dbconn.Open();
            dbCMD.Connection = dbconn;
            
        }
        catch (OleDbException ex)
        {
        }
        finally
        {
            dbconn.Close();
            GridView1.DataBind();
            GridView1.Visible=true;
        }

    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        CheckBoxList1.Visible = true;
        Button2.Visible = true;
    }
}
