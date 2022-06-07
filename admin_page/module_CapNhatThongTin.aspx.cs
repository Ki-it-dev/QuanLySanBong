using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_page_module_CapNhatThongTin : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();

    protected string users_status, txtTenTaiKhoan;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["UserName"] != null)
        {
            if (!IsPostBack)
            {
                string _id = Context.Items["idUser"].ToString();

                txtIdUser.Value = _id;

                var getUser = (from u in db.tbUsers where u.users_id == Convert.ToInt32(_id) select u).FirstOrDefault();

                txtTenTaiKhoan = getUser.users_account;
                txtCMND.Value = getUser.users_identity;
                txtDiaChi.Value = getUser.users_address;
                txtEmail.Value = getUser.users_email;
                txtPhone.Value = getUser.users_phoneNumber;
                txtTaiKhoan.Value = getUser.users_account;
                txtTen.Value = getUser.users_fullname;
                users_status = getUser.users_status.ToString();

            }
        }
        else
        {
            alert.alert_Warning(Page, "Vui lòng đăng nhập để tiếp tục", "");
        }
    }

    protected void btnChinhSua_ServerClick(object sender, EventArgs e)
    {
        //Kiem tra tai khoan
        var getAccount = from u in db.tbUsers select u;
        var getUser = (from u in db.tbUsers
                       where u.users_account == Request.Cookies["UserName"].Value
                       select u);

        if (txtTaiKhoan.Value == "" ||
            txtEmail.Value == "" ||
            txtCMND.Value == "" || txtTen.Value == "" || txtPhone.Value == "" || txtDiaChi.Value == "")
        {
            alert.alert_Warning(Page, "Vui lòng nhập đầy đủ thông tin", "");
            return;
        }
        int number = Convert.ToInt32(txtCMND.Value);
        int count = 0;

        while (number > 0)
        {
            //thực hiện chia number cho 10 và tăng count++
            number = number / 10;
            count++;
        }
        if (count != 9)
        {
            alert.alert_Warning(Page, "Vui lòng nhập lại CMND", "");
            return;
        }
        if (getAccount.Count() > 0)
        {
            if (txtTaiKhoan.Value == getAccount.First().users_account)
            {
                alert.alert_Warning(Page, "Tài khoản đã tồn tại", "");
                return;
            }
            if (txtCMND.Value == getAccount.First().users_identity)
            {
                alert.alert_Warning(Page, "CMND đã tồn tại", "");
                return;
            }
            if (txtPhone.Value == getAccount.First().users_phoneNumber)
            {
                alert.alert_Warning(Page, "Số điện thoại đã tồn tại", "");
                return;
            }
        }
    }
}