<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Employeelog.aspx.cs" Inherits="Employeelog" %>

<script runat="server">

    
   
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table class="style1">
        <tr bgcolor="#CCCCCC">
            <td>
                <asp:Label ID="Labelnum" runat="server" Text="Emp Number"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="empno" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="Buttonfet" runat="server" Text="Fetch" 
                    onclick="Buttonfet_Click" />
            </td>
        </tr>
        <tr bgcolor="Silver">
            <td>
                <asp:Label ID="Labelname" runat="server" Text="Name"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="name" runat="server"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr bgcolor="#CCCCCC">
            <td>
                <asp:Label ID="Labeldob" runat="server" Text="DOB"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBoxdob" runat="server"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr bgcolor="Silver">
            <td>
                <asp:Label ID="Labeldes" runat="server" Text="Designation"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBoxdes" runat="server"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr bgcolor="#CCCCCC">
            <td>
                <asp:Label ID="Labeldep" runat="server" Text="Department"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBoxdep" runat="server"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr bgcolor="Silver">
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="Button_sub" runat="server" Text="Submit" onclick="Button2_Click" />
                <br />
                <asp:Label ID="Labelresult" runat="server" Text=""></asp:Label>
                <br />
                <asp:Label ID="Label_err" runat="server" Text=""></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

