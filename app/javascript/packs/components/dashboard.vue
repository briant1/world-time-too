<template>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div v-for="city in cities" class="col-md-6">
                <div class="card mt-3">
                    <div class="card-body">
                        <div class="dark bold" >
                            {{city.name}}
                            <a :href="city.wikipedia_url">
                                <i class="fab fa-wikipedia-w"></i>
                            </a>
                        </div>
                        <div class="light" >

                            <i class="fas fa-map-marker"></i>
                            {{city.lat}},
                            {{city.lng}}
                        </div>
                        <div class="mt-3">
                            <i class="fas fa-moon" v-show="city.has_dst"></i>
                            {{city.current_time | moment("dddd, MMMM Do YYYY, h:mm:ss a")}}
                        </div>
                    </div>
                    <div class="card-footer">
                        {{city.country.name}}
                        <a :href="city.country.wikipedia_url">
                            <i class="fab fa-wikipedia-w"></i>
                        </a>
                    </div>
                </div>
            </div>
            <div v-if="cities.length == 0" class="dark bold center mt-5">
                Search for some cities!
            </div>
        </div>
    </div>
</template>

<script>

    import favoriteService from '../services/favorite_service'

    export default {
        name: 'dashboard',
        data: function(){
            return {
                cities: []
            }
        },
        mounted() {
            this.fetchData()
        },
        watch: {
            '$route': function() {
                this.fetchData()
            }
        },
        methods: {
            displayFavorites: function(results) {
                this.cities = results
            },
            fetchData: function(){
                favoriteService.getFavoriteCities(this.displayFavorites)
            }
        }
    }
</script>

