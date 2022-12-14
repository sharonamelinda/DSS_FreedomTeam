fetch("./data.txt").then(function(response) {
  return response
}).then(function(data) {
 return data.text()
}).then(function(Normal) {
 document.getElementById("app").innerHTML = Normal;
}).catch(function(err) {
 console.log('Fetch problem show: ' + err.message);
});