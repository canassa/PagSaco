app = require('../app').app

chai = require('chai')
chaiHttp = require('chai-http');
parseXML = require('xml2js').parseString


chai.use chaiHttp
request = chai.request
expect = chai.expect


describe 'POST /v2/checkout', () ->
    it 'should return a HTTP 401 if the credentials are not provided', (done) ->
        request(app)
            .post('/v2/checkout')
            .res (res) ->
                expect(res).to.have.status 401
                expect(res.text).to.be.equal 'Unauthorized'
                done()

    it 'should return a HTTP 401 if the credentials are invalid', (done) ->
        params =
            email: 'invalid'
            token: 'invalid'

        request(app)
            .post('/v2/checkout')
            .req (req) ->
                req.send params
            .res (res) ->
                expect(res).to.have.status 401
                expect(res.text).to.be.equal 'Unauthorized'
                done()

    it 'should return a HTTP 200 if the credentials are valid', (done) ->
        params =
            email: 'ok'
            token: 'ok'
            currency: 'BRL'
            itemId1: '0001'
            itemDescription1: 'PHP Developer'
            itemAmount1: '100.00'
            itemQuantity1: '1'

        request(app)
            .post('/v2/checkout')
            .req (req) ->
                req.send params
            .res (res) ->
                expect(res).to.have.status 200
                done()

    it 'should return a valid XML', (done) ->
        params =
            email: 'ok'
            token: 'ok'
            currency: 'BRL'
            itemId1: '0001'
            itemDescription1: 'PHP Developer'
            itemAmount1: '100.00'
            itemQuantity1: '1'

        request(app)
            .post('/v2/checkout')
            .req (req) ->
                req.send params
            .res (res) ->
                expect(res).to.have.status 200

                parseXML res.text, (err, res) ->
                    expect(err).to.be.null
                    done()
