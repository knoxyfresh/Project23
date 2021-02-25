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
    public partial class AddReview : System.Web.UI.Page
    {
        DBConnect db = new DBConnect();
        string rid;
        protected void Page_Load(object sender, EventArgs e)
        {
            rid = Request.QueryString["r"];
            if (Request.QueryString["r"] != null)
            {
                String strSQL = "FetchRestaurant " + rid;
                DataSet ds = db.GetDataSet(strSQL);
                labeltitle.Text = ds.Tables[0].Rows[0][1].ToString();
            }
            else
            {
                labelerror.Text = "Error getting restaurant!";
            }
        }

        protected void buttonaddreview_Click(object sender, EventArgs e)
        {
            if (Session["auth"] != null && rid != null)
            {
                if (textboxdesc.Text == "" || textboxtitle.Text == "") labelerror.Text = "Please fill out all fields!";
                else
                {
                    //AddReview 'nLUYiHYr6f','1','Bad Things are here','this palce was bad and they had bad things','1','2','3','4'
                    string sqlcmd = "AddReview '" + Session["auth"] + "', '" + rid + "', '" + textboxtitle.Text + "', '" + textboxdesc.Text + "', '" + dropdownfood.SelectedValue + "', '" + dropdownservice.SelectedValue + "', '" + dropdownatmos.SelectedValue + "', '" + dropdownprice.SelectedValue + "'";
                    Response.Write(sqlcmd);
                    db.DoUpdate(sqlcmd);
                    labelerror.Text = "Review Submitted!";
                }
            }
            else
            {
                labelerror.Text = "Review Submitted!";
            }
        }
    }
}