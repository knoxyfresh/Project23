using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RestaurantsReview;
using Utilities;

namespace Yelp
{
    public partial class Main : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<Restaurant> places = new List<Restaurant>();
            DBConnect db = new DBConnect();
            //store user details

            if (!IsPostBack)
            {
                String strSQL = "FetchRestaurants";
                GridViewRestaurants.DataSource = db.GetDataSet(strSQL);
                GridViewRestaurants.DataBind();
                //AddReview @Auth='nLUYiHYr6f', @RestaurantID = 4, @Title = "Bad", @Details = 'Really gross place ew', @Qualityrating = 20, @Servicerating = 20, @Atmosrating = 20, @Pricerating = 20;"

                //login
                if (Session["auth"] != null)
                {
                    //get user
                    String sqlname = "Authorize \'" + Session["auth"] + "\';";
                    DataSet ds = db.GetDataSet(sqlname);
                    labelwelcome.Text = "Welcome " + ds.Tables[0].Rows[0][3].ToString() + "!";
                    string usertype = ds.Tables[0].Rows[0][1].ToString();
                    Session["usertype"] = usertype;
                    if (usertype == "1")
                    {
                        buttonaddrestaurant.Visible = true;
                        if (ds.Tables[0].Rows[0][4] != null)
                        {
                            buttonmanage.Visible = true;
                            Session["manages"] = ds.Tables[0].Rows[0][4].ToString();
                        }
                    }
                }
                else
                {
                    //is visitor
                    labelwelcome.Text = "Welcome Visitor!";

                }

                //get book data
                for (int count = 0; count < GridViewRestaurants.Rows.Count; count++)
                {
                    GridViewRow row = GridViewRestaurants.Rows[count];
                    string RestaurantID = row.Cells[1].Text;
                    if (row.Cells[5].Text.Equals("&nbsp;")) row.Cells[5].Text = "No Reviews";
                    else row.Cells[5].Text += "/5";
                    if (row.Cells[6].Text.Equals("&nbsp;")) row.Cells[6].Text = "No Reviews";
                    else row.Cells[6].Text += "/5";
                    if (row.Cells[7].Text.Equals("&nbsp;")) row.Cells[7].Text = "No Reviews";
                    else row.Cells[7].Text += "/5";
                    if (row.Cells[8].Text.Equals("&nbsp;")) row.Cells[8].Text = "No Reviews";
                    else row.Cells[8].Text += "/5";

                }

            }
        }
        public void Filter() { }

        protected void Filter(object sender, EventArgs e)
        {
            for (int count = 0; count < GridViewRestaurants.Rows.Count; count++)
            {
                GridViewRow row = GridViewRestaurants.Rows[count];
                row.Visible = false;
                if (checkboxbar.Checked && row.Cells[3].Text == "Bar") row.Visible = true;
                if (checkboxcasual.Checked && row.Cells[3].Text == "Casual") row.Visible = true;
                if (checkboxfastfood.Checked && row.Cells[3].Text == "Fast Food") row.Visible = true;
                if (checkboxupscale.Checked && row.Cells[3].Text == "Upscale") row.Visible = true;
                if (checkboxcoffee.Checked && row.Cells[3].Text == "Coffee") row.Visible = true;
                if (!checkboxbar.Checked && !checkboxcasual.Checked && !checkboxfastfood.Checked && !checkboxupscale.Checked && !checkboxcoffee.Checked) row.Visible = true;
            }
        }


        protected void OpenReviews(object sender, EventArgs e)
        {
            var rowIndex = ((GridViewRow)((Control)sender).NamingContainer).RowIndex;
            //Session["CurrentRestaurant"] = GridViewRestaurants.Rows[rowIndex].Cells[0].Text;
            string restid = GridViewRestaurants.Rows[rowIndex].Cells[0].Text;
            string redirstring = "ViewRestaurant.aspx" + "?r=" + restid;
            Response.Redirect(redirstring);
        }

        protected void buttonaddrestaurant_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddRestaurant.aspx");
        }

        protected void buttonmanage_Click(object sender, EventArgs e)
        {

        }

        protected void buttonamakereservation_Click(object sender, EventArgs e)
        {

        }
    }
}