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

    protected string styleNone, txtNone;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["UserName"] != null)
        {
            var getUser = (from u in db.tbUsers where u.users_account == Request.Cookies["UserName"].Value select u).FirstOrDefault();

            txtUserName.InnerText = getUser.users_fullname;

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
    public static string locDau(string s)
    {
        Regex regex = new Regex("\\p{IsCombiningDiacriticalMarks}+");
        string temp = s.Normalize(NormalizationForm.FormD);
        return regex.Replace(temp, String.Empty).Replace('\u0111', 'd').Replace('\u0110', 'D');
    }

    protected void btnTimKiem_ServerClick(object sender, EventArgs e)
    {
        string value =  locDau(txtTimKiem.Value);

        //Danh sach san pham
        var getDoUong = from du in db.tbDrinks select du.drinks_name;
        var getQuanAo = from qa in db.tbClothes select qa.clothes_name;
        var getGiay = from g in db.tbShoes select g.shoes_name;

        //var dsSan = db.tbFieldTypes.Where(x => x.field_type_name.Contains(value));
        //var dsDoUong = db.tbDrinks.Where(x => x.drinks_name.Contains(value));
        //var dsQuanAo = db.tbClothes.Where(x => x.clothes_name.Contains(value));
        //var dsGiay = db.tbShoes.Where(x => x.shoes_name.Contains(value));

    }
}
