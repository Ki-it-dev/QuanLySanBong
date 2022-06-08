using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_module_module_XacNhanDatSan : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();

    protected string txtDateTimeNow, field_name, book_time_detail, txtusers_fullname, price;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string _idSan = Context.Items["_idSan"].ToString();
            string _idGio = Context.Items["_idGio"].ToString();

            txtIdGio.Value = _idGio;
            txtIdSan.Value = _idSan;

            var getUser = from u in db.tbUsers where u.users_account == Request.Cookies["UserName"].Value select u.users_fullname;
            var getSan = from s in db.tbFields where s.field_id == Convert.ToInt32(_idSan) select s.field_name;
            var getTimeDetail = from t in db.tbBookTimes where t.book_time_id == Convert.ToInt32(_idGio) select t.book_time_detail;
            var getPrice = from p in db.tbPrices where p.book_time_id == Convert.ToInt32(_idGio) select p.price;

            txtDateTimeNow = DateTime.Now.ToString();
            field_name = getSan.FirstOrDefault();
            book_time_detail = getTimeDetail.FirstOrDefault();
            txtusers_fullname = getUser.FirstOrDefault();
            price = getPrice.FirstOrDefault().ToString();
        }
        loadata();
    }

    protected void loadata()
    {
        var getUser = from u in db.tbUsers where u.users_account == Request.Cookies["UserName"].Value select u.users_fullname;
        var getSan = from s in db.tbFields where s.field_id == Convert.ToInt32(txtIdGio.Value) select s.field_name;
        var getTimeDetail = from t in db.tbBookTimes where t.book_time_id == Convert.ToInt32(txtIdGio.Value) select t.book_time_detail;
        var getPrice = from p in db.tbPrices where p.book_time_id == Convert.ToInt32(txtIdGio.Value) select p.price;

        txtDateTimeNow = DateTime.Now.ToString();
        field_name = getSan.FirstOrDefault();
        book_time_detail = getTimeDetail.FirstOrDefault();
        txtusers_fullname = getUser.FirstOrDefault();
        price = getPrice.FirstOrDefault().ToString();
    }

    protected void btnReturn_ServerClick(object sender, EventArgs e)
    {
        Response.Redirect("/trang-chu");
    }

    protected void btnXacNhan_ServerClick(object sender, EventArgs e)
    {
        var getUser = from u in db.tbUsers where u.users_account == Request.Cookies["UserName"].Value select u;

        tbTempTransactionAdmin insertAdm = new tbTempTransactionAdmin();
        tbTempTransactionCustomer insertCus = new tbTempTransactionCustomer();

        insertAdm.book_time_id = Convert.ToInt32(txtIdGio.Value);
        insertAdm.field_id = Convert.ToInt32(txtIdSan.Value);
        insertAdm.users_id = getUser.FirstOrDefault().users_id;

        insertCus.book_time_id = Convert.ToInt32(txtIdGio.Value);
        insertCus.field_id = Convert.ToInt32(txtIdSan.Value);
        insertCus.users_id = getUser.FirstOrDefault().users_id;

        db.tbTempTransactionAdmins.InsertOnSubmit(insertAdm);
        db.tbTempTransactionCustomers.InsertOnSubmit(insertCus);

        alert.alert_Success(Page, "Xác nhận thành công vui lòng chờ nhân viên xác nhận", "");

        db.SubmitChanges();

        Response.Redirect("/quan-ly-dat-san-ca-nhan");
    }
}