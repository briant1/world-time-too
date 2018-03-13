<template>
    <div >
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-6 center">
                    <router-link to="/dashboard">
                        <i class="fas fa-chart-line"></i>
                        dashboard
                    </router-link>
                </div>
                <div class="col-6 center">
                    <router-link to="/dashboard/search">
                        <i class="fas fa-search"></i>
                        search
                    </router-link>

                </div>
            </div>
        </div>

        <router-view />

        <v-dialog/>
    </div>


</template>

<script>

    import VModal from 'vue-js-modal'

    export default {
        name: 'app',
        components: {VModal}
    }
</script>
