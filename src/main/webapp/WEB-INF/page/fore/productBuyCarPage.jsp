<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/header.jsp" %>
<head>
    <script src="${pageContext.request.contextPath}/res/js/fore/fore_productBuyCar.js"></script>
    <link href="${pageContext.request.contextPath}/res/css/fore/fore_productBuyCarPage.css" rel="stylesheet"/>
    <title>Tmall.com - Shopping Cart</title>
    <script>
        $(function () {
            $('#btn-ok').click(function () {
                $.ajax({
                    url: "${pageContext.request.contextPath}/orderItem/" + $("#order_id_hidden").val(),
                    type: "DELETE",
                    data: null,
                    dataType: "json",
                    success: function (data) {
                        if (data.success !== true) {
                            alert("Exception occurred while removing items from the shopping cart. Please try again later!");
                        }
                        location.href = "/tmall/cart";
                    },
                    beforeSend: function () {

                    },
                    error: function () {
                        alert("Exception occurred while removing products from the shopping cart. Please try again later!");
                        location.href = "/tmall/cart";
                    }
                });
            });
        });

        function removeItem(orderItem_id) {
            if (isNaN(orderItem_id) || orderItem_id === null) {
                return;
            }
            $("#order_id_hidden").val(orderItem_id);
            $('#modalDiv').modal();
        }
    </script>
</head>
<body>
<nav>
    <%@ include file="include/navigator.jsp" %>
    <div class="header">
        <div id="mallLogo">
            <a href="${pageContext.request.contextPath}"><img
                    src="${pageContext.request.contextPath}/res/images/fore/WebsiteImage/tmallLogoA.png"><span
                    class="span_tmallBuyCar">Shopping Cart</span></a>
        </div>
        <div class="shopSearchHeader">
            <form action="${pageContext.request.contextPath}/product" method="get">
                <div class="shopSearchInput">
                    <input type="text" class="searchInput" name="product_name" placeholder="Search Tmall Products/Brands/Shops"
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
    <c:choose>
        <c:when test="${fn:length(requestScope.orderItemList)<=0}">
            <div id="crumbs">
                <span class="cart-tip">The shopping cart helps you complete batch purchases and payments at once, making ordering more convenient and payment simpler! <a
                        href="http://service.taobao.com/support/help-11746.htm?spm=a1z0d.1.0.0.ogEwpx" target="_blank">How to use the shopping cart</a></span>
            </div>
            <div id="empty">
                <h2>Your shopping cart is still empty, take action now! You can:</h2>
                <ul>
                    <li>看看<a href="${pageContext.request.contextPath}/order">Items You've Purchased</a></li>
                </ul>
            </div>
        </c:when>
        <c:otherwise>
            <div id="J_FilterBar">
                <ul id="J_CartSwitch">
                    <li>
                        <a href="${pageContext.request.contextPath}/cart" class="J_MakePoint">
                            <em>All Products</em>
                            <span class="number">${requestScope.orderItemTotal}</span>
                        </a>
                    </li>
                </ul>
                <div class="cart-sum">
                    <span class="pay-text">Selected items (excluding shipping costs)</span>
                    <strong class="price"><em id="J_SmallTotal"><span
                            class="total-symbol">&nbsp;</span>0.00</em></strong>
                    <a id="J_SmallSubmit" class="submit-btn submit-btn-disabled">Checkout</a>
                </div>
                <div class="wrap-line">
                    <div class="floater"></div>
                </div>
            </div>
            <table id="J_CartMain">
                <thead>
                <tr>
                    <th class="selectAll_th"><input type="checkbox" class="cbx_select" id="cbx_select_all"><label
                            for="cbx_select_all">Select All</label></th>
                    <th width="474px" class="productInfo_th"><span>Product Information</span></th>
                    <th width="120px"><span>Unit Price</span></th>
                    <th width="120px"><span>Quantity</span></th>
                    <th width="120px"><span>Amount</span></th>
                    <th width="84px"><span>Operation</span></th>
                    <th hidden>ID</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${requestScope.orderItemList}" var="orderItem">
                    <tr class="orderItem_category">
                        <td colspan="6"><span class="shop_logo"></span><span
                                class="category_shop">Shop: 贤趣${orderItem.productOrderItem_product.product_category.category_name}旗舰店</span>
                        </td>
                    </tr>
                    <tr class="orderItem_info">
                        <td class="tbody_checkbox"><input type="checkbox" class="cbx_select"
                                                          id="cbx_orderItem_select_${orderItem.productOrderItem_id}"
                                                          name="orderItem_id"><label
                                for="cbx_orderItem_select_${orderItem.productOrderItem_id}"></label></td>
                        <td><img class="orderItem_product_image"
                                 src="${pageContext.request.contextPath}/res/images/item/productSinglePicture/${orderItem.productOrderItem_product.singleProductImageList[0].productImage_src}"
                                 style="width: 80px;height: 80px;"/><span class="orderItem_product_name"><a
                                href="${pageContext.request.contextPath}/product/${orderItem.productOrderItem_product.product_id}">${orderItem.productOrderItem_product.product_name}</a></span>
                        </td>
                        <td><span
                                class="orderItem_product_price">￥${orderItem.productOrderItem_price/orderItem.productOrderItem_number}</span>
                        </td>
                        <td>
                            <div class="item_amount">
                                <a href="javascript:void(0)" onclick="up(this)"
                                   class="J_Minus <c:if test="${orderItem.productOrderItem_number<=1}">no_minus</c:if>">-</a>
                                <input type="text" value="${orderItem.productOrderItem_number}"/>
                                <a href="javascript:void(0)" onclick="down(this)" class="J_Plus">+</a>
                            </div>
                        </td>
                        <td>
                            <span class="orderItem_product_realPrice">￥${orderItem.productOrderItem_price}</span>
                        </td>
                        <td><a href="javascript:void(0)" onclick="removeItem('${orderItem.productOrderItem_id}')"
                               class="remove_order">Remove</a></td>
                        <td>
                            <input type="hidden" class="input_orderItem" name="${orderItem.productOrderItem_id}"/>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div id="J_FloatBar">
                <div id="J_SelectAll2">
                    <div class="cart_checkbox">
                        <input class="J_checkboxShop" id="J_SelectAllCbx2" type="checkbox" value="true"/>
                        <label for="J_SelectAllCbx2" title="Select all items in the shopping cart"></label>
                    </div>
                    <span class="span_selectAll">&nbsp;Select All</span>
                </div>
                <div class="operations">
                    <a href="javascript:void(0)" onclick="remove()">Remove</a>
                </div>
                <div class="float-bar-right">
                    <div id="J_ShowSelectedItems">
                        <span class="txt">Selected Items</span>
                        <em id="J_SelectedItemsCount">0</em>
                        <span class="txt">pieces</span>
                    </div>
                    <div class="price_sum">
                        <span class="txt">Total (excluding shipping costs):</span>
                        <strong class="price">
                            <em id="J_Total">
                                <span class="total_symbol">&nbsp;  ￥</span>
                                <span class="total_value"> 0.00</span>
                            </em>
                        </strong>
                    </div>
                    <div class="btn_area">
                        <a href="javascript:void(0)" id="J_Go" onclick="create(this)">
                            <span>Checkout</span>
                        </a>
                    </div>
                </div>
            </div>
        </c:otherwise>
    </c:choose>
</div>
<%-- 模态框 --%>
<div class="modal fade" id="modalDiv" tabindex="-1" role="dialog" aria-labelledby="modalDiv" aria-hidden="true"
     data-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">Prompt</h4>
            </div>
            <div class="modal-body">Are you sure you want to remove this item?</div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-primary" id="btn-ok">OK</button>
                <button type="button" class="btn btn-default" data-dismiss="modal" id="btn-close">Close</button>
                <input type="hidden" id="order_id_hidden">
            </div>
        </div>
        <%-- /.modal-content --%>
    </div>
    <%-- /.modal --%>
</div>
<%@include file="include/footer_two.jsp" %>
<%@include file="include/footer.jsp" %>
</body>
