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
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid">
        <div id="index">
            <div class="khoangcach">
                <div class="d-flex justify-content-end">
                    <div id="login-form">
                        <!-- Pills navs -->
                        <ul class="nav nav-pills nav-justified mb-3" id="ex1" role="tablist">
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
                                    <input type="email" id="loginName" runat="server" class="form-control" />
                                    <label class="form-label" for="loginName">Account</label>
                                </div>

                                <!-- Password input -->
                                <div class="form-outline mb-4">
                                    <input type="password" id="loginPassword" runat="server" class="form-control" />
                                    <label class="form-label" for="loginPassword">Password</label>
                                </div>

                                <!-- 2 column grid layout -->
                                <div class="row mb-4">
                                    <div class="col-md-6 d-flex justify-content-center">
                                        <!-- Checkbox -->
                                        <div class="form-check mb-3 mb-md-0">
                                            <input class="form-check-input" type="checkbox" value="" id="loginCheck" checked />
                                            <label class="form-check-label" for="loginCheck">Remember me </label>
                                        </div>
                                    </div>

                                    <div class="col-md-6 d-flex justify-content-center">
                                        <!-- Simple link -->
                                        <a href="#!">Forgot password?</a>
                                    </div>
                                </div>

                                <!-- Submit button -->
                                <button type="submit" id="btnLogin" runat="server" onserverclick="btnLogin_ServerClick" class="btn btn-primary btn-block mb-4">Sign in</button>

                                <!-- Register buttons -->
                                <div class="text-center">
                                    <p>Not a member? <a href="#!">Register</a></p>
                                </div>
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

                                <!-- Name input -->
                                <div class="form-outline mb-4">
                                    <input type="text" id="registerName" runat="server" class="form-control" />
                                    <label class="form-label" for="registerName">Full name</label>
                                </div>

                                <!-- Username input -->
                                <div class="form-outline mb-4">
                                    <input type="text" id="registerUsername" runat="server" class="form-control" />
                                    <label class="form-label" for="registerUsername">Account</label>
                                </div>

                                <!-- Email input -->
                                <div class="form-outline mb-4">
                                    <input type="email" id="registerEmail" runat="server" class="form-control" />
                                    <label class="form-label" for="registerEmail">Email</label>
                                </div>

                                <!-- Password input -->
                                <div class="form-outline mb-4">
                                    <input type="password" id="registerPassword" runat="server" class="form-control" />
                                    <label class="form-label" for="registerPassword">Password</label>
                                </div>

                                <!-- Repeat Password input -->
                                <div class="form-outline mb-4">
                                    <input type="password" id="registerRepeatPassword" runat="server" class="form-control" />
                                    <label class="form-label" for="registerRepeatPassword">Repeat password</label>
                                </div>

                                <!-- Phone numbers input -->
                                <div class="form-outline mb-4">
                                    <input type="text" id="phoneNumbers" runat="server" class="form-control" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');" />
                                    <label class="form-label" for="phoneNumbers">Phone numbers</label>
                                </div>

                                <!-- Phone numbers input -->
                                <div class="form-outline mb-4">
                                    <input type="text" id="identity" runat="server" class="form-control" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');" />
                                    <label class="form-label" for="identity">Identity</label>
                                </div>

                                <!-- Checkbox -->
                                <div class="form-check d-flex justify-content-center mb-4">
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
                    <div class="p-2">
                        <a href="#san">
                            <button id="datngay">
                                ĐẶT NGAY
                            </button>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <%--<div id="san3">
            <div class="khoangcach">
                <h1>Sân 3</h1>
                <div class="d-flex">
                    <div style="margin-top: 15%;">
                        <a href="#san7">
                            <img src="images/Left.png" /></a>
                    </div>
                    <div class="container">
                        <div class="box1">
                            <div>
                                <h3>3-A</h3>
                            </div>
                            <div>
                                <button style="background-color: red;" class="h">6:00-8:00</button>
                                <button style="background-color: rgb(51, 255, 0);" class="h">8:00-10:00</button>
                                <button style="background-color: rgb(51, 255, 0);" class="h">10:00-12:00</button>
                                <button style="background-color: rgb(51, 255, 0);" class="h">12:00-14:00</button>
                                <br>
                                <button style="background-color: rgb(51, 255, 0);" class="h">14:00-16:00</button>
                                <button style="background-color: red;" class="h">16:00-18:00</button>
                                <button style="background-color: rgb(51, 255, 0);" class="h">18:00-20:00</button>
                                <button style="background-color: red;" class="h">20:00-22:00</button>
                            </div>
                            <div style="float: right; margin: 40px;">
                                <a href="#xn">Đặt sân</a>
                            </div>
                        </div>
                        <div class="box2">
                            <div>
                                <h3>3-B</h3>
                            </div>
                            <div>
                                <button style="background-color: red;" class="h">6:00-8:00</button>
                                <button style="background-color: rgb(51, 255, 0);" class="h">8:00-10:00</button>
                                <button style="background-color: rgb(51, 255, 0);" class="h">10:00-12:00</button>
                                <button style="background-color: rgb(51, 255, 0);" class="h">12:00-14:00</button>
                                <br>
                                <button style="background-color: rgb(51, 255, 0);" class="h">14:00-16:00</button>
                                <button style="background-color: red;" class="h">16:00-18:00</button>
                                <button style="background-color: rgb(51, 255, 0);" class="h">18:00-20:00</button>
                                <button style="background-color: red;" class="h">20:00-22:00</button>
                            </div>
                            <div style="float: right; margin: 40px;">
                                <a href="#xn">Đặt sân</a>
                            </div>
                        </div>
                        <div class="box3">
                            <div>
                                <h3>3-C</h3>
                            </div>
                            <div>
                                <button style="background-color: red;" class="h">6:00-8:00</button>
                                <button style="background-color: rgb(51, 255, 0);" class="h">8:00-10:00</button>
                                <button style="background-color: rgb(51, 255, 0);" class="h">10:00-12:00</button>
                                <button style="background-color: rgb(51, 255, 0);" class="h">12:00-14:00</button>
                                <br>
                                <button style="background-color: rgb(51, 255, 0);" class="h">14:00-16:00</button>
                                <button style="background-color: red;" class="h">16:00-18:00</button>
                                <button style="background-color: rgb(51, 255, 0);" class="h">18:00-20:00</button>
                                <button style="background-color: red;" class="h">20:00-22:00</button>
                            </div>
                            <div style="float: right; margin: 40px;">
                                <a href="#xn">Đặt sân</a>
                            </div>
                        </div>
                        <div class="box4">
                            <div>
                                <h3>3-D</h3>
                            </div>
                            <div>
                                <button style="background-color: red;" class="h">6:00-8:00</button>
                                <button style="background-color: rgb(51, 255, 0);" class="h">8:00-10:00</button>
                                <button style="background-color: rgb(51, 255, 0);" class="h">10:00-12:00</button>
                                <button style="background-color: rgb(51, 255, 0);" class="h">12:00-14:00</button>
                                <br>
                                <button style="background-color: rgb(51, 255, 0);" class="h">14:00-16:00</button>
                                <button style="background-color: red;" class="h">16:00-18:00</button>
                                <button style="background-color: rgb(51, 255, 0);" class="h">18:00-20:00</button>
                                <button style="background-color: red;" class="h">20:00-22:00</button>
                            </div>
                            <div style="float: right; margin: 40px;">
                                <a href="#xn">Đặt sân</a>
                            </div>
                        </div>
                    </div>
                    <div style="margin-top: 15%;">
                        <a href="#san5">
                            <img src="images/Right.png" /></a>
                    </div>
                </div>
            </div>
        </div>
        <div id="san5">
            <div class="khoangcach">
                <h1>Sân 5</h1>
                <div class="d-flex">
                    <div style="margin-top: 15%;">
                        <a href="#san3">
                            <img src="images/Left.png" /></a>
                    </div>
                    <div class="container">
                        <div class="box1">
                            <div>
                                <h3>5-A</h3>
                            </div>
                            <div>
                                <button style="background-color: red;" class="h">6:00-8:00</button>
                                <button style="background-color: rgb(51, 255, 0);" class="h">8:00-10:00</button>
                                <button style="background-color: rgb(51, 255, 0);" class="h">10:00-12:00</button>
                                <button style="background-color: rgb(51, 255, 0);" class="h">12:00-14:00</button>
                                <br>
                                <button style="background-color: rgb(51, 255, 0);" class="h">14:00-16:00</button>
                                <button style="background-color: red;" class="h">16:00-18:00</button>
                                <button style="background-color: rgb(51, 255, 0);" class="h">18:00-20:00</button>
                                <button style="background-color: red;" class="h">20:00-22:00</button>
                            </div>
                            <div style="float: right; margin: 40px;">
                                <a href="#xn">Đặt sân</a>
                            </div>
                        </div>
                        <div class="box2">
                            <div>
                                <h3>5-B</h3>
                            </div>
                            <div>
                                <button style="background-color: red;" class="h">6:00-8:00</button>
                                <button style="background-color: rgb(51, 255, 0);" class="h">8:00-10:00</button>
                                <button style="background-color: rgb(51, 255, 0);" class="h">10:00-12:00</button>
                                <button style="background-color: rgb(51, 255, 0);" class="h">12:00-14:00</button>
                                <br>
                                <button style="background-color: rgb(51, 255, 0);" class="h">14:00-16:00</button>
                                <button style="background-color: red;" class="h">16:00-18:00</button>
                                <button style="background-color: rgb(51, 255, 0);" class="h">18:00-20:00</button>
                                <button style="background-color: red;" class="h">20:00-22:00</button>
                            </div>
                            <div style="float: right; margin: 40px;">
                                <a href="#xn">Đặt sân</a>
                            </div>
                        </div>
                        <div class="box3">
                            <div>
                                <h3>5-C</h3>
                            </div>
                            <div>
                                <button style="background-color: red;" class="h">6:00-8:00</button>
                                <button style="background-color: rgb(51, 255, 0);" class="h">8:00-10:00</button>
                                <button style="background-color: rgb(51, 255, 0);" class="h">10:00-12:00</button>
                                <button style="background-color: rgb(51, 255, 0);" class="h">12:00-14:00</button>
                                <br>
                                <button style="background-color: rgb(51, 255, 0);" class="h">14:00-16:00</button>
                                <button style="background-color: red;" class="h">16:00-18:00</button>
                                <button style="background-color: rgb(51, 255, 0);" class="h">18:00-20:00</button>
                                <button style="background-color: red;" class="h">20:00-22:00</button>
                            </div>
                            <div style="float: right; margin: 40px;">
                                <a href="#xn">Đặt sân</a>
                            </div>
                        </div>
                        <div class="box4">
                            <div>
                                <h3>5-D</h3>
                            </div>
                            <div>
                                <button style="background-color: red;" class="h">6:00-8:00</button>
                                <button style="background-color: rgb(51, 255, 0);" class="h">8:00-10:00</button>
                                <button style="background-color: rgb(51, 255, 0);" class="h">10:00-12:00</button>
                                <button style="background-color: rgb(51, 255, 0);" class="h">12:00-14:00</button>
                                <br>
                                <button style="background-color: rgb(51, 255, 0);" class="h">14:00-16:00</button>
                                <button style="background-color: red;" class="h">16:00-18:00</button>
                                <button style="background-color: rgb(51, 255, 0);" class="h">18:00-20:00</button>
                                <button style="background-color: red;" class="h">20:00-22:00</button>
                            </div>
                            <div style="float: right; margin: 40px;">
                                <a href="#xn">Đặt sân</a>
                            </div>
                        </div>
                    </div>
                    <div style="margin-top: 15%;">
                        <a href="#san7">
                            <img src="images/Right.png" /></a>
                    </div>
                </div>


            </div>
        </div>
        <div id="san7">
            <div class="khoangcach">
                <h1>Sân 7</h1>
                <div class="d-flex">
                    <div style="margin-top: 15%;">
                        <a href="#san5">
                            <img src="images/Left.png" /></a>
                    </div>
                    <div class="container">
                        <div class="box1">
                            <div>
                                <h3>7-A</h3>
                            </div>
                            <div>
                                <button style="background-color: red;" class="h">6:00-8:00</button>
                                <button style="background-color: rgb(51, 255, 0);" class="h">8:00-10:00</button>
                                <button style="background-color: rgb(51, 255, 0);" class="h">10:00-12:00</button>
                                <button style="background-color: rgb(51, 255, 0);" class="h">12:00-14:00</button>
                                <br>
                                <button style="background-color: rgb(51, 255, 0);" class="h">14:00-16:00</button>
                                <button style="background-color: red;" class="h">16:00-18:00</button>
                                <button style="background-color: rgb(51, 255, 0);" class="h">18:00-20:00</button>
                                <button style="background-color: red;" class="h">20:00-22:00</button>
                            </div>
                            <div style="float: right; margin: 40px;">
                                <a href="#xn">Đặt sân</a>
                            </div>
                        </div>
                        <div class="box2">
                            <div>
                                <h3>7-B</h3>
                            </div>
                            <div>
                                <button style="background-color: red;" class="h">6:00-8:00</button>
                                <button style="background-color: rgb(51, 255, 0);" class="h">8:00-10:00</button>
                                <button style="background-color: rgb(51, 255, 0);" class="h">10:00-12:00</button>
                                <button style="background-color: rgb(51, 255, 0);" class="h">12:00-14:00</button>
                                <br>
                                <button style="background-color: rgb(51, 255, 0);" class="h">14:00-16:00</button>
                                <button style="background-color: red;" class="h">16:00-18:00</button>
                                <button style="background-color: rgb(51, 255, 0);" class="h">18:00-20:00</button>
                                <button style="background-color: red;" class="h">20:00-22:00</button>
                            </div>
                            <div style="float: right; margin: 40px;">
                                <a href="#xn">Đặt sân</a>
                            </div>
                        </div>
                        <div class="box3">
                            <div>
                                <h3>7-C</h3>
                            </div>
                            <div>
                                <button style="background-color: red;" class="h">6:00-8:00</button>
                                <button style="background-color: rgb(51, 255, 0);" class="h">8:00-10:00</button>
                                <button style="background-color: rgb(51, 255, 0);" class="h">10:00-12:00</button>
                                <button style="background-color: rgb(51, 255, 0);" class="h">12:00-14:00</button>
                                <br>
                                <button style="background-color: rgb(51, 255, 0);" class="h">14:00-16:00</button>
                                <button style="background-color: red;" class="h">16:00-18:00</button>
                                <button style="background-color: rgb(51, 255, 0);" class="h">18:00-20:00</button>
                                <button style="background-color: red;" class="h">20:00-22:00</button>
                            </div>
                            <div style="float: right; margin: 40px;">
                                <a href="#xn">Đặt sân</a>
                            </div>
                        </div>
                        <div class="box4">
                            <div>
                                <h3>7-D</h3>
                            </div>
                            <div>
                                <button style="background-color: red;" class="h">6:00-8:00</button>
                                <button style="background-color: rgb(51, 255, 0);" class="h">8:00-10:00</button>
                                <button style="background-color: rgb(51, 255, 0);" class="h">10:00-12:00</button>
                                <button style="background-color: rgb(51, 255, 0);" class="h">12:00-14:00</button>
                                <br>
                                <button style="background-color: rgb(51, 255, 0);" class="h">14:00-16:00</button>
                                <button style="background-color: red;" class="h">16:00-18:00</button>
                                <button style="background-color: rgb(51, 255, 0);" class="h">18:00-20:00</button>
                                <button style="background-color: red;" class="h">20:00-22:00</button>
                            </div>
                            <div style="float: right; margin: 40px;">
                                <a href="#xn">Đặt sân</a>
                            </div>
                        </div>
                    </div>
                    <div style="margin-top: 15%;">
                        <a href="#san3">
                            <img src="images/Right.png" /></a>
                    </div>
                </div>


            </div>
        </div>
        <div id="sanpham">
            <div class="khoangcach">
                <h1>Sản Phẩm</h1>
                <div class="dropdown" style="margin-top: 30px;">
                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Tất cả sản phẩm
                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                        <a class="dropdown-item" href="#">Nước giải khát</a>
                        <a class="dropdown-item" href="#">Áo quần</a>
                        <a class="dropdown-item" href="#">Giày dép</a>
                    </div>
                </div>
                <div class="card-deck">
                    <div class="card">
                        <img class="card-img-top" src="images/pep.jpg" alt="Card image cap">
                        <div class="card-body">
                            <h4 class="card-title">Pepsi</h4>
                            <p class="card-text">This is a calcium supplement and resistance drink for athletes.</p>
                            <h5>10.000 VNĐ VNĐ</h5>
                        </div>
                        <div class="card-footer">
                            <small class="text-muted">Last updated 3 mins ago</small>
                            <small style="float: right" class="text-muted">SL: còn 38</small>
                        </div>
                    </div>
                    <div class="card">
                        <img class="card-img-top" src="images/giay.jpg" alt="Card image cap">
                        <div class="card-body">
                            <h4 class="card-title">Giày bóng đá Adidas</h4>
                            <p class="card-text">This is a super stretchy shoe that can help us hit the target.</p>
                            <h5>6.000.000 VNĐ</h5>
                        </div>
                        <div class="card-footer">
                            <small class="text-muted">Last updated 3 mins ago</small>
                            <small style="float: right" class="text-muted">SL: còn 88</small>
                        </div>
                    </div>
                    <div class="card">
                        <img class="card-img-top" src="images/qa.jpg" alt="Card image cap">
                        <div class="card-body">
                            <h4 class="card-title">Quần áo bóng đá</h4>
                            <p class="card-text">This is a sweat-proof and durable garment for athletes to pull on.</p>
                            <h5>1.000.000 VNĐ</h5>
                        </div>
                        <div class="card-footer">
                            <small class="text-muted">Last updated 3 mins ago</small>
                            <small style="float: right" class="text-muted">SL: còn 20</small>
                        </div>
                    </div>
                    <div class="card">
                        <img class="card-img-top" src="images/qa.jpg" alt="Card image cap">
                        <div class="card-body">
                            <h4 class="card-title">Quần áo bóng đá</h4>
                            <p class="card-text">This is a sweat-proof and durable garment for athletes to pull on.</p>
                            <h5>1.000.000 VNĐ</h5>
                        </div>
                        <div class="card-footer">
                            <small class="text-muted">Last updated 3 mins ago</small>
                            <small style="float: right" class="text-muted">SL: còn 20</small>
                        </div>
                    </div>
                    <div class="card">
                        <img class="card-img-top" src="images/qa.jpg" alt="Card image cap">
                        <div class="card-body">
                            <h4 class="card-title">Quần áo bóng đá</h4>
                            <p class="card-text">This is a sweat-proof and durable garment for athletes to pull on.</p>
                            <h5>1.000.000 VNĐ</h5>
                        </div>
                        <div class="card-footer">
                            <small class="text-muted">Last updated 3 mins ago</small>
                            <small style="float: right" class="text-muted">SL: còn 20</small>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="xn">
            <div class="khoangcach">
                <h1>Xác nhận đặt sân</h1>
                <div class="d-flex justify-content-center">
                    <section class="xn" style="padding: 20px 30px;">
                        <div class="d-flex flex-column">
                            <div class="p-2">
                                <div class="d-flex flex-row">
                                    <div class="p-2">
                                        <img style="margin-bottom: 30px; margin-right: 20px; width: 20rem; height: 10rem;" src="data:image/jpeg;base64,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" alt="">
                                    </div>
                                    <div class="p-2">
                                        <div class="d-flex flex-column">
                                            <div class="p-2">
                                                <p>Tên sân: Sân 3-A</p>
                                            </div>
                                            <div class="p-2">
                                                <p>Thời gian: 6:00-8:00</p>
                                            </div>
                                            <div class="p-2">
                                                <p>Ngày đặt: 21/12/2021</p>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="p-2">
                                <p>Tên tài khoản : </p>
                            </div>
                            <div class="p-2">
                                <p>Tích điểm     : </p>
                            </div>
                            <div class="p-2">
                                <p>Giảm giá      : </p>
                            </div>
                            <div class="p-2">
                                <div class="d-flex flex-row-reverse">
                                    <div class="p-2">
                                        <button class="btn btn-danger" style="font-size: 1rem; border-radius: 10px;"><i class="fa-solid fa-xmark"></i></button>
                                    </div>
                                    <div class="p-2">
                                        <button class="btn btn-success" style="font-size: 1rem; border-radius: 10px;"><i class="fa-solid fa-check"></i></button>
                                    </div>
                                    <div class="p-2">
                                        <div class="d-flex flex-column justify-content-center">
                                            <span style="margin-top: 10px; margin-right: 10px; color: red; font-style: italic;">Tổng tiền: 100.000 VNĐ</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </section>
                </div>

            </div>
        </div>
        <div id="qldscn">
            <div class="khoangcach">
                <h1>Quản lý đơn đặt sân của tôi</h1>
                <div class="d-flex flex-wrap ">
                    <div class="flex-item">
                        <div class="d-flex flex-column">
                            <div class="p-2">Sân : 3-A</div>
                            <div class="p-2">Thời gian : 8:00-10:00</div>
                            <div class="p-2">Ngày đặt  : 20/11/2021</div>
                            <div class="d-flex">
                                <div class="p-2"><span class="badge badge-warning">Chờ xác nhận</span></div>
                                <div class="p-2"><a href="#"><span class="badge badge-danger">Hủy</span></a></div>
                            </div>
                        </div>
                        <div>
                        </div>
                    </div>
                    <div class="flex-item">
                        <div class="d-flex flex-column">
                            <div class="p-2">Sân : 3-A</div>
                            <div class="p-2">Thời gian : 8:00-10:00</div>
                            <div class="p-2">Ngày đặt  : 20/11/2021</div>
                            <div class="d-flex">
                                <div class="p-2"><span class="badge badge-success">Đã xác nhận</span></div>
                                <div class="p-2"><a hidden="hidden" href="#"><span class="badge badge-danger">Hủy</span></a></div>
                            </div>
                        </div>
                        <div>
                        </div>
                    </div>
                    <div class="flex-item">
                        <div class="d-flex flex-column">
                            <div class="p-2">Sân : 3-A</div>
                            <div class="p-2">Thời gian : 8:00-10:00</div>
                            <div class="p-2">Ngày đặt  : 20/11/2021</div>
                            <div class="d-flex">
                                <div class="p-2"><span class="badge badge-success">Đã xác nhận</span></div>
                                <div class="p-2"><a hidden="hidden" href="#"><span class="badge badge-danger">Hủy</span></a></div>
                            </div>
                        </div>
                        <div>
                        </div>
                    </div>
                    <div class="flex-item">
                        <div class="d-flex flex-column">
                            <div class="p-2">Sân : 3-A</div>
                            <div class="p-2">Thời gian : 8:00-10:00</div>
                            <div class="p-2">Ngày đặt  : 20/11/2021</div>
                            <div class="d-flex">
                                <div class="p-2"><span class="badge badge-warning">Chờ xác nhận</span></div>
                                <div class="p-2"><a href="#"><span class="badge badge-danger">Hủy</span></a></div>
                            </div>
                        </div>
                        <div>
                        </div>
                    </div>
                    <div class="flex-item">
                        <div class="d-flex flex-column">
                            <div class="p-2">Sân : 3-A</div>
                            <div class="p-2">Thời gian : 8:00-10:00</div>
                            <div class="p-2">Ngày đặt  : 20/11/2021</div>
                            <div class="d-flex">
                                <div class="p-2"><span class="badge badge-success">Đã xác nhận</span></div>
                                <div class="p-2"><a hidden="hidden" href="#"><span class="badge badge-danger">Hủy</span></a></div>
                            </div>
                        </div>
                        <div>
                        </div>
                    </div>
                    <div class="flex-item">
                        <div class="d-flex flex-column">
                            <div class="p-2">Sân : 3-A</div>
                            <div class="p-2">Thời gian : 8:00-10:00</div>
                            <div class="p-2">Ngày đặt  : 20/11/2021</div>
                            <div class="d-flex">
                                <div class="p-2"><span class="badge badge-secondary">Đã hủy</span></div>
                                <div class="p-2"><a hidden="hidden" href="#"><span class="badge badge-danger">Hủy</span></a></div>
                            </div>
                        </div>
                        <div>
                        </div>
                    </div>
                    <div class="flex-item">
                        <div class="d-flex flex-column">
                            <div class="p-2">Sân : 3-A</div>
                            <div class="p-2">Thời gian : 8:00-10:00</div>
                            <div class="p-2">Ngày đặt  : 20/11/2021</div>
                            <div class="d-flex">
                                <div class="p-2"><span class="badge badge-warning">Chờ xác nhận</span></div>
                                <div class="p-2"><a href="#"><span class="badge badge-danger">Hủy</span></a></div>
                            </div>
                        </div>
                        <div>
                        </div>
                    </div>
                    <div class="flex-item">
                        <div class="d-flex flex-column">
                            <div class="p-2">Sân : 3-A</div>
                            <div class="p-2">Thời gian : 8:00-10:00</div>
                            <div class="p-2">Ngày đặt  : 20/11/2021</div>
                            <div class="d-flex">
                                <div class="p-2"><span class="badge badge-secondary">Đã hủy</span></div>
                                <div class="p-2"><a hidden="hidden" href="#"><span class="badge badge-danger">Hủy</span></a></div>
                            </div>
                        </div>
                        <div>
                        </div>
                    </div>
                    <div class="flex-item">
                        <div class="d-flex flex-column">
                            <div class="p-2">Sân : 3-A</div>
                            <div class="p-2">Thời gian : 8:00-10:00</div>
                            <div class="p-2">Ngày đặt  : 20/11/2021</div>
                            <div class="d-flex">
                                <div class="p-2"><span class="badge badge-warning">Chờ xác nhận</span></div>
                                <div class="p-2"><a href="#"><span class="badge badge-danger">Hủy</span></a></div>
                            </div>
                        </div>
                        <div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <div id="qlttcn">
            <div class="khoangcach">
                <h1>THÔNG TIN CÁ NHÂN</h1>
                <div class="d-flex justify-content-center">
                    <section class="xn" style="padding: 20px 30px;">
                        <div class="d-flex flex-column">
                            <div class="p-2">
                                <div class="d-flex flex-row">
                                    <div class="p-2">
                                        <img style="margin-bottom: 30px; margin-right: 20px; width: 10rem; height: 10rem;" src="images/tt.jpg" alt="">
                                    </div>
                                    <div class="p-2">
                                        <div class="d-flex flex-column">
                                            <div class="p-2">
                                                <p>id: 1</p>
                                            </div>
                                            <div class="p-2">
                                                <p>Tên tài khoản : haubui0812 </p>
                                            </div>
                                            <div class="p-2">
                                                <p>CMND/CCCD : 252252252 </p>
                                            </div>
                                            <div class="p-2">
                                                <p>Họ và Tên: Bùi Văn Hậu</p>
                                            </div>
                                            <div class="p-2">
                                                <p>Số điện thoại: 0905088055</p>
                                            </div>
                                            <div class="p-2">
                                                <p>Địa chỉ : 42 Nguyễn Lương Bằng </p>
                                            </div>
                                            <div class="p-2">
                                                <p>Trạng thái  : Đã kích hoạt </p>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>

                            <div class="p-2">
                                <div class="d-flex flex-row-reverse">
                                    <div class="p-2">
                                        <button class="btn btn-secondary" style="font-size: 1rem; border-radius: 20px;"><i class="fa-solid fa-pen-to-square"></i></button>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </section>
                </div>
            </div>
        </div>
        <div id="xndsc">
            <div class="khoangcach">
                <h1>Xán nhận đơn đặt sân</h1>
                <div class="d-flex flex-wrap ">
                    <div class="flex-item">
                        <div class="d-flex flex-column">
                            <div class="p-2">Sân : 3-A</div>
                            <div class="p-2">Thời gian : 8:00-10:00</div>
                            <div class="p-2">Người đặt : vanhau0812</div>
                            <div class="p-2">Ngày đặt  : 20/11/2021</div>
                            <div class="d-flex flex-row-reverse">
                                <div class="p-2"><a href="#"><span class="badge badge-danger">Hủy</span></a></div>
                                <div class="p-2"><a href="#"><span class="badge badge-success">Xác nhận</span></a></div>
                            </div>
                        </div>
                        <div>
                        </div>
                    </div>
                    <div class="flex-item">
                        <div class="d-flex flex-column">
                            <div class="p-2">Sân : 3-A</div>
                            <div class="p-2">Thời gian : 8:00-10:00</div>
                            <div class="p-2">Người đặt : vanhau0812</div>
                            <div class="p-2">Ngày đặt  : 20/11/2021</div>
                            <div class="d-flex flex-row-reverse">
                                <div class="p-2"><a href="#"><span class="badge badge-danger">Hủy</span></a></div>
                                <div class="p-2"><a href="#"><span class="badge badge-success">Xác nhận</span></a></div>
                            </div>
                        </div>
                        <div>
                        </div>
                    </div>
                    <div class="flex-item">
                        <div class="d-flex flex-column">
                            <div class="p-2">Sân : 3-A</div>
                            <div class="p-2">Thời gian : 8:00-10:00</div>
                            <div class="p-2">Người đặt : vanhau0812</div>
                            <div class="p-2">Ngày đặt  : 20/11/2021</div>
                            <div class="d-flex flex-row-reverse">
                                <div class="p-2"><a href="#"><span class="badge badge-danger">Hủy</span></a></div>
                                <div class="p-2"><a href="#"><span class="badge badge-success">Xác nhận</span></a></div>
                            </div>
                        </div>
                        <div>
                        </div>
                    </div>
                    <div class="flex-item">
                        <div class="d-flex flex-column">
                            <div class="p-2">Sân : 3-A</div>
                            <div class="p-2">Thời gian : 8:00-10:00</div>
                            <div class="p-2">Người đặt : vanhau0812</div>
                            <div class="p-2">Ngày đặt  : 20/11/2021</div>
                            <div class="d-flex flex-row-reverse">
                                <div class="p-2"><a href="#"><span class="badge badge-danger">Hủy</span></a></div>
                                <div class="p-2"><a href="#"><span class="badge badge-success">Xác nhận</span></a></div>
                            </div>
                        </div>
                        <div>
                        </div>
                    </div>
                    <div class="flex-item">
                        <div class="d-flex flex-column">
                            <div class="p-2">Sân : 3-A</div>
                            <div class="p-2">Thời gian : 8:00-10:00</div>
                            <div class="p-2">Người đặt : vanhau0812</div>
                            <div class="p-2">Ngày đặt  : 20/11/2021</div>
                            <div class="d-flex flex-row-reverse">
                                <div class="p-2"><a href="#"><span class="badge badge-danger">Hủy</span></a></div>
                                <div class="p-2"><a href="#"><span class="badge badge-success">Xác nhận</span></a></div>
                            </div>
                        </div>
                        <div>
                        </div>
                    </div>
                    <div class="flex-item">
                        <div class="d-flex flex-column">
                            <div class="p-2">Sân : 3-A</div>
                            <div class="p-2">Thời gian : 8:00-10:00</div>
                            <div class="p-2">Người đặt : vanhau0812</div>
                            <div class="p-2">Ngày đặt  : 20/11/2021</div>
                            <div class="d-flex flex-row-reverse">
                                <div class="p-2"><a href="#"><span class="badge badge-danger">Hủy</span></a></div>
                                <div class="p-2"><a href="#"><span class="badge badge-success">Xác nhận</span></a></div>
                            </div>
                        </div>
                        <div>
                        </div>
                    </div>
                    <div class="flex-item">
                        <div class="d-flex flex-column">
                            <div class="p-2">Sân : 3-A</div>
                            <div class="p-2">Thời gian : 8:00-10:00</div>
                            <div class="p-2">Người đặt : vanhau0812</div>
                            <div class="p-2">Ngày đặt  : 20/11/2021</div>
                            <div class="d-flex flex-row-reverse">
                                <div class="p-2"><a href="#"><span class="badge badge-danger">Hủy</span></a></div>
                                <div class="p-2"><a href="#"><span class="badge badge-success">Xác nhận</span></a></div>
                            </div>
                        </div>
                        <div>
                        </div>
                    </div>
                    <div class="flex-item">
                        <div class="d-flex flex-column">
                            <div class="p-2">Sân : 3-A</div>
                            <div class="p-2">Thời gian : 8:00-10:00</div>
                            <div class="p-2">Người đặt : vanhau0812</div>
                            <div class="p-2">Ngày đặt  : 20/11/2021</div>
                            <div class="d-flex flex-row-reverse">
                                <div class="p-2"><a href="#"><span class="badge badge-danger">Hủy</span></a></div>
                                <div class="p-2"><a href="#"><span class="badge badge-success">Xác nhận</span></a></div>
                            </div>
                        </div>
                        <div>
                        </div>
                    </div>
                    <div class="flex-item">
                        <div class="d-flex flex-column">
                            <div class="p-2">Sân : 3-A</div>
                            <div class="p-2">Thời gian : 8:00-10:00</div>
                            <div class="p-2">Người đặt : vanhau0812</div>
                            <div class="p-2">Ngày đặt  : 20/11/2021</div>
                            <div class="d-flex flex-row-reverse">
                                <div class="p-2"><a href="#"><span class="badge badge-danger">Hủy</span></a></div>
                                <div class="p-2"><a href="#"><span class="badge badge-success">Xác nhận</span></a></div>
                            </div>
                        </div>
                        <div>
                        </div>
                    </div>
                    <div class="flex-item">
                        <div class="d-flex flex-column">
                            <div class="p-2">Sân : 3-A</div>
                            <div class="p-2">Thời gian : 8:00-10:00</div>
                            <div class="p-2">Người đặt : vanhau0812</div>
                            <div class="p-2">Ngày đặt  : 20/11/2021</div>
                            <div class="d-flex flex-row-reverse">
                                <div class="p-2"><a href="#"><span class="badge badge-danger">Hủy</span></a></div>
                                <div class="p-2"><a href="#"><span class="badge badge-success">Xác nhận</span></a></div>
                            </div>
                        </div>
                        <div>
                        </div>
                    </div>

                </div>
            </div>

        </div>
        <div id="qldsc">
            <div class="khoangcach">
                <h1>Quản lý giao dịch</h1>
                <div style="margin-top: 50px;">
                    <div class="d-flex flex-column">
                        <div class="p-2">
                            <table class="table table-dark">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Mã sân</th>
                                        <th scope="col">Tài khoản</th>
                                        <th scope="col">Thời gian</th>
                                        <th scope="col">Giá tiền</th>
                                        <th scope="col">Ngày đặt</th>
                                        <th scope="col">Trạng thái</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">1</th>
                                        <td>3-A</td>
                                        <td>haubui0812</td>
                                        <td>08:00-10:00</td>
                                        <td>100000000</td>
                                        <td>20/11/2021</td>
                                        <td>Chờ xác nhận</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">2</th>
                                        <td>3-A</td>
                                        <td>haubui0812</td>
                                        <td>08:00-10:00</td>
                                        <td>100000000</td>
                                        <td>20/11/2021</td>
                                        <td>Đã xác nhận</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">3</th>
                                        <td>3-A</td>
                                        <td>haubui0812</td>
                                        <td>08:00-10:00</td>
                                        <td>100000000</td>
                                        <td>20/11/2021</td>
                                        <td>Đã Hủy</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">4</th>
                                        <td>3-A</td>
                                        <td>haubui0812</td>
                                        <td>08:00-10:00</td>
                                        <td>100000000</td>
                                        <td>20/11/2021</td>
                                        <td>Chờ xác nhận</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">5</th>
                                        <td>3-A</td>
                                        <td>haubui0812</td>
                                        <td>08:00-10:00</td>
                                        <td>100000000</td>
                                        <td>20/11/2021</td>
                                        <td>Đã xác nhận</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="p-2">
                            <div class="d-flex flex-row-reverse"><a class="alert alert-warning" style="text-decoration: none" href="#xndsc">Đến trang xác nhận đơn</a></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>--%>
    </div>
</asp:Content>

