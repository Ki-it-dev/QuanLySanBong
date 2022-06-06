using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_page_employee_page_module_XacNhanDatSanChung : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["UserName"] != null)
        {
            if (!IsPostBack)
            {
                var getUser = (from u in db.tbUsers
                               where u.users_account == Request.Cookies["UserName"].Value
                               select u);
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
        var getData = (from f in db.tbFields
                       join ad in db.tbTempTransactionAdmins on f.field_id equals ad.field_id
                       join bt in db.tbBookTimes on ad.book_time_id equals bt.book_time_id
                       join t in db.tbTransactions on ad.temp_transaction_id equals t.temp_transaction_id
                       join u in db.tbUsers on ad.users_id equals u.users_id
                       where t.transaction_status == 0
                       select new
                       {
                           f.field_name,
                           u.users_account,
                           bt.book_time_detail,
                           t.transaction_datetime,

                           ad.book_time_id,
                           ad.field_id,
                       });

        rpXacNhan.DataSource = getData;
        rpXacNhan.DataBind();
    }


    protected void btnServerHuy_ServerClick(object sender, EventArgs e)
    {
        var getIDSanAD = from s in db.tbTempTransactionAdmins
                         where s.book_time_id == Convert.ToInt32(txtIdGio.Value) && s.field_id == Convert.ToInt32(txtIdSan.Value)
                         orderby s.temp_transaction_id
                         select s.temp_transaction_id;

        tbTempTransactionCustomer del1 = db.tbTempTransactionCustomers.Where(x => x.temp_transaction_id == Convert.ToInt32(getIDSanAD.FirstOrDefault())).FirstOrDefault();
        tbTempTransactionAdmin del2 = db.tbTempTransactionAdmins.Where(x => x.temp_transaction_id == Convert.ToInt32(getIDSanAD.FirstOrDefault())).FirstOrDefault();
        tbTransaction del3 = db.tbTransactions.Where(x => x.temp_transaction_id == Convert.ToInt32(getIDSanAD.FirstOrDefault())).FirstOrDefault();

        db.tbTempTransactionCustomers.DeleteOnSubmit(del1);
        db.tbTempTransactionAdmins.DeleteOnSubmit(del2);
        db.tbTransactions.DeleteOnSubmit(del3);

        db.SubmitChanges();
        alert.alert_Success(Page, "Hủy thành công", "");
        loadData();
    }

    protected void btnServerXacNhan_ServerClick(object sender, EventArgs e)
    {
        var getIDSanAD = from s in db.tbTempTransactionAdmins
                         where s.book_time_id == Convert.ToInt32(txtIdGio.Value) && s.field_id == Convert.ToInt32(txtIdSan.Value)
                         orderby s.temp_transaction_id
                         select s.temp_transaction_id;

        tbTransaction update = db.tbTransactions.Where(x => x.temp_transaction_id == Convert.ToInt32(getIDSanAD.FirstOrDefault())).FirstOrDefault();

        update.transaction_status = 1;
        db.SubmitChanges();
        alert.alert_Success(Page, "Cập nhật thành công", "");
        loadData();
    }
}