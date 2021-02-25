<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="Yelp.Main" %>

<%@ Import Namespace="RestaurantsReview" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Main Page</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="style.css" />
</head>
<body>
    <form id="form1" runat="server">
        <!-- #include file="nav.html" -->
        <div class="container">
            <div class="jumbotron">
                <h1>Restaurants</h1>
            </div>
            <div class="col-lg-12">
                <h3>
                    <asp:Label ID="labelwelcome" runat="server"></asp:Label>

                </h3>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <p>Sorting</p>
                    <asp:CheckBox ID="checkboxbar" runat="server" AutoPostBack="True" Text="Bar" OnCheckedChanged="Filter" />
                    <asp:CheckBox ID="checkboxfastfood" runat="server" AutoPostBack="True" Text="Fast Food" OnCheckedChanged="Filter" />
                    <asp:CheckBox ID="checkboxcasual" runat="server" AutoPostBack="True" Text="Casual" OnCheckedChanged="Filter" />
                    <asp:CheckBox ID="checkboxcoffee" runat="server" AutoPostBack="True" Text="Coffee" OnCheckedChanged="Filter" />
                    <asp:CheckBox ID="checkboxupscale" runat="server" AutoPostBack="True" Text="Upscale" OnCheckedChanged="Filter" />
                </div>
            </div>
            <div class="row">
                <div class="col-lg-9">
                    <asp:GridView ID="GridViewRestaurants" runat="server" AutoGenerateColumns="false" CssClass="table">
                        <Columns>
                            <asp:BoundField DataField="RestaurantID" HeaderText="ID" ReadOnly="true" />
                            <asp:TemplateField HeaderText="View">
                                <ItemTemplate>
                                    <asp:Image ID="img" runat="server" CssClass="img-fluid" ImageUrl='<%# Eval("img") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="true" />
                            <asp:BoundField DataField="Description" HeaderText="Description" ReadOnly="true" />
                            <asp:BoundField DataField="Type" HeaderText="Type" ReadOnly="true" />
                            <asp:BoundField DataField="AvgReviewFood" HeaderText="Food" ReadOnly="true" />
                            <asp:BoundField DataField="AvgReviewService" HeaderText="Service" ReadOnly="true" />
                            <asp:BoundField DataField="AvgReviewAtmos" HeaderText="Atmoshere" ReadOnly="true" />
                            <asp:BoundField DataField="AvgReviewPrice" HeaderText="Price" ReadOnly="true" />
                            <asp:TemplateField HeaderText="View">
                                <ItemTemplate>
                                    <asp:Button runat="server" Text="Open Reviews" OnClick="OpenReviews" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
                <div class="col-lg-3">
                    <div class="card">
                        <div class="card-body">
                            <asp:Button CssClass="btn btn-primary" runat="server" ID="buttonamakereservation" Text="Make Reservation" OnClick="buttonamakereservation_Click" />
                            <br />
                            <br />
                            <asp:Button CssClass="btn btn-primary" runat="server" ID="buttonaddrestaurant" Text="Add Restaurant" Visible="false" OnClick="buttonaddrestaurant_Click" />
                            <br />
                            <br />
                            <asp:Button CssClass="btn btn-primary" runat="server" ID="buttonmanage" Text="Manage" Visible="false" OnClick="buttonmanage_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
