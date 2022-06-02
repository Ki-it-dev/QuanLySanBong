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
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["UserName"] != null)
        {
            var getUser = (from u in db.tbUsers where u.users_account == Request.Cookies["UserName"].Value select u).FirstOrDefault();

            txtUserName.InnerText = getUser.users_fullname;
        }
    }
}
