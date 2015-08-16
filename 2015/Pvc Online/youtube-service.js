app.factory('ytService', ['$http' , function ($http) {
	var ytService = {};
	ytService.consultar = function(query){
		var key = "AIzaSyAjpw5Brs9n_VOG0xXlYmXsDXdgJmO4y0Y";
		var query = encodeURI(query);
		var url = "https://www.googleapis.com/youtube/v3/search?part=snippet&order=viewCount&q="+query+"&type=video&videoDefinition=high&key="+key;
    	return $http.get(url);
	}

	return ytService;
}]);