using DevExpress.Web.ASPxHtmlEditor;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_page_module_function_module_Introduce : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();
    private int _id;
    string image;
    protected void Page_Load(object sender, EventArgs e)
    {
        // Kiểm trả session login nếu khác null thì vào form xử lý
        edtnoidung.Toolbars.Add(HtmlEditorToolbar.CreateStandardToolbar1());
        if (Session["AdminLogined"] != null)
        {

            admin_User logedMember = Session["AdminLogined"] as admin_User;
            //if (logedMember.groupuser_id == 3)
            //    Response.Redirect("/user-home");
            if (!IsPostBack)
            {
                Session["_id"] = 0;
            }
            loadData();
        }
        // nếu session = null thì trả về trang login
        else
        {
            Response.Redirect("/admin-login");
        }

    }
    private void loadData()
    {
        // load data đổ vào var danh sách
        var getData = from nc in db.tbIntroduces
                      select nc;
        // đẩy dữ liệu vào gridivew
        grvList.DataSource = getData;
        grvList.DataBind();
    }
    private void setNULL()
    {
        txttensanpham.Text = "";
        txtSummary.Text = "";
        edtnoidung.Html = "";
    }
    protected void btnThem_Click(object sender, EventArgs e)
    {
        // Khi nhấn nút thêm thì mật định session id = 0 để thêm mới
        Session["_id"] = 0;
        // gọi hàm setNull để trả toàn bộ các control về rỗng
        setNULL();
        ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Insert", "popupControl.Show();", true);
        loadData();
    }
    protected void btnChiTiet_Click(object sender, EventArgs e)
    {
        // get value từ việc click vào gridview
        _id = Convert.ToInt32(grvList.GetRowValues(grvList.FocusedRowIndex, new string[] { "introduct_id" }));
        // đẩy id vào session
        Session["_id"] = _id;
        var getData = (from nc in db.tbIntroduces
                       where nc.introduct_id == _id
                       select nc).Single();
        txttensanpham.Text = getData.introduce_title;
        txtSummary.Text = getData.introduce_summary;
        edtnoidung.Html = getData.introduce_content;
        if (getData.introduce_image == null)
            image = "/admin_images/up-img.png";
        else
            image = getData.introduce_image;
            ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Detail", "popupControl.Show();showImg1_1('" + getData.introduce_image + "'); ", true);
        loadData();
    }
    protected void btnXoa_Click(object sender, EventArgs e)
    {

        cls_Introduce cls;
        List<object> selectedKey = grvList.GetSelectedFieldValues(new string[] { "introduct_id" });
        if (selectedKey.Count > 0)
        {
            foreach (var item in selectedKey)
            {
                cls = new cls_Introduce();

                if (cls.Linq_Xoa(Convert.ToInt32(item)))
                {
                    alert.alert_Success(Page, "Xóa thành công", "");
                }
                else
                    alert.alert_Error(Page, "Xóa thất bại", "");
            }
        }
        else
            alert.alert_Warning(Page, "Bạn chưa chọn dữ liệu", "");
    }

    public bool checknull()
    {
        if (txttensanpham.Text != "" || edtnoidung.Html != "")
            return true;
        else return false;
    }


    protected void btnLuu_Click(object sender, EventArgs e)
    {

        cls_Introduce cls = new cls_Introduce();
        if (Page.IsValid && FileUpload1.HasFile)
        {
            string filename = (FileUpload1.FileName);
            string fileName_save = Path.Combine(Server.MapPath("~/uploadimages"), filename);
            FileUpload1.SaveAs(fileName_save);
            image = "/uploadimages/" + filename;
        }
        if (checknull() == false)
            alert.alert_Warning(Page, "Nhập đầy đủ thông tin!", "");
        else
        {
            //if (image == null)
            //{
            //    image = "/admin_images/up-img.png";
            //}
            if (Session["_id"].ToString() == "0")
            {
                if (cls.Linq_Them(txttensanpham.Text, txtSummary.Text, edtnoidung.Html, image))
                {
                    alert.alert_Success(Page, "Thêm thành công", "");
                    loadData();
                }
                else alert.alert_Error(Page, "Thêm thất bại", "");
            }
            else
            {
                if (cls.Linq_Sua(Convert.ToInt32(Session["_id"].ToString()), txttensanpham.Text, txtSummary.Text, edtnoidung.Html, image))
                {
                    alert.alert_Success(Page, "Cập nhật thành công", "");
                    loadData();
                }
                else alert.alert_Error(Page, "Cập nhật thất bại", "");
            }
            // loadData();
        }
    }
    public void delete(string sFileName)
    {
        if (sFileName != String.Empty)
        {
            if (File.Exists(sFileName))

                File.Delete(sFileName);
        }
    }


    protected void btnHienThi_Click(object sender, EventArgs e)
    {
        List<object> selectedKey = grvList.GetSelectedFieldValues(new string[] { "introduct_id" });
        if (selectedKey.Count>0)
        {
            foreach(var item in selectedKey)
            {
                var getIntro = (from intr in db.tbIntroduces where intr.introduct_id == Convert.ToInt32(item) select intr).SingleOrDefault();
                if (getIntro != null)
                {
                    getIntro.introduce_active = true;
                    getIntro.introduce_dateup = DateTime.Now;
                    db.SubmitChanges();
                    alert.alert_Success(Page, "Hiển thị thành công!", "");
                }
                else
                {
                    alert.alert_Error(Page, "Hiển thị thất bại!", "");
                }
            }
        }
        // đẩy id vào session
    }
}