using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_module_module_DatTruoc : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if(Context.Items["time"] == null)
            {
                Response.Redirect("/danh-sach-san");
            }
            else
            {
                string timeDat = Context.Items["time"].ToString();
                dteNgayBatDau.Value = timeDat;
                if (timeDat == DateTime.Now.ToString("yyyy-MM-dd").Replace(' ', 'T'))
                {
                    Response.Redirect("/danh-sach-san");
                }
                else
                {
                    loadData();
                }
            }
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
                              //style = Convert.ToInt32(bt.book_time_detail.Substring(0, 2)) < DateTime.Now.Hour ? "pointer-events: none;background:aqua" : "",
                          };
        rpKhungGio.DataSource = getBookTime;
        rpKhungGio.DataBind();
    }
    protected void btnXemTrangThaiSan_ServerClick(object sender, EventArgs e)
    {
        string _idSan = txtIdSan.Value;
        string _idGio = txtIdGio.Value;
        string _idTime = dteNgayBatDau.Value;

        var getData = (from p in db.tbPrices
                       join bt in db.tbBookTimes on p.book_time_id equals bt.book_time_id
                       join s in db.tbFields on p.field_type_id equals s.field_type_id
                       join tta in db.tbTempTransactionAdmins on s.field_id equals tta.field_id
                       join t in db.tbTransactions on tta.temp_transaction_id equals t.temp_transaction_id
                       where
                       tta.field_id == Convert.ToInt32(txtIdSan.Value)
                       && tta.book_time_id == Convert.ToInt32(txtIdGio.Value)
                       && t.transaction_status == 0
                       && t.transaction_datetime.Value == Convert.ToDateTime(dteNgayBatDau.Value)
                       select new
                       {
                           tta.field_id,
                           tta.book_time_id,
                       });

        if (getData.Count() > 0)
        {
            alert.alert_Info(Page, "Sân đang được chờ xác nhận", "");
        }
        else
        {
            if (Request.Cookies["UserName"] == null)
            {
                alert.alert_Warning(Page, "Bạn phải đăng nhập để được đặt sân", "");
            }
            else
            {
                Context.Items["_idSan"] = _idSan;
                Context.Items["_idGio"] = _idGio;
                Context.Items["_idTime"] = _idTime;
                Server.Transfer("module_XacNhanDatSan.aspx");
            }
        }
    }
    protected void loadData()
    {
        //Danh sach san
        var getData = (from l in db.tbFieldTypes
                       join ls in db.tbFields on l.field_type_id equals ls.field_type_id
                       select new
                       {
                           ls.field_id,
                           ls.field_name,
                           l.field_type_name,
                       });

        var getBookTime = (from bt in db.tbBookTimes select bt);

        rpDanhSachSan.DataSource = getData;
        rpDanhSachSan.DataBind();
        //Khach da dan san
        var getTimeBook = (from p in db.tbPrices
                           join bt in db.tbBookTimes on p.book_time_id equals bt.book_time_id
                           join s in db.tbFields on p.field_type_id equals s.field_type_id
                           join tta in db.tbTempTransactionAdmins on s.field_id equals tta.field_id
                           join st in db.tbTransactions on tta.temp_transaction_id equals st.temp_transaction_id
                           where st.transaction_status == 1 
                           && st.transaction_datetime == Convert.ToDateTime(dteNgayBatDau.Value)
                           select new
                           {
                               tta.book_time_id,
                               tta.field_id,
                           });

        txtIdSanDaDat.Value = string.Join(",", getTimeBook.Select(x => x.field_id));
        txtIdTimeDaDat.Value = string.Join(",", getTimeBook.Select(x => x.book_time_id));

        //Khach da dat san nhung cho nhan vien xac nhan
        var getTimeBookWait = (from p in db.tbPrices
                               join bt in db.tbBookTimes on p.book_time_id equals bt.book_time_id
                               join s in db.tbFields on p.field_type_id equals s.field_type_id
                               join tta in db.tbTempTransactionAdmins on s.field_id equals tta.field_id
                               join st in db.tbTransactions on tta.temp_transaction_id equals st.temp_transaction_id
                               where st.transaction_status == 0 /*&& st.transaction_datetime.Value.Day == DateTime.Now.Day*/
                               && st.transaction_datetime == Convert.ToDateTime(dteNgayBatDau.Value)
                               select new
                               {
                                   tta.book_time_id,
                                   tta.field_id,
                               });

        txtIdSanCho.Value = string.Join(",", getTimeBookWait.Select(x => x.field_id));
        txtIdTimeCho.Value = string.Join(",", getTimeBookWait.Select(x => x.book_time_id));
    }
    protected void btnDatSan_ServerClick(object sender, EventArgs e)
    {
        string time = txtTimeDatTruoc.Value;

        if (time == DateTime.Now.ToString("yyyy-MM-dd").Replace(' ', 'T'))
        {
            Response.Redirect("/danh-sach-san");
        }
        else
        {
            loadData();
        }
    }
}