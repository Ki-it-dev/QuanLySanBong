using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TrangChu : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();

    protected string none, txtDateTImeNow;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.Cookies["UserName"] != null)
            {
                //Da dang nhap
                loginName.Value = Request.Cookies["UserName"].Value;
                //An Form login
                none = "display:none;";
            }
            else
            {
                none = "display:block;";
            }
        }
        txtDateTImeNow = DateTime.Now.ToString("dd/MM/yyyy");
    }
    
    protected void setNull()
    {
        registerUsername.Value = "";
        registerPassword.Value = "";
        registerRepeatPassword.Value = "";
        identity.Value = "";
        registerName.Value = "";
        phoneNumbers.Value = "";
        registerEmail.Value = "";
    }
    protected void btnRegister_ServerClick(object sender, EventArgs e)
    {
        //Kiem tra tai khoan
        var getAccount = from u in db.tbUsers select u;

        txtCheckCMND.Value = string.Join(",", getAccount.Select(x => x.users_identity));
        string[] arrCMND = txtCheckCMND.Value.Split(',');

        txtCheckAccount.Value = string.Join(",", getAccount.Select(x => x.users_account));
        string[] arrAcc = txtCheckCMND.Value.Split(',');

        txtCheckPhone.Value = string.Join(",", getAccount.Select(x => x.users_phoneNumber));
        string[] arrPhone = txtCheckCMND.Value.Split(',');

        if (registerUsername.Value == "" || registerRepeatPassword.Value == "" ||
            registerPassword.Value == "" || registerEmail.Value == "" ||
            identity.Value == "" || registerName.Value == "" || phoneNumbers.Value == "")
        {
            alert.alert_Warning(Page, "Vui lòng nhập đầy đủ thông tin", "");
            return;
        }
        if (registerPassword.Value != registerRepeatPassword.Value)
        {
            alert.alert_Warning(Page, "Vui lòng nhập lại mật khẩu", "");
            return;
        }

        int number = Convert.ToInt32(identity.Value);
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
                if (registerUsername.Value == arrAcc[i])
                {
                    alert.alert_Warning(Page, "Tài khoản đã tồn tại", "");
                    return;
                }
                if (identity.Value == arrCMND[i])
                {
                    alert.alert_Warning(Page, "CMND đã tồn tại", "");
                    return;
                }
                if (phoneNumbers.Value == arrPhone[i])
                {
                    alert.alert_Warning(Page, "Số điện thoại đã tồn tại", "");
                    return;
                }
            }
        }
        tbUser insert = new tbUser();

        insert.group_user_id = 3;
        insert.users_password = registerPassword.Value;
        insert.users_account = registerUsername.Value;
        insert.users_identity = identity.Value;
        insert.users_fullname = registerName.Value;
        insert.users_phoneNumber = phoneNumbers.Value;
        insert.users_email = registerEmail.Value;
        insert.users_status = true;

        db.tbUsers.InsertOnSubmit(insert);
        db.SubmitChanges();
        alert.alert_Success(Page, "Đăng ký thành công", "");
    }
    protected void btnLogin_ServerClick(object sender, EventArgs e)
    {
        string pass = loginPassword.Value;
        string account = loginName.Value;
        var viewUserName = from tb in db.tbUsers
                           where tb.users_account == account
                           && tb.users_password == pass
                           && tb.users_status == true
                           select tb;

        if (viewUserName.Count() > 0)
        {
            tbUser list = viewUserName.Single();
            HttpCookie ck = new HttpCookie("UserName");
            string s = ck.Value;
            ck.Value = account;
            Response.Cookies.Add(ck);
            //alert.alert_Success(Page, "Đăng nhập thành công", "");
            Response.Redirect("/trang-chu");
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "AlertBox", "swal('Sai tên đăng nhập / mật khẩu!', '','warning')", true);
        }
    }
}