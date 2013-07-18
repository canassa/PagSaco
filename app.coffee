express = require 'express'
routes = require './routes'
http = require 'http'
path = require 'path'
jade = require 'jade'

jade.doctypes.xml = '<?xml version="1.0" encoding="ISO-8859-1" standalone="yes"?>';

app = exports.app = express()

# all environments
app.set 'port', process.env.PORT or 3000
app.set 'views', __dirname + '/views'
app.set 'view engine', 'jade'
app.use express.favicon()
app.use express.logger('dev')
app.use express.bodyParser()
app.use express.methodOverride()
app.use app.router
app.use require('stylus').middleware(__dirname + '/public')
app.use express.static path.join(__dirname, 'public')

# development only
if 'development' == app.get 'env'
    app.use express.errorHandler()

app.post '/v2/checkout', routes.checkout

http.createServer(app).listen app.get('port'), () ->
    console.log 'Express server listening on port ' + app.get('port')
