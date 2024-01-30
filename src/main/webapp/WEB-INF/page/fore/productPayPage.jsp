<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/header.jsp" %>
<head>
    <script src="${pageContext.request.contextPath}/res/js/fore/fore_reward.js"></script>
    <link href="${pageContext.request.contextPath}/res/css/fore/fore_orderPay.css" rel="stylesheet"/>
    <title>Tmall tmall.com - Online Payment</title>
    <style type="text/css">
        .frm_label{
            cursor: pointer;
            font-size: 12px;
            font-weight: normal;
            color:#666;
            margin: 0 4px 0 0;
        }
        .frm_input{
            width: 150px;
            outline: none;
            padding: 5px;
            color:#666;
            margin: 0 20px 0 0;
            height: 20px;
            border-radius: 3px;
            border: 1px solid #e9ebef;
            font-size: 12px;
            margin-top: 10px;
        }
        .frm_input:focus{
            border: 1px solid #bbb;
        }
        .frm_btn{
            transition: background-color 0.25s ease-in;
            outline: none;
            height: 20px;
            border-radius: 5px;
            padding: 8px 18px;
            border: 0;
            color:white;
            font-size: 12px;
            background-color: #ff7874;
            margin-right: 10px;
            margin-top: 10px;
        }
        .frm_btn:hover{
            background-color: #fe5874;
        }
        .messageForm {
            width: 300px;
            margin: 0 auto;
            text-align: left;
            margin-top: 10px;
        }
        /*修改多选,单选按钮样式*/
        input[type="checkbox"]+label::before {
            content: "\a0";
            position: relative;
            bottom: 1px;
            display: inline-block;
            vertical-align: middle;
            font-size: 18px;
            width: 12px;
            height: 12px;
            margin-right: .4em;
            border: 1px solid #cccccc;
            text-indent: .15em;
            line-height: 1;
            cursor: pointer;
        }
        input[type="checkbox"]:checked + label::before {
            background-color: #ff7874;
            background-clip: content-box;
            padding: 2px;
        }
        input[type="checkbox"] {
            position: absolute;
            clip: rect(0, 0, 0, 0);
        }
    </style>
</head>
<body>
<nav>
    <%@ include file="include/navigator.jsp" %>
    <div class="header">
        <div id="mallLogo">
            <a href="${pageContext.request.contextPath}"><img
                    src="${pageContext.request.contextPath}/res/images/fore/WebsiteImage/tmallLogoA.png"></a>
        </div>
    </div>
</nav>
<div class="content">
    <div class="order_div">
        <c:choose>
            <c:when test="${fn:length(requestScope.productOrder.productOrderItemList)==1}">
                <div class="order_name">
                    <span>Tmall -- ${requestScope.productOrder.productOrderItemList[0].productOrderItem_product.product_name}</span>
                </div>
                <div class="order_shop_name">
                    <span>Seller's Nickname: Tmall ${requestScope.productOrder.productOrderItemList[0].productOrderItem_product.product_category.category_name}旗舰店</span>
                </div>
            </c:when>
            <c:otherwise>
                <div class="order_name">
                    <span>Tmall -- Combined Order: ${fn:length(requestScope.productOrder.productOrderItemList)}笔</span>
                </div>
            </c:otherwise>
        </c:choose>
        <div class="order_price">
            <span class="price_value">${requestScope.orderTotalPrice}</span>
            Yuan
            <span class="price_unit">(No actual payment will be made)</span>
        </div>
    </div>
    <div class="order_pay_div">
        <script>
            function pay() {
                $.ajax({
                    url: "${pageContext.request.contextPath}/order/pay/${requestScope.productOrder.productOrder_code}",
                    type: "PUT",
                    data: null,
                    dataType: "json",
                    success: function (data) {
                        if (data.success !== true) {
                            alert("Exception occurred while processing the order. Please try again later!");
                        }
                        location.href = "/tmall" + data.url;
                    },
                    beforeSend: function () {

                    },
                    error: function () {
                        alert("There was an issue with the order payment. Please try to pay again!");
                        location.href = "/tmall/order/0/10";
                    }
                });
            }
        </script>
        <a class="order_pay_btn" href="javascript:void(0)" onclick="pay()">Confirm Payment</a>
    </div>
    <div class="order_reward_div">
        <p class="order_reward_header">Author's Note</p>
        <br/>
        <p>Firstly, thank you for coming here.</p>
        <p>This project is a collaboration completed by me and two other friends during our free time at school, creating a demo for an online store.</p>
        <p>Both the front-end and back-end business code were independently developed, with specially designed styles for the back-end and a front-end referencing Tmall for interface development.</p>
        <p>Technology is advancing rapidly, and currently, we are using more popular front-end and back-end technology stacks to open source more high-quality projects.</p>
        <p>However, we still remember the passion and effort we put into this project.</p>
        <p>Developing at school is not easy. If this project has been helpful to you, you can reward us.</p>
        <p>After you reward, you can leave your payment nickname so that we can enter it into the reward list. We will handle your information with privacy protection and sincerely thank you.</p>
        <form method="post" class="messageForm">
            <label for="name" class="frm_label">Nickname</label>
            <input type="text" name="name" id="name" class="frm_input" maxlength="12">
            <input id="checkbox_is_anonymous" name="checkbox_is_anonymous" type="checkbox" value="0">
            <label class="frm_label" id="lbl_checkbox_is_anonymous" for="checkbox_is_anonymous">Anonymous</label>
            <br/>
            <label for="message" class="frm_label">Message</label>
            <input type="text" name="message" id="message" class="frm_input" maxlength="100">
            <input type="submit" class="frm_btn" id="reward_submit" value="Submit">
        </form>
        <br/>
        <div class="order_reward_alipay_div">
            <p class="order_reward_name" id="reward_alipay_name">Alipay</p>
            <img src="${pageContext.request.contextPath}/res/images/fore/WebsiteImage/alipay.jpg"/>
        </div>
        <div class="order_reward_weixinpay_div">
            <p class="order_reward_name" id="reward_weixin_name">WeChat</p>
            <img src="${pageContext.request.contextPath}/res/images/fore/WebsiteImage/weixinpay.png">
        </div>
    </div>
</div>
<%@include file="include/footer_two.jsp" %>
<%@include file="include/footer.jsp" %>
</body>
