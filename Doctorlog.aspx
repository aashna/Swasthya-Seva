<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Doctorlog.aspx.cs" Inherits="Doctorlog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            height: 21px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table class="style1" frame="box" width="100%">
        <tr style="background-color: #C0C0C0">
            <td>
                <asp:Label ID="Label1" runat="server" Text="Empno"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBoxemp" runat="server"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button_fetch" runat="server" Text="Fetch" 
                    onclick="Button_fetch_Click" />
            </td>
            <td rowspan="10" style=" background-color:White">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                   ForeColor="#333333" DataSourceID="AccessDataSource2" Visible="False" 
                   >
                   <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="empno" HeaderText="empno" SortExpression="empno" />
                        <asp:BoundField DataField="low_bp" HeaderText="low_bp" 
                            SortExpression="low_bp" />
                        <asp:BoundField DataField="high_bp" HeaderText="high_bp" 
                            SortExpression="high_bp" />
                        <asp:BoundField DataField="blood_sugar_1" HeaderText="blood_sugar(Fasting)" 
                            SortExpression="blood_sugar_1" />
                            <asp:BoundField DataField="blood_sugar_2" HeaderText="blood_sugar(Postpradial)" 
                            SortExpression="blood_sugar_2" />
                        <asp:BoundField DataField="weight" HeaderText="weight" 
                            SortExpression="weight" />
                        <asp:BoundField DataField="remarks" HeaderText="remarks" 
                            SortExpression="remarks" />
                       
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
                <asp:AccessDataSource ID="AccessDataSource2" runat="server" 
                    DataFile="~/App_Data/employee.accdb" 
                    SelectCommand="SELECT * FROM [emp_details] WHERE ([empno] = ?)">
                    <SelectParameters>
                        <asp:SessionParameter Name="empno" SessionField="user" Type="String" />
                    </SelectParameters>
                </asp:AccessDataSource>
                <br />
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="AccessDataSource4"> <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="system_date" HeaderText="system_date" 
                            SortExpression="system_date" DataFormatString="{0:d}" />
                        <asp:BoundField DataField="empno" HeaderText="empno" SortExpression="empno" />
                        <asp:BoundField DataField="medicines" HeaderText="medicines" 
                            SortExpression="medicines" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
                <asp:AccessDataSource ID="AccessDataSource4" runat="server" 
                    DataFile="~/App_Data/employee.accdb" 
                    SelectCommand="SELECT * FROM [emp_medicines] WHERE (([empno] = ?) AND ([system_date]=?))">
                    <SelectParameters>
                        <asp:SessionParameter Name="empno" SessionField="user" Type="String" />
                        <asp:SessionParameter Name="system_date" SessionField="date" Type="String" />
                    </SelectParameters>
                </asp:AccessDataSource>
            </td>
        </tr>
        <tr style="background-color: #CCCCCC">
            <td>
                <asp:Label ID="Label2" runat="server" Text="Name"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBoxname" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr style="background-color: #C0C0C0">
            <td>
                <asp:Label ID="Label3" runat="server" Text="Date of birth"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBoxdob" runat="server" 
                     Width="102px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label12" runat="server" Text="Age"></asp:Label>
                <asp:TextBox ID="TextBoxage" runat="server" style="margin-left: 10px" 
                    Width="50px"></asp:TextBox>
            </td>
        </tr>
        <tr style="background-color: #CCCCCC">
            <td align=right class="style2">
                <asp:Label ID="Label4" runat="server" Text="Date"></asp:Label>
                <br />
                <br />
            </td>
            <td class="style2" rowspan="1">
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label_date" runat="server" Text=""></asp:Label>
                <br />
                <br />
                <br />
            </td>
        </tr>
        <tr style="background-color: #C0C0C0">
            <td>
                <asp:Label ID="Label5" runat="server" Text="Blood pressure"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBoxlbp" runat="server" Width="106px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBoxhbp" runat="server" style="margin-left: 4px" 
                    Width="105px"></asp:TextBox>
                <br />
                Diastolic&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                Systolic &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                <br />
            </td>
        </tr>
        <tr style="background-color:#CCCCCC">
            <td>
                <asp:Label ID="Label6" runat="server" Text="Blood sugar"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBoxsugar" runat="server" Width="84px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBoxsugar2" runat="server" Width="84px"></asp:TextBox>
&nbsp;&nbsp;
                <br />
                <asp:Label ID="Label10" runat="server" Text="Fasting"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label11" runat="server" Text="Postpradial"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
        </tr>
        <tr style="background-color: #C0C0C0">
            <td>
                <asp:Label ID="Label7" runat="server" Text="Weight"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBoxwt" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr style="background-color: #CCCCCC">
            <td>
                <asp:Label ID="Label8" runat="server" Text="Medicine prescribed"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DropDownListmedi" runat="server" 
                    DataSourceID="AccessDataSource1" DataTextField="medicine" AutoPostBack="True" 
                    DataValueField="medicine" 
                    onselectedindexchanged="DropDownListmedi_SelectedIndexChanged1" 
                      >
                </asp:DropDownList>

               
            


     
                <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                    DataFile="~/App_Data/employee.accdb" SelectCommand="SELECT * FROM [medicines1]">
                </asp:AccessDataSource>
                
                &nbsp;<asp:TextBox ID="textbox" runat="server" Visible=false
                    ></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button 
                    ID="Button1" runat="server" Text="ADD" onclick="Button1_Click" />
                <asp:Label ID="Labelresult" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr style="background-color: #C0C0C0">
            <td>
                <asp:Label ID="Label9" runat="server" Text="Remarks"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBoxremark" runat="server" TextMode="MultiLine" 
                    ></asp:TextBox>
            </td>
        </tr>
        <tr style="background-color: #C0C0C0">
            <td>
                &nbsp;</td>
            <td>
                <br />
                <asp:CheckBoxList ID="CheckBoxList1" runat="server" 
                    DataSourceID="AccessDataSource3" DataTextField="medicines" 
                    DataValueField="medicines" Visible="False">
                </asp:CheckBoxList>
                <asp:AccessDataSource ID="AccessDataSource3" runat="server" 
                    DataFile="~/App_Data/employee.accdb" 
                    
                    SelectCommand="SELECT DISTINCT [medicines] FROM [emp_medicines] WHERE ([empno] = ?) ORDER BY [medicines]">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextBoxemp" Name="empno" PropertyName="Text" 
                            Type="Int32" />
                    </SelectParameters>
                </asp:AccessDataSource>
                <br />
                <asp:Button ID="Button2" runat="server" Text="Add" onclick="Button2_Click" 
                    Visible="False" />
                <br />
                <br />
                <asp:Button ID="Button3" runat="server" onclick="Button3_Click" Text="Medical History" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button4" runat="server" Text="Medicines Prescribed" 
                    onclick="Button4_Click" />
                <br />
                <br />
                <asp:Label ID="Label_err" runat="server" Text=""></asp:Label>
                <br />
                <asp:Button ID="Button_submit" runat="server" Text="Submit" 
                    onclick="Button_submit_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button_cancel" runat="server" Text="Cancel" 
                    onclick="Button_cancel_Click" />
                <br />
                <br />
                <br />
            </td>
        </tr>
    </table>
</asp:Content>

