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

                if (getUser.FirstOrDefault().group_user_id == 1)
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
        var getUserList = from u in db.tbUsers
                          join pq in db.tbGroupUsers on u.group_user_id equals pq.group_user_id
                          select new
                          {
                              u.users_phoneNumber,
                              u.users_fullname,
                              u.users_account,
                              u.users_password,
                              u.users_identity,
                              u.users_address,
                              u.users_id,
                              users_status = u.users_status == true ? "Đã kích hoạt" : "Chưa kích hoạt",
                              pq.group_user_name,
                          };
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
        Server.Transfer("/admin_page/module_CapNhatThongTin.aspx");
    }
}