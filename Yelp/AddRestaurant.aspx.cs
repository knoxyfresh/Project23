using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utilities;

namespace Yelp
{
    public partial class AddRestaurant : System.Web.UI.Page
    {
        DBConnect db = new DBConnect();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                String strSQL = "SELECT * FROM RestaurantTypes ORDER BY Type";
                dropdownlisttype.DataSource = db.GetDataSet(strSQL);
                dropdownlisttype.DataTextField = "Type";
                dropdownlisttype.DataValueField = "Type";
                dropdownlisttype.DataBind();
            }
            else { }
        }

        protected void buttonmanage_Click(object sender, EventArgs e)
        {

            String strSQL = "AddRestaurant '" + textboxname.Text.Replace("'", "''") + "', '" + textboxdesc.Text.Replace("'", "''") + "', '" + dropdownlisttype.SelectedValue + "', '" + textboximage.Text + "'";
            db.DoUpdate(strSQL);
            Response.Write(strSQL);

        }
    }
}