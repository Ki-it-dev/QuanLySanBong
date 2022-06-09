using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_module_module_ChinhSuaThongTinCaNhan : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();

    protected string users_status;

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
        var getUser = (from u in db.tbUsers
                       where u.users_account == Request.Cookies["UserName"].Value
                       select new
                       {
                           u.users_account,
                           u.users_address,
                           u.users_email,
                           u.users_fullname,
                           u.users_identity,
                           u.users_phoneNumber,
                           users_status = u.users_status == true ? "Đã kích hoạt" : "Chưa kích hoạt",
                       }).FirstOrDefault();

        txtCMND.Value = getUser.users_identity;
        txtDiaChi.Value = getUser.users_address;
        txtEmail.Value = getUser.users_email;
        txtPhone.Value = getUser.users_phoneNumber;
        txtTaiKhoan.Value = getUser.users_account;
        txtTen.Value = getUser.users_fullname;
        users_status = getUser.users_status;
    }


    protected void btnChinhSua_ServerClick(object sender, EventArgs e)
    {
        //Kiem tra tai khoan
        var getAccount = from u in db.tbUsers where u.users_account != Request.Cookies["UserName"].Value select u;

        var getUser = (from u in db.tbUsers
                       where u.users_account == Request.Cookies["UserName"].Value select u);

        txtCheckCMND.Value = string.Join(",", getAccount.Select(x => x.users_identity));
        string[] arrCMND = txtCheckCMND.Value.Split(',');

        txtCheckAccount.Value = string.Join(",", getAccount.Select(x => x.users_account));
        string[] arrAcc = txtCheckAccount.Value.Split(',');

        txtCheckPhone.Value = string.Join(",", getAccount.Select(x => x.users_phoneNumber));
        string[] arrPhone = txtCheckPhone.Value.Split(',');

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
            for (int i = 0; i < arrAcc.Length; i++)
            {
                if (txtTaiKhoan.Value == arrAcc[i])
                {
                    alert.alert_Warning(Page, "Tài khoản đã tồn tại", "");
                    return;
                }
                if (txtCMND.Value == arrCMND[i])
                {
                    alert.alert_Warning(Page, "CMND đã tồn tại", "");
                    return;
                }
                if (txtPhone.Value == arrPhone[i])
                {
                    alert.alert_Warning(Page, "Số điện thoại đã tồn tại", "");
                    return;
                }
            }
        }

        tbUser update = db.tbUsers.Where(x => x.users_id == getUser.First().users_id).FirstOrDefault();

        update.users_account = txtTaiKhoan.Value;
        update.users_address = txtDiaChi.Value;
        update.users_email = txtEmail.Value;
        update.users_fullname = txtTen.Value;
        update.users_identity = txtCMND.Value;
        update.users_phoneNumber = txtPhone.Value;

        db.SubmitChanges();
        loadData();
        alert.alert_Success(Page, "Cập nhật thành công", "");
    }
}