<%@ Page Title="" Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="module_DatTruoc.aspx.cs" Inherits="web_module_module_DatTruoc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../css/cssModule/index.css" rel="stylesheet" type="text/css" />
    <link href="../css/cssModule/san.css" rel="stylesheet" type="text/css">
    <link href="../css/cssModule/sanpham.css" rel="stylesheet" type="text/css">
    <link href="../css/cssModule/xacnhan.css" rel="stylesheet" type="text/css">
    <link href="../css/cssModule/qldscn.css" rel="stylesheet" type="text/css">
    <link href="../css/cssModule/qlttcn.css" rel="stylesheet" type="text/css">
    <link href="../css/cssModule/xndsc.css" rel="stylesheet" type="text/css">
    <link href="../css/cssModule/qldsc.css" rel="stylesheet" type="text/css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="san3">
        <div class="container-fluid" style="padding-top: 8%;">
            <div class="container">

                <input type="date" name="name" value="" id="dteNgayBatDau" runat="server" onchange="myFunChange()" />

                <div class="row">
                    <asp:Repeater runat="server" ID="rpDanhSachSan" OnItemDataBound="rpDanhSachSan_ItemDataBound">
                        <ItemTemplate>
                            <div class="col-lg-6 col-md-12 col-sm-12">
                                <div class="card mb-4" style="background-color: transparent; height: 20%;">
                                    <h2 style="color: snow"><%#Eval("field_type_name") %></h2>
                                    <div class="card-body" style="width: 100%; background-color: transparent; border: solid 1px lightgoldenrodyellow;">
                                        <h5 class="card-title" style="color: snow"><%#Eval("field_name") %></h5>
                                        <div class="listBookTimes_<%#Eval("field_id") %> row">
                                            <asp:Repeater runat="server" ID="rpKhungGio">
                                                <ItemTemplate>
                                                    <div class="col-lg-3 col-md-1  col-sm-1 mb-3 ">
                                                        <a href="#" class="btn btn-primary cursor-poiter" style='min-width: 120px;'
                                                            id="btnSan_<%#Eval("book_time_id") %>_<%#Eval("field_id") %>"
                                                            onclick="btnTimes('<%#Eval("book_time_id") %>','<%#Eval("field_id") %>')"><%#Eval("book_time_detail") %></a>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </div>
                                        <p class="card-text" id="txtStatus_<%#Eval("field_id") %>"></p>
                                        <%--<a href="#" class="btn btn-primary mt-2" onclick="btnDatSan(<%#Eval("field_id") %>)" id="<%#Eval("field_id") %>">Đặt sân</a>--%>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
        <div style="display: none;">
            <input type="text" id="txtTrangThaiSan" runat="server" name="name" />

            <input type="text" id="txtIdSan" runat="server" />
            <input type="text" id="txtIdGio" runat="server" />
            <a href="#" id="btnXemTrangThaiSan" runat="server" onserverclick="btnXemTrangThaiSan_ServerClick"></a>

            <input type="text" id="txtIdSanDaDat" runat="server" name="name" />
            <input type="text" id="txtIdTimeDaDat" runat="server" name="name" />

            <input type="text" id="txtIdSanCho" runat="server" name="name" />
            <input type="text" id="txtIdTimeCho" runat="server" name="name" />

            <input type="text" id="txtIdSanDat" runat="server" />

            <input type="text" id="txtTimeDatTruoc" runat="server" name="name" value="" />
            <a href="#" id="btnDatSan" runat="server" onserverclick="btnDatSan_ServerClick"></a>
        </div>
    </div>

    <style>
        .sanDaDat {
            background: red !important;
            color: #fff !important;
            font-weight: 600;
            pointer-events: none;
        }

        .sanCho {
            background: yellow !important;
            color: #000 !important;
            font-weight: 600;
            /*pointer-events: none;*/
        }
    </style>

    <script>

        var _idSanDaDat = document.getElementById("<%=txtIdSanDaDat.ClientID%>").value.split(',')
        var _idTimeDaDat = document.getElementById("<%=txtIdTimeDaDat.ClientID%>").value.split(',')

        var _idSanCho = document.getElementById("<%=txtIdSanCho.ClientID%>").value.split(',')
        var _idTimeCho = document.getElementById("<%=txtIdTimeCho.ClientID%>").value.split(',')

        function btnTimes(_idgio, _idsan) {
            document.getElementById("<%=txtIdGio.ClientID%>").value = _idgio;
            document.getElementById("<%=txtIdSan.ClientID%>").value = _idsan;
            document.getElementById("<%=btnXemTrangThaiSan.ClientID%>").click();
        }

        function myFunChange() {
            document.getElementById("<%=txtTimeDatTruoc.ClientID%>").value = document.getElementById("<%=dteNgayBatDau.ClientID%>").value
            document.getElementById("<%=btnDatSan.ClientID%>").click();
        }

        $(document).ready(function () {
            for (var i = 0; i < _idSanDaDat.length; i++) {
                var getElements = document.querySelectorAll("#btnSan_" + _idTimeDaDat[i] + "_" + _idSanDaDat[i]);
                //console.log(getElements)
                getElements.forEach(function (element) {
                    element.classList.add('sanDaDat');
                });
            }
            for (var i = 0; i < _idSanCho.length; i++) {
                var getElements = document.querySelectorAll("#btnSan_" + _idTimeCho[i] + "_" + _idSanCho[i]);
                //console.log(getElements)
                getElements.forEach(function (element) {
                    element.classList.add('sanCho');
                });
            }

            var dtToday = new Date();

            var month = dtToday.getMonth() + 1;
            var day = dtToday.getDate();
            var year = dtToday.getFullYear();
            if (month < 10)
                month = '0' + month.toString();
            if (day < 10)
                day = '0' + day.toString();

            var maxDate = year + '-' + month + '-' + day;

            $('#ContentPlaceHolder1_dteNgayBatDau').attr('min', maxDate);
        })

    </script>
</asp:Content>

