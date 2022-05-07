<template>
  <div id="app">
  <section class="header-main bg-light">
    <div class="container">
      <div class="row gy-3 align-items-center">
        <div class="col-lg-2 col-sm-4 col-4">
          <NuxtLink to="/" style="color:black;" class="btn">
            Home <font-awesome-icon :icon="['fas', 'cube']"  />
          </NuxtLink>
        </div>
        <div class="order-lg-last col-lg-5 col-sm-8 col-8">
          <div class="float-end">
            <template v-if="this.$auth.loggedIn">
              <NuxtLink to="/dashboard/" style="color:black;" class="btn">
                Profile <font-awesome-icon :icon="['fas', 'user']"  />
              </NuxtLink>
                <a href="#" @click.prevent="logout">Logout <font-awesome-icon :icon="['fas', 'bug']"  /></a>
            </template>
            <template v-else>
              <NuxtLink to="/auth/login" style="color:black;" class="btn">
                Sign In <font-awesome-icon :icon="['fas', 'user']"  />
              </NuxtLink>
            </template>

            <NuxtLink to="/my/favorites" class="btn btn-light">
              Wishlist <font-awesome-icon :icon="['fas', 'heart']"  />
            </NuxtLink>

            <NuxtLink to="/cart" class="btn btn-light">
              Корзина <font-awesome-icon :icon="['fas', 'cart-plus']"  />
            </NuxtLink>
          </div>
        </div> <!-- col end.// -->
        <div class="col-lg-5 col-md-12 col-12">
          <form class="">
            <div class="input-group">
              <input type="text" class="form-control" style="width:55%" v-model="searchData" placeholder="Search">
              <button @click.prevent="search()" type="submit" style="height:49px;margin-top:1.5px;" class="btn btn-info">
                <svg class="h-6 w-6 text-black"  fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"/>
                </svg>
              </button>
            </div> <!-- input-group end.// -->
          </form>
        </div> <!-- col end.// -->

      </div> <!-- row end.// -->
    </div> <!-- container end.// -->
  </section>
  </div>
</template>

<script>
export default {
  data:() => ({
    searchData : '',
  }),
  methods: {
    logout() {
      this.$auth.$storage.removeUniversal('user')
      this.$auth.logout()
    },
    debounce(callee, timeoutMs) {
      // Как результат возвращаем другую функцию.
      // Это нужно, чтобы мы могли не менять другие части кода,
      // чуть позже мы увидим, как это помогает.
      return function perform(...args) {
        // В переменной previousCall мы будем хранить
        // временную метку предыдущего вызова...
        let previousCall = this.lastCall;

        // ...а в переменной текущего вызова —
        // временную метку нынешнего момента.
        this.lastCall = Date.now();

        // Нам это будет нужно, чтобы потом сравнить,
        // когда была функция вызвана в этот раз и в предыдущий.
        // Если разница между вызовами меньше, чем указанный интервал,
        // то мы очищаем таймаут...
        if (previousCall && this.lastCall - previousCall <= timeoutMs) {
          clearTimeout(this.lastCallTimer);
        }

        // ...который отвечает за непосредственно вызов функции-аргумента.
        // Обратите внимание, что мы передаём все аргументы ...args,
        // который получаем в функции perform —
        // это тоже нужно, чтобы нам не приходилось менять другие части кода.
        this.lastCallTimer = setTimeout(() => callee(...args), timeoutMs);

        // Если таймаут был очищен, вызова не произойдёт;
        // если он очищен не был, то callee вызовется.
        // Таким образом мы как бы «отодвигаем» вызов callee
        // до тех пор, пока «снаружи всё не подуспокоится».
      };
    },
    search() {
        if(typeof(this.$route.query.search) == "undefined") {
          this.$router.push({ path: '/category/', query: { search: this.searchData } })
        }
        else {
          this.$router.push({ query: { search: this.searchData } })
          this.reload()
        }
    }
  }
}
</script>


