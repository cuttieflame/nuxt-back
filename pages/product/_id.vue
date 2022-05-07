<template>
  <div>

   <HeaderProduct :items="images" :prinfo="product" :price="price" :stripe="stripe"/>
    <section style="margin-top:-20px;" class="padding-y bg-light border-top">
      <div class="container">
        <h1 v-if="validationErrors">{{validationErrors}}</h1>
        <div class="row">
          <div class="col-lg-8">
            <!-- =================== COMPONENT SPECS ====================== -->
            <div class="card">
              <header class="card-header">

                <ContentProduct v-if="product_info" :items="product_info" />
              </header>

            </div>
            <!-- =================== COMPONENT SPECS .// ================== -->
          </div> <!-- col.// -->
          <aside class="col-lg-4">
            <!-- =================== COMPONENT ADDINGS ====================== -->
            <div class="card">
              <div class="card-body">
                <h5 class="card-title">Similar items</h5>

                <article class="itemside mb-3">
                  <a href="#" class="aside">

                  </a>
                  <div class="info">
                    <a href="#" class="title mb-1"> Rucksack Backpack Large <br> Line Mounts </a>
                    <strong class="price"> $38.90</strong> <!-- price.// -->
                  </div>
                </article>

                <article class="itemside mb-3">
                  <a href="#" class="aside">

                  </a>
                  <div class="info">
                    <a href="#" class="title mb-1"> Summer New Men's Denim <br> Jeans Shorts  </a>
                    <strong class="price"> $29.50</strong> <!-- price.// -->
                  </div>
                </article>

                <article class="itemside mb-3">
                  <a href="#" class="aside">
                  </a>
                  <div class="info">
                    <a href="#" class="title mb-1"> T-shirts with multiple colors, for men and lady </a>
                    <strong class="price"> $120.00</strong> <!-- price.// -->
                  </div>
                </article>

                <article class="itemside mb-3">
                  <a href="#" class="aside">
                  </a>
                  <div class="info">
                    <a href="#" class="title mb-1"> Blazer Suit Dress Jacket for Men, Blue color </a>
                    <strong class="price"> $339.90</strong> <!-- price.// -->
                  </div>
                </article>

              </div> <!-- card-body .// -->
            </div> <!-- card .// -->
            <!-- =================== COMPONENT ADDINGS .// ================== -->
          </aside> <!-- col.// -->
        </div>

        <br><br>

      </div><!-- container // -->
    </section>

  </div>
</template>

<script>
import CarouselProduct from "../../components/CarouselProduct";
import ContentProduct from "../../components/ContentProduct";
import HeaderProduct from "../../components/HeaderProduct";

export default {
  components: {HeaderProduct, ContentProduct, CarouselProduct},
  layout : 'customLayout',
  data:() => ({
    product: [],
    images : [],
    product_info : [],
    price : [],
    stripe : [],
    validationErrors : '',
  }),
  mounted() {
    this.getProduct()
  },
  methods: {
    async getProduct() {
      await this.$axios.$get(`api/v1/product/${this.$route.params.id}` + '?t=main' + '&f=client')
        .then(resp => {
          this.product = resp.product || ''
          this.images = JSON.parse(this.product.images.images)
          this.product_info = this.product.productinfo[0]
          this.price = this.product.productprice
          this.stripe = resp.stripe
        })
          .catch((error) => {
            console.log(error)
            this.validationErrors = error.response.data.error || {};
          })
    },
  },

}
</script>


