﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="module_XacNhanDatSanChung.aspx.cs" Inherits="admin_page_employee_page_module_XacNhanDatSanChung" %>

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
    <div id="xndsc">
        <div class="khoangcach">
            <h1>Xác nhận đơn đặt sân</h1>
            <div class="d-flex flex-wrap ">
                <asp:Repeater runat="server" ID="rpXacNhan">
                    <ItemTemplate>
                        <div class="flex-item">
                            <div class="d-flex flex-column">
                                <div class="p-2">Sân : <%#Eval("field_name") %></div>
                                <div class="p-2">Thời gian : <%#Eval("book_time_detail") %></div>
                                <div class="p-2">Người đặt : <%#Eval("users_account") %></div>
                                <div class="p-2">Ngày đặt  : <%#Eval("transaction_datetime") %></div>
                                <div class="d-flex flex-row-reverse">
                                    <div class="p-2">
                                        <a href="#"
                                            onclick="btnHuy('<%#Eval("field_id") %>','<%#Eval("book_time_id") %>')">
                                            <span class="badge badge-danger">Hủy</span></a>
                                    </div>
                                    <div class="p-2">
                                        <a href="#"
                                            onclick="btnXacNhan('<%#Eval("field_id") %>','<%#Eval("book_time_id") %>')">
                                            <span class="badge badge-success">Xác nhận</span></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>

    <div style="display:none;">
        <input type="text" name="name" value="" runat="server" id="txtIdSan" />
        <input type="text" name="name" value="" runat="server" id="txtIdGio" />
        <a href="#" id="btnServerHuy" runat="server" onserverclick="btnServerHuy_ServerClick">content</a>
        <a href="#" id="btnServerXacNhan" runat="server" onserverclick="btnServerXacNhan_ServerClick">content</a>
    </div>

    <script>
        function btnHuy(idSan, idGio) {
            document.getElementById("<%=txtIdSan.ClientID%>").value = idSan
            document.getElementById("<%=txtIdGio.ClientID%>").value = idGio
            document.getElementById("<%=btnServerHuy.ClientID%>").click()
        }
        function btnXacNhan(idSan, idGio) {
            document.getElementById("<%=txtIdSan.ClientID%>").value = idSan
            document.getElementById("<%=txtIdGio.ClientID%>").value = idGio
            document.getElementById("<%=btnServerXacNhan.ClientID%>").click()
        }
    </script>

</asp:Content>

