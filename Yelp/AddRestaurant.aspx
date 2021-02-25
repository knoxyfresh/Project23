<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddRestaurant.aspx.cs" Inherits="Yelp.AddRestaurant" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Restaurant</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="style.css" />
</head>
<body>
    <!-- #include file="nav.html" -->
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:Label ID="Label1" runat="server" Text="Type"></asp:Label>
        <asp:DropDownList ID="dropdownlisttype" runat="server">
        </asp:DropDownList>

        <asp:Label ID="Label2" runat="server" Text="Name"></asp:Label>
        <asp:TextBox ID="textboxname" runat="server"></asp:TextBox>

        <asp:Label ID="Label4" runat="server" Text="Image"></asp:Label>
        <asp:TextBox ID="textboximage" runat="server"></asp:TextBox>

        <asp:Label ID="Label3" runat="server" Text="Description"></asp:Label>
        <asp:TextBox ID="textboxdesc" runat="server" TextMode="MultiLine"></asp:TextBox>
        <asp:Button CssClass="btn btn-primary" runat="server" ID="buttonmanage" Text="Add" OnClick="buttonmanage_Click" />
    </form>
</body>
</html>
