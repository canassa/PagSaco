
exports.checkout = (req, res) ->
    if req.body.email != 'ok' or req.body.token != 'ok'
        res.send 401

    res.send 200
    # charset = req.get('content-type').split(';')[1].split('=')[1]
    # console.log charset

    # console.log req.is 'application/x-www-form-urlencoded'
    # console.log req.is 'application/xml'

    # res.render 'index', title: 'PagSaco'

