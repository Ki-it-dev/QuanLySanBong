<%@ Page Title="" Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="TrangChu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/cssModule/index.css" rel="stylesheet" type="text/css" />
    <link href="css/cssModule/san.css" rel="stylesheet" type="text/css">
    <link href="css/cssModule/sanpham.css" rel="stylesheet" type="text/css">
    <link href="css/cssModule/xacnhan.css" rel="stylesheet" type="text/css">
    <link href="css/cssModule/qldscn.css" rel="stylesheet" type="text/css">
    <link href="css/cssModule/qlttcn.css" rel="stylesheet" type="text/css">
    <link href="css/cssModule/xndsc.css" rel="stylesheet" type="text/css">
    <link href="css/cssModule/qldsc.css" rel="stylesheet" type="text/css">
    <link href="css/mdb.min.css" rel="stylesheet" />
    <script src="../js/mdb.min.js"></script>
    <script src="admin_js/sweetalert.min.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid">
        <div id="index">
            <div class="khoangcach">
                <div class="d-flex justify-content-end">
                    <div id="login-form" style="<%=none%>">
                        <!-- Pills navs -->
                        <ul class="nav nav-pills nav-justified mb-3" id="ex1" rrpquanaoole="tablist">
                            <li class="nav-item" role="presentation">
                                <a class="nav-link active" id="tab-login" data-mdb-toggle="pill" href="#pills-login" role="tab"
                                    aria-controls="pills-login" aria-selected="true">Login</a>
                            </li>
                            <li class="nav-item" role="presentation">
                                <a class="nav-link" id="tab-register" data-mdb-toggle="pill" href="#pills-register" role="tab"
                                    aria-controls="pills-register" aria-selected="false">Register</a>
                            </li>
                        </ul>
                        <!-- Pills navs -->

                        <!-- Pills content -->
                        <div class="tab-content">
                            <div class="tab-pane fade show active" id="pills-login" role="tabpanel" aria-labelledby="tab-login">
                                <div class="text-center mb-3">
                                    <p>Sign in with:</p>

                                    <button type="button" class="btn btn-link btn-floating mx-1">
                                        <i class="fab fa-facebook-f"></i>
                                    </button>

                                    <button type="button" class="btn btn-link btn-floating mx-1">
                                        <i class="fab fa-google"></i>
                                    </button>

                                    <button type="button" class="btn btn-link btn-floating mx-1">
                                        <i class="fab fa-twitter"></i>
                                    </button>

                                    <button type="button" class="btn btn-link btn-floating mx-1">
                                        <i class="fab fa-github"></i>
                                    </button>
                                </div>

                                <p class="text-center">or:</p>

                                <!-- Email input -->
                                <div class="form-outline mb-4">
                                    <input type="text" id="loginName" runat="server" class="form-control" />
                                    <label class="form-label" for="loginName">Account</label>
                                </div>

                                <!-- Password input -->
                                <div class="form-outline mb-4">
                                    <input type="password" id="loginPassword" runat="server" class="form-control" />
                                    <label class="form-label" for="loginPassword">Password</label>
                                </div>

                                <!-- 2 column grid layout 
                                <div class="row mb-4">
                                    <div class="col-md-6 d-flex justify-content-center">
                                        <div class="form-check mb-3 mb-md-0">
                                            <input class="form-check-input" type="checkbox" value="" id="loginCheck" checked />
                                            <label class="form-check-label" for="loginCheck">Remember me </label>
                                        </div>
                                    </div>

                                    <div class="col-md-6 d-flex justify-content-center">
                                        <a href="#!">Forgot password?</a>
                                    </div>
                                </div> -->

                                <!-- Submit button -->
                                <button type="submit" id="btnLogin" runat="server" onserverclick="btnLogin_ServerClick" class="btn btn-primary btn-block mb-4">Sign in</button>

                                <!-- Register buttons 
                                <div class="text-center">
                                    <p>Not a member? <a href="#!">Register</a></p>
                                </div>-->
                            </div>
                            <div class="tab-pane fade" id="pills-register" role="tabpanel" aria-labelledby="tab-register">
                                <div class="text-center mb-3">
                                    <p>Sign up with:</p>
                                    <button type="button" class="btn btn-link btn-floating mx-1">
                                        <i class="fab fa-facebook-f"></i>
                                    </button>

                                    <button type="button" class="btn btn-link btn-floating mx-1">
                                        <i class="fab fa-google"></i>
                                    </button>

                                    <button type="button" class="btn btn-link btn-floating mx-1">
                                        <i class="fab fa-twitter"></i>
                                    </button>

                                    <button type="button" class="btn btn-link btn-floating mx-1">
                                        <i class="fab fa-github"></i>
                                    </button>
                                </div>

                                <p class="text-center">or:</p>
                                <div class="row">
                                    <div class="col-md-6">
                                        <!-- Name input -->
                                        <div class="form-outline mb-3">
                                            <input type="text" id="registerName" runat="server" class="form-control" />
                                            <label class="form-label" for="registerName">Full name</label>
                                        </div>
                                        <!-- Email input -->
                                        <div class="form-outline mb-3">
                                            <input type="email" id="registerEmail" runat="server" class="form-control" />
                                            <label class="form-label" for="registerEmail">Email</label>
                                        </div>


                                        <!-- Password input -->
                                        <div class="form-outline mb-3">
                                            <input type="password" id="registerPassword" runat="server" class="form-control" />
                                            <label class="form-label" for="registerPassword">Password</label>
                                        </div>
                                        <!-- Phone numbers input -->
                                        <div class="form-outline mb-3">
                                            <input type="text" id="phoneNumbers" runat="server" class="form-control" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');" />
                                            <label class="form-label" for="phoneNumbers">Phone</label>
                                        </div>

                                    </div>

                                    <div class="col-md-6">
                                        <!-- Identity input -->
                                        <div class="form-outline mb-3">
                                            <input type="text" id="identity" runat="server" class="form-control" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');" />
                                            <label class="form-label" for="identity">Identity</label>
                                        </div>

                                        <!-- Username input -->
                                        <div class="form-outline mb-3">
                                            <input type="text" id="registerUsername" runat="server" class="form-control" />
                                            <label class="form-label" for="registerUsername">Account</label>
                                        </div>


                                        <!-- Repeat Password input -->
                                        <div class="form-outline mb-2">
                                            <input type="password" id="registerRepeatPassword" runat="server" class="form-control" />
                                            <label class="form-label" for="registerRepeatPassword">Repeat password</label>
                                        </div>
                                    </div>

                                </div>


                                <!-- Checkbox -->
                                <div class="form-check d-flex justify-content-center mb-2">
                                    <input class="form-check-input me-2" type="checkbox" value="" id="registerCheck" checked
                                        aria-describedby="registerCheckHelpText" />
                                    <label class="form-check-label" for="registerCheck">
                                        I have read and agree to the terms
                                    </label>
                                </div>

                                <!-- Submit button -->
                                <button type="submit" id="btnRegister" runat="server" onserverclick="btnRegister_ServerClick" class="btn btn-primary btn-block mb-3">Sign in</button>
                            </div>
                        </div>
                        <!-- Pills content -->
                    </div>
                </div>
                <div class="d-flex justify-content-end">
                    <div class="p-2" style="margin-top: 20px">
                        <a href="#san3" style="padding: 10px; text-decoration: none; border: solid 1px greenyellow; border-radius: 40px; color: navajowhite; font-family: emoji; font-style: italic; font-size: medium;">ĐẶT NGAY
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div id="san3">
            <div class="container-fluid">
                <div class="container">
                    <div class="row">
                        <asp:Repeater runat="server" ID="rpDanhSachSan" OnItemDataBound="rpDanhSachSan_ItemDataBound">
                            <ItemTemplate>
                                <div class="col-lg-6 col-md-12 col-sm-12">
                                    <div class="card mb-4" style="background-color: transparent; height: 20%;">
                                        <h2 style="color: snow"><%#Eval("field_type_name") %></h2>
                                        <div class="card-body" style="width: 300%; background-color: transparent; border: solid 1px lightgoldenrodyellow;">
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
        <div id="sanpham">
            <div class="khoangcach">
                <h1>Sản Phẩm</h1>
                <div class="dropdown" style="margin-top: 30px;">

                    <asp:DropDownList ID="ddlSanPham" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlSanPham_SelectedIndexChanged">
                        <asp:ListItem>Tất cả sản phẩm</asp:ListItem>
                        <asp:ListItem>Nước giải khát</asp:ListItem>
                        <asp:ListItem>Áo quần</asp:ListItem>
                        <asp:ListItem>Giày dép</asp:ListItem>
                    </asp:DropDownList>

                </div>
                <div class="card-deck">
                    <div class="container-fluid">
                        <div class="row">
                            <asp:Repeater runat="server" ID="rpQuanAo">
                                <ItemTemplate>
                                    <div class="col-lg-3">
                                        <div class="card">
                                            <img class="card-img-top" src="<%#Eval("picture")%>" alt="Card image cap">
                                            <div class="card-body">
                                                <h4 class="card-title"><%#Eval("clothes_name") %></h4>
                                                <p class="card-text"><%#Eval("clothes_description") %></p>
                                                <h5><%#Eval("clothes_price") %></h5>
                                            </div>
                                            <div class="card-footer">
                                                <small class="text-muted">Last updated: <%=txtDateTImeNow%></small>
                                                <small style="float: right" class="text-muted">SL: còn <%#Eval("quantity") %></small>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>

                            <asp:Repeater runat="server" ID="rpGiay">
                                <ItemTemplate>
                                    <div class="col-lg-3">
                                        <div class="card">
                                            <img class="card-img-top" src="<%#Eval("picture")%>" alt="Card image cap">
                                            <div class="card-body">
                                                <h4 class="card-title"><%#Eval("shoes_name") %></h4>
                                                <p class="card-text"><%#Eval("shoes_description") %></p>
                                                <h5><%#Eval("shoes_price") %></h5>
                                            </div>
                                            <div class="card-footer">
                                                <small class="text-muted">Last updated: <%=txtDateTImeNow%></small>
                                                <small style="float: right" class="text-muted">SL: còn <%#Eval("quantity") %></small>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>

                            <asp:Repeater runat="server" ID="rpDoUong">
                                <ItemTemplate>
                                    <div class="col-lg-3">
                                        <div class="card">
                                            <img class="card-img-top" src="<%#Eval("picture")%>" alt="Card image cap">
                                            <div class="card-body">
                                                <h4 class="card-title"><%#Eval("drinks_name") %></h4>
                                                <p class="card-text"><%#Eval("drinks_description") %></p>
                                                <h5><%#Eval("drinks_price") %></h5>
                                            </div>
                                            <div class="card-footer">
                                                <small class="text-muted">Last updated: <%=txtDateTImeNow%></small>
                                                <small style="float: right" class="text-muted">SL: còn <%#Eval("quantity") %></small>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>

                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <style>
        .sanDaDat {
            background: red !important;
            color: #fff !important;
            font-weight: 600;
            pointer-events:none;
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
                console.log(getElements)
                getElements.forEach(function (element) {
                    element.classList.add('sanDaDat');
                });
            }
        })
    </script>

</asp:Content>

