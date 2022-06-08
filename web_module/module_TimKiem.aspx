<%@ Page Title="" Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="module_TimKiem.aspx.cs" Inherits="web_module_module_TimKiem" %>

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
    <div style="<%=styleNone%>">
        <h1 style="color: greenyellow;padding-top: 25%; text-align:center;">Không tìm thấy dữ liệu</h1></div>

    <div id="sanpham">
        <div class="container-fluid" style="padding-top: 8%;">
            <div class="d-flex justify-content-between">
            </div>
            <div class="card-deck">
                <div class="container-fluid">
                    <div class="row">
                        <asp:Repeater runat="server" ID="rpQuanAo">
                            <ItemTemplate>
                                <div class="col-lg-2 col-md-1 col-sm-1 mb-3">
                                    <div class="card">
                                        <img class="card-img-top" src="<%#Eval("picture")%>" alt="Card image cap">
                                        <div class="card-body">
                                            <div class="d-flex align-items-center flex-column" style="height: 200px;">
                                                <div class=" p-2">
                                                    <h4 class="card-title"><%#Eval("clothes_name") %></h4>
                                                </div>
                                                <div class="d-flex">
                                                    <div class="p-2"><h6 class="card-title"><%#Eval("clothes_size") %> </h6></div>
                                                    <div class="p-2"></div>
                                                    <div class="p-2"><h6 class="card-title"> <%#Eval("clothes_color") %></h6></div>
                                                </div>
                                                <div class="p-2">
                                                    <p class="card-text"><%#Eval("clothes_description") %></p>
                                                </div>
                                                <div class="mt-auto p-2">
                                                    <h6><%#Eval("clothes_price","{0:0,00}") %> VNĐ</h6>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card-footer">
                                            <small class="text-muted">Last updated: <%=txtDateTImeNow%></small>
                                            <small style="float: right" class="text-muted mt-3">SL: còn <%#Eval("quantity") %></small>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>

                        <asp:Repeater runat="server" ID="rpGiay">
                            <ItemTemplate>
                                <div class="col-lg-2 mb-3">
                                    <div class="card">
                                        <img class="card-img-top" src="<%#Eval("picture")%>" alt="Card image cap">
                                        <div class="card-body">
                                            <div class="d-flex align-items-center flex-column" style="height: 200px;">
                                                <div class="p-2">
                                                    <h4 class="card-title"><%#Eval("shoes_name") %></h4>
                                                </div>
                                                <div class="d-flex">
                                                    <div class="p-2"><h6 class="card-title"><%#Eval("shoes_size") %></h6></div>
                                                    <div class="p-2"></div>
                                                    <div class="p-2"><h6 class="card-title"><%#Eval("shoes_color") %></h6></div>
                                                </div>
                                                <div class="p-2">
                                                    <p class="card-text"><%#Eval("shoes_description") %></p>
                                                </div>
                                                <div class="mt-auto p-2">
                                                    <h6><%#Eval("shoes_price","{0:0,00}") %> VNĐ</h6>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card-footer">
                                            <small class="text-muted">Last updated: <%=txtDateTImeNow%></small>
                                            <small style="float: right" class="text-muted mt-3">SL: còn <%#Eval("quantity") %></small>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>

                        <asp:Repeater runat="server" ID="rpDoUong">
                            <ItemTemplate>
                                <div class="col-lg-2 mb-3">
                                    <div class="card">
                                        <img class="card-img-top" src="<%#Eval("picture")%>" alt="Card image cap">
                                        <div class="card-body">
                                            <div class="d-flex align-items-center flex-column" style="height: 200px;">
                                                <div class="p-2">
                                                    <h4 class="card-title"><%#Eval("drinks_name") %></h4>
                                                </div>
                                                <div class="p-2">
                                                    <p class="card-text"><%#Eval("drinks_description") %></p>
                                                </div>
                                                <div class="mt-auto p-2">
                                                    <h6><%#Eval("drinks_price","{0:0,00}") %> VNĐ</h6>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="card-footer">
                                            <small class="text-muted">Last updated: <%=txtDateTImeNow%></small>
                                            <small style="float: right" class="text-muted mt-3">SL: còn <%#Eval("quantity") %></small>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </div>
        <div style="padding:8%;"></div>
    </div>

    <div id="san3">
        <div class="container-fluid" style="padding-top: 8%;">
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
                                                    <div class="col-lg-3 col-md-1  col-sm-1 mb-3 ">
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

            <input type="text" id="txtIdSanCho" runat="server" name="name" />
            <input type="text" id="txtIdTimeCho" runat="server" name="name" />

            <input type="text" id="txtIdSanDat" runat="server" />
            <%--<a href="#" id="btnDatSan" runat="server" onserverclick="btnDatSan_ServerClick"></a>--%>

            <input type="text" runat="server" id="txtIdSanTimKiem" name="name" value="" />
            <input type="text" runat="server" id="txtIdDoUongTimKiem" name="name" value="" />
            <input type="text" runat="server" id="txtIdGiayTimKiem" name="name" value="" />
            <input type="text" runat="server" id="txtIdQuanAoTimKiem" name="name" value="" />

        </div>
        <div style="padding:8%;"></div>
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
        })
    </script>

</asp:Content>

