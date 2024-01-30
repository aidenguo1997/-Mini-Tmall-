<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/header.jsp" %>
<head>
    <link href="${pageContext.request.contextPath}/res/css/fore/fore_orderConfirmPage.css" rel="stylesheet"/>
    <title>Order Confirmation - Tmall.com - Ideal Life on Tmall</title>
    <script>

    </script>
</head>
<body>
<nav>
    <%@ include file="include/navigator.jsp" %>
</nav>
<div class="header">
    <div id="mallLogo">
        <a href="${pageContext.request.contextPath}"><img
                src="${pageContext.request.contextPath}/res/images/fore/WebsiteImage/tmallLogoA.png"></a>
    </div>
    <div class="shopSearchHeader">
        <form action="${pageContext.request.contextPath}/product" method="get">
            <div class="shopSearchInput">
                <input type="text" class="searchInput" name="product_name" placeholder="Search Tmall Products/Brands/Shops"
                       maxlength="50">
                <input type="submit" value="Search" class="searchBtn">
            </div>
        </form>
    </div>
</div>
<div class="headerLayout">
    <div class="headerContext">
        <ol class="header-extra">
            <li class="step-done">
                <div class="step-name">Place Order</div>
                <div class="step-no_first"></div>
                <div class="step-time">
                    <div class="step-time-wraper">${productOrder.productOrder_pay_date}</div>
                </div>
            </li>
            <li class="step-done">
                <div class="step-name">Payment to Alipay</div>
                <div class="step-no step-no-select"></div>
                <div class="step-time">
                    <div class="step-time-wraper">${productOrder.productOrder_pay_date}</div>
                </div>
            </li>
            <li class="step-done">
                <div class="step-name">Seller Ships</div>
                <div class="step-no step-no-select"></div>
                <div class="step-time">
                    <div class="step-time-wraper">${productOrder.productOrder_delivery_date}</div>
                </div>
            </li>
            <li class="step-no">
                <div class="step-name">Confirm Receipt</div>
                <div class="step-no">4</div>
            </li>
            <li class="step-no">
                <div class="step-name">Review</div>
                <div class="step-no_last">5</div>
            </li>
        </ol>
    </div>
</div>
<div class="content">
    <h1>I have received the goods and agree to pay with Alipay</h1>
    <div class="order_info">
        <h2>Confirm Order Information</h2>
        <table class="table_order_orderItem">
            <thead>
            <tr>
                <th>Shop Items</th>
                <th>Unit Price</th>
                <th>Quantity</th>
                <th>Subtotal</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${requestScope.productOrder.productOrderItemList}" var="orderItem" varStatus="i">
                <tr class="tr_product_info">
                    <td width="500px"><img
                            src="${pageContext.request.contextPath}/res/images/item/productSinglePicture/${orderItem.productOrderItem_product.singleProductImageList[0].productImage_src}"
                            style="width: 50px;height: 50px;"/><span class="span_product_name"><a
                            href="${pageContext.request.contextPath}/product/${orderItem.productOrderItem_product.product_id}"
                            target="_blank">${orderItem.productOrderItem_product.product_name}</a></span>
                    </td>
                    <td><span
                            class="span_product_sale_price">${orderItem.productOrderItem_product.product_sale_price}0</span>
                    </td>
                    <td><span class="span_productOrderItem_number">${orderItem.productOrderItem_number}</span></td>
                    <td><span class="span_productOrderItem_price"
                              style="font-weight: bold">${orderItem.productOrderItem_price}0</span></td>
                </tr>
            </c:forEach>
            <tr class="order-ft">
                <td colspan="4">
                    <div class="total-price">Total Paid: ¥<strong>${requestScope.orderTotalPrice}0</strong></div>
                </td>
            </tr>
            </tbody>
            <tbody class="misc-info">
            <tr class="set-row">
                <td colspan="4"></td>
            </tr>
            <tr>
                <td colspan="4">
                    <span class="info_label">Order Number:</span>
                    <span class="info_value">${requestScope.productOrder.productOrder_code}</span>
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    <span class="info_label">Seller Shop Nickname:</span>
                    <span class="info_value">贤趣模拟旗舰店</span>
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    <span class="info_label">Transaction Time:</span>
                    <span class="info_value">${requestScope.productOrder.productOrder_pay_date}</span>
                </td>
            </tr>
            </tbody>
        </table>
        <div class="order-dashboard">
            <div class="bd">
                <ul>
<%--                    <li>请收到货后，再确认收货！否则您可能钱货两空！</li>--%>
                    <li>Note: This system does not conduct real transactions. Please feel free to test.</li>
                </ul>
                <script>
                    function confirmOrder() {
                        <%--var yn = confirm("点击确认后，您之前付款到支付宝的 ${requestScope.orderTotalPrice}0 元将直接到卖家账户里，请务必收到货再确认！");--%>
                        var yn = confirm("After clicking confirm, your order process is complete. You can proceed with product reviews and delivery reminders later.");
                        if (yn) {
                            $.ajax({
                                url: "/tmall/order/success/${requestScope.productOrder.productOrder_code}",
                                type: "PUT",
                                data: null,
                                dataType: "json",
                                success: function (data) {
                                    if (data.success) {
                                        location.href = "/tmall/order/success/${requestScope.productOrder.productOrder_code}";
                                    } else {
                                        alert("Order confirmation exception. Please try again later!");
                                        location.href = "/tmall/order/0/10";
                                    }
                                },
                                error: function (data) {
                                    alert("Order confirmation exception. Please try again later!");
                                    location.href = "/tmall/order/0/10";
                                }
                            });
                        }
                    }
                </script>
                <a href="javascript:void(0)" onclick="confirmOrder()">Confirm</a>
            </div>
        </div>
    </div>
</div>
<%@include file="include/footer_two.jsp" %>
<%@include file="include/footer.jsp" %>
</body>
