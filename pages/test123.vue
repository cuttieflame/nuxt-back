<template>
  <div>
    <div class="container">
      Избранные товары
      <div class="row">

        <div class="col-lg-3 col-md-8 col-sm-8" v-for="(item, index) in products">
          <figure class="card card-product-grid">

            <div class="d-flex justify-content-center">
              <a href="#" class="img-wrap">
                <img style="width:240px;height:240px;"
                     :src="'http://127.0.0.1:8000/storage/images/HumKE711BtI.jpg'" />
              </a>
            </div>
            <figcaption class="info-wrap border-top">

              <div>
                <a v-for="(item1, index) in item.attributesoptions">
                  {{item1.value}}
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
    products : [],
  }),
  mounted() {
    this.getProducts()
  },
  methods : {
    async getProducts() {
      await this.$axios.$get('/api/products')
        .then(resp => {
          this.products = resp.product.data
          console.log(resp)
        })
        .catch((err) => {
          console.log(err)
        })
    },
  }
}
</script>
