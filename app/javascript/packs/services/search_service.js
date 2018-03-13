export default {
    search (address,cb) {

        axios.post('/dashboard/search.json', {
            address: address
        })
            .then(response =>
                //todo: check success == true
                cb(response.data.data)
            )
            .catch(e => {
                alert(e)
            })

    }
}