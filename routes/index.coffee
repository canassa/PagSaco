
exports.checkout = (req, res) ->
    # charset = req.get('content-type').split(';')[1].split('=')[1]
    # console.log charset

    console.log req.is 'application/x-www-form-urlencoded'
    console.log req.is 'application/xml'

    res.render 'index', title: 'PagSaco'
