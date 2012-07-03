function sendPostRequest() {
    req = new XMLHttpRequest();
    req.open("POST", 'http://pr.aiit.ac.jp/pv', true);
    req.setRequestHeader('Content-Type', 'application/json');
    req.setRequestHeader('Accept', 'application/json');
    req.withCredentials = true;
    req.onreadystatechange = function(event) {
	if(req.readyState === 4) {
	    if(req.status === 200) {
		console.log('status code : ' + request.status);
		console.log('response text : ' + request.responseText);
	    } else {
		console.log("Error", req.statusText);
	    }
	}
    };

    body = JSON.stringify({
	title: document.title,
    });
    req.send(body);
    return req;
}

request = sendPostRequest();
