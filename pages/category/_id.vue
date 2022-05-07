<template>
  <client-only>
  <div>
    <section class="bg-primary py-5">
      <div class="container">
        <h2 class="text-white">Men's wear</h2>
        <ol class="breadcrumb ondark mb-0">
          <li class="breadcrumb-item"><a href="#">Home</a></li>
          <li class="breadcrumb-item"><a href="#">Category</a></li>
          <li class="breadcrumb-item active" aria-current="page">{{$route.params.id }}  </li>
        </ol>
      </div> <!-- container //  -->
    </section>
    <section class="padding-y">
      <div class="container">
          <div v-if="errored" class="alert alert-danger" role="alert">
            Записи не загрузились
          </div>
        <div class="row">
          <aside class="col-lg-3">

            <button class="btn btn-outline-secondary mb-3 w-100  d-lg-none" data-bs-toggle="collapse" data-bs-target="#aside_filter">Show filter</button>

            <!-- ===== Card for sidebar filter ===== -->
            <div id="aside_filter" class="collapse card d-lg-block mb-5">

              <article class="filter-group">
                <header class="card-header">
                  <a href="#" class="title" data-bs-toggle="collapse" data-bs-target="#collapse_aside1">
                    Related items
                    <font-awesome-icon :icon="['fas', 'chevron-down']"  />
                  </a>
                </header>
                <div class="collapse show" id="collapse_aside1">
                  <div class="card-body">
                    <ul class="list-group list-group-flush">
                      <li v-for="(item, index) in related_items"
                          class="list-group-item">
                        {{ item.title }}
                      </li>
                    </ul>
                  </div> <!-- card-body.// -->
                </div>
              </article> <!-- filter-group // -->

              <article class="filter-group">
                <header class="card-header">
                  <a href="#" class="title" data-bs-toggle="collapse" data-bs-target="#collapse_aside_brands">
                    Brands
                    <font-awesome-icon :icon="['fas', 'chevron-down']"  />
                  </a>
                </header>
                <div class="collapse show" id="collapse_aside_brands">
                  <div class="card-body">
                    BRANDS
                    <label v-for="(item, index) in brands" class="form-check mb-2">
                      <input v-bind:value='item.replace(/[^0-9]/g,"")' v-model="checkedBrands" class="form-check-input" type="checkbox">
                      <span style="padding-left:4px;padding-top:2.5px;" class="form-check-label"> {{item.replace(/\d/g,'')}} </span>
                      <span style="color:black;background-color:gray;" class="badge rounded-pill bg-gray-dark float-end">{{item.replace(/[a-zA-Zа-яА-Я]/g,"")}}</span>
                    </label> <!-- form-check end.// -->
                  </div>
                </div>
              </article>

              <article class="filter-group">
                <header class="card-header">
                  <a href="#" class="title" data-bs-toggle="collapse" data-bs-target="#collapse_aside2">
                    Price
                    <font-awesome-icon :icon="['fas', 'chevron-down']"  />
                  </a>
                </header>
                <div class="collapse show" id="collapse_aside2">
                  <div class="card-body">
                    <input v-model="price" type="range" class="form-range" min="0" max="10000">
                    <p>{{price}}</p>
                    <div class="row mb-3">
                      <div class="col-6">
                        <label for="min" class="form-label">Min</label>
                        <input class="form-control" id="min" placeholder="0" v-model="price" type="number">
                      </div> <!-- col end.// -->

                      <div class="col-6">
                        <label for="max" class="form-label">Max</label>
                        <input class="form-control" id="max" v-model="maxprice" placeholder="10000" type="number">
                      </div> <!-- col end.// -->
                    </div> <!-- row end.// -->
                  </div> <!-- card-body.// -->
                </div>
              </article> <!-- filter-group // -->

              <article class="border border-top filter-group">

            <button @click="productFilters()" style="width:100%;" class="button-30" role="button">Сохранить</button>
            <button @click="clearFilters()" style="width:100%;" class="button-30" role="button">Очистить фильтры</button>
          </article>
            </div>
          </aside> <!-- col .// -->
          <main class="col-lg-7">
            <header class="d-sm-flex align-items-center border-bottom mb-4 pb-3">

              <strong class="d-block py-2">{{pagination.total}} Items found </strong>
              <div class="ms-auto">
                <div class="btn-group">
                  <a href="#" class="btn btn-light" data-bs-toggle="tooltip" title="" data-bs-original-title="List view">
                    <font-awesome-icon :icon="['fas', 'bars']"  />
                  </a>
                  <a href="#" class="btn btn-light" data-bs-toggle="tooltip" title="" data-bs-original-title="List view">
                    <font-awesome-icon :icon="['fas', 'bars']"  />
                  </a>
                </div> <!-- btn-group end.// -->
              </div>
            </header>

            <!-- ========= content items ========= -->
            <article style="margin-top:20px;" class="card card-product-list" v-for="(item, index) in posts" :key="item.id">
              <div v-if="loading">Загрузка...</div>
              <div class="row">
                <aside class="col-xl-3 col-md-4" v-for="(item1, index) in item.attributesoptions" v-if="item1.attribute_id == 7">
                  <a href="#" class="img-wrap">
                    <img style="height:204px;width:274px;"
                         :src="'http://127.0.0.1:8000/storage/images/HumKE711BtI.jpg'" />
                  </a>
                </aside> <!-- col.// -->
                <div class="col-xl-6 col-md-5 col-sm-7">
                  <div style="padding-top:25px;" class="card-body">
                    <a href="#" class="title h5" v-for="(item1, index) in item.attributesoptions" v-if="item1.attribute_id == 4">{{item1.value | truncate(50)}}</a>

                    <div class="rating-wrap mb-2">
                      <span class="label-rating text-warning">4.5</span>
                      <i class="dot"></i>
                      <span class="label-rating text-muted">154 orders</span>
                    </div> <!-- rating-wrap.// -->
                    <p v-for="(item1, index) in item.attributesoptions" v-if="item1.attribute_id == 5">{{item1.value | truncate(100)}}</p>
                  </div> <!-- card-body.// -->
                </div> <!-- col.// -->
                <aside class="col-xl-3 col-md-3 col-sm-5 border-right">
                  <div style="padding-top:25px;" class="info-aside ">
                    <div class="price-wrap">
                      <span class="price h5">{{Math.round(item.productprice.price)}}</span>
                      <del class="price-old">{{Math.round(item.productprice.old_price)}}</del>
                      <br>
                      <span class="discount">Скидка {{Math.round(item.productprice.discount)}} %</span>
                    </div> <!-- info-price-detail // -->
                    <p class="text-success">Free shipping</p>
                    <br>
                    <div class="mb-3">
                      <a href="#" class="btn btn-primary"> Buy this </a>
                      <a href="#" class="btn btn-light btn-icon border border-dark">  <font-awesome-icon :icon="['fas', 'heart']"  />  </a>
                    </div>
                  </div> <!-- info-aside.// -->
                </aside> <!-- col.// -->
              </div> <!-- row.// -->
            </article>
            <hr>

            <footer v-if="pagination.total >= 10" class="d-flex mt-4">
              <nav aria-label="Page navigation example">
                <ul class="pagination">
                  <li
                      :class="{disabled:!pagination.prev_page_url}"
                      @click="getPosts(pagination.prev_page_url)"
                      class="page-item"><a class="page-link" href="#">
                    Назад
                  </a>
                  </li>

                  <li @click="getPosts(currentUrl + '&page=1' )" class="page-item"><a class="page-link" href="#">1</a></li>
                  <li @click="getPosts(currentUrl + '&page=2' )" class="page-item"><a class="page-link" href="#">2</a></li>
                  <li @click="getPosts(currentUrl + '&page=3' )" class="page-item"><a class="page-link" href="#">3</a></li>

<!--                  <li @click="getPosts('http://127.0.0.1:8000/api/category/1?page=1')" class="page-item"><a class="page-link" href="#">1</a></li>-->
<!--                  <li @click="getPosts('http://127.0.0.1:8000/api/category/1?page=2')"  class="page-item"><a class="page-link" href="#">2</a></li>-->
<!--                  <li @click="getPosts('http://127.0.0.1:8000/api/category/1?page=3')" class="page-item"><a class="page-link" href="#">3</a></li>-->
                  <li
                    :class="{disabled:!pagination.next_page_url}"
                    @click="getPosts(pagination.next_page_url)"
                    class="page-item"><a class="page-link" href="#">Next</a></li>
                  <li class="page-item disabled"><a class="page-link" href="#">
                    {{pagination.current_page}} из {{pagination.last_page}}
                  </a></li>
                </ul>
              </nav>
            </footer>
            <!-- ========= content items .// ========= -->
          </main>
          <main class="col-lg-2">
            <ul class="area_rightNews linkStyle_normal">
              <div style="">
                <br>
                <div class="sidetags" style="clear:both;width:100%">
                  <ul style="font-size:14px;">
                    <li class="sidetag">
                      <a @click="productPrice('pr-in')">+</a>
                      <a href="/tags/-3D" rel="nofollow" title="Удалить из поиска">-</a>
                      <a href="/tags/3D">по цене(возр)</a>
                    </li>
                    <li class="sidetag">
                    <a @click="productPrice('pr-de')">+</a>
                    <a href="/tags/-action" rel="nofollow" title="Удалить из поиска">-</a>
                    <a href="/tags/action">по цене(убыв)</a>
                  </li>
                    <li class="sidetag">
                      <a @click="productSort('new')">+</a>
                    <a href="/tags/-ahegao" rel="nofollow" title="Удалить из поиска">-</a>
                    <a href="/tags/ahegao">новые</a>
                  </li>
                    <li class="sidetag">
                      <a @click="productSort('old')">+</a>
                    <a href="/tags/-ahegao" rel="nofollow" title="Удалить из поиска">-</a>
                    <a href="/tags/ahegao">старые</a>
                  </li>
                    <li class="sidetag">
                      <a @click="productSort('sl')" to="#">+</a>
                    <a href="/tags/-bdsm" rel="nofollow" title="Удалить из поиска">-</a>
                    <a href="/tags/bdsm">по лидерам продаж</a>
                  </li>
                  </ul>
                </div>
                <br>
              </div>

            </ul>
          </main><!-- col .// -->
        </div> <!-- row .// -->

      </div> <!-- container .//  -->
    </section>
  </div>
  </client-only>
</template>

<script>
export default {
  layout : 'customLayout',
  data:() => ({
    posts: [],
    productsFilters : [],
    post: {
      id:'',
      title:'',
      description:'',
    },
    post_id:'',
    pagination:{},
    edit:false,
    loading:false,
    errored:false,
    price : 0,
    checkedBrands : [],
    currentUrl : '',
    related_items : [],
    brands : [],
    maxprice : 0,
  }),
  mounted() {
    this.getPosts()
    this.currentUrl = window.location.href
  },
  methods: {
    getPosts(page_url) {
      if(this.$route.query.br || this.$route.query.pr) {
        if(this.$route.query.search) {
          page_url = page_url || '/api/v1/category/' + '?search=' + this.$route.query.search + '&=100' + '&br=' + this.$route.query.br + '' + '&pr=' + this.$route.query.pr
        }
        else {
          page_url = page_url || '/api/v1/category/'+this.$route.params.id + '?q=100' + '&br=' + this.$route.query.br + '' + '&pr=' + this.$route.query.pr
        }
      }
      if(this.$route.query.o || this.$route.query.s) {
        if(this.$route.query.search) {
          page_url = page_url || '/api/v1/category/' + '?search=' + this.$route.query.search + '&q=100' + '&o=' + this.$route.query.o + '' + '&s=' + this.$route.query.s
        }
        else {
          page_url = page_url || '/api/category/'+this.$route.params.id + '?q=100' + '&o=' + this.$route.query.o + '' + '&s=' + this.$route.query.s
        }
      }
      if (this.$route.query.o || !this.$route.query.s) {
        if(this.$route.query.search) {
          page_url = page_url || '/api/v1/category/' + '?search=' + this.$route.query.search + '&q=100' + '&o=' + this.$route.query.o
        }
        else {
          page_url = page_url || '/api/v1/category/'+this.$route.params.id + '?q=100' + '&o=' + this.$route.query.o
        }
      }
      else {
        page_url = page_url || '/api/v1/category/'+this.$route.params.id + '?q=100'
      }
      console.log(page_url)
      this.$axios.$get(page_url)
      .then(response => {
        this.posts = response.products.data
        this.related_items = response.related_items
        this.brands = response.brands
        // this.productsFilters = response.filters
        this.makePagination(response.products)
      })
      .catch(error => {
        this.errored = true;
      })
      .finally(() => this.loading = false)
    },
    makePagination(response) {
        let pagination = {
          current_page:response.current_page,
          last_page:response.last_page,
          prev_page_url:response.prev_page_url,
          next_page_url:response.next_page_url,
          total:response.total,
        }
        this.pagination = pagination
    },
    productPrice(article) {
      this.$router.push({query:{'o':article}})
      this.reload()
    },
    productSort(article) {
      if(this.$route.query) {
        this.$router.push({query:{'o':this.$route.query.o,'s':article}})
      }
      else {
        this.$router.push({query:{'s':article}})
      }
      this.reload()
    },
    productFilters() {
      let sstr = this.checkedBrands.toString()
      if(this.price == 0 || this.maxprice == 0) {
        this.$router.push({query:{'br':sstr}})
      }
      else {
        this.$router.push({query:{'br':sstr,'pr':this.price,'max':this.maxprice}})
      }
      this.reload()
    },
    clearFilters() {
      this.$router.push({query:{'br':'','pr':'','max':''}})
      setTimeout(this.reload(), 3000);
    },
  },
  filters: {
    truncate: function (text,stop,clamp) {
      return text.slice(0, stop) + (stop < text.length ? clamp || '' : '')
    }
  }

}
</script>

<style scoped>
.button-30 {
  align-items: center;
  appearance: none;
  background-color: #FCFCFD;
  border-radius: 4px;
  border-width: 0;
  box-shadow: rgba(45, 35, 66, 0.4) 0 2px 4px,rgba(45, 35, 66, 0.3) 0 7px 13px -3px,#D6D6E7 0 -3px 0 inset;
  box-sizing: border-box;
  color: #36395A;
  cursor: pointer;
  display: inline-flex;
  font-family: "JetBrains Mono",monospace;
  height: 48px;
  justify-content: center;
  line-height: 1;
  list-style: none;
  overflow: hidden;
  padding-left: 16px;
  padding-right: 16px;
  position: relative;
  text-align: left;
  text-decoration: none;
  transition: box-shadow .15s,transform .15s;
  user-select: none;
  -webkit-user-select: none;
  touch-action: manipulation;
  white-space: nowrap;
  will-change: box-shadow,transform;
  font-size: 18px;
}

.button-30:focus {
  box-shadow: #D6D6E7 0 0 0 1.5px inset, rgba(45, 35, 66, 0.4) 0 2px 4px, rgba(45, 35, 66, 0.3) 0 7px 13px -3px, #D6D6E7 0 -3px 0 inset;
}

.button-30:hover {
  box-shadow: rgba(45, 35, 66, 0.4) 0 4px 8px, rgba(45, 35, 66, 0.3) 0 7px 13px -3px, #D6D6E7 0 -3px 0 inset;
  transform: translateY(-2px);
}

.button-30:active {
  box-shadow: #D6D6E7 0 3px 7px inset;
  transform: translateY(2px);
}
</style>
