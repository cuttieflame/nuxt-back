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
              <form @submit.prevent="vkAuth">
                  <a @click="vkAuth()">
                  <svg  xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
                       width="60" height="60"
                       viewBox="0 0 30 30"
                       style=" fill:#000000;">    <path d="M15,3C8.373,3,3,8.373,3,15c0,6.627,5.373,12,12,12s12-5.373,12-12C27,8.373,21.627,3,15,3z M21.361,18.967l-1.868,0.026 c0,0-0.403,0.079-0.93-0.285c-0.699-0.48-1.358-1.729-1.872-1.567c-0.521,0.166-0.505,1.29-0.505,1.29s0.004,0.198-0.115,0.327 c-0.129,0.139-0.382,0.125-0.382,0.125h-0.837c0,0-1.846,0.153-3.473-1.543c-1.772-1.849-3.338-5.498-3.338-5.498 s-0.092-0.23,0.006-0.348c0.111-0.13,0.41-0.134,0.41-0.134l2-0.01c0,0,0.188,0.033,0.324,0.133 c0.111,0.082,0.174,0.236,0.174,0.236s0.323,0.819,0.752,1.561c0.836,1.446,1.224,1.763,1.508,1.608 c0.414-0.226,0.29-2.044,0.29-2.044s0.008-0.66-0.208-0.954c-0.168-0.229-0.484-0.297-0.622-0.314 c-0.113-0.015,0.071-0.277,0.311-0.395c0.36-0.176,0.996-0.186,1.747-0.179c0.585,0.006,0.754,0.042,0.982,0.098 c0.69,0.167,0.456,0.811,0.456,2.356c0,0.495-0.089,1.191,0.267,1.42c0.154,0.099,0.529,0.015,1.464-1.579 c0.445-0.756,0.778-1.644,0.778-1.644s0.073-0.158,0.186-0.226c0.116-0.07,0.272-0.048,0.272-0.048l2.105-0.013 c0,0,0.632-0.076,0.735,0.211c0.108,0.3-0.236,1.001-1.096,2.148c-1.412,1.884-1.569,1.709-0.396,2.799 c1.12,1.041,1.351,1.547,1.39,1.611C22.339,18.906,21.361,18.967,21.361,18.967z"></path>
                  </svg>
                  </a>
              </form>
         </div>
            <div class="row px-3 mb-4">
              <div class="line"></div> <small class="or text-center">Or</small>
              <div class="line"></div>
            </div>
            <form @submit.prevent="login">
              <div class="row px-3"> <label class="mb-1">
                <h6 class="mb-0 text-sm">Email</h6>
              </label> <input type="email" v-model="form.email" class="mb-4 form-control form-control-lg" /> </div>
              <div class="row px-3"> <label class="mb-1">
                <h6 class="mb-0 text-sm">Password</h6>
              </label> <input type="password" v-model="form.password" class="mb-4 form-control form-control-lg" /> </div>
              <div class="row mb-3 px-3"> <button type="submit" class="btn btn-blue text-center">Login</button> </div>
            </form>
            <div class="row mb-4 px-3"> <small class="font-weight-bold">Do you have an account?
              <NuxtLink to="/auth/register" style="color:red;">
              Register
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
    title: '',
    meta: [
      { hid: 'description', name: 'description', content: 'Login page' }
    ],
  },
  data:() => ({
    form: {
      email: '',
      password: ''
    },
    errors: ''
  }),
  methods: {
    vkAuth() {
      try {
        this.$auth.loginWith('social')
      } catch(err) {
        console.log(err)
      }
    },
    async login() {
      try {
           await this.$auth.loginWith('laravelSanctum', {data:this.form}).then(res => {
             let user = res.data.data.user
             this.$auth.$storage.setUniversal('user', user, true)

             user = this.$auth.$storage.getUniversal('user')
             console.log(user)

           })

      } catch (err) {

      }
    },

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
  width: 50px;
  height: 50px;
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

