<template>
  <div>
    <div class="d-flex flex-column">
      <div class="p-2">
        <stripe-checkout
            ref="checkoutRef"
            :pk="publishableKey"
            :sessionId="oneTimeId"
        />
        <button class="btn btn-primary" @click="submit">Pay now!</button>
      </div>
      <div class="p-2">
        <stripe-checkout
            ref="checkoutSubRef"
            :pk="publishableKey"
            :sessionId="sessionSubId"
        />
        <button class="btn btn-primary" @click="submitSub">Subscription!</button>
      </div>

    </div>
  </div>
</template>

<script>
export default {
  layout : 'navDashboard',
  data:() => ({
    cancelurl:"http://localhost:3000/dashboard/subscription/",
    loading: false,
    oneTimeId : null,
    sessionSubId : null,
    publishableKey : "pk_test_51KmxFhLfaQqcaRmQ8LnvXrZxApFd80nLwk5kD7pqXQcfMP9bSfM3pVK3XX4l1nkchTyu6J1GF6tmifqVGTF8GSxG00p4hNfWr7",
    lineItems: [],
    // successURL: 'your-success-url',
    // cancelURL: 'your-cancel-url',
  }),
  mounted() {
    this.getProducts()
  },
  methods: {
    async getProducts() {
      this.$axios.$get('/api/v1/stripe')
          .then((res) => {
            console.log(res)
            this.oneTimeId = res.check.id
            this.sessionSubId = res.sub.id
          })
          .catch((err) => {
            console.log(err)
          })
    },
    submit () {
      this.$refs.checkoutRef.redirectToCheckout();
    },
    submitSub() {
      this.$refs.checkoutSubRef.redirectToCheckout();
    }
  }
}
</script>