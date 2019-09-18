console.log("displayTime Module..........................................");

var displayTimeService = (function() {
	function displayTime(timeValue) {
		var today = new Date();
		var gap = today.getTime() - timeValue;
		var dateObj = new Date(timeValue);
		var str = "";
		
		var yy = dateObj.getFullYear();
		var mm = dateObj.getMonth() + 1;
		var dd = dateObj.getDate();
		return [ yy, '-', (mm > 9 ? '' : '0') + mm, '-',
				(dd > 9 ? '' : '0') + dd ].join('');

	}// end displayTime

	return {
		displayTime : displayTime
	};
})();