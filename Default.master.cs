using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.MasterPage
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();

    protected string styleNone, txtNone;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["UserName"] != null)
        {
            var getUser = (from u in db.tbUsers where u.users_account == Request.Cookies["UserName"].Value select u).FirstOrDefault();

            txtUserName.InnerText = getUser.users_fullname;

            if (getUser.group_user_id == 1 || getUser.group_user_id == 2)
            {
                txtNone = "display:block";
            }
            else
            {
                txtNone = "display:none";
            }
        }
        else
        {
            styleNone = "display:none";
        }
    }

    protected void btnLogOut_ServerClick(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Cookies["UserName"].Expires = DateTime.Now.AddDays(-1);
        Response.Redirect("/trang-chu");
    }
}
