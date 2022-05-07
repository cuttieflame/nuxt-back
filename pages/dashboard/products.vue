<template>
  <div>
    <div class="card mb-4">
      <div class="card-body">
        <!-- Grid row -->
        <div class="row">
          <!-- Grid column -->
          <div class="col-md-12">
            <h2 class="pt-3 pb-4 text-center font-bold font-up deep-purple-text">Search within table</h2>
            <div class="input-group md-form form-sm form-2 pl-0">
              <input class="form-control my-0 py-1 pl-3 purple-border" type="text" placeholder="Search something here..." aria-label="Search">
              <span class="input-group-addon waves-effect purple lighten-2" id="basic-addon1"><a>
                <font-awesome-icon :icon="['fas', 'pencil']"  /></a></span>
            </div>
          </div>
        </div>
        <div class="container">
          <div class="table-responsive">
            <table class="table custom-table">
              <thead>
              <tr>
              <th>#</th>
                <th>Name</th>
                <th>Content</th>
                <th>
                  <div class="form-check">
                    <input class="form-check-input" type="radio" v-bind:value="0" v-model="new_price" name="flexRadioDefault" id="flexRadioDefault1">
                    <label style="font-size:12px; !important;"  class="form-check-label" for="flexRadioDefault1">
                      цена(возр)
                    </label>
                  </div>
                  <div class="form-check">
                    <input class="form-check-input" type="radio" v-bind:value="1" v-model="new_price" name="flexRadioDefault" id="flexRadioDefault2" checked>
                    <label style="font-size:12px; !important;" class="form-check-label" for="flexRadioDefault2">
                      цена(убыв)
                    </label>
                  </div>
                  Price
                </th>
                <th>
                  <div class="form-check">
                    <input class="form-check-input" type="radio" v-bind:value="0" v-model="old_price" name="flexRadioDefault" id="flexRadioDefault3">
                    <label style="font-size:12px; !important;" class="form-check-label" for="flexRadioDefault3">
                      цена(возр)
                    </label>
                  </div>
                  <div class="form-check">
                    <input class="form-check-input" type="radio" v-bind:value="1" v-model="old_price" name="flexRadioDefault" id="flexRadioDefault4" checked>
                    <label style="font-size:12px; !important;" class="form-check-label" for="flexRadioDefault4">
                      цена(убыв)
                    </label>
                  </div>
                  Old price
                </th>
                <th>Actions</th>
              </tr>
              </thead>
              <tbody>
              <tr v-if="products" v-for="(item, index) in products">
                  <th scope="row"><input class="form-check-input" type="checkbox" v-bind:value="item.id" id="flexCheckDefault" v-model="checked"></th>
                  <td  v-for="(item1, index) in item.attributesoptions" v-if="item1.attribute_id == 4">{{item1.value | truncate(40)}}</td>
                  <td  v-for="(item1, index) in item.attributesoptions" v-if="item1.attribute_id == 5">{{item1.value | truncate(40)}}</td>
                  <td>{{item.productprice.price}}</td>
                  <td>{{item.productprice.old_price}}</td>
                  <td>
                    <button class="btn btn-danger"><font-awesome-icon :icon="['fas', 'ban']"  /></button>
                    <button class="btn btn-primary"><font-awesome-icon :icon="['fas', 'pencil']"  /></button>
                    <button class="btn btn-secondary"><font-awesome-icon :icon="['fas', 'eye']"  /></button>
                  </td>
                </tr>
              </tbody>
            </table>
            <button class="btn btn-danger" @click="deleteProducts()">Удалить</button>
            <button class="btn btn-success" @click="deleteProducts()">Сохранить</button>
          </div>
        </div>
      </div>
    </div>


  </div>
</template>

<script>
export default {
  layout : 'navDashboard',
  data:() => ({
    products: [],
    errors:{},
    checked : [],
    new_price : '',
    old_price : '',
  }),
  mounted() {
    this.getMyProducts(this.$auth.$storage.getUniversal('user').data.id)
  },
  methods: {
    getMyProducts(id) {
      let page_url = ''
      if (this.$route.query.cp) {
        page_url = page_url || `api/v1/product/${id}` + '?t=dsh' + '&cp=' + this.new_price
      }
      if (this.$route.query.op) {
        page_url = page_url || `api/v1/product/${id}` + '?t=dsh' + '&op=' + this.old_price
      }
      if (this.$route.query.cp || this.$route.query.op) {
        page_url = page_url || `api/v1/product/${id}` + '?t=dsh' + '&cp=' + this.new_price + '&op=' + this.old_price
      }
      else {
        page_url = page_url || `/api/v1/product/${id}` + '?t=dsh'
      }
      this.$axios.$get(page_url)
        .then(resp=>{
          this.products = resp.product
        })
        .catch((err)=>{
          console.log(err)}
        )
    },
    deleteProducts() {
      let sstr = this.checked.toString()
      this.$axios.$post('api/v1/products/delete' + '?pr=' + sstr)
      this.reload()
    },
    filterProducts() {
      this.$router.push({query:{'cp':this.new_price,'op':this.old_price}})
      this.reload()
    }
  },
  filters: {
    truncate: function (text,stop,clamp) {
      return text.slice(0, stop) + (stop < text.length ? clamp || '' : '')
    }
  }
}
</script>

<style>
.hm-gradient {
  background-image: linear-gradient(to top, #f3e7e9 0%, #e3eeff 99%, #e3eeff 100%);
}
.darken-grey-text {
  color: #2E2E2E;
}
.input-group.md-form.form-sm.form-2 input {
  border: 1px solid #bdbdbd;
  border-top-left-radius: 0.25rem;
  border-bottom-left-radius: 0.25rem;
}
.input-group.md-form.form-sm.form-2 input.purple-border {
  border: 1px solid #9e9e9e;
}
.input-group.md-form.form-sm.form-2 input[type=text]:focus:not([readonly]).purple-border {
  border: 1px solid #ba68c8;
  box-shadow: none;
}
.form-2 .input-group-addon {
  border: 1px solid #ba68c8;
}
.danger-text {
  color: #ff3547;
}
.success-text {
  color: #00C851;
}
.table-bordered.red-border, .table-bordered.red-border th, .table-bordered.red-border td {
  border: 1px solid #ff3547!important;
}
.table.table-bordered th {
  text-align: center;
}
</style>
