import Vue from 'vue';
import { StripeCheckout } from '@vue-stripe/vue-stripe';

Vue.use(StripeCheckout)
Vue.component('stripe-checkout', StripeCheckout)
