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

    protected string txtTenTaiKhoan;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["UserName"] != null)
        {
            if (!IsPostBack)
            {
                if(Context.Items["idUser"] == null)
                {
                    Response.Redirect("/trang-chu");
                }
                else
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
                }
            }
            loadData();
        }
        else
        {
            alert.alert_Warning(Page, "Vui lòng đăng nhập để tiếp tục", "");
        }
    }
    protected void loadData()
    {
        var getUser = (from u in db.tbUsers where u.users_id == Convert.ToInt32(txtIdUser.Value) select u).FirstOrDefault();

        txtTenTaiKhoan = getUser.users_account;
        txtCMND.Value = getUser.users_identity;
        txtDiaChi.Value = getUser.users_address;
        txtEmail.Value = getUser.users_email;
        txtPhone.Value = getUser.users_phoneNumber;
        txtTaiKhoan.Value = getUser.users_account;
        txtTen.Value = getUser.users_fullname;
    }
    protected void btnChinhSua_ServerClick(object sender, EventArgs e)
    {
        //Kiem tra tai khoan
        var getAccount = from u in db.tbUsers where u.users_id != Convert.ToInt32(txtIdUser.Value) select u;

        var getUser = (from u in db.tbUsers
                       where u.users_account == Request.Cookies["UserName"].Value
                       select u);

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
            for(int i = 0; i < arrAcc.Length; i++)
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

        tbUser update = db.tbUsers.Where(x => x.users_id == Convert.ToInt32(txtIdUser.Value)).FirstOrDefault();

        update.users_account = txtTaiKhoan.Value;
        update.users_address = txtDiaChi.Value;
        update.users_email = txtEmail.Value;
        update.users_fullname = txtTen.Value;
        update.users_identity = txtCMND.Value;
        update.users_phoneNumber = txtPhone.Value;
        update.users_status = Convert.ToBoolean(ddlStatus.SelectedItem.Text);
        update.group_user_id = Convert.ToInt32(ddlPhanQuyen.SelectedValue);
        db.SubmitChanges();
        alert.alert_Success(Page, "Cập nhật thành công", "");
        Response.Redirect("/quan-ly-tai-khoan");
    }
}