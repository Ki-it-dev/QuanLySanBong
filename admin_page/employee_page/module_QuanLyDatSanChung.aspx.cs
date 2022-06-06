using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_page_employee_page_module_QuanLyDatSanChung : System.Web.UI.Page
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
                var getUser = (from u in db.tbUsers
                               where u.users_account == Request.Cookies["UserName"].Value
                               select u);
                if(getUser.FirstOrDefault().group_user_id == 1 || getUser.FirstOrDefault().group_user_id == 2)
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
                       select new
                       {
                           f.field_name,
                           bt.book_time_detail,
                           u.users_account,
                           t.price,
                           t.transaction_datetime,
                           transaction_status = t.transaction_status == 1 ? "Đã xác nhận":"Chờ xác nhận",
                       });

        rpQlGD.DataSource = getData;
        rpQlGD.DataBind();
    }
}