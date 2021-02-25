<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddReview.aspx.cs" Inherits="Yelp.AddReview" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Review</title>
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
                <h1>Add Review for
                    <asp:Label runat="server" ID="labeltitle"></asp:Label></h1>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="alert alert-dark" role="alert">
                        <asp:Label runat="server" ID="labelerror"></asp:Label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-8">
                    <p>Title</p>
                    <asp:TextBox ID="textboxtitle" runat="server" Text=""></asp:TextBox>
                    <p>Description</p>
                    <asp:TextBox ID="textboxdesc" runat="server" TextMode="MultiLine" Text=""></asp:TextBox>
                </div>
                <div class="col-lg-4">
                    <div class="card">
                        <div class="card-header">
                            Star Ratings
                        </div>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">
                                <p>Food Rating</p>
                                <asp:DropDownList ID="dropdownfood" runat="server">
                                    <asp:ListItem Text="1 Star" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="2 Stars" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="3 Stars" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="4 Stars" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="5 Stars" Value="5"></asp:ListItem>
                                </asp:DropDownList>
                            </li>
                            <li class="list-group-item">
                                <p>Service Rating</p>
                                <asp:DropDownList ID="dropdownservice" runat="server">
                                    <asp:ListItem Text="1 Star" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="2 Stars" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="3 Stars" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="4 Stars" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="5 Stars" Value="5"></asp:ListItem>
                                </asp:DropDownList>
                            </li>
                            <li class="list-group-item">
                                <p>Atmosphere Rating</p>
                                <asp:DropDownList ID="dropdownatmos" runat="server">
                                    <asp:ListItem Text="1 Star" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="2 Stars" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="3 Stars" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="4 Stars" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="5 Stars" Value="5"></asp:ListItem>
                                </asp:DropDownList>
                            </li>
                            <li class="list-group-item">
                                <p>Price Rating</p>
                                <asp:DropDownList ID="dropdownprice" runat="server">
                                    <asp:ListItem Text="1 Star" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="2 Stars" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="3 Stars" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="4 Stars" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="5 Stars" Value="5"></asp:ListItem>
                                </asp:DropDownList>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <asp:Button runat="server" ID="buttonaddreview" Text="Add Review" OnClick="buttonaddreview_Click" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
