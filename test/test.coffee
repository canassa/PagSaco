assert = require 'assert'
app = require('../app').app
request = require 'supertest'


describe 'POST /v2/checkout', () ->
    it 'should return a 401 if the credentials are not provided', (done) ->
        request(app)
            .post('/v2/checkout')
            .expect('Unauthorized')
            .expect(401, done)
