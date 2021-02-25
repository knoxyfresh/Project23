using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utilities;

namespace Yelp
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["auth"] = null;
        }

        protected void ButtonLoginVisitor_Click(object sender, EventArgs e)
        {
            Response.Redirect("Main.aspx");
        }

        protected void ButtonLoginRepresentative_Click(object sender, EventArgs e)
        {
            Session["auth"] = "nLUYiHYr6f";
            Response.Redirect("Main.aspx");

        }

        protected void ButtonLoginReviewer_Click(object sender, EventArgs e)
        {

            Session["auth"] = "hZd8Okyixh";
            Response.Redirect("Main.aspx");
        }
    }
}