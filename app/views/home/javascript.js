function sendPostRequest() {
    console.log('cookie : ' + document.cookie);

    uuid = "";
    key = "web_marketing_uuid=";
    i = 0;
    cookie_array = document.cookie.split("; ");
    while(cookie_array[i]) {
	console.log(cookie_array[i]);
	if(cookie_array[i].substr(0, key.length) == key) {
	    uuid = cookie_array[i].substr(key.length, cookie_array[i].length);
	    break;
	}
	i++;
    }
    console.log(uuid);
    
    body = JSON.stringify({
	title: document.title,
	uuid: uuid
    });

    req = new XMLHttpRequest();
    req.open("POST", 'http://pr.aiit.ac.jp/pv', false);
    req.setRequestHeader('Content-Type', 'application/json');
    req.setRequestHeader('Accept', 'application/json');

    req.send(body);
    return req;
}

request = sendPostRequest();
console.log('status code : ' + request.status);
console.log('response text : ' + request.responseText);
