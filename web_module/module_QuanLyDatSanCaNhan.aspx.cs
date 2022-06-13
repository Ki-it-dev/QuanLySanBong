using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_module_module_QuanLyDatSanCaNhan : System.Web.UI.Page
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
        //Lay ra user
        var getUser = from u in db.tbUsers where u.users_account == Request.Cookies["UserName"].Value select u;
        //Lay ra toan bo san da dat
        var getData = (from ds in db.tbTempTransactionAdmins
                       join f in db.tbFields on ds.field_id equals f.field_id
                       join bt in db.tbBookTimes on ds.book_time_id equals bt.book_time_id
                       join t in db.tbTransactions on ds.temp_transaction_id equals t.temp_transaction_id
                       where ds.users_id == getUser.FirstOrDefault().users_id
                       select new
                       {
                           transaction_datetime = DateTime.Parse(t.transaction_datetime.ToString()).ToString("yyyy-MM-dd"),
                           f.field_name,
                           bt.book_time_detail,

                           f.field_id,
                           bt.book_time_id,

                           daXacNhan = t.transaction_status == 1 ? "display:block" : "display:none",

                           choXacNhan = t.transaction_status == 0 ? "display:block" : "display:none",
                           huy = t.transaction_status == 0 ? "display:block" : "display:none",

                           daHuy = t.transaction_status == -1 ? "display:block" : "display:none",
                       });

        rpDanhSachDatSan.DataSource = getData;
        rpDanhSachDatSan.DataBind();
    }


    protected void btnHuy_ServerClick(object sender, EventArgs e)
    {
        try
        {
            string _idGio = txtIdGio.Value;
            string _idSan = txtIdSan.Value;

            tbTempTransactionAdmin del1 = db.tbTempTransactionAdmins.Where(x => x.field_id == Convert.ToInt32(_idSan) && x.book_time_id == Convert.ToInt32(_idGio)).FirstOrDefault();
            tbTempTransactionCustomer del2 = db.tbTempTransactionCustomers.Where(x => x.field_id == Convert.ToInt32(_idSan) && x.book_time_id == Convert.ToInt32(_idGio)).FirstOrDefault();

            db.tbTempTransactionAdmins.DeleteOnSubmit(del1);
            db.tbTempTransactionCustomers.DeleteOnSubmit(del2);

            db.SubmitChanges();

            alert.alert_Success(Page, "Hủy thành công", "");
            loadData();
        }
        catch
        {
            alert.alert_Warning(Page, "Lỗi hủy", "");
        }
    }
}