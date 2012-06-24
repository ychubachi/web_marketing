function sendPostRequest() {
    url = 'http://pr.aiit.ac.jp/pv';
    console.log('url : ' + url)
    
    body = JSON.stringify({
	title: document.title,
	URL: document.URL,
	cookie: document.cookie
    });

    req = new XMLHttpRequest();
    req.open("POST", url, false);
    req.setRequestHeader('Content-Type', 'application/json');
    req.setRequestHeader('Accept', 'application/json');

    req.send(body);
    return req;
}

request = sendPostRequest();
console.log('status code : ' + request.status);
console.log('response text : ' + request.responseText);
