<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddReservation.aspx.cs" Inherits="Yelp.AddReservation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <title>Add Reservation</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="style.css" />
</head>
<body>
 <!-- #include file="nav.html" -->
    <form id="form1" runat="server">
        <div class="container">
            <asp:Label runat="server" ID="labelerror"></asp:Label>
            <div runat="server" id="content">
        <asp:Label ID="Label1" runat="server" Text="Restaurant"></asp:Label>
        <asp:DropDownList ID="dropdownlistrestaurant" runat="server">
        </asp:DropDownList>

        <asp:Label ID="Label2" runat="server" Text="Name"></asp:Label>
        <asp:TextBox ID="textboxname" runat="server"></asp:TextBox>

        <asp:Label ID="Label4" runat="server" Text="Date and Time"></asp:Label>
        <asp:TextBox ID="textboxdate" runat="server" class="form-control" TextMode="DateTimeLocal"></asp:TextBox>
      
        <asp:Label ID="Label3" runat="server" Text="Party of"></asp:Label>
        <asp:TextBox ID="textboxparty" runat="server" type="number"></asp:TextBox>
        <asp:Button CssClass="btn btn-primary" runat="server" ID="buttonmanage" Text="Add"/>
            </div>
        </div>
    </form>
</body>
</html>
