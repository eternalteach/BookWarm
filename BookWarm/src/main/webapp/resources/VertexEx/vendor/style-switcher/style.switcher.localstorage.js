
if (typeof localStorage !== "undefined") {
	if (localStorage.getItem('skin.css') !== null && !document.querySelector('html').hasAttribute('data-style-switcher-options')) {

		var css = localStorage.getItem('skin.css'),
		    head = document.head || document.getElementsByTagName('head')[0],
		    style = document.createElement('style');

		style.type = 'text/css';
		if (style.styleSheet) {
		    style.styleSheet.cssText = css;
		} else {
		    style.appendChild(document.createTextNode(css));
		}

		head.appendChild(style);

	}

	if (localStorage.getItem('layout') !== null && !document.querySelector('html').hasAttribute('data-style-switcher-options')) {

		if (localStorage.getItem('layout') == 'boxed-layout') {
         document.querySelector('html').className += ' ' +'boxed';
      }
      if (localStorage.getItem('layout') == 'boxed-layout-2') {
         document.querySelector('html').className += ' ' + 'boxed v2';
      }
   }

   if (localStorage.getItem('menuDrapdownColor') !== null) {
      if (localStorage.getItem('menuDrapdownColor') == 'menu-dropdown-color-dark') {
         var m = window.document.getElementsByClassName('l-navbar')[0];
         m.className += ' ' + 'l-navbar_black_dropdown';
      } 
   }
}