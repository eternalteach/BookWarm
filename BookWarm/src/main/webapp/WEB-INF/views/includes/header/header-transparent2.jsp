<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <%@ include file="./include-header-front01.jsp"%>
</head>
<body>

   <div class="wrapper">

      <!--header start-->
      <header id="header" class="header-narrow header-transparent" data-plugin-options="{'stickyEnabled': true, 'stickyEnableOnBoxed': true, 'stickyEnableOnMobile': true, 'stickyStartAt': 1, 'stickySetTop': '1'}">
         <div class="header-body">
            <div class="header-container container">
               <div class="header-row">
                  <div class="header-column">
                     <div class="header-row">
                        <div class="header-logo">
                           <a href="index.html">
                              <img alt="Vertex" width="108" height="72" src="./resources/VertexEx/img/logo-white.png">
                           </a>
                        </div>
                     </div>
                  </div>
                  <div class="header-column justify-content-center">
                     <div class="header-row">
                        <div class="header-nav header-nav-top-line justify-content-center">
                           <div class="header-nav-main header-nav-main-effect-2 header-nav-main-sub-effect-1">
                              
                              <!-- 탑 메뉴 -->
                              <%@ include file="./include-header-top-nav.jsp"%>
                              
                           </div>
                           <button class="btn header-btn-collapse-nav" data-toggle="collapse" data-target=".header-nav-main nav">
                              <i class="fa fa-bars"></i>
                           </button>
                        </div>
                     </div>
                  </div>

                  <div class="header-column justify-content-end">
                     <div class="header-row">
                        <div class="header-nav header-nav-top-line justify-content-end">
                           <div class="header-nav-main header-nav-main-effect-2 header-nav-main-sub-effect-1">
                              <nav class="collapse">
                                 <ul class="nav nav-pills" id="mainNav">
                                    <li class="dropdown header-search-wrap">
                                       <a class="dropdown-item dropdown-toggle" href="#"><i class="fa fa-search fs-14"></i> </a>
                                       <ul class="dropdown-menu">
                                          <li>
                                             <div class="header-search">
                                                <form id="searchForm" action="pages-search-result.html" method="get" novalidate="novalidate">
                                                   <div class="input-group">
                                                      <input type="text" class="form-control" name="q" id="q" placeholder="Search..." required="">
                                                      <span class="input-group-btn">
                                                         <button class="btn btn-light" type="submit"><i class="fa fa-search"></i></button>
                                                      </span>
                                                   </div>
                                                </form>
                                             </div>
                                          </li>
                                       </ul>
                                    </li>
                                    <li class="dropdown dropdown-mega dropdown-mega-shop" id="headerShop">
                                       <a class="dropdown-item dropdown-toggle" href="page-login.html">
                                          <i class="ion-bag fs-22"></i>
                                          <span class="cart-items">2</span>
                                       </a>
                                       <ul class="dropdown-menu">
                                          <li>
                                             <div class="dropdown-mega-content">
                                                <table class="cart">
                                                   <tbody>
                                                      <tr>
                                                         <td class="product-actions">
                                                            <a title="Remove this item" class="remove" href="#">
                                                               <i class="fa fa-times"></i>
                                                            </a>
                                                         </td>
                                                         <td class="product-thumbnail">
                                                            <a href="shop-product-sidebar.html">
                                                               <img width="100" height="100" alt="" class="img-fluid" src="./resources/VertexEx/img/shop/th-mismo-bag-grey.jpg">
                                                            </a>
                                                         </td>
                                                         <td class="product-name">
                                                            <a href="shop-product-sidebar.html">Mismo Bag Grey<br><span class="amount">1 x <strong>$120.00</strong></span></a>
                                                         </td>
                                                      </tr>
                                                      <tr>
                                                         <td class="product-actions">
                                                            <a title="Remove this item" class="remove" href="#">
                                                               <i class="fa fa-times"></i>
                                                            </a>
                                                         </td>
                                                         <td class="product-thumbnail">
                                                            <a href="shop-product-sidebar.html">
                                                               <img width="100" height="100" alt="" class="img-fluid" src="./resources/VertexEx/img/shop/th-womens-bag.jpg">
                                                            </a>
                                                         </td>
                                                         <td class="product-name">
                                                            <a href="shop-product-sidebar.html">Womens Bag<br><span class="amount">2 x <strong>$135.00</strong></span></a>
                                                         </td>
                                                      </tr>
                                                      <tr>
                                                         <td class="cart-total-actions" colspan="6">
                                                            <div class="cart-total">
                                                               <strong>Subtotal:</strong>
                                                               <span class="cart-total-amount">$255.00</span>
                                                            </div>
                                                         </td>
                                                      </tr>
                                                      <tr>
                                                         <td class="actions p-none" colspan="6">
                                                            <div class="actions-continue text-center">
                                                               <button type="submit" class="btn btn-light">View Card</button>
                                                               <button type="submit" class="btn btn-primary mr-none">Checkout</button>
                                                            </div>
                                                         </td>
                                                      </tr>
                                                   </tbody>
                                                </table>
                                             </div>
                                          </li>
                                       </ul>
                                    </li>
                                 </ul>
                              </nav>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </header>
      <!--header end-->

      <div class="page">

         

         
		<!-- insert context -->
		<!-- insert footer -->
         
      </div>
   </div>
</body>
</html>