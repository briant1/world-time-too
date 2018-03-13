<template>
    <div class="row mt-3">
        <div class="col-8">
            <div class="dark bold">
                {{geoLoc.country_code}}
            </div>
            <div>
                {{geoLoc.city}},
                {{geoLoc.state}}
            </div>
            <div class="light" >
                <i class="fas fa-map-marker"></i>
                {{geoLoc.lat}},
                {{geoLoc.lng}}
            </div>
        </div>
        <div class="col-4 right">
            <button class="btn btn-primary" @click="favorite">
                Favorite
            </button>
        </div>
    </div>

</template>

<script>

    import searchService from '../services/search_service'
    import favoriteService from '../services/favorite_service'

    export default {

        props: ['geoLoc'],
        data: function(){
            return {
            }
        },
        methods: {
            favorite: function(){
                favoriteService.create(this.geoLoc, this.createCallback)
            },
            createCallback: function(){
                this.$modal.show('dialog', {
                    title: 'Saved successfully',
                    text: 'Good job!'})
            }
        }
    }
</script>

