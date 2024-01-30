<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/header.jsp" %>
<head>
    <script src="${pageContext.request.contextPath}/res/js/fore/fore_login.js"></script>
    <link href="${pageContext.request.contextPath}/res/css/fore/fore_login.css" rel="stylesheet">
    <style rel="stylesheet">
        #baseNavigator {
            padding: 22px 0;
            width: 1190px;
            height: 44px;
            margin: auto;
        }

        #baseNavigator img {
            width: 190px;
            margin-top: 8px;
        }

        #nav {
            width: auto;
            height: 32px;
            font-family: "Arial", Tahoma, sans-serif;
            font-size: 12px;
            position: relative !important;
            background: #f2f2f2;
            z-index: 999;
            border-bottom: 1px solid #e5e5e5;
        }
    </style>
    <title>Tmall - Login</title>
</head>
<body>
<nav id="baseNavigator">
    <a href="${pageContext.request.contextPath}" target="_self">
        <img src="${pageContext.request.contextPath}/res/images/fore/WebsiteImage/tmallLogoA.png"/>
    </a>
</nav>
<div class="content">
    <div class="contentMain"></div>
    <div class="loginDiv">
        <div class="loginSwitch" id="loginSwitch"></div>
        <div class="loginMessage">
            <div class="loginMessageMain">
                <div class="poptip-arrow"><em></em><span></span></div>
                <img src="${pageContext.request.contextPath}/res/images/fore/WebsiteImage/scan-safe.png"/><span>Scan for login</span>
            </div>
        </div>
        <div class="pwdLogin">
            <span class="loginTitle">Password Login</span>
            <form method="post" class="loginForm">
                <div class="loginInputDiv">
                    <label for="name" class="loginLabel"><img
                            src="${pageContext.request.contextPath}/res/images/fore/WebsiteImage/2018-04-27_235518.png"
                            width="38px" height="39px" title="Username"/></label>
                    <input type="text" name="name" id="name" class="loginInput" placeholder="Username/Email/Mobile Number">
                </div>
                <div class="loginInputDiv">
                    <label for="password" class="loginLabel"><img
                            src="${pageContext.request.contextPath}/res/images/fore/WebsiteImage/2018-04-27_235533.png"
                            width="38px" height="39px" title="Login Password"/></label>
                    <input type="password" name="password" id="password" class="loginInput">
                </div>
                <input type="submit" class="loginButton" value="Login">
            </form>
            <div class="loginLinks">
                <a href="#">Forgot Password</a>
                <a href="#">Forgot Username</a>
                <a href="${pageContext.request.contextPath}/register">Register</a>
            </div>
            <div class="error_message">
                <p id="error_message_p"></p>
            </div>
        </div>
        <div class="qrcodeLogin">
            <span class="loginTitle">Mobile Scan, Secure Login</span>
            <div class="qrcodeMain">
                <img src="${pageContext.request.contextPath}/res/images/fore/WebsiteImage/login_qrcode.png"
                     id="qrcodeA"/>
                <img src="${pageContext.request.contextPath}/res/images/fore/WebsiteImage/login_qrcodeB.png"
                     id="qrcodeB"/>
            </div>
            <div class="qrcodeFooter">
                <img src="${pageContext.request.contextPath}/res/images/fore/WebsiteImage/scan_icon2.png">
                <p>Open <a href="https://www.tmall.com/wow/portal/act/app-download">Mobile Tmall</a> | <a
                        href="https://www.taobao.com/m">Mobile Taobao</a> scan to login</p>
            </div>
            <div class="loginLinks">
                <a href="JavaScript:void(0)" id="pwdLogin">Password Login</a>
                <a href="#">Register</a>
            </div>
        </div>
    </div>
</div>
<%@ include file="include/footer.jsp" %>
<link href="${pageContext.request.contextPath}/res/css/fore/fore_foot_special.css" rel="stylesheet"/>
</body>
