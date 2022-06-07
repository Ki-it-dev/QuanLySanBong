using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_module_module_SanPham : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();

    protected string txtDateTImeNow;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ddlSanPhamData();
        }
        txtDateTImeNow = DateTime.Now.ToString("dd/MM/yyyy");
    }
    protected void ddlSanPhamData()
    {
        //Danh sach san pham
        var getDoUong = from du in db.tbDrinks select du;
        var getQuanAo = from qa in db.tbClothes select qa;
        var getGiay = from g in db.tbShoes select g;
        //var getAll = from 

        //rpAll.DataSource = getAll;

        //Danh sach do uong
        rpDoUong.DataSource = getDoUong;
        rpDoUong.DataBind();
        //Danh sach ao quan
        rpQuanAo.DataSource = getQuanAo;
        rpQuanAo.DataBind();
        //Danh sach giay
        rpGiay.DataSource = getGiay;
        rpGiay.DataBind();
    }
    protected void ddlSanPham_SelectedIndexChanged(object sender, EventArgs e)
    {
        var getDoUong = from du in db.tbDrinks select du;
        var getQuanAo = from qa in db.tbClothes select qa;
        var getGiay = from g in db.tbShoes select g;
        //Dropdown list san pham
        if (ddlSanPham.SelectedItem.Text == "Nước giải khát")
        {
            //Danh sach do uong
            rpDoUong.DataSource = getDoUong;
            rpDoUong.DataBind();
            //Danh sach ao quan
            rpQuanAo.DataSource = null;
            rpQuanAo.DataBind();
            //Danh sach giay
            rpGiay.DataSource = null;
            rpGiay.DataBind();
        }
        if (ddlSanPham.SelectedItem.Text == "Áo quần")
        {
            //Danh sach ao quan
            rpQuanAo.DataSource = getQuanAo;
            rpQuanAo.DataBind();
            //Danh sach do uong
            rpDoUong.DataSource = null;
            rpDoUong.DataBind();
            //Danh sach giay
            rpGiay.DataSource = null;
            rpGiay.DataBind();
        }
        if (ddlSanPham.SelectedItem.Text == "Giày dép")
        {
            //Danh sach giay
            rpGiay.DataSource = getGiay;
            rpGiay.DataBind();
            //Danh sach do uong
            rpDoUong.DataSource = null;
            rpDoUong.DataBind();
            //Danh sach ao quan
            rpQuanAo.DataSource = null;
            rpQuanAo.DataBind();
        }
        if (ddlSanPham.SelectedItem.Text == "Tất cả sản phẩm")
        {
            //Danh sach do uong
            rpDoUong.DataSource = getDoUong;
            rpDoUong.DataBind();
            //Danh sach ao quan
            rpQuanAo.DataSource = getQuanAo;
            rpQuanAo.DataBind();
            //Danh sach giay
            rpGiay.DataSource = getGiay;
            rpGiay.DataBind();
        }
    }
}