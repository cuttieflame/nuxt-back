<template>
  <div>
    <hr class="mt-0 mb-4">
    <div class="row" v-for="item in billing">
      <div class="col-lg-4 mb-4">
        <!-- Billing card 1-->
        <div class="card h-100 border-start-lg border-start-primary">
          <div class="card-body">
            <div class="small text-muted">Current monthly bill</div>
            <div class="h3">{{item.characteristics.amount}}</div>
            <a class="text-arrow-icon small" href="#!">
              Switch to yearly billing
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-right"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg>
            </a>
          </div>
        </div>
      </div>
      <div class="col-lg-4 mb-4">
        <!-- Billing card 2-->
        <div class="card h-100 border-start-lg border-start-secondary">
          <div class="card-body">
            <div class="small text-muted">Next payment due</div>
            <div class="h3">{{item.billing_history.end_subscription}}</div>
            <a class="text-arrow-icon small text-secondary" href="#!">
              View payment history
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-right"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg>
            </a>
          </div>
        </div>
      </div>
      <div class="col-lg-4 mb-4">
        <!-- Billing card 3-->
        <div class="card h-100 border-start-lg border-start-success">
          <div class="card-body">
            <div class="small text-muted">Current plan</div>
            <div class="h3 d-flex align-items-center">{{item.characteristics.name}}</div>
            <a class="text-arrow-icon small text-success" href="#!">
              Upgrade plan
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-right"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg>
            </a>
          </div>
        </div>
      </div>
    </div>
    <!-- Payment methods card-->
    <div class="card card-header-actions mb-4">
      <div class="card-header">
        Payment Methods
        <button class="btn btn-sm btn-primary" type="button">Add Payment Method</button>
      </div>
      <div class="card-body px-0">
        <div class="d-flex align-items-center justify-content-between px-4" v-for="item in payments">
          <div class="d-flex align-items-center">
            <i class="fab fa-cc-mastercard fa-2x cc-color-mastercard"></i>
            <div class="ms-4">
              <div class="small">Mastercard ending in {{item.last4}}</div>
              <div class="text-xs text-muted">Expires {{item.exp_year}}</div>
            </div>
          </div>
          <div class="ms-4 small">
            <a class="text-muted me-3" href="#!">Make Default</a>
            <a href="#!">Edit</a>
          </div>
        </div>
        <hr>
      </div>
    </div>
    <!-- Billing history card-->
    <div class="card mb-4">
      <div class="card-header">Billing History</div>
      <div class="card-body p-0">
        <!-- Billing history table-->
        <div class="table-responsive table-billing-history">
          <table class="table mb-0">
            <thead>
            <tr>
              <th class="border-gray-200" scope="col">Transaction ID</th>
              <th class="border-gray-200" scope="col">Dat/th>
              <th class="border-gray-200" scope="col">Amount</th>
              <th class="border-gray-200" scope="col">Status</th>
            </tr>
            </thead>
            <tbody>
            <tr v-for="item in billing">
              <td>{{item.billing_history.transaction_id}}</td>
              <td>start-{{item.billing_history.start_subscription}}
              end-{{item.billing_history.end_subscription}}
              </td>
              <td>{{item.billing_history.amount}} - {{item.billing_history.currency}}</td>
              <td>
                <span class="badge bg-light text-dark" v-if="item.billing_history.status == true">paid</span>
                <span class="badge bg-light text-dark" v-else>not paid</span>
              </td>
            </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  layout : 'navDashboard',
  data:() => ({
    billing : [],
    payments : [],
  }),
  mounted() {
    this.getProducts()
  },
  methods: {
    getProducts() {
      this.$axios.$get(`/api/v1/user/subscriptions`)
          .then((resp) => {
            this.billing = resp[0].data
            this.payments = resp[1]
          })
          .catch((err) => {console.log(err)})
    },

  },
}
</script>


