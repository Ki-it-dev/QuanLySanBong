using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.MasterPage
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();

    protected string styleNone, txtNone,adminNone;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["UserName"] != null)
        {
            var getUser = (from u in db.tbUsers where u.users_account == Request.Cookies["UserName"].Value select u).FirstOrDefault();

            txtUserName.InnerText = getUser.users_fullname;

            if (getUser.group_user_id == 1)
            {
                adminNone = "display:block";
            }
            else
            {
                adminNone = "display:none";
            }
            if (getUser.group_user_id == 1 || getUser.group_user_id == 2)
            {
                txtNone = "display:block";
            }
            else
            {
                txtNone = "display:none";
            }
        }
        else
        {
            styleNone = "display:none";
        }
    }

    protected void btnLogOut_ServerClick(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Cookies["UserName"].Expires = DateTime.Now.AddDays(-1);
        Response.Redirect("/trang-chu");
    }
    protected void btnTimKiem_ServerClick(object sender, EventArgs e)
    {
        string value =  txtTimKiem.Value;

        //Danh sach san pham
        var dsSan = db.tbFieldTypes.Where(x => x.field_type_name.Contains(value));
        var dsDoUong = db.tbDrinks.Where(x => x.drinks_name.Contains(value));
        var dsGiay = db.tbShoes.Where(x => x.shoes_name.Contains(value));
        var dsQuanAo = db.tbClothes.Where(x => x.clothes_name.Contains(value));

        string _idSan = string.Join(",", dsSan.Select(x => x.field_type_id));
        string _idDoUong = string.Join(",", dsDoUong.Select(x => x.drinks_id));
        string _idGiay = string.Join(",", dsQuanAo.Select(x => x.clothes_id));
        string _idQuanAo = string.Join(",", dsGiay.Select(x => x.shoes_id));

        Context.Items["idSan"] = _idSan;
        Context.Items["idDoUong"] = _idDoUong;
        Context.Items["idGiay"] = _idGiay;
        Context.Items["idQuanAo"] = _idQuanAo;

        Server.Transfer("/web_module/module_TimKiem.aspx");
    }
}
