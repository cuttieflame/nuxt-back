<template>
  <div class="container-fluid px-1 px-md-5 px-lg-1 px-xl-5 py-5 mx-auto">
    <div class="card card0 border-0">
      <div class="row d-flex">
        <div class="col-lg-6">
          <div class="card1 pb-5">
            <div class="row"> <img src="https://i.imgur.com/CXQmsmF.png" class="logo"> </div>
            <div class="row px-3 justify-content-center mt-4 mb-5 border-line"> <img src="https://i.imgur.com/uNGdWHi.png" class="image"> </div>
          </div>
        </div>
        <div class="col-lg-6">
          <div class="card2 card border-0 px-4 py-5">
            <div class="row mb-4 px-3">
              <h6 class="mb-0 mr-4 mt-2">Sign in with</h6>
              <div class="facebook text-center mr-3">
                <div class="fa fa-facebook"></div>
              </div>
              <div class="twitter text-center mr-3">
                <div class="fa fa-twitter"></div>
              </div>
              <div class="linkedin text-center mr-3">
                <div class="fa fa-linkedin"></div>
              </div>
            </div>
            <div class="row px-3 mb-4">
              <div class="line"></div> <small class="or text-center">Or</small>
              <div class="line"></div>
            </div>
            <form @submit.prevent="register">
              <div class="row px-3"> <label class="mb-1">
                <h6 class="mb-0 text-sm">Name</h6>
              </label>  <input type="text" v-model="form.name" class="mb-4 form-control form-control-lg" /> </div>
              <div class="row px-3"> <label class="mb-1">
                <h6 class="mb-0 text-sm">Email</h6>
              </label> <input type="email" v-model="form.email" class="mb-4 form-control form-control-lg" /> </div>
              <div class="row px-3"> <label class="mb-1">
                <h6 class="mb-0 text-sm">Password</h6>
              </label> <input type="password" v-model="form.password" class="mb-4 form-control form-control-lg" /> </div>
              <div class="row px-3"> <label class="mb-1">
                <h6 class="mb-0 text-sm">Confirm Password</h6>
              </label>  <input type="password" v-model="form.password_confirmation" class="mb-4 form-control form-control-lg" />
              </div>
              <div class="row mb-3 px-3"> <button type="submit" class="btn btn-blue text-center">Login</button> </div>
            </form>
            <div class="row mb-4 px-3"> <small class="font-weight-bold">
              <NuxtLink to="/auth/login" style="color:red;">
                Login
              </NuxtLink>
            </small> </div>
          </div>
        </div>
      </div>
      <div class="bg-blue py-4">
        <div class="row px-3"> <small class="ml-4 ml-sm-5 mb-2">Copyright &copy; 2019. All rights reserved.</small>
          <div class="social-contact ml-4 ml-sm-auto"> <span class="fa fa-facebook mr-4 text-sm"></span> <span class="fa fa-google-plus mr-4 text-sm"></span> <span class="fa fa-linkedin mr-4 text-sm"></span> <span class="fa fa-twitter mr-4 mr-sm-5 text-sm"></span> </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
  export default {
  layout : 'customLayout',
  head: {
  title: ' | Register',
  meta: [
{ hid: 'description', name: 'description', content: 'Registration page' }
  ],
},
  data: ()=> ({
  form: {
  name: '',
  email: '',
  password: '',
  password_confirmation: '',
},
  errors: [],
}),
  methods: {
  async register() {
  try {
  let errors = []
  await this.$axios.$get('sanctum/csrf-cookie')
  await this.$axios.$post('/register', this.form)
  .then((resp) => {})
  .catch((err) => {
})
  this.errors = errors
  await this.$auth.loginWith('laravelSanctum', {data: this.form})
} catch (error) {}
}
}
}
</script>
<style >
.card0 {
  box-shadow: 0px 4px 8px 0px #757575;
  border-radius: 0px
}

.card2 {
  margin: 0px 40px
}

.logo {
  width: 200px;
  height: 100px;
  margin-top: 20px;
  margin-left: 35px
}

.image {
  width: 360px;
  height: 280px
}

.border-line {
  border-right: 1px solid #EEEEEE
}

.facebook {
  background-color: #3b5998;
  color: #fff;
  font-size: 18px;
  padding-top: 5px;
  border-radius: 50%;
  width: 35px;
  height: 35px;
  cursor: pointer
}

.twitter {
  background-color: #1DA1F2;
  color: #fff;
  font-size: 18px;
  padding-top: 5px;
  border-radius: 50%;
  width: 35px;
  height: 35px;
  cursor: pointer
}

.linkedin {
  background-color: #2867B2;
  color: #fff;
  font-size: 18px;
  padding-top: 5px;
  border-radius: 50%;
  width: 35px;
  height: 35px;
  cursor: pointer
}

.line {
  height: 1px;
  width: 45%;
  background-color: #E0E0E0;
  margin-top: 10px
}

.or {
  width: 10%;
  font-weight: bold
}

.text-sm {
  font-size: 14px !important
}

::placeholder {
  color: #BDBDBD;
  opacity: 1;
  font-weight: 300
}

:-ms-input-placeholder {
  color: #BDBDBD;
  font-weight: 300
}

::-ms-input-placeholder {
  color: #BDBDBD;
  font-weight: 300
}

input,
textarea {
  padding: 10px 12px 10px 12px;
  border: 1px solid lightgrey;
  border-radius: 2px;
  margin-bottom: 5px;
  margin-top: 2px;
  width: 100%;
  box-sizing: border-box;
  color: #2C3E50;
  font-size: 14px;
  letter-spacing: 1px
}

input:focus,
textarea:focus {
  -moz-box-shadow: none !important;
  -webkit-box-shadow: none !important;
  box-shadow: none !important;
  border: 1px solid #304FFE;
  outline-width: 0
}

button:focus {
  -moz-box-shadow: none !important;
  -webkit-box-shadow: none !important;
  box-shadow: none !important;
  outline-width: 0
}

a {
  color: inherit;
  cursor: pointer
}

.btn-blue {
  background-color: #1A237E;
  width: 150px;
  color: #fff;
  border-radius: 2px
}

.btn-blue:hover {
  background-color: #000;
  cursor: pointer
}

.bg-blue {
  color: #fff;
  background-color: #1A237E
}

@media screen and (max-width: 991px) {
  .logo {
    margin-left: 0px
  }

  .image {
    width: 300px;
    height: 220px
  }

  .border-line {
    border-right: none
  }

  .card2 {
    border-top: 1px solid #EEEEEE !important;
    margin: 0px 15px
  }
}
</style>

