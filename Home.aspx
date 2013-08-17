<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Home.aspx.cs" Inherits="Home" %>

<script runat="server">

 
</script>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <table class="style1">
        <tr>
            <td align=center>
                
                <asp:Label ID="Label1" runat="server" Text="Employee"></asp:Label>
            </td>
            <td>
                <asp:Button ID="emplog" runat="server" Text="Login"  onclick="Button1_Click1" />
            </td>
        </tr>
        <tr>
            <td align=center>
                <asp:Label ID="Label2" runat="server" Text="Doctor"></asp:Label>
            </td>
            <td>
                <asp:Button ID="doclog" runat="server" Text="Login" onclick="doclog_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
