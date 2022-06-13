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
            if (Context.Items["_idSan"] == null && Context.Items["_idGio"] == null && Context.Items["_idTime"] == null)
            {
                Response.Redirect("/trang-chu");
            }
            else
            {
                string _idSan = Context.Items["_idSan"].ToString();
                string _idGio = Context.Items["_idGio"].ToString();
                string _idTime = Context.Items["_idTime"].ToString();

                txtIdGio.Value = _idGio;
                txtIdSan.Value = _idSan;
                txtTime.Value = _idTime;

                var getUser = from u in db.tbUsers where u.users_account == Request.Cookies["UserName"].Value select u.users_fullname;
                var getSan = from s in db.tbFields where s.field_id == Convert.ToInt32(_idSan) select s;
                var getTimeDetail = from t in db.tbBookTimes where t.book_time_id == Convert.ToInt32(_idGio) select t;
                var getPrice = from p in db.tbPrices where p.book_time_id == Convert.ToInt32(_idGio) select p;

                txtDateTimeNow = _idTime;
                field_name = getSan.FirstOrDefault().field_name;
                book_time_detail = getTimeDetail.FirstOrDefault().book_time_detail;
                txtusers_fullname = getUser.FirstOrDefault();
                price = getPrice.FirstOrDefault().price.ToString();
            }
        }
        //loadata();
    }

    //protected void loadata()
    //{
    //    var getUser = from u in db.tbUsers where u.users_account == Request.Cookies["UserName"].Value select u.users_fullname;
    //    var getSan = from s in db.tbFields where s.field_id == Convert.ToInt32(txtIdGio.Value) select s;
    //    var getTimeDetail = from t in db.tbBookTimes where t.book_time_id == Convert.ToInt32(txtIdGio.Value) select t;
    //    var getPrice = from p in db.tbPrices where p.book_time_id == Convert.ToInt32(txtIdGio.Value) select p;

    //    txtDateTimeNow = txtTime.Value;
    //    field_name = getSan.FirstOrDefault().field_name;
    //    book_time_detail = getTimeDetail.FirstOrDefault().book_time_detail;
    //    txtusers_fullname = getUser.FirstOrDefault();
    //    price = getPrice.FirstOrDefault().price.ToString();
    //}

    protected void btnReturn_ServerClick(object sender, EventArgs e)
    {
        Response.Redirect("/danh-sach-san");
    }

    protected void btnXacNhan_ServerClick(object sender, EventArgs e)
    {
        var getUser = from u in db.tbUsers where u.users_account == Request.Cookies["UserName"].Value select u;

        var getBookTime = from bt in db.tbBookTimes
                          where bt.book_time_id == Convert.ToInt32(txtIdGio.Value)
                          select bt;

        string timeQua = string.Join(",", getBookTime.Select(x => x.book_time_detail.Substring(0, 2)));

        if (Convert.ToInt32(timeQua) < DateTime.Now.Hour)
        {
            Response.Redirect("/danh-sach-san");
        }
        else
        {
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

            db.SubmitChanges();

            var getId = from t in db.tbTempTransactionAdmins
                        join p in db.tbPrices on t.book_time_id equals p.book_time_id
                        where
                            t.book_time_id == Convert.ToInt32(txtIdGio.Value)
                            && t.field_id == Convert.ToInt32(txtIdSan.Value)
                            && t.users_id == getUser.FirstOrDefault().users_id
                        orderby t.temp_transaction_id descending
                        select new { 
                            t.temp_transaction_id,
                            p.price,
                        };

            tbTransaction insertTran = new tbTransaction();

            insertTran.temp_transaction_id = Convert.ToInt32(getId.FirstOrDefault().temp_transaction_id);
            insertTran.transaction_datetime = Convert.ToDateTime(txtTime.Value);
            insertTran.transaction_status = 0;
            insertTran.price = getId.FirstOrDefault().price;

            db.tbTransactions.InsertOnSubmit(insertTran);
            db.SubmitChanges();

            Response.Redirect("/quan-ly-dat-san-ca-nhan");
        }
    }
}