<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Yelp.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Yelp Me!</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="style.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="jumbotron">
                <h1>LOGIN</h1>
            </div>
            <div class="row">
                <div class="col-lg-4">
                    <div class="card">
                        <div class="card-body">
                            <asp:Button ID="ButtonLoginVisitor" runat="server" Text="Login Visitor" OnClick="ButtonLoginVisitor_Click" />
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="card">
                        <div class="card-body">
                            <asp:Button ID="ButtonLoginReviewer" runat="server" Text="Login Reviewer" OnClick="ButtonLoginReviewer_Click" />
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="card">
                        <div class="card-body">
                            <asp:Button ID="ButtonLoginRepresentative" runat="server" Text="Login Representative" OnClick="ButtonLoginRepresentative_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
