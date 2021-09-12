using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace MA3T_test1
{

    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
            if (IsPostBack)
            {

            }
        }

        protected void btnMiniTool_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/MiniTool");
        }


        protected void btnDocumentation_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Documentation");
        }

        protected void btnContact_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Contact");
        }

        protected void btnTEEM_Click(object sender, EventArgs e)
        {
            Response.Redirect("/");
        }
    }
}