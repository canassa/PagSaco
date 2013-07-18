
exports.checkout = (req, res) ->
    if req.body.email != 'ok' or req.body.token != 'ok'
        res.send 401

    res.render 'checkout'
