<template>
  <div>
<!--    <div v-for="(item3, index) in items">-->
<!--      {{item3}}-->
<!--     <div v-for="(item4, index) in item3.images[0]">-->
<!--       <div v-for="(item5, index) in item4">-->
<!--         {{item5}}-->
<!--       </div>-->
<!--     </div>-->
<!--    </div>-->
    <section style="margin-top:-20px;" class="padding-y">
      <div class="container">

        <div class="row">
          <aside class="col-lg-6">
            <CarouselProduct :items="items" />
          </aside>
          <template>
            <main class="col-lg-6">
              <article style="margin-top:50px;" class="ps-lg-3">
            <div>
              <div class="mb-3">
                <var class="price h5">Цена - {{price.price}}</var>
              </div>
              <h4  v-for="item1 in prinfo.attributesoptions" v-if="item1.attribute_id == 4" class="title text-dark">Название:{{item1.value | truncate(35)}}</h4>
              <p  v-for="item1 in prinfo.attributesoptions" v-if="item1.attribute_id == 5">Описание:{{item1.value | truncate(55)}}</p>
            </div>
              <div class="rating-wrap my-3">
                <ul class="rating-stars">
                  <li style="width:80%" class="stars-active"> </li>
                  <li> </li>
                </ul>
                <b class="label-rating text-warning"> 4.5</b>
                <i class="dot"></i>
                <span class="label-rating text-muted"> <i class="fa fa-shopping-basket"></i> 154 orders </span>
                <i class="dot"></i>
                <span class="label-rating text-success">In stock</span>
              </div> <!-- rating-wrap.// -->



              <p>CONTENT</p>

<!--              <dl class="row" v-for="(item4, index) in items.characteristic" :key="item4.id">-->
<!--                <dt class="col-3">{{item4.name}}:</dt>-->
<!--                <dd class="col-9">{{item4.text}}</dd>-->

<!--              </dl>-->

              <hr>

              <div class="row mb-4">
                <div class="col-md-4 col-6 mb-2">
                  <label class="form-label">Size</label>
                  <select class="form-select">
                    <option>Small</option>
                    <option>Medium</option>
                    <option>Large</option>
                  </select>
                </div> <!-- col.// -->
                <div class="col-md-4 col-6 mb-3">
                  <label class="form-label d-block">Quantity</label>
                  <div class="input-group input-spinner">
                    <button class="btn btn-icon btn-light" type="button">
                      <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="#999" viewBox="0 0 24 24">
                        <path d="M19 13H5v-2h14v2z"></path>
                      </svg>
                    </button>
                    <input class="form-control text-center" placeholder="" value="14">
                    <button class="btn btn-icon btn-light" type="button">
                      <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="#999" viewBox="0 0 24 24">
                        <path d="M19 13h-6v6h-2v-6H5v-2h6V5h2v6h6v2z"></path>
                      </svg>
                    </button>
                  </div> <!-- input-group.// -->
                </div> <!-- col.// -->
              </div> <!-- row.// -->
                <stripe-checkout
                    ref="checkoutRef"
                    :pk="publishableKey"
                    :sessionId="stripe.id"
                />
                <button class="btn btn-primary" @click="submit">Pay now!</button>
              <a href="#" class="btn  btn-primary"> <i class="me-1 fa fa-shopping-basket"></i> Add to cart </a>
              <a href="#" class="btn  btn-light"> <i class="me-1 fa fa-heart"></i> Save </a>

            </article> <!-- product-info-aside .// -->
          </main>
          </template>
        </div> <!-- row.// -->

      </div> <!-- container .//  -->
    </section>
  </div>
</template>

<script>
export default {
  props : ['items','prinfo','price','stripe'],
  data:() => ({
    cancelurl:"http://localhost:3000/dashboard/subscription/",
    loading: false,
    oneTimeId : '',
    publishableKey : "pk_test_51KmxFhLfaQqcaRmQ8LnvXrZxApFd80nLwk5kD7pqXQcfMP9bSfM3pVK3XX4l1nkchTyu6J1GF6tmifqVGTF8GSxG00p4hNfWr7",
    lineItems: [],
  }),
  methods: {
    submit () {
      this.$refs.checkoutRef.redirectToCheckout();
    },
  },
  filters: {
    truncate: function (text,stop,clamp) {
      return text.slice(0, stop) + (stop < text.length ? clamp || '' : '')
    }
  }
}
</script>
