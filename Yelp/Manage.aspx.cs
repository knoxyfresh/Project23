using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utilities;

namespace Yelp
{
    public partial class Manage : System.Web.UI.Page
    {
        DBConnect db = new DBConnect();
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString["r"];
            id = "1";

            String strSQL = "FetchRestaurantReviews " + id;
            GridViewReviews.DataSource = db.GetDataSet(strSQL);
            GridViewReviews.DataBind();
        }
        protected void EditReview(Object sender, System.Web.UI.WebControls.GridViewEditEventArgs e) { }
        protected void UpdateReview(Object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e) { }
        protected void CancelEditReview(Object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e) { }
    }
}