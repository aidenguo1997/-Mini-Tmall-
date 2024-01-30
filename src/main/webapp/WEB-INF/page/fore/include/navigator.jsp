<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/fore/fore_nav.css"/>
<script>
    $(function () {
        $(".quick_li").find("li").hover(
            function () {
                $(this).find(".sn_menu").addClass("sn_menu_hover");
                $(this).find(".quick_menu,.quick_qrcode,.quick_DirectPromoDiv,.quick_sitmap_div").css("display", "block");
            }, function () {
                $(this).find(".sn_menu").removeClass("sn_menu_hover");
                $(this).find(".quick_menu,.quick_qrcode,.quick_DirectPromoDiv,.quick_sitmap_div").css("display", "none");
            }
        );
    });
</script>
<div id="nav">
    <div class="nav_main">
        <p id="container_login">
            <c:choose>
                <c:when test="${requestScope.user.user_name==null}">
                    <em>Hello, welcome to Tmall</em>
                    <a href="${pageContext.request.contextPath}/login">Login</a>
                    <a href="${pageContext.request.contextPath}/register">Register</a>
                </c:when>
                <c:otherwise>
                    <em>Hi，</em>
                    <a href="${pageContext.request.contextPath}/userDetails" class="userName"
                       target="_blank">${requestScope.user.user_name}</a>
                    <a href="${pageContext.request.contextPath}/login/logout">Logout</a>
                </c:otherwise>
            </c:choose>
        </p>
        <ul class="quick_li">
            <li class="quick_li_MyTaobao">
                <div class="sn_menu">
                    <a href="${pageContext.request.contextPath}/userDetails">My Taobao<b></b></a>
                    <div class="quick_menu">
                        <a href="${pageContext.request.contextPath}/order/0/10">Items I've Bought</a>
                        <a href="#">Items I've Sold</a>
                    </div>
                </div>
            </li>
            <li class="quick_li_cart">
                <img src="${pageContext.request.contextPath}/res/images/fore/WebsiteImage/buyCar.png">
                <a href="${pageContext.request.contextPath}/cart">Shopping Cart</a>
            </li>
            <li class="quick_li_menuItem">
                <div class="sn_menu">
                    <a href="#">Favorites<b></b></a>
                    <div class="quick_menu">
                        <a href="#">Favorite Items</a>
                        <a href="#">Favorite Stores</a>
                    </div>
                </div>
            </li>
            <li class="quick_li_separator"></li>
            <li class="quick_li_mobile">
                <img src="${pageContext.request.contextPath}/res/images/fore/WebsiteImage/mobile.png">
                <a href="#" title="Tmall Wireless">Mobile Version</a>
                <div class="quick_qrcode">
                    <img src="${pageContext.request.contextPath}/res/images/fore/WebsiteImage/qrcode.png">
                    <b></b>
                </div>
            </li>
            <li class="quick_home"><a href="${pageContext.request.contextPath}">TaoBao</a></li>
            <li class="quick_DirectPromo">
                <div class="sn_menu">
                    <a href="#">Merchant Support<b></b></a>
                    <div class="quick_DirectPromoDiv">
                        <ul>
                            <li>
                                <h3>Merchant:</h3>
                                <a href="">Merchant Center</a>
                                <a href="">Tmall Rules</a>
                                <a href="">Merchant Enrollment</a>
                                <a href="">Operational Services</a>
                                <a href="">Merchant Quality Control</a>
                                <a href="">Merchant Tools</a>
                                <a href="">Tmall Knowledge Hub</a>
                                <a href="">Meow Language</a>
                            </li>
                            <li>
                                <h3>Help:</h3>
                                <a href="">Help Center</a>
                                <a href="">Ask Merchant Friends</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </li>
            <li class="quick_sitemap">
                <div class="sn_menu">
                    <a>Website Navigation<b></b></a>
                    <div class="quick_sitmap_div">
                        <div class="site-hot">
                            <h2>Hot Recommendations<span>Hot</span></h2>
                            <ul>
                                <li><a href="">Tmall Supermarket</a></li>
                                <li><a href="">Meow Fresh</a></li>
                                <li><a href="">New Technology Products</a></li>
                                <li><a href="">New Women's Fashion</a></li>
                                <li><a href="">Cool Street</a></li>
                                <li><a href="">New Women's Shoes</a></li>
                                <li><a href="">Try Beauty</a></li>
                                <li><a href="">New Sports Products</a></li>
                                <li><a href="">Fashion Gentleman</a></li>
                                <li><a href="">Smart Mommy</a></li>
                                <li><a href="">Eat and Enjoy</a></li>
                                <li><a href="">Enterprise Purchases</a></li>
                                <li><a href="">Member Points</a></li>
                                <li><a href="">Tmall International</a></li>
                                <li><a href="">Quality Channel</a></li>
                            </ul>
                        </div>
                        <div class="site-market">
                            <h2>Industry Market<span>Market</span></h2>
                            <ul>
                                <li><a href="">Beauty</a></li>
                                <li><a href="">Appliances</a></li>
                                <li><a href="">Women's Clothing</a></li>
                                <li><a href="">Men's Clothing</a></li>
                                <li><a href="">Women's Shoes</a></li>
                                <li><a href="">Men's Shoes</a></li>
                                <li><a href="">Underwear</a></li>
                                <li><a href="">Bags</a></li>
                                <li><a href="">Sports</a></li>
                                <li><a href="">Mother and Baby</a></li>
                                <li><a href="">Home Decoration</a></li>
                                <li><a href="">Medicine</a></li>
                                <li><a href="">Food</a></li>
                                <li><a href="">Accessories</a></li>
                                <li><a href="">Automobiles</a></li>
                            </ul>
                        </div>
                        <div class="site-brand">
                            <h2>Brand Fashion<span>Brand</span></h2>
                            <ul>
                                <li><a href="">Tmall Fashion</a></li>
                                <li><a href="">Big Brand Street</a></li>
                                <li><a href="">Fashion Street</a></li>
                                <li><a href="">Tmall Original</a></li>
                                <li><a href="">What Brand is Good</a></li>
                            </ul>
                        </div>
                        <div class="site-help">
                            <h2>Service Guide<span>Help</span></h2>
                            <ul>
                                <li><a href="">Help Center</a></li>
                                <li><a href="">Quality Guarantee</a></li>
                                <li><a href="">Special Services</a></li>
                                <li><a href="">7-Day Return Policy</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </li>
        </ul>
    </div>
</div>