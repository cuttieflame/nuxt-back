<template>
  <div class="col-md-12">
    <h1>Купоны</h1>
        <form method="POST" @submit.prevent="addCoupon()">
          <div>
            <div class="input-group row">
              <label for="code" class="col-sm-2 col-form-label">Код: </label>
              <div class="col-sm-8">
                <input type="text" class="form-control" name="code" id="code" maxlength="8" v-model="code">
              </div>
            </div>
            <br>
            <div class="input-group row">
              <label for="value" class="col-sm-2 col-form-label">Номинал: </label>
              <div class="col-sm-8">
                <input type="number" class="form-control" name="value" id="value" v-model="nominal_value">
              </div>
            </div>
            <br>
            <div class="input-group row">
              <label for="currency" class="col-sm-2 col-form-label">Валюта: </label>
              <div class="col-sm-8">
                <select name="currency" id="currency" class="form-control" v-model="currency">
                  <option value="0">Без валюты</option>
                  <option value="1">RUB</option>
                  <option value="2">USD</option>
                  <option value="3">EUR</option>
                </select>
              </div>
            </div>
            <br>
            <div class="form-check">
              <label class="form-check-label" for="flexCheckDefault">
                Использовать один раз
              </label>
              <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" v-model="is_only_once">
            </div>
            <div class="form-check">
              <label class="form-check-label" for="flexCheckDefault">
                Абсолютное значение
              </label>
              <input class="form-check-input" type="checkbox" value="" id="absolute" v-model="is_absolute">
            </div>
            <div class="input-group row">
              <label for="expired_at" class="col-sm-2 col-form-label">Использовать до: </label>
              <div class="col-sm-8">
                <input type="date" class="form-control" name="expired_at" id="expired_at" v-model="expired_at">
              </div>
            </div>
            <br>
            <div class="input-group row">
              <label for="description" class="col-sm-2 col-form-label">Описание: </label>
              <div class="col-sm-8">
            <textarea name="description" id="description" cols="72"
                      rows="6" v-model="description"></textarea>
              </div>
            </div>
            <br>
            <button class="btn btn-success">Сохранить</button>
          </div>
        </form>


  <table class="table">
    <tbody>
    <tr>
      <th>#</th>
      <th>Код</th>
      <th>Скидка</th>
      <th>Конец купкона</th>
      <th>Описание</th>
      <th>Кол-во использований</th>
      <th>Действия</th>
    </tr>
    <tr>
      <td>ID</td>
      <td>CODE</td>
      <td>Скидка</td>
      <td>Конец</td>
      <td>DESC</td>
      <td>0</td>
      <td>
        <button class="btn btn-danger"><font-awesome-icon :icon="['fas', 'ban']"  /></button>
        <button class="btn btn-primary"><font-awesome-icon :icon="['fas', 'pencil']"  /></button>
      </td>
    </tr>
    </tbody>
  </table>
  </div>
</template>

<script>
export default {
  layout : 'navDashboard',
  data:() => ({
    code : '',
    coupons : [],
    nominal_value : '',
    currency : '',
    is_only_once : 0,
    is_absolute : 0,
    expired_at : '',
    description : '',
  }),
  mounted() {

  },
  methods: {
    getMyProducts() {
      this.$axios.$get('api/v1/coupons')
          .then(resp=>{
            this.coupons = resp.data
          })
          .catch((err)=>{
            console.log(err)}
          )
    },
    addCoupon() {
      this.$axios.$post('api/v1/coupons/make',{
        code : this.code,
        nominal_value : this.nominal_value,
        currency : Number(this.currency),
        is_only_once : this.is_only_once,
        is_absolute : this.is_absolute,
        expired_at : this.expired_at,
        description : this.description
      })
    },
  }
  }
</script>