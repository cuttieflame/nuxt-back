<template>
  <div>
    <DropdownProducts :categories="categories" :currencies="currencies"/>
    <section class="section-intro pt-3">
      <div class="container">

        <div class="row gx-3">
          <main class="col-lg-9">
            <article class="card-banner p-5 bg-primary" style="height: 350px">
              <div style="max-width: 500px">
                <p style="font-size:26px;" class="text-white">Great products with <br> best deals </p>
                <p class="text-white">No matter how far along you are in your sophistication as an amateur astronomer, there is always one.</p>
                <a style="margin-top:20px;" href="#" class="btn btn-warning"> View more </a>
              </div>
            </article>
          </main>
          <aside  class="col-lg-3">
            <article style="background-color:red;" class="card-banner h-100">
              <div class="card-body text-center">
                <h5 class="mt-3 text-white">Amazing Gifts</h5>
                <p class="text-white">No matter how far along you are in your sophistication</p>
                <a href="#" class="btn btn-outline-light"> View more </a>
              </div>
            </article>
          </aside>
        </div> <!-- row //end -->

      </div> <!-- container end.// -->
    </section>
    <section class="padding-top">
      <div class="container">

        <header style="margin-top:20px;" class="section-heading">
          <p style="font-size:34px;" class="section-title">New products</p>
        </header>

        <div class="row">
          <div class="col-lg-3 col-md-8 col-sm-8" v-for="(item, index) in products.slice(0,8)" :key="item.id">
            <figure class="card card-product-grid">

              <div class="d-flex justify-content-center">
              <a href="#" class="img-wrap">
                <img lazy="loading" style="width:240px;height:240px;"
                     :src="'http://127.0.0.1:8000/storage/images/HumKE711BtI.jpg'" />
              </a>
              </div>
              <figcaption class="info-wrap border-top">

                <div v-for="(item1, index) in item.attributesoptions">
                <a v-if="item1.attribute_id == 4" class="title text-truncate">Название:{{item1.value | truncate(35)}}</a>
                  <p v-if="item1.attribute_id == 5">Описание:{{item1.value | truncate(55)}}</p>
                  <p v-if="item1.attribute_id == 5">Цена:{{item.productprice.price}}</p>
                  <p v-if="item1.attribute_id == 6">Просмотров:{{item1.value}}</p>
                  <p v-if="item1.attribute_id == 7">Тэги:{{item1.value}}</p>
                  <div v-if="item1.attribute_id > 6">
                  <button @click="addToCart(item.id)" class="btn btn-primary"><a style="text-decoration:none;color:white">В корзину <font-awesome-icon :icon="['fas', 'cart-plus']"  /> </a></button>
                  <button @click="addToFavorite(item.id)" class="btn btn-light border"><a> <font-awesome-icon :icon="['fas', 'heart']"  /> </a></button>
                  <a v-bind:href="'/product/' + item.id" style="color:black;" class="btn btn-light border">
                    <font-awesome-icon :icon="['fas', 'pencil']"  />
                  </a>
                  </div>
                </div>
              </figcaption>
            </figure>
          </div> <!-- col end.// -->

        </div>


      </div>

    </section>
    <section style="margin-top:20px;" class="padding-top">
      <div class="container">
        <div class="row gy-4">
          <aside class="col-lg-6">
            <div class="card bg-dark text-white border border-white">
              <img lazy="loading" style="height:420px;" :src="'http://127.0.0.1:8000/storage/images/2.jpg'" class="card-img" alt="...">
              <div style="padding:50px;" class="card-img-overlay">
                <h1 style="color:black;" class="card-title">Best products & brands in our store at 80% off</h1>
                <p style="color:gray;" class="card-text">That's true but not always</p>
                <button class="btn btn-info">Claim offer</button>
              </div>
            </div>
          </aside> <!-- col.// -->
          <aside class="col-lg-6">

            <div class="row mb-4">
              <div class="col-6">
                <article class="card bg-primary" style="min-height: 200px">
                  <div class="card-body">
                    <h5 class="text-white">Gaming toolset</h5>
                    <p class="text-white-50">Technology for cyber sport  </p>
                    <a class="btn btn-outline-light btn-sm" href="#">Learn more</a>
                  </div>
                </article>
              </div>
              <div class="col-6">
                <article class="card bg-primary" style="min-height: 200px">
                  <div class="card-body">
                    <h5 class="text-white">Quality sound</h5>
                    <p class="text-white-50">All you need for music</p>
                    <a class="btn btn-outline-light btn-sm" href="#">Learn more</a>
                  </div>
                </article>
              </div>
            </div> <!-- row.// -->

            <article class="card bg-success" style="min-height: 200px">
              <div class="card-body">
                <h5 class="text-white">Buy 2 items, With special gift</h5>
                <p class="text-white-50" style="max-width:400px;">Buy one, get one free marketing strategy helps your business improves the brand by sharing the profits </p>
                <a class="btn btn-outline-light btn-sm" href="#">Learn more</a>
              </div>
            </article>

          </aside> <!-- col.// -->
        </div> <!-- row.// -->
      </div> <!-- container end.// -->
    </section>
    <section class="padding-top">
      <div class="container">

        <header style="margin-top:20px;" class="section-heading">
          <p style="font-size:34px;">Recently viewed</p>
        </header>

        <div class="row">

          <div class="col-lg-3 col-md-8 col-sm-8" v-for="(item, index) in products.slice(8,16)" :key="item.id">
            <figure class="card card-product-grid">

              <div class="d-flex justify-content-center">
                <a href="#" class="img-wrap">
                  <img style="width:240px;height:240px;"
                       :src="'http://127.0.0.1:8000/storage/images/HumKE711BtI.jpg'" />
                </a>
              </div>
              <figcaption class="info-wrap border-top">


                <div v-for="(item1, index) in item.attributesoptions">
                  <a v-if="item1.attribute_id == 4" class="title text-truncate">Название:{{item1.value | truncate(35)}}</a>
                  <p v-if="item1.attribute_id == 5">Описание:{{item1.value | truncate(55)}}</p>
                  <p v-if="item1.attribute_id == 5">Цена:{{item.productprice.price}}</p>
                  <div v-if="item1.attribute_id > 6">
                    <button @click="addToCart(item.id)" class="btn btn-primary"><a style="text-decoration:none;color:white">В корзину <font-awesome-icon :icon="['fas', 'cart-plus']"  /> </a></button>
                    <button @click="addToFavorite(item.id)" class="btn btn-light border"><a> <font-awesome-icon :icon="['fas', 'heart']"  /> </a></button>
                    <a v-bind:href="'/product/' + item.id" style="color:black;" class="btn btn-light border">
                      <font-awesome-icon :icon="['fas', 'pencil']"  />
                    </a>
                  </div>
                </div>
              </figcaption>
            </figure>
          </div> <!-- col end.// -->

        </div>


      </div>

    </section>
    <footer style="margin-top:20px;" class="w-100 py-4 flex-shrink-0">
      <div class="container py-4">
        <div class="row gy-4 gx-5">
          <div class="col-lg-4 col-md-6">
            <h5 class="h1 text-white">FB.</h5>
            <p class="small text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt.</p>
            <p class="small text-muted mb-0">&copy; Copyrights. All rights reserved. <a class="text-primary" href="#">Bootstrapious.com</a></p>
          </div>
          <div class="col-lg-2 col-md-6">
            <h5 class="text-white mb-3">Quick links</h5>
            <ul class="list-unstyled text-muted">
              <li><a href="#">Home</a></li>
              <li><a href="#">About</a></li>
              <li><a href="#">Get started</a></li>
              <li><a href="#">FAQ</a></li>
            </ul>
          </div>
          <div class="col-lg-2 col-md-6">
            <h5 class="text-white mb-3">Quick links</h5>
            <ul class="list-unstyled text-muted">
              <li><a href="#">Home</a></li>
              <li><a href="#">About</a></li>
              <li><a href="#">Get started</a></li>
              <li><a href="#">FAQ</a></li>
            </ul>
          </div>
          <div class="col-lg-4 col-md-6">
            <h5 class="text-white mb-3">Newsletter</h5>
            <p class="small text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt.</p>
            <form action="#">
              <div class="input-group mb-3">
                <input class="form-control" type="text" placeholder="Recipient's username" aria-label="Recipient's username" aria-describedby="button-addon2">
                <button class="btn btn-primary" id="button-addon2" type="button"><i class="fas fa-paper-plane"></i></button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </footer>
  </div>
</template>

<script>
import CategoriesMain from "~/components/CategoriesMain";
import DropdownProducts from "../components/DropdownProducts";
export default {
  components: {DropdownProducts, CategoriesMain},
  layout : 'customLayout',
  data:() => ({
    categories : [],
    products: [],
    currencies : [],
    currentValue : 1,
  }),
  mounted() {
    this.getProducts()
  },
  methods: {
    async getProducts() {
      this.$axios.$get('/api/v1/products?t=main&q=100&w=cr,br,cg')
        .then((resp) => {
          this.currencies = resp.crct.currencies
          this.categories = resp.crct.categories
          this.products =  resp.product.data
        })
        .catch((err) => {console.log(err)})
    },
    getCurrencyCode(currencyCode) {
      this.$axios.$get(`/api/v1/currency/${currencyCode}`)
    },
    addToCart(product_id) {
        this.$axios.$post(`api/v1/cart/add/${product_id}`)
    },
    addToFavorite(product_id) {
        this.$axios.$post(`api/v1/favorite/add/${product_id}`)
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
footer .text-small {
  font-size: 0.9rem;
}

footer a {
  color: inherit;
  text-decoration: none;
  transition: all 0.3s;
}

footer a:hover, a:focus {
  text-decoration: none;
}

footer .form-control {
  background: #212529;
  border-color: #545454;
}

footer .form-control:focus {
  background: #212529;
}

footer {
  background: #212529;
}

</style>
