<template>
  <div>
  <NavBarMain />
    <client-only>
  <div class="container-xl px-4 mt-4">
    <!-- Account page navigation-->
    <nav class="nav nav-borders">
      <NuxtLink to="/dashboard" style="color:black;" class="btn">
        Profile
      </NuxtLink>
      <NuxtLink to="/dashboard/billing" style="color:black;" class="btn">
        Billing
      </NuxtLink>
      <NuxtLink to="/dashboard/security" style="color:black;" class="btn">
        Security
      </NuxtLink>
      <NuxtLink to="/dashboard/notifications" style="color:black;" class="btn">
        Notifications
      </NuxtLink>
      <NuxtLink v-if="is_admin == 1" to="/dashboard/create" style="color:black;" class="btn">
        Создать продукт
      </NuxtLink>
      <NuxtLink v-if="is_admin == 1" to="/dashboard/coupon" style="color:black;" class="btn">
        Создать купон
      </NuxtLink>
      <NuxtLink to='/dashboard/products/' style="color:black;" class="btn">
        Мои товары
      </NuxtLink>
      <NuxtLink to='/dashboard/subscription/' style="color:black;" class="btn">
        Подписки
      </NuxtLink>
    </nav>

    <Nuxt />

  </div>
    </client-only>
  </div>
</template>

<script>
import NavBarMain from "../components/NavBarMain";
export default {
  components: {NavBarMain},
  data:() => ({
    roles : [],
    is_admin : 0,
    is_user : 0,
  }),
  computed: {
    user() {
      return this.$auth.$storage.getUniversal('user').data
    },
  },
  mounted() {
    this.getRolesAndPermission()
  },
  methods: {
    getRolesAndPermission() {
      let arr = this.$auth.$storage.getUniversal('user').data.role_user
      let th = this
      arr.forEach((value, index) => {
        if(value.roles.slug == 'admin') {
          th.is_admin = 1
        }
        if(value.roles.slug == 'user') {
          th.is_user = 1
        }
      });
    }
  }
}
</script>
<style>
.img-account-profile {
  height: 10rem;
}
.rounded-circle {
  border-radius: 50% !important;
}
.card {
  box-shadow: 0 0.15rem 1.75rem 0 rgb(33 40 50 / 15%);
}
.card .card-header {
  font-weight: 500;
}
.card-header:first-child {
  border-radius: 0.35rem 0.35rem 0 0;
}
.card-header {
  padding: 1rem 1.35rem;
  margin-bottom: 0;
  background-color: rgba(33, 40, 50, 0.03);
  border-bottom: 1px solid rgba(33, 40, 50, 0.125);
}
.form-control, .dataTable-input {
  display: block;
  width: 100%;
  padding: 0.875rem 1.125rem;
  font-size: 0.875rem;
  font-weight: 400;
  line-height: 1;
  color: #69707a;
  background-color: #fff;
  background-clip: padding-box;
  border: 1px solid #c5ccd6;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  border-radius: 0.35rem;
  transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}

.nav-borders .nav-link.active {
  color: #0061f2;
  border-bottom-color: #0061f2;
}
.nav-borders .nav-link {
  color: #69707a;
  border-bottom-width: 0.125rem;
  border-bottom-style: solid;
  border-bottom-color: transparent;
  padding-top: 0.5rem;
  padding-bottom: 0.5rem;
  padding-left: 0;
  padding-right: 0;
  margin-left: 1rem;
  margin-right: 1rem;
}
</style>
