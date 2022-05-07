<template>
  <div>
    <div class="container">
      <nav class="navbar navbar-expand-lg navbar-light bg-dark navbar-dark shadow">
        <div class="container-fluid">
          <a class="navbar-brand" href="#">Online Store<span class="badge bg-primary"></span></a>
          <button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#navbar-content">
            <div class="hamburger-toggle">
              <div class="hamburger">
                <span></span>
                <span></span>
                <span></span>
              </div>
            </div>
          </button>
          <div class="collapse navbar-collapse" id="navbar-content">
            <ul class="navbar-nav mr-auto mb-2 mb-lg-0">

              <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">Каталог</a>
                <div class="dropdown-menu p-0" style="width:700px;">
                  <div class="d-flex flex-wrap flex-sm-nowrap px-2">
                    <div class="mega-dropdown-column pt-1 pt-lg-4 pb-4 px-2 px-lg-3">
                      <div class="widget widget-links mb-4">
                        <h6 class="fs-base mb-3">Все категории</h6>
                        <ul class="widget-list">
                          <li class="widget-list-item" v-for="(item, index) in categories" :key="item.id">
                            <a class="widget-list-link" v-bind:href="'/category/' + item.name + '-' + item.id">{{item.name}}</a>
                          </li>
                        </ul>
                      </div>
                      <div class="widget widget-links mb-4">
                        <h6 class="fs-base mb-3">Marketplace</h6>
                        <ul class="widget-list">
                          <li class="widget-list-item"><a class="widget-list-link" href="marketplace-category.html">Category Page</a></li>
                          <li class="widget-list-item"><a class="widget-list-link" href="marketplace-single.html">Single Item Page</a></li>
                          <li class="widget-list-item"><a class="widget-list-link" href="marketplace-vendor.html">Vendor Page</a></li>
                          <li class="widget-list-item"><a class="widget-list-link" href="marketplace-cart.html">Cart</a></li>
                          <li class="widget-list-item"><a class="widget-list-link" href="marketplace-checkout.html">Checkout</a></li>
                        </ul>
                      </div>
                      <div class="widget widget-links">
                        <h6 class="fs-base mb-3">Grocery store</h6>
                        <ul class="widget-list">
                          <li class="widget-list-item"><a class="widget-list-link" href="grocery-catalog.html">Product Catalog</a></li>
                          <li class="widget-list-item"><a class="widget-list-link" href="grocery-single.html">Single Product Page</a></li>
                          <li class="widget-list-item"><a class="widget-list-link" href="grocery-checkout.html">Checkout</a></li>
                        </ul>
                      </div>
                    </div>
                    <div class="mega-dropdown-column pt-1 pt-lg-4 pb-4 px-2 px-lg-3">
                      <div class="widget widget-links mb-4">
                        <h6 class="fs-base mb-3">Food Delivery</h6>
                        <ul class="widget-list">
                          <li class="widget-list-item"><a class="widget-list-link" href="food-delivery-category.html">Category Page</a></li>
                          <li class="widget-list-item"><a class="widget-list-link" href="food-delivery-single.html">Single Item (Restaurant)</a></li>
                          <li class="widget-list-item"><a class="widget-list-link" href="food-delivery-cart.html">Cart (Your Order)</a></li>
                          <li class="widget-list-item"><a class="widget-list-link" href="food-delivery-checkout.html">Checkout (Address &amp; Payment)</a></li>
                        </ul>
                      </div>
                      <div class="widget widget-links">
                        <h6 class="fs-base mb-3">NFT Marketplace<span class="badge bg-danger ms-1">NEW</span></h6>
                        <ul class="widget-list">
                          <li class="widget-list-item"><a class="widget-list-link" href="nft-catalog-v1.html">Catalog v.1</a></li>
                          <li class="widget-list-item"><a class="widget-list-link" href="nft-catalog-v2.html">Catalog v.2</a></li>
                          <li class="widget-list-item"><a class="widget-list-link" href="nft-single-auction-live.html">Single Item - Auction Live</a></li>
                          <li class="widget-list-item"><a class="widget-list-link" href="nft-single-auction-ended.html">Single Item - Auction Ended</a></li>
                          <li class="widget-list-item"><a class="widget-list-link" href="nft-single-buy.html">Single Item - Buy Now</a></li>
                          <li class="widget-list-item"><a class="widget-list-link" href="nft-vendor.html">Vendor Page</a></li>
                          <li class="widget-list-item"><a class="widget-list-link" href="nft-connect-wallet.html">Connect Wallet</a></li>
                          <li class="widget-list-item"><a class="widget-list-link" href="nft-create-item.html">Create New Item</a></li>
                        </ul>
                      </div>
                    </div>
                    <div class="mega-dropdown-column pt-1 pt-lg-4 px-2 px-lg-3">
                      <div class="widget widget-links mb-4">
                        <h6 class="fs-base mb-3">Shop pages</h6>
                        <ul class="widget-list">
                          <li class="widget-list-item"><a class="widget-list-link" href="shop-categories.html">Shop Categories</a></li>
                          <li class="widget-list-item"><a class="widget-list-link" href="shop-single-v1.html">Product Page v.1</a></li>
                          <li class="widget-list-item"><a class="widget-list-link" href="shop-single-v2.html">Product Page v.2</a></li>
                          <li class="widget-list-item"><a class="widget-list-link" href="shop-cart.html">Cart</a></li>
                          <li class="widget-list-item"><a class="widget-list-link" href="checkout-details.html">Checkout - Details</a></li>
                          <li class="widget-list-item"><a class="widget-list-link" href="checkout-shipping.html">Checkout - Shipping</a></li>
                          <li class="widget-list-item"><a class="widget-list-link" href="checkout-payment.html">Checkout - Payment</a></li>
                          <li class="widget-list-item"><a class="widget-list-link" href="checkout-review.html">Checkout - Review</a></li>
                          <li class="widget-list-item"><a class="widget-list-link" href="checkout-complete.html">Checkout - Complete</a></li>
                          <li class="widget-list-item"><a class="widget-list-link" href="order-tracking.html">Order Tracking</a></li>
                          <li class="widget-list-item"><a class="widget-list-link" href="comparison.html">Product Comparison</a></li>
                        </ul>
                      </div>
                    </div>
                  </div>
                </div>
              </li>
              <li style="list-style-type:none;max-width:100px;" class="nav-item dropdown">
                <a style="max-width:100px;" class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">Валюты</a>
                <div style="height:80px;" class="dropdown-menu p-0">
                  <div class="d-flex flex-wrap flex-sm-nowrap px-2">
                    <div class="mega-dropdown-column pb-4 px-2 px-lg-3">
                      <div class="widget widget-links mb-4">
                        <ul class="widget-list">
                          <li v-for="(item, index) in currencies" :key="item.id">
                            <a @click="getCurrencyCode(item.code)">{{item.symbol}}</a>
                          </li>
                        </ul>
                      </div>
                    </div>
                  </div>
                </div>
              </li>

              <li class="nav-item" style="padding-top:8px;padding-left:5px;">
                <a style="color:white;">Лучшие товары</a>
              </li>
              <li class="nav-item" style="padding-top:8px;padding-left:5px;">
                <a style="color:white;">Премиум</a>
              </li>
              <li class="nav-item" style="padding-top:8px;padding-left:5px;">
                <a style="color:white;">Акции</a>
              </li>
              <li class="nav-item" style="padding-top:8px;padding-left:5px;">
                <a style="color:white;">Бренды</a>
              </li>
              <li class="nav-item" style="padding-top:8px;padding-left:5px;">
                <a style="color:white;">Магазины</a>
              </li>
              <li class="nav-item" style="padding-top:8px;padding-left:5px;">
                <a style="color:white;">Электроника</a>
              </li>
              <li class="nav-item" style="padding-top:8px;padding-left:5px;">
                <a style="color:white;">Одежда и обувь</a>
              </li>
              <li class="nav-item" style="padding-top:8px;padding-left:5px;">
                <a style="color:white;">Детские товары</a>
              </li>
              <li class="nav-item" style="padding-top:8px;padding-left:5px;">
                <a style="color:white;">Дом и сад</a>
              </li>

            </ul>
          </div>

        </div>
      </nav>

    </div>
  </div>
</template>
<script>
export default {
  props : ['categories','currencies'],
  methods : {
    getCurrencyCode(currencyCode) {
      this.$axios.$get(`/api/v1/currency/${currencyCode}`)
    },
  }
}
</script>
