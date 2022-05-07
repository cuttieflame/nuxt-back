<template>
  <div>

    <div class="form-group">
    <button class="btn btn-secondary" @click="addProduct()">Подключиться к чату</button>
  </div>
    <div class="form-group">
      <input style="width:150px;" type="text" v-model="message">
      <button class="btn btn-success" @click="sendMessage(message)">Отправить</button>
      <p v-for="(item, index) in centr">
        {{item}}
      </p>
    </div>
  </div>
</template>


<script>

import Centrifuge from "centrifuge";

export default {
  layout : 'customLayout',
  data:() => ({
    centr : [],
    message : '',
    name : ''
  }),
  methods: {
    sendMessage(message) {
      let Centrifuge = require("centrifuge");

      let centrifuge = new Centrifuge('ws://localhost:8081/connection/websocket')
      centrifuge.setToken('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIyODI4MiIsImV4cCI6MTY0OTI2NTM1Nn0.cgXJqm0_kzYttdNmixBd-2mJQOqF8h5ejL2B2MLnFbY');
      let th = this
      let ctrf = centrifuge.subscribe("news", function(message) {
      });

      ctrf.publish({"input": message}).then(function() {
        // success ack from Centrifugo received
      }, function(err) {
        console.log(err)
      });

      centrifuge.connect();
    },
    addProduct () {
      let Centrifuge = require("centrifuge");
      // let SockJS = require('sockjs-client');

      let centrifuge = new Centrifuge('ws://localhost:8081/connection/websocket')

      centrifuge.setToken('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIyODI4MiIsImV4cCI6MTY0OTI2NTM1Nn0.cgXJqm0_kzYttdNmixBd-2mJQOqF8h5ejL2B2MLnFbY');
      let th = this

      centrifuge.subscribe("news", function(message) {
        th.centr.push(message.data);
      });

      centrifuge.connect();

    },
  },

}
</script>
