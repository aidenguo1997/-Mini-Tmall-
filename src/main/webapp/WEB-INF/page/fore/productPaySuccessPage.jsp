<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/header.jsp" %>
<head>
    <link href="${pageContext.request.contextPath}/res/css/fore/fore_orderPaySuccess.css" rel="stylesheet"/>
    <title>Tmall - Online Payment</title>
</head>
<body>
<nav>
    <%@ include file="include/navigator.jsp" %>
    <div class="header">
        <div id="mallLogo">
            <a href="${pageContext.request.contextPath}"><img
                    src="${pageContext.request.contextPath}/res/images/fore/WebsiteImage/tmallLogoA.png"></a>
        </div>
        <div class="shopSearchHeader">
            <form action="${pageContext.request.contextPath}/product" method="get">
                <div class="shopSearchInput">
                    <input type="text" class="searchInput" name="product_name" placeholder="Search Tmall Products/Brands/Stores"
                           value="${requestScope.searchValue}" maxlength="50">
                    <input type="submit" value="Search" class="searchBtn">
                </div>
            </form>
            <ul>
                <c:forEach items="${requestScope.categoryList}" var="category" varStatus="i">
                    <li>
                        <a href="${pageContext.request.contextPath}/product?category_id=${category.category_id}">${category.category_name}</a>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
</nav>
<div class="content">
    <div class="content_main">
        <div id="J_AmountList">
            <h2>You have successfully made the payment</h2>
            <div class="summary_pay_done">
                <ul>
                    <li>
                        Shipping Address: <span>${requestScope.productOrder.productOrder_detail_address} ${requestScope.productOrder.productOrder_receiver} ${requestScope.productOrder.productOrder_mobile}</span>
                    </li>
                    <li>Total Payment: <span><em>￥${requestScope.orderTotalPrice}</em></span></li>
                </ul>
            </div>
        </div>
        <div id="J_ButtonList">
            <span class="info">You can </span>
            <a class="J_MakePoint" href="${pageContext.request.contextPath}/order/0/10">view purchased items</a>
        </div>
        <div id="J_RemindList">
            <ul>
                <li class="alertLi">
                    <p>
                        <strong>Safety Reminder:</strong>
                        <span class="info">After placing an order, </span>
                        <span class="warn">any links sent to you via QQ for refund processing are scams.</span>
                        <span class="info"> Tmall does not have system upgrades, order issues, etc. Be cautious of fraudulent customer service calls!</span>
                    </p>
                </li>
            </ul>
        </div>
        <div id="J_Qrcode">
            <div class="mui-tm">
                <a target="_blank" href="http://pages.tmall.com/wow/portal/act/app-download">
                    <img class="type2-info"
                         src="${pageContext.request.contextPath}/res/images/fore/WebsiteImage/TB1c1dwRFXXXXaMapXXXXXXXXXX-259-81.png"/>
                    <img class="type2-qrcode"
                         src="${pageContext.request.contextPath}/res/images/fore/WebsiteImage/TB1A2aISXXXXXX4XXXXwu0bFXXX.png"/>
                </a>
            </div>
        </div>
    </div>
</div>
<%@include file="include/footer_two.jsp" %>
<%@include file="include/footer.jsp" %>
</body>