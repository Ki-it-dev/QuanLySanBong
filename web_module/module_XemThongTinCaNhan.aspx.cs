using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_module_module_XemThongTinCaNhan : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["UserName"] != null)
        {
            if (!IsPostBack)
            {
                loadData();
            }
        }
        else
        {
            alert.alert_Warning(Page, "Vui lòng đăng nhập để tiếp tục", "");
        }
    }

    protected void loadData()
    {
        var getUser = from u in db.tbUsers
                      where u.users_account == Request.Cookies["UserName"].Value
                      select new
                      {
                          u.users_account,
                          u.users_address,
                          u.users_email,
                          u.users_fullname,
                          u.users_identity,
                          u.users_phoneNumber,
                          users_status = u.users_status==true ? "Đã kích hoạt" : "Chưa kích hoạt",
                      };

        rpThongTinCaNhan.DataSource = getUser;
        rpThongTinCaNhan.DataBind();

    }


    protected void btnSua_ServerClick(object sender, EventArgs e)
    {
        Response.Redirect("/chinh-sua-thong-tin-ca-nhan");
    }
}