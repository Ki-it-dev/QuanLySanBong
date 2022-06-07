<%@ Page Title="" Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="module_SanPham.aspx.cs" Inherits="web_module_module_SanPham" %>

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
                                    <div class="col-lg-2 mb-3">
                                        <div class="card">
                                            <img class="card-img-top" src="<%#Eval("picture")%>" alt="Card image cap">
                                            <div class="card-body">
                                                <div class="d-flex align-items-center flex-column" style="height: 200px;">
                                                <div class=" p-2"><h4 class="card-title"><%#Eval("clothes_name") %></h4></div>
                                                <div class="p-2"><p class="card-text"><%#Eval("clothes_description") %></p></div>
                                                <div class="mt-auto p-2"><h6><%#Eval("clothes_price","{0:0,00}") %> VNĐ</h6></div>
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
                                                <div class="p-2"><h4 class="card-title"><%#Eval("shoes_name") %></h4></div>
                                                <div class="p-2"><p class="card-text"><%#Eval("shoes_description") %></p></div>
                                                <div class="mt-auto p-2"><h6><%#Eval("shoes_price","{0:0,00}") %> VNĐ</h6></div>
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
                                                <div class="p-2"><h4 class="card-title"><%#Eval("drinks_name") %></h4></div>
                                                <div class="p-2"><p class="card-text"><%#Eval("drinks_description") %></p></div>
                                                 <div class="mt-auto p-2"><h6><%#Eval("drinks_price","{0:0,00}") %> VNĐ</h6></div>
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
        </div>
</asp:Content>

