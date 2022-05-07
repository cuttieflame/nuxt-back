<template>
  <div>
    <section class="h-100 h-custom">
      <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
          <div class="col-12">
            <div class="card card-registration card-registration-2" style="border-radius: 15px;">
              <div class="card-body p-0">
                <validation-user-account-errors v-if="validationErrors" :errors="validationErrors" />
                <div class="row g-0">
                  <div class="col-lg-8">
                    <div class="p-5">
                      <div class="d-flex justify-content-between align-items-center mb-5">
                        <h1 class="fw-bold mb-0 text-black">Shopping Cart</h1>
                        <h6 v-if="carts" class="mb-0 text-muted">{{carts.length}} items</h6>
                      </div>
                      <hr class="my-4">

                      <div v-if="carts" v-for="(item, index) in carts" :key="item.id" class="row mb-4 d-flex justify-content-between align-items-center">
                        <div class="col-md-2 col-lg-2 col-xl-2">
                          <img :src="'http://127.0.0.1:8000/storage/images/HumKE711BtI.jpg'" alt="#" />
                        </div>
                        <div class="col-md-3 col-lg-3 col-xl-3">
                          <h6 class="text-muted">{{item.name}}</h6>
                          <h6 class="text-black mb-0">{{item.content | truncate(40)}}</h6>
                        </div>
                        <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
                          <button value="1" @click="QuantityCart(item.id,'minus')" class="btn btn-link px-2">
                            <font-awesome-icon :icon="['fas', 'minus']"  />
                          </button>

                          <input v-bind:id="'elem' + item.id" style="width:50px;" type="text" v-bind:value='item.quantity' v-on:change="QuantityCart(item.id,'change')">
<!--                          <input id="form1" min="1" v-bind:value='item.quantity' name="quantity" type="number" class="form-control form-control-sm" />-->

                          <button value="1" @click="QuantityCart(item.id,'plus')" class="btn btn-link px-2">
                            <font-awesome-icon :icon="['fas', 'plus']"  />
                          </button>
                        </div>
                        <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                          <h6 class="mb-0">₽ {{item.price}}</h6>
                        </div>
                        <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                          <button  @click="RemoveItemFromCart(item.id)" class="btn" type="button"><a href="#" class="text-muted"><font-awesome-icon :icon="['fas', 'trash']"  /></a></button>
                        </div>
                      </div>
                      <div v-if="carts.length == 0">Корзина пуста</div>
                      <hr class="my-4">
                      <div style="margin-top:-10px;" class="row">
                        <div class="col-3">
                            <NuxtLink to="/"> <h6 class="mb-0"><a href="#" class="text-body"><font-awesome-icon :icon="['fas', 'arrow-left']"  /> Вернуть в магазин</a></h6> </NuxtLink>
                        </div>
                        <div class="col-3">
                            <button style="margin-top:-10px;" @click="removeUserCart()" class="btn" type="button"><h6 class="mb-0"><a href="#" class="text-body"><font-awesome-icon :icon="['fas', 'trash']"  /> Очистить корзину</a></h6></button>
                        </div>
                      </div>
                      <div v-show="carts.length !== 0" class="card mb-4">
                        <div class="card-body">
                          <p><strong>Приблизительная дата доставки</strong></p>
                          <p class="mb-0">{{this.datas.now}} - {{this.datas.not_now}}</p>
                        </div>
                      </div>
                      <div class="card mb-4 mb-lg-0">
                        <div class="card-body">
                          <p><strong>We accept</strong></p>
                          <p>VISA</p>
                        </div>
                      </div>

                    </div>
                  </div>
                  <div class="col-lg-4 bg-grey">
                    <div class="p-5">
                      <h3 class="fw-bold mb-5 mt-2 pt-1">Summary</h3>
                      <hr class="my-4">

                      <div class="d-flex justify-content-between mb-4">
                        <h5 class="text-uppercase">items {{carts.length}}</h5>
                        <h5>₽ {{price}}</h5>
                      </div>

                      <h5 class="text-uppercase mb-3">Shipping</h5>

                      <div class="mb-4 pb-2">
                        <select class="select">
                          <option value="1">Standard-Delivery- €5.00</option>
                          <option value="2">Two</option>
                          <option value="3">Three</option>
                          <option value="4">Four</option>
                        </select>
                      </div>
                      <form method="POST" @submit.prevent="makeOrder()">
                      <h5 class="text-uppercase mb-3">Give code</h5>
                        <div v-if="currency !== null">
                          У вас включена скидка <br>
                          Размер скидки - {{coupon_value}} %
                        </div>
                      <div>
                        <div class="form-outline">
                          <label class="form-label" for="code" name="code">Enter your code</label>
                          <input type="text" id="code" class="form-control form-control-lg" v-model="give_code" />
                        </div>
                      </div>
                      <button class="btn btn-success" @click="getCurrencyCode()">Применить скидку</button>
                      <h5 class="text-uppercase mb-3">Description</h5>

                      <div class="mb-5">
                        <div class="form-outline">
                          <textarea class="form-label" for="description" name="description" v-model="description"  placeholder="enter your description"></textarea>
                        </div>
                      </div>

                      <hr class="my-4">

                      <div class="d-flex justify-content-between mb-5">
                        <h5 class="text-uppercase">Total price</h5>
                        <h5>₽ {{price}}</h5>
                      </div>

                      <button v-if="$auth.user !== null" type="submit" class="btn btn-dark btn-block btn-lg"
                              data-mdb-ripple-color="dark">Купить
                      </button>
                        <NuxtLink v-else to="/auth/login" style="color:black;" class="btn border">
                          Sign In <font-awesome-icon :icon="['fas', 'user']"  />
                        </NuxtLink>
                      </form>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

    </section>

  </div>
</template>

<script>
export default {
  layout : 'customLayout',
  data:() => ({
    carts : [],
    cart_number : 1,
    price : 0,
    datas : [],
    give_code : '',
    description : '',
    validationErrors:'',
    currency : '',
    coupon_value : '',
  }),
  mounted() {
    this.getUserCart()
  },
  computed: {
     priceCart : function () {
    let a = 0;
     this.carts.map(function(elem) {
        a += elem.product.price
     })
       return this.price + a;
     },
  },
  methods : {
    async getUserCart() {
      await this.$axios.$get('/api/v1/cart')
        .then(resp => {
          this.carts = resp.products.data
          this.datas = resp.times
          this.currency = resp.products.meta.currency
          this.coupon_value = resp.products.meta.coupon_value
          this.carts.forEach((value, index) => {
            this.price += Number(value.price)
          });
          console.log(resp)
        })
        .catch((error) => {
          this.validationErrors = error.response.data.errors || {};
        })
    },
    makeOrder() {
      this.$axios.$post('/api/v1/order/make',{
        give_code : this.give_code || '',
        description : this.description || '',
      })
    },
    getCurrencyCode() {
      let coupon = this.give_code
      this.$axios.$get(`/api/v1/coupons/${coupon}`)
    },
    removeUserCart() {
      this.$axios.$post('/api/v1/cart/clear')
    },
    RemoveItemFromCart(cart_id) {
      this.$axios.$delete(`/api/v1/cart/delete/${cart_id}`)
    },
    QuantityCart(item_id,sign) {
      if(sign == 'minus') {
        document.getElementById('elem' + item_id).value = Number(document.getElementById('elem' + item_id).value) - 1;
      }
      if(sign == 'plus') {
        document.getElementById('elem' + item_id).value = Number(document.getElementById('elem' + item_id).value) + 1;
      }
      let value123 = document.getElementById('elem' + item_id).value;
      this.$axios.$put(`api/v1/cart/quantity/?cart_id=${item_id}&quantity=${sign}&value=${value123}`)
    },


  },

  filters: {
    truncate: function (text,stop,clamp) {
      return text.slice(0, stop) + (stop < text.length ? clamp || '' : '')
    }
  }
}
</script>
<style>


.card-registration .select-input.form-control[readonly]:not([disabled]) {
  font-size: 1rem;
  line-height: 2.15;
  padding-left: .75em;
  padding-right: .75em;
}

.card-registration .select-arrow {
  top: 13px;
}


@media (min-width: 992px) {
  .card-registration-2 .bg-grey {
    border-top-right-radius: 16px;
    border-bottom-right-radius: 16px;
  }
}

@media (max-width: 991px) {
  .card-registration-2 .bg-grey {
    border-bottom-left-radius: 16px;
    border-bottom-right-radius: 16px;
  }
}
</style>
