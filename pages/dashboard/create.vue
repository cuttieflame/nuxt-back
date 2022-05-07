<template>
    <div>
      <client-only>
      <div>
        <validation-user-account-errors v-if="validationErrors" :errors="validationErrors" />
        <div class="card mt-2 mx-auto p-2 bg-light">
          <div class="card-body bg-light">
            <div class="container">
              <form  method="POST" @submit.prevent="addProduct()" enctype="multipart/form-data">
                <div class="controls">
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="name">Название продукта</label>
                        <input id="name" type="text" name="name" class="form-control" placeholder="Please enter your firstname *" v-model="name">
                      </div>
                    </div>
                    <div class="col-md-2">
                      <div class="form-group">
                        <label for="price_id">Цена(в рублях)</label>
                        <input type="number" id="price_id" placeholder="price" v-model="price">
                      </div>
                    </div>
                    <div class="col-md-2">
                      <div>
                        <vue-multiselect v-model="value1" :options="categories" :multiple="true" :close-on-select="false" :clear-on-select="false" :preserve-search="true" placeholder="Pick" label="name" track-by="name" :preselect-first="true">
                          <template slot="selection" slot-scope="{ values, search, isOpen }"><span class="multiselect__single" v-if="values.length &amp;&amp; !isOpen">{{ values.length }} options selected</span></template>
                        </vue-multiselect>
                      </div>
                    </div>
                    <div class="col-md-2">
                      <div>
                        <vue-multiselect v-model="value2" :options="brands" :multiple="true" :close-on-select="false" :clear-on-select="false" :preserve-search="true" placeholder="Pick some" label="name" track-by="name" :preselect-first="true">
                          <template slot="selection" slot-scope="{ values, search, isOpen }"><span class="multiselect__single" v-if="values.length &amp;&amp; !isOpen">{{ values.length }} options selected</span></template>
                        </vue-multiselect>
                      </div>
                    </div>
                  </div>

                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label for="content">Content *</label>
                        <textarea id="content" name="message" class="form-control" placeholder="Write your message here." rows="4" v-model="content"></textarea>
                      </div>
                    </div>

                      <div class="col-md-12">
                        <div class="form-group">
                          <label for="tags">Tags </label>
                          <input id="tags" name="tags" class="form-control" placeholder="Write your message here." v-model="tags">
                        </div>
                      </div>

                    <div class="col-md-12">
                      <div class="form-group">
                        <label>Основное изображение(будет изображаться на главной странице)</label>
                        <input type="file" class="form-control-file" id="file" ref="file" v-on:change="handleFileUpload">
                      </div>
                    </div>
                    <div class="col-md-12">
                      <h2>Эти изображения будут в карточке продукта</h2>
                      <div style="margin-top:-20px;">
                            <label></label>
                            <input multiple type="file" id="files" ref="files">
                      </div>
                      <div v-if="images.length > 0">
                        <table class="table">
                          <thead>
                          <tr>
                            <th scope="col">id</th>
                            <th scope="col">name</th>
                            <th scope="col">edit</th>
                            <th scope="col">delete</th>
                          </tr>
                          </thead>
                          <tbody>
                          <tr v-for="(item, index) in images" :key="item.id">
                            <th scope="row">index</th>
                            <td>{{item}}</td>
                            <td>edit</td>
                            <td>delete</td>
                          </tr>
                          </tbody>
                        </table>
                      </div>
                    </div>
                    <div class="col-md-12">
                      <button type="submit" class="btn btn-success">Сохранить</button>
                    </div>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div> <!-- /.8 -->
      </div>
      </client-only>
    </div>
</template>

<script>
import NavBarMain from "../../components/NavBarMain";
import ValidationUserAccountErrors from "../../components/ValidationUserAccountErrors";
export default {
  components: {ValidationUserAccountErrors},
  layout : 'navDashboard',
    data:() => ({

      categories : [],
      value1: [],
      value2: [],
      arr1 : [],
      arr2 : [],
      checked : [],
      brands : [],
      tags : [],
      name: '',
      price : '',
      content : '',
      main_image : '',
      images : [],
      errored : false,
      pr_id : '',
      validationErrors : '',
    }),
  mounted() {
    this.$axios.$get('/api/v1/brands_categories/')
      .then(resp=>{
        this.categories = resp.crct.categories
        this.brands = resp.crct.brands
      })
      .catch((err)=>{
        this.errored = true
      })
  },
  methods: {
    handleFileUpload(){
      this.main_image = this.$refs.file.files[0];
    },
    handleFilesUploaded(id){
      let th = this;
      Array.from(this.$refs.images[0].files).map(function(key,value) {
        th.images.push(key.name);
      });
      console.log(this.images)
    },
    nameWithLang ({ name, language }) {
      return `${name} — [${language}]`
    },
    async addProduct () {
      this.file = this.$refs.file.files[0];
      this.files = this.$refs.files.files;
      let formData = new FormData();
      formData.append('file', this.file);
      for( let i = 0; i < this.files.length; i++ ){
        let file = this.files[i];
        formData.append('files[' + i + ']', file);
      }
      let th = this
      this.value1.forEach(function(elem) {
        th.arr1.push(elem.id);
      });
      this.value2.forEach(function(elem1) {
        th.arr2.push(elem1.id);
      });
      const config = { 'content-type': 'multipart/form-data' }
       this.$axios.$post('/api/v1/products/create',{
        price : Number(this.price),
        name : this.name,
        content : this.content,
        brand : th.arr2.toString(),
        category : th.arr2.toString(),
        tags : this.tags,
        main_image : this.main_image.name,
        images : ['123']
      }).then(response => (
         this.uploadProductImage(response.product_id)
      )).catch(error => {
         this.validationErrors = error.response.data.errors || {};
       })
    },
    uploadProductImage(id) {
      this.file = this.$refs.file.files[0];
      this.files = this.$refs.files.files;
      let formData = new FormData();
      formData.append('file', this.file);
      for( let i = 0; i < this.files.length; i++ ){
        let file = this.files[i];
        formData.append('files[' + i + ']', file);
      }
      this.$axios.$post( `/api/v1/products/image/${id}`,
          formData,
          {
            headers: {
              'Content-Type': 'multipart/form-data'
            }
          })
    },

  }
}
</script>

<style>
h1 {
  margin-bottom: 40px
}

label {
  color: #333
}

.btn-send {
  font-weight: 300;
  text-transform: uppercase;
  letter-spacing: 0.2em;
  width: 80%;
  margin-left: 3px
}

.help-block.with-errors {
  color: #ff5050;
  margin-top: 5px
}

.card {
  margin-left: 10px;
  margin-right: 10px
}

</style>
