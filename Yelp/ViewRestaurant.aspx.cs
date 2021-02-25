using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utilities;

namespace Yelp
{
    public partial class ViewRestaurant : System.Web.UI.Page
    {
        DBConnect db = new DBConnect();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && Request.QueryString["r"] != null)
            {
                //fetch data
                string id = Request.QueryString["r"];

                String strSQL = "FetchRestaurantReviews " + id;
                GridViewReviews.DataSource = db.GetDataSet(strSQL);
                GridViewReviews.DataBind();

                DataSet data = db.GetDataSet("FetchRestaurant " + id);
                labelname.Text = data.Tables[0].Rows[0][1].ToString();
                labeltype.Text = "Type: " + data.Tables[0].Rows[0][3].ToString();
                labeldesc.Text = data.Tables[0].Rows[0][3].ToString();
                labelrfood.Text = "Food: " + data.Tables[0].Rows[0][4].ToString() + "/5 Stars";
                labelrservice.Text = "Service: " + data.Tables[0].Rows[0][5].ToString() + "/5 Stars";
                labelratmos.Text = "Atmosphere: " + data.Tables[0].Rows[0][6].ToString() + "/5 Stars";
                labelrprice.Text = "Price: " + data.Tables[0].Rows[0][7].ToString() + "/5 Stars";

                if (Session["Auth"] != null)
                    if (Session["Usertype"].ToString() == "1" && Session["manages"].ToString() == id) buttonmanage.Visible = true;

            }
        }

        protected void buttonadd_Click(object sender, EventArgs e)
        {
            string redirstring = "AddReview.aspx" + "?r=" + Request.QueryString["r"];
            Response.Redirect(redirstring);
        }
    }
}