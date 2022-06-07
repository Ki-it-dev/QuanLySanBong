<%@ Page Title="" Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="module_San.aspx.cs" Inherits="web_module_module_San" %>

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
    <div id="san3">
        <div class="container-fluid">
            <div class="container">
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
                                                    <div class="col-3 mb-3 ">
                                                        <a href="#" class="btn btn-primary cursor-poiter" style="min-width: 120px;"
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

            <input type="text" id="txtIdSanDat" runat="server" />
            <%--<a href="#" id="btnDatSan" runat="server" onserverclick="btnDatSan_ServerClick"></a>--%>
        </div>
    </div>

    <style>
        .sanDaDat {
            background: red !important;
            color: #fff !important;
            font-weight: 600;
            pointer-events: none;
        }
    </style>

    <script>

        var _idSanDaDat = document.getElementById("<%=txtIdSanDaDat.ClientID%>").value.split(',')
        var _idTimeDaDat = document.getElementById("<%=txtIdTimeDaDat.ClientID%>").value.split(',')

        function btnTimes(_idgio, _idsan) {
            document.getElementById("<%=txtIdGio.ClientID%>").value = _idgio;
            document.getElementById("<%=txtIdSan.ClientID%>").value = _idsan;
            document.getElementById("<%=btnXemTrangThaiSan.ClientID%>").click();
        }

        <%--function btnDatSan(idSan) {
            document.getElementById("<%=txtIdSanDat.ClientID%>").value = idSan;
            document.getElementById("<%=btnDatSan.ClientID%>").click();
        }--%>

        $(document).ready(function () {
            for (var i = 0; i < _idSanDaDat.length; i++) {
                var getElements = document.querySelectorAll("#btnSan_" + _idTimeDaDat[i] + "_" + _idSanDaDat[i]);
                //console.log(getElements)
                getElements.forEach(function (element) {
                    element.classList.add('sanDaDat');
                });
            }
        })
    </script>

</asp:Content>

