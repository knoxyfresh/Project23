<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Project2.index" %>

<%@ Import Namespace="BookLibrary" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Book Store</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <style>
        .row {
            margin-top: 20px;
            margin-bottom: 20px;
        }

        #errorarea {
            color: red;
        }

        h4 {
            font-weight: bold;
        }

        @-webkit-keyframes Gradient {
            0% {
                background-position: 0% 50%
            }

            50% {
                background-position: 100% 50%
            }

            100% {
                background-position: 0% 50%
            }
        }

        @-moz-keyframes Gradient {
            0% {
                background-position: 0% 50%
            }

            50% {
                background-position: 100% 50%
            }

            100% {
                background-position: 0% 50%
            }
        }

        @keyframes Gradient {
            0% {
                background-position: 0% 50%
            }

            50% {
                background-position: 100% 50%
            }

            100% {
                background-position: 0% 50%
            }
        }

        body {
            background: linear-gradient(-45deg, #EE7752, #E73C7E, #23A6D5, #23D5AB);
            background-size: 400% 400%;
            -webkit-animation: Gradient 15s ease infinite;
            -moz-animation: Gradient 15s ease infinite;
            animation: Gradient 15s ease infinite;
        }

        .container {
            background-color: white;
        }

        .pad {
            padding: 50px;
        }

        #LabelError {
            color: red;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="jumbotron text-center">
                <h1>Book Store</h1>
            </div>
            <div class="row">
                <div class="col-lg-12 text-center" id="ErrorDisplay" runat="server" visible="false">
                    <asp:Label ID="LabelError" runat="server"></asp:Label>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12" id="BtnBackDisplay" runat="server" visible="false">
                    <asp:Button ID="BtnBack" runat="server" OnClick="BtnBack_Click" Text="Back" class="btn btn-primary" />
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4">
                    <div runat="server" id="InfoFields">

                        <h4>Student ID</h4>
                        <asp:TextBox ID="TxtStudent" runat="server"></asp:TextBox>
                        <h4>First Name</h4>
                        <asp:TextBox ID="TxtFirstName" runat="server"></asp:TextBox>
                        <h4>Last Name</h4>
                        <asp:TextBox ID="TxtLastName" runat="server"></asp:TextBox>
                        <h4>Address</h4>
                        <asp:TextBox ID="TxtAddress" runat="server"></asp:TextBox>
                        <h4>Address 2</h4>
                        <asp:TextBox ID="TxtAddress2" runat="server"></asp:TextBox>
                        <h4>State</h4>
                        <asp:TextBox ID="TxtState" runat="server"></asp:TextBox>
                        <h4>Zip</h4>
                        <asp:TextBox ID="TxtZip" runat="server" pattern="(\d{5}([\-]\d{4})?)"></asp:TextBox>
                        <h4>Phone</h4>
                        <asp:TextBox ID="TxtPhone" runat="server" MaxLength="12"></asp:TextBox>
                        <br />
                        <h4>Campus</h4>
                        <asp:DropDownList ID="DropDownCampus" runat="server" CssClass="dropdown-toggle">
                            <asp:ListItem Value="maincampus">Main</asp:ListItem>
                            <asp:ListItem Value="japan">Japan</asp:ListItem>
                            <asp:ListItem Value="ambler">Ambler</asp:ListItem>
                            <asp:ListItem Value="tokyo">Tokyo</asp:ListItem>
                            <asp:ListItem Value="health">Health Sciences Center</asp:ListItem>
                            <asp:ListItem Value="harrisburg">Harrisburg</asp:ListItem>
                            <asp:ListItem Value="wonka">WonkaWorld</asp:ListItem>
                        </asp:DropDownList>
                        <br />
                        <br />
                        <asp:Button ID="ButtonSubmitInfo" runat="server" OnClick="ButtonSubmitInfo_Click" Text="Submit Info" class="btn btn-primary" />
                    </div>
                    <div runat="server" id="InfoDisplay" visible="false">
                        <h4>Information</h4>
                        <p>
                            <asp:Label runat="server" ID="LabelName"></asp:Label>
                        </p>
                        <p>
                            <asp:Label runat="server" ID="LabelAddress"></asp:Label>
                        </p>
                        <p>
                            <asp:Label runat="server" ID="LabelAddress2"></asp:Label>
                        </p>
                        <p>
                            <asp:Label runat="server" ID="LabelStateAndZip"></asp:Label>
                        </p>
                        <p>
                            <asp:Label runat="server" ID="LabelCampus"></asp:Label>
                        </p>
                        <p>
                            <asp:Label runat="server" ID="LabelPhone"></asp:Label>
                        </p>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div runat="server" id="BooksDisplay" visible="false">
                        <asp:GridView ID="BooksGridView" runat="server" AutoGenerateColumns="false" class="table">
                            <Columns>
                                <asp:TemplateField HeaderText="Purchase">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="checkBuy" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="ISBN" HeaderText="ISBN" ReadOnly="true" />
                                <asp:BoundField DataField="BasePrice" HeaderText="Price" ReadOnly="true" DataFormatString="{0:c}" />
                                <asp:BoundField DataField="Title" HeaderText="Title" ReadOnly="true" />
                                <asp:BoundField DataField="Authors" HeaderText="Authors" ReadOnly="true" />
                                <asp:TemplateField HeaderText="Type">
                                    <ItemTemplate>
                                        <asp:DropDownList ID="DropDownType" runat="server">
                                            <asp:ListItem Value="hardcover">Hard Cover</asp:ListItem>
                                            <asp:ListItem Value="paperback">Paper Back</asp:ListItem>
                                            <asp:ListItem Value="ebook">E-book</asp:ListItem>
                                        </asp:DropDownList>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Rent/Buy">
                                    <ItemTemplate>
                                        <asp:DropDownList ID="DropDownRentOrBuy" runat="server">
                                            <asp:ListItem Value="buy">Buy</asp:ListItem>
                                            <asp:ListItem Value="rent">Rent</asp:ListItem>
                                        </asp:DropDownList>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Quantity">
                                    <ItemTemplate>
                                        <asp:TextBox runat="server" ID="quantity" Text="0" name="quantity" max="99" type="number"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>
                        </asp:GridView>
                        <asp:Button ID="ButtonSubmit" OnClick="ButtonSubmit_Click" Text="Submit Order" class="btn btn-success" runat="server" />
                    </div>
                    <div runat="server" id="CartDisplay" visible="false">
                        <h3>
                            <asp:Label runat="server" ID="LabelNameFinal"></asp:Label>
                        </h3>
                        <asp:GridView ID="CartGridView" runat="server" AutoGenerateColumns="false" class="table">
                            <Columns>
                                <asp:TemplateField HeaderText="Title">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# ((Book)Container.DataItem).Title %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ISBN">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# ((Book)Container.DataItem).Isbn %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Type">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# ((Book)Container.DataItem).BookType %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Rent/Buy">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# ((Book)Container.DataItem).RentedOrBought %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Quantity">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# ((Book)Container.DataItem).Quantity %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Price">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# ((Book)Container.DataItem).Price %>' DataFormatString="{0:c}"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="TotalCost">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# ((Book)Container.DataItem).TotalCost %>' DataFormatString="{0:c}"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:Button ID="ButtonAdmin" runat="server" OnClick="ButtonAdmin_Click" Text="View Admin" class="btn btn-primary" />
                    </div>
                    <div runat="server" id="AdminDisplay" visible="false">
                        <h3>Administration</h3>
                        <asp:GridView ID="AdminGridView" runat="server" AutoGenerateColumns="false" class="table">
                            <Columns>
                                <asp:BoundField DataField="Title" HeaderText="Title" ReadOnly="true" />
                                <asp:BoundField DataField="TotalQuantitySold" HeaderText="Total Sold" ReadOnly="true" />
                                <asp:BoundField DataField="TotalQuantityRented" HeaderText="Total Rented" ReadOnly="true" />
                                <asp:BoundField DataField="TotalSales" HeaderText="Authors" ReadOnly="true" DataFormatString="{0:c}" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script>
        $(function () {
            $("input:checkbox").click(function () {
                $("#BooksGridView tr").each(function () {
                    //if ($(this).find("td").eq(0).find('input[type="checkbox"]').checked == true)
                    //    alert();
                    var textval = $(this).find("td").eq(7).find("input");
                    var checkval = $(this).find('input[type="checkbox"]:checked')
                    console.log("TextBox text is " + textval.val() + "; DCheck value is " + checkval.prop("checked"));
                    if (checkval.prop("checked") && textval.val() == 0)
                        textval.val(1);
                })
            })
        })
    </script>
</body>
</html>
