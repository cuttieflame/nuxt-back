<template>
  <div>

    <hr class="mt-0 mb-4">
    <div class="row">
      <div class="col-xl-4">
        <!-- Profile picture card-->
        <div class="card mb-4 mb-xl-0">
          <div class="card-header">Profile Picture</div>
          <div class="card-body text-center">
            <!-- Profile picture image-->
            <div class="d-flex justify-content-center">
              <p v-if="is_update == 1">Ваша фотографии скоро обновится</p>
            <img class="img-account-profile rounded-circle mb-2" v-if="user.user_image" v-bind:src="this.image + user.user_image" alt="">
            </div>
            <!-- Profile picture help block-->
            <div class="small font-italic text-muted mb-4">JPG or PNG no larger than 5 MB</div>
            <!-- Profile picture upload button-->
            <input class="btn btn-primary" id="file" ref="file" type="file" v-on:change="updateImage()">
          </div>
        </div>
      </div>
      <div class="col-xl-8">
        <!-- Account details card-->
        <div class="card mb-4">
          <div class="card-header">Account Details</div>
          <div class="card-body">
            <form>
              <!-- Form Group (username)-->
              <validation-user-account-errors v-if="validationErrors" :errors="validationErrors" />
              <div class="mb-3">
                <label class="small mb-1" for="name">Username (how your name will appear to other users on the site) </label>
                <input class="form-control" id="name" type="text" placeholder="Enter your username" v-model="user.name">
              </div>
              <!-- Form Row-->
              <div class="row gx-3 mb-3">
                <!-- Form Group (first name)-->
                <div class="col-md-6">
                  <label class="small mb-1" for="first_name">First name</label>
                  <input class="form-control" id="first_name" type="text" placeholder="Enter your first name" v-model="user.first_name">
                </div>
                <!-- Form Group (last name)-->
                <div class="col-md-6">
                  <label class="small mb-1" for="last_name">Last name</label>
                  <input class="form-control" id="last_name" type="text" placeholder="Enter your last name" v-model="user.last_name">
                </div>
              </div>
              <!-- Form Row        -->
              <div class="row gx-3 mb-3">
                <!-- Form Group (organization name)-->
                <div class="col-md-6">
                  <label class="small mb-1" for="organization">Organization name</label>
                  <input class="form-control" id="organization" type="text" placeholder="Enter your organization name" v-model="user.organization">
                </div>
                <!-- Form Group (location)-->
                <div class="col-md-6">
                  <label class="small mb-1" for="location">Location</label>
                  <input class="form-control" id="location" type="text" placeholder="Enter your location" v-model="user.location">
                </div>
              </div>
              <!-- Form Group (email address)-->
              <div class="mb-3">
                <label class="small mb-1" for="email">Email address</label>
                <input class="form-control" id="email" type="email" placeholder="Enter your email address" v-model="user.email">
              </div>
              <!-- Form Row-->
              <div class="row gx-3 mb-3">
                <!-- Form Group (phone number)-->
                <div class="col-md-6">
                  <label class="small mb-1" for="phone">Phone number</label>
                  <input class="form-control" id="phone" type="tel" placeholder="Enter your phone number" v-model="user.phone">
                </div>
                <!-- Form Group (birthday)-->
                <div class="col-md-6">
                  <label class="small mb-1" for="birthday">Birthday</label>
                  <input class="form-control" id="birthday" type="date" name="birthday" placeholder="Enter your birthday" v-model="user.birthday">
                </div>
              </div>
              <!-- Save changes button-->
              <button class="btn btn-primary" @click="editUser(user.id)" type="button">Save changes</button>
              <button class="btn btn-danger" @click="deleteUser(user.id)">Delete</button>
            </form>

          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import ValidationUserAccountErrors from "../../components/ValidationUserAccountErrors";
export default {
  components: {ValidationUserAccountErrors},
  layout : 'navDashboard',
  data:() => ({
    user: [],
    image : "http://127.0.0.1:8000/storage/images/",
    errors:{},
    file : '',
    files : '',
    userId : '',
    validationErrors:'',
    is_update : 0,
  }),
  mounted() {
    setTimeout(()=>{
      this.getUser()
    },3000);
  },
  methods: {
    async getUser() {
     await this.$axios.$get('/api/v1/user/')
        .then(resp=>{
          this.user = resp.data
        })
        .catch((err)=>{})
    },
    editUser(id) {
      this.$axios.$put(`/api/v1/user/update/${id}`,{
          name : this.user.name,
          email : this.user.email,
          first_name : this.user.first_name,
          last_name : this.user.last_name,
          organization : this.user.organization,
          location : this.user.location,
          phone : this.user.phone,
          birthday : this.user.birthday,
      })
        .catch(error => {
          this.validationErrors = error.response.data.errors || {};
        })
      this.getUser();
    },
    updateImage() {
      this.userId = this.user.id
      this.file = this.$refs.file.files[0];
      let formData = new FormData();
      formData.append('file', this.file);
      this.$axios.$post( `/api/v1/user/updateImage/${this.userId}`,
          formData,
          {
            headers: {
              'Content-Type': 'multipart/form-data'
            }
        })
          .then((resp) => {
            this.is_update = 1
          })
    },
    deleteUser(id) {
      this.$axios.$delete(`/api/v1/user/destroy/${id}`)
    },


  }
}
</script>

