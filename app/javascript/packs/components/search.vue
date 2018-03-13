<template>
    <div class="container mt-5" >
        <div v-show="!isLoading">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <input type="text" class="w-100"  v-model="address" v-on:keyup.enter="search" />
                    <div class="btn btn-primary mt-3 w-100" @click="search">
                        search
                    </div>
                </div>
            </div>
            <search-results v-for="(result, results) in results"
                            v-bind:geoLoc="result">

            </search-results>
        </div>
        <div class="row justify-content-center mt-5" v-show="isLoading">
            <i class="fas fa-spinner fa-pulse fa-5x" ></i>
        </div>
    </div>


</template>

<script>

    import searchService from '../services/search_service'
    import searchResults from '../components/search_results.vue'

    export default {

        name: 'dashboard',
        components: {searchResults},
        data: function(){
            return {
                address: '',
                isLoading: true,
                results: []
            }
        },
        mounted() {
          this.isLoading = false
        },
        methods: {
            search: function () {
                this.isLoading = true
                searchService.search(this.address,this.displaySearchResults)
            },
            displaySearchResults: function(results) {
                this.isLoading = false
                this.results = results
            }
        }
    }
</script>

