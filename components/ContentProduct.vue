<template>
  <div>
    <template>
    <ul  class="nav nav-tabs card-header-tabs">
        <li class="nav-item"  v-for="(item3, index2) in items.name_attributes" :key="item3.id">
            <a href="#" :data-bs-target="'#tab_' + index2" data-bs-toggle="tab" class="nav-link" :class="{ 'active': index2 == 0 }">
              {{item3.name}}
            </a>
        </li>
    </ul>
    <div class="tab-content">
      <article class="tab-pane show card-body" v-for="(item3, index4) in items.attribute_info" :key="item3.id" :id="'tab_' + index4" :class="{ 'active': index4 == 0 }">
        <p>{{item3.text}}</p>
        <ul class="list-check cols-two">
          <li>Norm </li>
        </ul>
        <table class="table border table-hover">
          <tbody>
          <tr v-for="(item4, index5) in item3.more_info" :key="item4.id">
            <th>  {{item4.name}}: </th> <td> {{item4.text}} </td>
          </tr>
<!--          <tr>-->
<!--            <th>  Processor capacity: </th> <td> 2.3GHz dual-core Intel Core i5 </td>-->
<!--          </tr>-->
<!--          <tr>-->
<!--            <th>  Camera quality: </th> <td>720p FaceTime HD camera  </td>-->
<!--          </tr>-->
<!--          <tr>-->
<!--            <th>  Memory </th> <td> 8 GB RAM or 16 GB RAM </td>-->
<!--          </tr>-->
<!--          <tr>-->
<!--            <th>  Graphics </th> <td> Intel Iris Plus Graphics 640 </td>-->
<!--          </tr>-->
          </tbody></table>
      </article> <!-- tab-content.// -->
    </div>
    </template>
  </div>
</template>

<script>
export default {
  props : ['items'],

}
</script>
