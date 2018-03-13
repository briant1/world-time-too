export default {
    create (favoriteData,cb) {

        axios.post('/favorites.json', {
            favorite: favoriteData
        })
            .then(response =>
                cb(response.data)
            )
            .catch(e => {
                alert(e)
            })

    },
    getFavoriteCities (cb) {

        axios.get('/favorite_cities.json')
            .then(response =>
                cb(response.data.data)
            )
            .catch(e => {
                alert(e)
            })

    }
}