using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utilities;

namespace Yelp
{
    public partial class AddReservation : System.Web.UI.Page
    {
        DBConnect db = new DBConnect();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Auth"]!=null) {
                String strSQL = "FetchRestaurants";

                dropdownlistrestaurant.DataSource = db.GetDataSet(strSQL);
                dropdownlistrestaurant.DataTextField = "Name";
                dropdownlistrestaurant.DataValueField = "RestaurantID";
                dropdownlistrestaurant.DataBind();
            }
            else {
                content.Visible = false;
                labelerror.Text = "Not Authorized!";
            }
        }
    }
}