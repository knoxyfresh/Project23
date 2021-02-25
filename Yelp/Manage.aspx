<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="Yelp.Manage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridViewReviews" runat="server" AutoGenerateColumns="false" CssClass="table" OnRowCancelingEdit="CancelEditReview" OnRowEditing="EditReview" OnRowUpdating="UpdateReview">
                <Columns>
                    <asp:TemplateField HeaderText="Title">
                        <ItemTemplate>
                            <asp:TextBox ID="txtTitle" runat="server" Height="20px" Width="64px" Text='<%# Bind("Title") %>'></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Details">
                        <ItemTemplate>
                            <asp:TextBox ID="txtDetails" runat="server" Height="20px" Width="64px" Text='<%# Bind("Details") %>' TextMode="MultiLine"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Food">
                        <ItemTemplate>
                            <asp:TextBox ID="txtFood" runat="server" Height="20px" Width="64px" Text='<%# Bind("FoodRating") %>'></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Service">
                        <ItemTemplate>
                            <asp:TextBox ID="txtService" runat="server" Height="20px" Width="64px" Text='<%# Bind("ServiceRating") %>'></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Atmosphere">
                        <ItemTemplate>
                            <asp:TextBox ID="txtAtmos" runat="server" Height="20px" Width="64px" Text='<%# Bind("AtmosphereRating") %>'></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Price">
                        <ItemTemplate>
                            <asp:TextBox ID="txtPrice" runat="server" Height="20px" Width="64px" Text='<%# Bind("PriceRating") %>'></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ButtonType="Button" HeaderText="Edit Product" ShowEditButton="True" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
