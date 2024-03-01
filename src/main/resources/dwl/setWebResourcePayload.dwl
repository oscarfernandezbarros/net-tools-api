%dw 2.0
output text/plain
import substringAfterLast from dw::core::Strings
import * from dw::Runtime

var ignoreFiles = p("ignoreFiles") splitBy ","
var uriPath = attributes.requestPath			
var path = if ("/" == uriPath) 
     "web/index.html"
    else 
    "web" ++ uriPath

---
if (ignoreFiles contains substringAfterLast(uriPath, "/"))
    null
else
	try(() -> readUrl("classpath://" ++ path, "text/plain")) orElse  "Resource not found."
    