app.controller('VideosController', function (get, $routeParams, ytService){
	Videos = this;
	Videos.id_disciplina = $routeParams.id_disciplina;
	Videos.id_assunto = $routeParams.id_assunto;
		
	get.disciplinas()
	.success(function(result){

		Videos.Disciplinas = result.Disciplines;

		Videos.Disciplina = 
		_.find(Videos.Disciplinas, function(disciplinas){ return disciplinas.Id == Videos.id_disciplina; });

    	Videos.Assunto =
    	 _.find(Videos.Disciplina.Subjects, function(subject){ return subject.Id == Videos.id_assunto; });

		Videos.query = Videos.Disciplina.Name + ' ' + Videos.Assunto.Name;
		ytService.consultar(Videos.query)
		.success(function(data){
			Videos.items = data.items;
		});
	})

});