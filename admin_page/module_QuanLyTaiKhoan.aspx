<%@ Page Title="" Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="module_QuanLyTaiKhoan.aspx.cs" Inherits="admin_page_module_QuanLyTaiKhoan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../../css/cssModule/index.css" rel="stylesheet" type="text/css" />
    <link href="../../css/cssModule/san.css" rel="stylesheet" type="text/css">
    <link href="../../css/cssModule/sanpham.css" rel="stylesheet" type="text/css">
    <link href="../../css/cssModule/xacnhan.css" rel="stylesheet" type="text/css">
    <link href="../../css/cssModule/qldscn.css" rel="stylesheet" type="text/css">
    <link href="../../css/cssModule/qlttcn.css" rel="stylesheet" type="text/css">
    <link href="../../css/cssModule/xndsc.css" rel="stylesheet" type="text/css">
    <link href="../../css/cssModule/qldsc.css" rel="stylesheet" type="text/css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="qldsc">
        <div class="khoangcach">
            <h1>Quản lý tài khoản</h1>
            <div style="margin-top: 50px;">
                <div class="d-flex flex-column">
                    <div class="p-2">
                        <table class="table table-dark">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Phân quyền</th>
                                    <th scope="col">Tên tài khoản</th>
                                    <th scope="col">Mật khẩu</th>
                                    <th scope="col">Số điện thoại</th>
                                    <th scope="col">CMND</th>
                                    <th scope="col">Địa chỉ</th>
                                    <th scope="col">Trạng thái</th>
                                    <th scope="col"></th>
                                    <th scope="col"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater runat="server" ID="rpTK">
                                    <ItemTemplate>
                                        <tr>
                                            <th scope="row"><%=STT++%></th>
                                            <td><%#Eval("group_user_name") %></td>
                                            <td><%#Eval("users_fullname") %></td>
                                            <td><%#Eval("users_account") %></td>
                                            <td><%#Eval("users_phoneNumber") %></td>
                                            <td><%#Eval("users_identity") %></td>
                                            <td><%#Eval("users_address") %></td>
                                            <td><%#Eval("users_status")%></td>
                                            <td>
                                                <a class="btn btn-primary" onclick="btnXoa('<%#Eval("users_id")%>')">Xóa</a>
                                            </td>
                                            <td>
                                                <a class="btn btn-primary" onclick="btnSua('<%#Eval("users_id")%>')">Cập nhật</a>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <a href="#" id="btnXoaServer" runat="server" onserverclick="btnXoaServer_ServerClick"></a>
    <a href="#" id="btnSuaServer" runat="server" onserverclick="btnSuaServer_ServerClick"></a>

    <input type="text" runat="server" id="txtIdUser" name="name" value="" />

    <script>

        function btnSua(id) {
            document.getElementById("<%=txtIdUser.ClientID%>").value = id;
            document.getElementById("<%=btnSuaServer.ClientID%>").click();
        }

        function btnXoa(id) {
            swal("Bạn có thực sự muốn xóa?",
                "Nếu xóa, dữ liệu sẽ không thể khôi phục.",
                "warning",
                {
                    buttons: true,
                    dangerMode: true
                }).then(function (value) {
                    if (value == true) {
                        document.getElementById("<%=txtIdUser.ClientID%>").value = id
                        var xoa = document.getElementById('<%=btnXoaServer.ClientID%>')
                        xoa.click();
                    }
                });
        }
    </script>

</asp:Content>

