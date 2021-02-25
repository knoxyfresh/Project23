<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewRestaurant.aspx.cs" Inherits="Yelp.ViewRestaurant" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Restaurant</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="style.css" />
</head>
<body>
    <!-- #include file="nav.html" -->
    <form id="form1" runat="server">
        <div class="container">
            <div class="jumbotron">
                <h1>
                    <asp:Label runat="server" ID="labelname"></asp:Label></h1>
            </div>
            <div class="row">

                <div class="col-lg-8">
                    <p>
                        <asp:Label runat="server" ID="labeltype"></asp:Label>
                    </p>
                    <p>
                        <asp:Label runat="server" ID="labeldesc"></asp:Label>
                    </p>
                    <asp:GridView ID="GridViewReviews" runat="server" AutoGenerateColumns="false" CssClass="table">
                        <Columns>
                            <asp:BoundField DataField="Title" HeaderText="Title" ReadOnly="true" />
                            <asp:BoundField DataField="Details" HeaderText="Details" ReadOnly="true" />
                            <asp:BoundField DataField="FoodRating" HeaderText="Food" ReadOnly="true" />
                            <asp:BoundField DataField="ServiceRating" HeaderText="Service" ReadOnly="true" />
                            <asp:BoundField DataField="AtmosphereRating" HeaderText="Atmosphere" ReadOnly="true" />
                            <asp:BoundField DataField="PriceRating" HeaderText="Price" ReadOnly="true" />
                        </Columns>
                    </asp:GridView>
                </div>
                <div class="row">
                    <div class="col-lg-4">
                        <h3>Avg. Ratings</h3>
                        <p>
                            <asp:Label runat="server" ID="labelrfood"></asp:Label>
                        </p>
                        <p>
                            <asp:Label runat="server" ID="labelrservice"></asp:Label>
                        </p>
                        <p>
                            <asp:Label runat="server" ID="labelratmos"></asp:Label>
                        </p>
                        <p>
                            <asp:Label runat="server" ID="labelrprice"></asp:Label>
                        </p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <asp:Button runat="server" ID="buttonmanage" Visible="false" Text="Manage" />
                    </div>
                    <div class="col-lg-6">
                        <asp:Button runat="server" ID="buttonadd" Text="Add Review" OnClick="buttonadd_Click" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
