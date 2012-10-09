var mainURL = "http://127.0.0.1:3000"

/*var jsPlugins = ["jquery.min"];

for(var idx in jsPlugins) {
	var plugin = jsPlugins[idx]+".js";
	
	var headID = document.getElementsByTagName("head")[0];
	var jsPlugin = document.createElement("script");
	jsPlugin.type = "text/javascript";
	jsPlugin.src = parentURL + plugin;
	document.lastChild.firstChild.appendChild(jsPlugin);
}*/

// Add the div to which the container will be appended
var container = document.createElement('div');
container.id="discoteca-catalogo";
document.body.appendChild(container);

// append JS styles
var css = document.createElement('link');
css.type = 'text/css';
css.rel = "stylesheet";
css.media = "all";
css.href = mainURL+"/assets/externals.css";
document.getElementsByTagName("head")[0].appendChild(css);

// avoid conflicts with other libraries
var jQQ = jQuery.noConflict();
jQQ.get(mainURL+'/catalogs.js', {type: 'mini'}, function(data) {
	console.log(data);
	eval(data);
}, 'text');	


