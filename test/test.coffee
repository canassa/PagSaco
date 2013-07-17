assert = require 'assert'
app = require('../app').app
request = require 'supertest'


describe 'POST /v2/checkout', () ->
    it 'respond with json', (done) ->
        request(app)
            .post('/v2/checkout')
            .set('Accept', 'application/json')
            .expect('Content-Type', /text\/html/)
            .expect(200, done)
