<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/header.jsp" %>
<head>
    <script src="${pageContext.request.contextPath}/res/js/fore/fore_register.js"></script>
    <link href="${pageContext.request.contextPath}/res/css/fore/fore_register.css" rel="stylesheet">
    <title>Tmall.com - Online Registration</title>
    <script>
        $(function () {
            $("span.address_province").text($("#select_order_address_province").find("option:selected").text());
            $("span.address_city").text($("#select_order_address_city").find("option:selected").text());
            $("span.address_district").text($("#select_order_address_district").find("option:selected").text());
        })
    </script>
    <style rel="stylesheet">
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
</head>
<body>
<nav>
    <div class="header">
        <div id="mallLogo">
            <a href="${pageContext.request.contextPath}"><img
                    src="${pageContext.request.contextPath}/res/images/fore/WebsiteImage/tmallLogoA.png"><span
                    class="span_tmallRegister">User Registration</span></a>
        </div>
    </div>
</nav>
<div class="content">
    <div class="steps">
        <div class="steps_main">
            <span class="steps_tsl">Fill in Account Information</span>
        </div>
    </div>
    <div class="form-list">
        <div class="form-item">
            <label class="form-label form-label-b tsls">Set Username</label>
        </div>
        <div class="form-item">
            <label class="form-label tsl">Username：</label>
            <input name="user_name" id="user_name" class="form-text err-input" placeholder="Enter your username" maxlength="20">
            <span class="form_span"></span>
        </div>
        <div class="form-item">
            <label class="form-label form-label-b tsls">Set Login Password</label>
            <label class="form-label tsl">Authenticate during login to protect account information</label>
        </div>
        <div class="form-item">
            <label class="form-label tsl">Login Password:</label>
            <input name="user_password" type="password" id="user_password" class="form-text err-input"
                   placeholder="Set your login password" maxlength="20">
            <span class="form_span"></span>
        </div>
        <div class="form-item">
            <label class="form-label tsl">Confirm Password:</label>
            <input name="user_password_one" type="password" id="user_password_one" class="form-text err-input"
                   placeholder="Please enter your password again" maxlength="20">
            <span class="form_span"></span>
        </div>
        <div class="form-item">
            <label class="form-label form-label-b tsls">Fill in Basic Information</label>
        </div>
        <div class="form-item">
            <label class="form-label tsl">Nickname:</label>
            <input name="user_nickname" id="user_nickname" class="form-text err-input" placeholder="Enter your nickname"
                   maxlength="20">
            <span class="form_span"></span>
        </div>
        <div class="form-item">
            <label class="form-label tsl">Gender：</label>
            <input name="user_gender" type="radio" id="form_radion" value="0" checked="checked">Male
            <input name="user_gender" type="radio" id="form_radios" value="1">Female
        </div>
        <div class="form-item">
            <label class="form-label tsl">Date of Birth:</label>
            <input type="date" name="user_birthday" id="user_birthday" class="form-text err-input"/>
            <span class="form_span"></span>
        </div>
        <div class="form-item">
            <label class="form-label tsl">Residential Address:</label>
            <select class="selectpicker" id="select_user_address_province" data-size="8" data-live-search="true">
                <c:forEach items="${requestScope.addressList}" var="address" varStatus="i">
                    <option value="${address.address_areaId}"
                            <c:if test="${requestScope.addressId==address.address_areaId}">selected</c:if>>${address.address_name}</option>
                </c:forEach>
            </select>
            <select class="selectpicker" id="select_user_address_city" data-size="8" data-live-search="true">
                <c:forEach items="${requestScope.cityList}" var="address" varStatus="i">
                    <option value="${address.address_areaId}"
                            <c:if test="${requestScope.cityAddressId==address.address_areaId}">selected</c:if>>${address.address_name}</option>
                </c:forEach>
            </select>
            <select name="user_address" class="selectpicker" id="select_user_address_district" data-size="8"
                    data-live-search="true">
                <c:forEach items="${requestScope.districtList}" var="address" varStatus="i">
                    <option value="${address.address_areaId}"
                            <c:if test="${requestScope.districtAddressId==address.address_areaId}">selected</c:if>>${address.address_name}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-item">
            <input type="button" id="register_sub" class="btns btn-large tsl" value="Register"/>
        </div>
    </div>
</div>
<%@include file="include/footer.jsp" %>
<link href="${pageContext.request.contextPath}/res/css/fore/fore_foot_special.css" rel="stylesheet"/>
<div class="msg">
    <span>注册成功，跳转到登陆页面</span>
</div>
</body>

