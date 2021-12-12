/* INFORMATION */

// 1xx
const informational = {
  100: 'Continue',              // client should continue it's process
  101: 'Switching Protocols', 
  102: 'Processing',
}

// 2xx 
const success = {
  200: 'OK',                    // the request has succeeded. GET, POST
  201: 'Created',               // the request has created, POST or PUT
  202: 'Accepted',              // the request has been accepted for processing
  204: 'No Content',            // the server has fullfilled the request but does not return an entity-body
}

// 3xx
const redirection = {
  304: 'Not Modified',          // GET request performed and access allowed but the document has not been modified
}

/* ERRORS */

// 4xx
const clientError = {
  400: 'Bad Request',           // the request could not be understood by the server due to malformed syntax
  401: 'Unauthorized',          // the request requeires user authentication such as creating content or posting a picture
  403: 'Foribidden',            // the server understood the request, but is refusing the fullfill it
  404: 'Not Found',             // the server has not found anything matching the request
  405: 'Method Not Allowed',    // the method specified in the Request-Line is not allowed for the resource identified by the Request-URI
  409: "Conflict"               // the request could not be completed due to conflict with the current state
}

// 5xx
const serverError = {
  500: 'Internal Server Error', // the server encountered an unexpected condition which prevented it from fullfilling the request
  501: 'Not Implemented',       // the server does not support the functionality required to fullfill the request
  502: 'Bad Gateway',           // the server, while acting as a gateway or proxy, received an invalid response from the upstream server it accessed in attempting to fullfill the request
  503: 'Service Unavailable',   // the server is currently unable to handle the request due to temporary overloading or maintenance of the server.
                                // NOTE: the existence of the 503 status code does not imply that a server must use it whne becoming overloading. some servers may wish to simply refuse the connection 
  504: 'Gateway Timeout',       // the server, while acting as a gateway or proxy, did not received a timely response from the upstream server specified by the URI. (eg. HTTP, FTP)
}

module.exports = {informational, success, redirection, clientError, serverError}
