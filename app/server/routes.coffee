app.get '/', (req, res) ->
 res.render 'index.jade'

# Catch all error handler
app.use (err, req, res, next) ->
  res.render 'error.jade',
    code: 500
    msg: "There was an internal server error."
    trace: err.stack.toString()

# 404 page
app.get '*', (req, res) ->
  res.render 'error.jade',
    code: 404
    msg: "Page not found."