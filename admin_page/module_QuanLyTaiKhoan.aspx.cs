using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_page_module_QuanLyTaiKhoan : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();

    protected int STT = 1;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["UserName"] != null)
        {
            if (!IsPostBack)
            {
                var getUser = from u in db.tbUsers where u.users_account == Request.Cookies["UserName"].Value select u;

                if (getUser.FirstOrDefault().group_user_id == 1 || getUser.FirstOrDefault().group_user_id == 2)
                {
                    loadData();
                }
                else
                {
                    alert.alert_Warning(Page, "Không đủ quyền để thực hiện", "");
                }
            }
        }
        else
        {
            Response.Redirect("/trang-chu");
        }
    }

    protected void loadData()
    {
        var getUserList = from u in db.tbUsers select u;
        rpTK.DataSource = getUserList;
        rpTK.DataBind();
    }


    protected void btnXoaServer_ServerClick(object sender, EventArgs e)
    {
        var _idUser = txtIdUser.Value;

        tbUser delete = db.tbUsers.Where(x => x.users_id == Convert.ToInt32(_idUser)).FirstOrDefault();

        db.tbUsers.DeleteOnSubmit(delete);
        db.SubmitChanges();
        alert.alert_Success(Page, "Xóa thành công", "");
        loadData();
    }

    protected void btnSuaServer_ServerClick(object sender, EventArgs e)
    {
        Context.Items["idUser"] = txtIdUser.Value;
        Server.Transfer("module_CapNhatThongTin.aspx");
    }
}