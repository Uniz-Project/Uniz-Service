console.log("Uniz Module......")

var unizService = (function(){

	function post(url, params, callback, error) {
		$.ajaxSettings.traditional = true;
		$.ajax({
			type : 'post',
			url : url,
			dataType : 'json',
			data : params,
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			success : function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		})
	}

	function register(params, callback, error) {
		post("/uniz/register", params, callback, error);
	};

	function registLike(params, callback, error) {
		post("/uniz/mylike", params, callback, error);
	};

	function registDislike(params, callback, error) {
		post("/uniz/mydislike", params, callback, error);
	};

	function feedPositive(params, callback, error) {
		post("/uniz/positiveFeed", params, callback, error);
	};

	function feedNegative(params, callback, error) {
		post("/uniz/negativeFeed", params, callback, error);
	};

	function feedRecovery(params, callback, error) {
		post("/uniz/recoverFeed", params, callback, error);
	};

	function getPreset(params, callback, error) {
		getJson("/uniz/getPreset", params, callback, error);
	};

	function getUnitags(params, callback, error) {
		getJson("/uniz/getUnitags", params, callback, error);
	};

	function getJson(url, params, callback, error) {
		$.getJSON(url, params,
				function(data) {
					if(callback) {
						callback(data);
					}
				}
			).fail(function(xhr, status, err) {
				if (error) {
					error();
				}
			});
	}

	function displayTime(timeValue) {
		let today = new Date();
		let gap = today.getTime() - timeValue;
		let dateObj = new Date(timeValue);
		let str = "";

		if (gap < (1000 * 60 * 60 *24)) {
			let hh = dateObj.getHours();
			let mi = dateObj.getMinutes();
			let ss = dateObj.getSeconds();

			return [ (hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi, ':', (ss > 9 ? '' : '0') + ss].join('');
		} else {
			let yy = dateObj.getFullYear();
			let mm = dateObj.getMonth() + 1;
			let dd = dateObj.getDate();

			return [ yy, '/', (mm > 9 ? '' : '0') + mm, '/', (dd > 9 ? '' : '0') + dd ].join('');
		}

	}

	return {
		post: post,
		register: register,
		registLike: registLike,
		registDislike: registDislike,
		feedPositive: feedPositive,
		feedNegative: feedNegative,
		feedRecovery: feedRecovery,
		getJson: getJson,
		getPreset : getPreset,
		getUnitags : getUnitags,
		displayTime : displayTime
	};
})();