app.factory('get', ['$http' , function ($http) {
	var get = {};
	get.addEstados = function(data){
		var url = 'http://pvc.dev/hackatonDescomplica/dados.json';
		return $http({
			url:url,
		    method: 'POST',
		    data : $.param({data: data}),
		    headers: {'Content-Type': 'application/x-www-form-urlencoded'}
		});
	} 
	get.disciplinas = function(){
		var url = 'http://pvc.dev/hackatonDescomplica/disciplinas.json';
    	return $http.get(url);
	}

	return get;
}]);