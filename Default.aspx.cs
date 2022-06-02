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
                loginName.Value = Request.Cookies["UserName"].Value;
                none = "display:none;";
                txtDateTImeNow = DateTime.Now.ToString();
                loadData();
            }
            else
            {
                none = "display:block;";
            }
        }
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
            if (registerUsername.Value == getAccount.First().users_account)
            {
                alert.alert_Warning(Page, "Tài khoản đã tồn tại", "");
                return;
            }
            if (identity.Value == getAccount.First().users_identity)
            {
                alert.alert_Warning(Page, "CMND đã tồn tại", "");
                return;
            }
            if (phoneNumbers.Value == getAccount.First().users_phoneNumber)
            {
                alert.alert_Warning(Page, "Số điện thoại đã tồn tại", "");
                return;
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

        setNull();
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
            alert.alert_Success(Page, "Đăng nhập thành công", "");
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "AlertBox", "swal('Sai tên đăng nhập / mật khẩu!', '','warning')", true);
        }
    }

    protected void loadData()
    {
        var getData = (from l in db.tbFieldTypes
                       join ls in db.tbFields on l.field_type_id equals ls.field_type_id
                       select new
                       {
                           ls.field_id,
                           ls.field_name,
                           l.field_type_name,
                       });

        var getBookTime = (from bt in db.tbBookTimes select bt);

        //txtTimes.Value = string.Join(",", getBookTime.Select(x => x.book_time_detail));
        //txtIdTimes.Value = string.Join(",", getBookTime.Select(x => x.book_time_id));
        //txtIdSans.Value = string.Join(",", getData.Select(x => x.field_id));

        rpDanhSachSan.DataSource = getData;
        rpDanhSachSan.DataBind();

        var getTimeBook = (from p in db.tbPrices
                           join bt in db.tbBookTimes on p.book_time_id equals bt.book_time_id
                           join s in db.tbFields on p.field_type_id equals s.field_type_id
                           join tta in db.tbTempTransactionAdmins on s.field_id equals tta.field_id
                           join st in db.tbTransactions on tta.temp_transaction_id equals st.temp_transaction_id
                           where st.transaction_status == 1
                           select new
                           {
                               bt.book_time_id,
                               tta.field_id,
                           });

        txtIdSanDaDat.Value = string.Join(",", getTimeBook.Select(x => x.field_id));
        txtIdTimeDaDat.Value = string.Join(",", getTimeBook.Select(x => x.book_time_id));

        //if (Request.Cookies["User"] != null)
        //{
        //    btnLogin.Visible = false;
        //    btnRegister.Visible = false;
        //    btnLoggout.Visible = true;
        //}
        //else
        //{
        //    btnLogin.Visible = true;
        //    btnRegister.Visible = true;
        //    btnLoggout.Visible = false;
        //}

        var getQuanAo = from qa in db.tbClothes select qa;
        rpQuanAo.DataSource = getQuanAo;
        rpQuanAo.DataBind();

        var getGiay = from g in db.tbShoes select g;
        rpGiay.DataSource = getGiay;
        rpGiay.DataBind();

        var getDoUong = from du in db.tbDrinks select du;
        rpDoUong.DataSource = getDoUong;
        rpDoUong.DataBind();
    }


    protected void btnXemTrangThaiSan_ServerClick(object sender, EventArgs e)
    {
        string _idSan = txtIdSan.Value;
        string _idGio = txtIdGio.Value;

        var getData = (from p in db.tbPrices
                       join bt in db.tbBookTimes on p.book_time_id equals bt.book_time_id
                       join s in db.tbFields on p.field_type_id equals s.field_type_id
                       join tta in db.tbTempTransactionAdmins on s.field_id equals tta.field_id
                       where
                       tta.field_id == Convert.ToInt32(txtIdSan.Value)
                       && bt.book_time_id == Convert.ToInt32(txtIdGio.Value)
                       //&& s.field_status == true
                       select new
                       {
                           bt.book_time_detail,
                           bt.book_time_id,
                       });

        var getSan = (from l in db.tbFieldTypes
                      join ls in db.tbFields on l.field_type_id equals ls.field_type_id
                      where ls.field_id == Convert.ToInt32(txtIdSan.Value)
                      select new
                      {
                          ls.field_id,
                          ls.field_name,
                      });

        if (getData.Count() > 0)
        {
            alert.alert_Warning(Page, "Sân " + getSan.First().field_name + " vào lúc " + getData.First().book_time_detail + " đã được đặt", "");
        }
        else
        {
            alert.alert_Warning(Page, "Sân trống", "");
        }
    }

    protected void rpDanhSachSan_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        Repeater rpKhungGio = e.Item.FindControl("rpKhungGio") as Repeater;
        string field_id = DataBinder.Eval(e.Item.DataItem, "field_id").ToString();
        var getBookTime = from bt in db.tbBookTimes
                          select new
                          {
                              bt.book_time_id,
                              bt.book_time_detail,
                              field_id = field_id,
                          };
        rpKhungGio.DataSource = getBookTime;
        rpKhungGio.DataBind();
    }

    //protected void btnLoggout_ServerClick(object sender, EventArgs e)
    //{
    //    Session.Clear();
    //    Response.Cookies["User"].Expires = DateTime.Now.AddDays(-1);
    //    Response.Redirect("/dang-nhap");
    //}

    protected void btnDatSan_ServerClick(object sender, EventArgs e)
    {
        var getUser = (from u in db.tbUsers where Request.Cookies["UserName"].Value == u.users_account select u).FirstOrDefault();
        var getTypeFieldId = (from f in db.tbFields where f.field_id == Convert.ToInt32(txtIdSanDat.Value) select f).FirstOrDefault();

        tbTempTransactionCustomer insertUser = new tbTempTransactionCustomer();
        tbTempTransactionAdmin insertAdmin = new tbTempTransactionAdmin();

        insertUser.field_id = Convert.ToInt32(txtIdSanDat.Value);
    }
}