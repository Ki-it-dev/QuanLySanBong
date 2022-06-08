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
        <div id="index">
        <div class="container-fluid" style="padding-top: 8%;">
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
                                        <div class="form-outline mb-2">
                                            <input type="text" id="registerName" runat="server" class="form-control" />
                                            <label class="form-label" for="registerName">Full name</label>
                                        </div>
                                        <!-- Email input -->
                                        <div class="form-outline mb-2">
                                            <input type="email" id="registerEmail" runat="server" class="form-control" />
                                            <label class="form-label" for="registerEmail">Email</label>
                                        </div>


                                        <!-- Password input -->
                                        <div class="form-outline mb-2">
                                            <input type="password" id="registerPassword" runat="server" class="form-control" />
                                            <label class="form-label" for="registerPassword">Password</label>
                                        </div>
                                        <!-- Phone numbers input -->
                                        <div class="form-outline mb-2">
                                            <input type="text" id="phoneNumbers" runat="server" class="form-control" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');" />
                                            <label class="form-label" for="phoneNumbers">Phone</label>
                                        </div>

                                    </div>

                                    <div class="col-md-6">
                                        <!-- Identity input -->
                                        <div class="form-outline mb-2">
                                            <input type="text" id="identity" runat="server" class="form-control" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');" />
                                            <label class="form-label" for="identity">Identity</label>
                                        </div>

                                        <!-- Username input -->
                                        <div class="form-outline mb-2">
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
    </div>

    <div style="display: none;">
        <input type="text" runat="server" id="txtCheckCMND" name="name" value="" />
        <input type="text" runat="server" id="txtCheckPhone" name="name" value="" />
        <input type="text" runat="server" id="txtCheckAccount" name="name" value="" />
    </div>

</asp:Content>

