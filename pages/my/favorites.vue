<template>
  <div>
    <div class="container">
      Избранные товары
      <div class="row">

        <div class="col-lg-3 col-md-8 col-sm-8" v-for="(item, index) in favorites" :key="item.id">
          <figure class="card card-product-grid">

            <div class="d-flex justify-content-center">
              <a href="#" class="img-wrap">
                <img style="width:240px;height:240px;"
                     :src="'http://127.0.0.1:8000/storage/images/HumKE711BtI.jpg'" />
              </a>
            </div>
            <figcaption class="info-wrap border-top">

              <div>
                <a class="title text-truncate">{{item.product.name | truncate(35)}}</a>
                <p>{{item.product.content | truncate(40)}}</p>
                <p>Цена - {{item.product.price}}</p>
                <button @click="addToCart(item.id)" class="btn btn-primary"><a style="text-decoration:none;color:white">В корзину <font-awesome-icon :icon="['fas', 'cart-plus']"  /> </a></button>
                <button @click="deleteFromFavorites(item.id)" class="btn btn-light border"><a> <font-awesome-icon :icon="['fas', 'heart']"  /> </a></button>
                <a v-bind:href="'/product/' + item.id" style="color:black;" class="btn btn-light border">
                  <font-awesome-icon :icon="['fas', 'pencil']"  />
                </a>
              </div>
            </figcaption>
          </figure>
        </div> <!-- col end.// -->

      </div>
    </div>
  </div>
</template>
<script>
export default {
  layout : 'customLayout',
  data:() => ({
    favorites : [],
  }),
  mounted() {
    this.getUserCart()
  },
  methods : {
    async getUserCart() {
      await this.$axios.$get('/api/v1/favorite')
        .then(resp => {
          this.favorites = resp.products
        })
        .catch((err) => {
          console.log(err)
        })
    },
    removeUserCart() {
      this.$axios.$post('api/v1/favorite/clear')
    },
    deleteFromFavorites(product_id) {
      this.$axios.$delete(`/api/v1/cart/favorite/${product_id}`)
      this.reload()
    },
    addToCart(product_id) {
      this.$axios.$post(`api/v1/cart/add/${product_id}`)
    },
  },

  filters: {
    truncate: function (text,stop,clamp) {
      return text.slice(0, stop) + (stop < text.length ? clamp || '' : '')
    }
  }
}
</script>

