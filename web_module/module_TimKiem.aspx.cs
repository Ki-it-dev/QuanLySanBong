using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_module_module_TimKiem : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();

    protected string txtDateTImeNow, styleNone, noneSp, noneSan;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string _idSan, _idDoUong, _idGiay, _idQuanAo;

            if(Context.Items["idSan"] == null 
                && Context.Items["idDoUong"] == null
                && Context.Items["idGiay"] == null
                && Context.Items["idQuanAo"] == null)
            {
                Response.Redirect("/trang-chu");
            }
            else
            {
                _idSan = Context.Items["idSan"].ToString();
                _idDoUong = Context.Items["idDoUong"].ToString();
                _idGiay = Context.Items["idGiay"].ToString();
                _idQuanAo = Context.Items["idQuanAo"].ToString();

                txtIdSanTimKiem.Value = _idSan;
                txtIdDoUongTimKiem.Value = _idDoUong;
                txtIdGiayTimKiem.Value = _idGiay;
                txtIdQuanAoTimKiem.Value = _idQuanAo;

                if (_idSan != "")
                {
                    loadDSSan(); noneSp = "display:none";
                }
                if (_idDoUong != "")
                {
                    loadSanPham("1"); noneSan = "display:none"; noneSp = "display:block";
                }
                if (_idGiay != "")
                {
                    loadSanPham("3");
                }
                if (_idQuanAo != "")
                {
                    loadSanPham("2");
                }
                if (_idDoUong == "" && _idGiay == "" && _idQuanAo == "" && _idSan == "")
                {
                    styleNone = "display:block"; noneSan = "display:none"; noneSp = "display:none";
                }
                else
                {
                    styleNone = "display:none";
                }
            }
        }
        txtDateTImeNow = DateTime.Now.ToString("dd/MM/yyyy");
    }

    protected void loadSanPham(string sanPham)
    {
        string[] arrIdQuanAoTK = txtIdQuanAoTimKiem.Value.Split(',');
        string[] arrIdDoUongTK = txtIdDoUongTimKiem.Value.Split(',');
        string[] arrIdGiayTK = txtIdGiayTimKiem.Value.Split(',');

        //Danh sach san pham
        var getDoUong = from du in db.tbDrinks where arrIdDoUongTK.Contains(du.drinks_id.ToString()) select du;
        var getQuanAo = from qa in db.tbClothes where arrIdQuanAoTK.Contains(qa.clothes_id.ToString()) select qa;
        var getGiay = from g in db.tbShoes where arrIdGiayTK.Contains(g.shoes_id.ToString()) select g;

        if (sanPham == "1")
        {
            //Danh sach do uong
            rpDoUong.DataSource = getDoUong;
            rpDoUong.DataBind();
        }
        if (sanPham == "2")
        {
            //Danh sach ao quan
            rpQuanAo.DataSource = getQuanAo;
            rpQuanAo.DataBind();
        }
        if (sanPham == "3")
        {
            //Danh sach giay
            rpGiay.DataSource = getGiay;
            rpGiay.DataBind();
        }
    }

    protected void loadDSSan()
    {
        string[] arrIdSanTK = txtIdSanTimKiem.Value.Split(',');

        //Danh sach san
        var getData = (from l in db.tbFieldTypes
                       join ls in db.tbFields on l.field_type_id equals ls.field_type_id
                       where arrIdSanTK.Contains(l.field_type_id.ToString())
                       select new
                       {
                           ls.field_id,
                           ls.field_name,
                           l.field_type_name,
                       });
        rpDanhSachSan.DataSource = getData;
        rpDanhSachSan.DataBind();

        //Khach da dan san
        var getTimeBook = (from p in db.tbPrices
                           join bt in db.tbBookTimes on p.book_time_id equals bt.book_time_id
                           join s in db.tbFields on p.field_type_id equals s.field_type_id
                           join tta in db.tbTempTransactionAdmins on s.field_id equals tta.field_id
                           join st in db.tbTransactions on tta.temp_transaction_id equals st.temp_transaction_id
                           where st.transaction_status == 1 && st.transaction_datetime.Value.Day == DateTime.Now.Day
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
                               where st.transaction_status == 0 && st.transaction_datetime.Value.Day == DateTime.Now.Day
                               select new
                               {
                                   tta.book_time_id,
                                   tta.field_id,
                               });

        txtIdSanCho.Value = string.Join(",", getTimeBookWait.Select(x => x.field_id));
        txtIdTimeCho.Value = string.Join(",", getTimeBookWait.Select(x => x.book_time_id));
    }
    protected void btnXemTrangThaiSan_ServerClick(object sender, EventArgs e)
    {
        string _idSan = txtIdSan.Value;
        string _idGio = txtIdGio.Value;

        var getData = (from p in db.tbPrices
                       join bt in db.tbBookTimes on p.book_time_id equals bt.book_time_id
                       join s in db.tbFields on p.field_type_id equals s.field_type_id
                       join tta in db.tbTempTransactionAdmins on s.field_id equals tta.field_id
                       join t in db.tbTransactions on tta.temp_transaction_id equals t.temp_transaction_id
                       where
                       tta.field_id == Convert.ToInt32(txtIdSan.Value)
                       && tta.book_time_id == Convert.ToInt32(txtIdGio.Value)
                       && t.transaction_status == 0
                       && t.transaction_datetime.Value.Day == DateTime.Now.Day
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
                Server.Transfer("web_module/module_XacNhanDatSan.aspx");
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
                              style = Convert.ToInt32(bt.book_time_detail.Substring(0, 2)) < DateTime.Now.Hour ? "pointer-events: none;background:aqua" : "",
                          };
        rpKhungGio.DataSource = getBookTime;
        rpKhungGio.DataBind();
    }

}