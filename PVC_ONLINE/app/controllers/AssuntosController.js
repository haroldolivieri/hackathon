app.controller('AssuntosController', function (get, ytService, $routeParams){
	Assunto = this;
	Assunto.id = Assunto.id_disciplina = $routeParams.id;
	get.disciplinas()
	.success(function(result){
		Assunto.Disciplinas = result.Disciplines;
		Assunto.listarAssuntos = _.find(Assunto.Disciplinas, function(disciplinas){ return disciplinas.Id == Assunto.id; }).Subjects;
		Assunto.listarEventos = _.find(Assunto.Disciplinas, function(disciplinas){ return disciplinas.Id == Assunto.id; }).Events;
	})

	Assunto.Show = function (AssuntoSelected){
		console.log(AssuntoSelected);
		Assunto.getNameDisciplina = _.find(Assunto.Disciplinas, function(disciplinas){ return disciplinas.Id == Assunto.id; }).Name;
		Assunto.query = Assunto.getNameDisciplina + ' ' + AssuntoSelected.Name;
		ytService.consultar(Assunto.query)
		.success(function(data){
			Assunto.videos = data.items;
			console.log(Assunto.videos);
		})
	}
});