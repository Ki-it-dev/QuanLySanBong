﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="module_QuanLyDatSanCaNhan.aspx.cs" Inherits="web_module_module_QuanLyDatSanCaNhan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../css/cssModule/index.css" rel="stylesheet" type="text/css" />
    <link href="../css/cssModule/san.css" rel="stylesheet" type="text/css">
    <link href="../css/cssModule/sanpham.css" rel="stylesheet" type="text/css">
    <link href="../css/cssModule/xacnhan.css" rel="stylesheet" type="text/css">
    <link href="../css/cssModule/qldscn.css" rel="stylesheet" type="text/css">
    <link href="../css/cssModule/qlttcn.css" rel="stylesheet" type="text/css">
    <link href="../css/cssModule/xndsc.css" rel="stylesheet" type="text/css">
    <link href="../css/cssModule/qldsc.css" rel="stylesheet" type="text/css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="qldscn">
        <div class="khoangcach">
            <h1>Quản lý đơn đặt sân của tôi</h1>
            <div class="d-flex flex-wrap ">
                <asp:Repeater runat="server" ID="rpDanhSachDatSan">
                    <ItemTemplate>
                        <div class="flex-item">
                            <div class="d-flex flex-column">
                                <div class="p-2">Sân : <%#Eval("field_name") %></div>
                                <div class="p-2">Thời gian : <%#Eval("book_time_detail") %></div>
                                <div class="p-2">Ngày đặt  : <%#Eval("transaction_datetime") %></div>
                                <div class="d-flex">
                                    <div class="p-2"><span class="badge badge-success" style="<%#Eval("daXacNhan")%>" >Đã xác nhận</span></div>
                                    <div class="p-2"><span class="badge badge-warning" style="<%#Eval("choXacNhan")%>" >Chờ xác nhận</span></div>
                                    <div class="p-2"><span class="badge badge-secondary" style="<%#Eval("daHuy")%>" >Đã hủy</span></div>
                                    <div class="p-2"><a href="#"><span class="badge badge-danger" 
                                        onclick="myBtnHuy('<%#Eval("field_id") %>','<%#Eval("book_time_id") %>')" style="<%#Eval("huy")%>">Hủy</span></a></div>
                                </div>
                            </div>
                            <div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
        <div style="padding:8%;"></div>
    </div>
    <a href="#" id="btnHuy" runat="server" onserverclick="btnHuy_ServerClick"></a>
    <div style="display:none;">
    <input type="text" name="name" value="" id="txtIdSan" runat="server"/>
    <input type="text" name="name" value="" id="txtIdGio" runat="server"/>
</div>

    <script>
        function myBtnHuy(idSan, idGio) {
            document.getElementById("<%=txtIdSan.ClientID%>").value = idSan
            document.getElementById("<%=txtIdGio.ClientID%>").value = idGio
            document.getElementById("<%=btnHuy.ClientID%>").click()
        }
    </script>

</asp:Content>

