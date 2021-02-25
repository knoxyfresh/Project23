using System;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utilities;
using BookLibrary;
using PersonClass;
using System.Data;

namespace Project2
{
    public partial class index : System.Web.UI.Page
    {
        DBConnect objDB = new DBConnect();
        ArrayList BooksToBuy = new ArrayList();
        Person user = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)    // if it's the first page load
            {
                LabelError.Text = "";
                String strSQL = "SELECT * FROM Books ORDER BY title";
                BooksGridView.DataSource = objDB.GetDataSet(strSQL);
                BooksGridView.DataBind();

                AdminGridView.DataSource = objDB.GetDataSet(strSQL);
                AdminGridView.DataBind();


            }
        }
        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            if (!ValidateGridView(BooksGridView))
            {
                error("Please check at least one book and have a correct quantity");
            }
            else
            {
                //get book data
                for (int count = 0; count < BooksGridView.Rows.Count; count++)
                {
                    //Book newBook = new Book(BooksGridView.Rows.Cells[2].Text, BooksGridView.Rows.Cells[1].Text);
                    CheckBox chk = (CheckBox)BooksGridView.Rows[count].FindControl("checkBuy");
                    if (chk.Checked)
                    {
                        string quantitystr = ((TextBox)BooksGridView.Rows[count].FindControl("Quantity")).Text;
                        int quantity;
                        if (Int32.TryParse(quantitystr, out quantity) && quantity > 0)
                        {
                            //validate

                            DropDownList ddl = (DropDownList)BooksGridView.Rows[count].FindControl("DropDownType");
                            string selectedtype = ddl.SelectedValue;
                            DropDownList ddlrb = (DropDownList)BooksGridView.Rows[count].FindControl("DropDownRentOrBuy");
                            string selectedrentorbuy = ddlrb.SelectedValue;
                            //ErrorDisplay.Text += "Book: " + title + "ISBN: " + isbn + "Authors: " + authors;
                            //Make book array

                            //Cart creator
                            //DataRow selectedRow = objDB.GetRow(bookdata, count);
                            //string isbn = selectedRow[0].ToString() + " "; //ISBN 
                            //string title = selectedRow[1] + " ";     //Title
                            //string authors = selectedRow[2] + " ";     // Author
                            //string price = selectedRow[3] + " ";     //price
                            GridViewRow row = BooksGridView.Rows[count];
                            string isbn = row.Cells[1].Text;
                            string price = row.Cells[2].Text;
                            string title = row.Cells[3].Text;
                            string authors = row.Cells[4].Text;
                            decimal totalprice;
                            Decimal.TryParse(price, out totalprice);
                            switch (selectedtype)
                            {
                                case "paperback":
                                    totalprice /= 2;
                                    break;
                                case "ebook":
                                    totalprice /= 3;
                                    break;
                                default:
                                    //hardcover no price change
                                    break;
                            }
                            switch (selectedrentorbuy)
                            {
                                case "rent":
                                    totalprice /= 2;
                                    break;
                                case "buy":
                                    totalprice *= 2;
                                    break;
                                default:
                                    //hardcover no price change
                                    break;
                            }

                            //decide to update rented or bought
                            if (selectedrentorbuy == "rent")
                                objDB.DoUpdate("UPDATE Books SET TotalQuantityRented = TotalQuantityRented + " + quantity + " WHERE ISBN='" + isbn + "';");
                            if (selectedrentorbuy == "buy")
                                objDB.DoUpdate("UPDATE Books SET TotalQuantitySold = TotalQuantitySold + " + quantity + " WHERE ISBN='" + isbn + "';");
                            objDB.DoUpdate("UPDATE Books SET TotalSales = TotalSales + " + totalprice.ToString("#.##") + " WHERE ISBN='" + isbn + "';");

                            Book newbook = new Book(title, isbn, authors, selectedtype, selectedrentorbuy, quantity, Math.Round(totalprice, 2));
                            BooksToBuy.Add(newbook);
                        }
                    }

                }
                CartGridView.DataSource = BooksToBuy;
                CartGridView.DataBind();
                ErrorDisplay.Visible = false;
                CartDisplay.Visible = true;
                BooksDisplay.Visible = false;
            }

        }
        public void error(string er)
        {
            LabelError.Text = er;
            ErrorDisplay.Visible = true;
        }
        public bool ValidateGridView(GridView data)
        {
            int dummyint;
            int checkcnt = 0;
            for (int count = 0; count < data.Rows.Count; count++)
            {
                CheckBox chk = (CheckBox)data.Rows[count].FindControl("checkbuy");
                string quantity = ((TextBox)BooksGridView.Rows[count].FindControl("Quantity")).Text;
                if (chk.Checked)
                {
                    if (string.IsNullOrEmpty(quantity) || !Int32.TryParse(quantity, out dummyint))
                        return false;
                    //if you find one checked with bad quantity then reject
                    checkcnt++;
                }
            }
            return true && checkcnt != 0;
        }

        protected void BtnBack_Click(object sender, EventArgs e)
        {
            if (AdminDisplay.Visible == true)  //back to cart from admin
            {
                AdminDisplay.Visible = false;
                BooksDisplay.Visible = false;
                CartDisplay.Visible = true;
                InfoDisplay.Visible = true;
                InfoFields.Visible = false;
                ErrorDisplay.Visible = false;
            }
            else if (CartDisplay.Visible == true)  //back to books from cart
            {
                AdminDisplay.Visible = false;
                BooksDisplay.Visible = true;
                CartDisplay.Visible = false;
                InfoDisplay.Visible = true;
                InfoFields.Visible = false;
                ErrorDisplay.Visible = false;
                BooksToBuy.Clear();
            }
            else  //back to input info from books
            {
                AdminDisplay.Visible = false;
                BooksDisplay.Visible = false;
                CartDisplay.Visible = false;
                InfoDisplay.Visible = false;
                InfoFields.Visible = true;
                ErrorDisplay.Visible = false;
                BtnBackDisplay.Visible = false;
            }
        }

        protected void ButtonSubmitInfo_Click(object sender, EventArgs e)
        {
            //get user data
            if (string.IsNullOrEmpty(TxtFirstName.Text) || string.IsNullOrEmpty(TxtLastName.Text) || string.IsNullOrEmpty(TxtStudent.Text) || string.IsNullOrEmpty(TxtAddress.Text) || string.IsNullOrEmpty(TxtZip.Text) || string.IsNullOrEmpty(TxtState.Text) || string.IsNullOrEmpty(TxtPhone.Text))
            {
                //empty info fields
                error("Please fill out all of your personal information");
            }
            else
            {

                InfoFields.Visible = false;
                InfoDisplay.Visible = true;
                BooksDisplay.Visible = true;
                BtnBackDisplay.Visible = true;
                ErrorDisplay.Visible = false;
                //build a person
                //concat address since it is only used for shipping
                string address = TxtFirstName.Text + " " + TxtLastName.Text + " " + TxtAddress.Text + " " + TxtAddress2.Text + " " + TxtState.Text + " " + TxtZip.Text;
                user = new Person(TxtFirstName.Text, TxtLastName.Text, TxtStudent.Text, DropDownCampus.Text, TxtPhone.Text, address);
                InfoDisplay.Visible = true;
                LabelName.Text = "Welcome: " + TxtFirstName.Text + " " + TxtLastName.Text + "!";
                LabelAddress.Text = TxtAddress.Text;
                LabelAddress2.Text = TxtAddress2.Text;
                LabelStateAndZip.Text = TxtState.Text + " " + TxtZip.Text;
                LabelCampus.Text = "Campus: " + DropDownCampus.Text;
                LabelPhone.Text = "Phone: " + TxtPhone.Text;
                LabelNameFinal.Text = "Thanks for your order " + TxtFirstName.Text + "!";
            }
        }

        protected void ButtonAdmin_Click(object sender, EventArgs e)
        {
            String strSQL = "SELECT * FROM Books ORDER BY title";
            AdminGridView.DataSource = objDB.GetDataSet(strSQL);
            AdminGridView.DataBind();
            AdminDisplay.Visible = true;
            CartDisplay.Visible = false;
            ErrorDisplay.Visible = false;
        }
    }
}