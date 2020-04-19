<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="UStudyGroup.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="height: 286px">
    <form id="form1" runat="server">
        <div aria-hidden="False" aria-orientation="horizontal">
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" BackColor="White" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" ForeColor="Black">
            </asp:DropDownList>
            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" Visible="False" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
            </asp:DropDownList>
            <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" Visible="False" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged">
            </asp:DropDownList>
        </div>
        <p>
            <asp:Label ID="Label1" runat="server" Text="Name" Visible="False"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" AutoPostBack="True" OnTextChanged="TextBox1_TextChanged" Visible="False"></asp:TextBox>
        </p>
        <p>
        <asp:Label ID="Label2" runat="server" Text="Email" Visible="False"></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server" AutoPostBack="True" OnTextChanged="TextBox2_TextChanged" Visible="False"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label3" runat="server" Text="Phone" Visible="False"></asp:Label>
            <asp:TextBox ID="TextBox3" runat="server" AutoPostBack="True" OnTextChanged="TextBox3_TextChanged" Visible="False"></asp:TextBox>
        </p>
        <asp:Label ID="Label4" runat="server" Text="Max" Visible="False"></asp:Label>
        <asp:TextBox ID="TextBox4" runat="server" AutoPostBack="True" OnTextChanged="TextBox4_TextChanged" Visible="False"></asp:TextBox>
        <p>
            <asp:Button ID="Button1" runat="server" Text="Join a group" Visible="False" OnClick="Button1_Click" />
            <asp:Button ID="Button2" runat="server" Text="Create" Visible="False" OnClick="Button2_Click"/>
        </p>
    </form>
</body>
</html>
