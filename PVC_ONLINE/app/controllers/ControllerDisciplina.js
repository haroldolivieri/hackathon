app.controller('DisciplinasController', function(get, $interval){
	Disciplina = this;
	get.disciplinas()
	.success(function(result){
		Disciplina.result = result.Disciplines;
	});

	
	$interval(function(){
		var rand = Math.floor(Math.random() * 10,2);
		
		if (Disciplina.result[rand]) {
			console.log(Disciplina.result[rand].Name);
			Disciplina.label = Disciplina.result[rand].Name;
			
		}

	},3000);

	Disciplina.listDisciplina = function(assuntos){
		Disciplina.assuntos = assuntos;	
	}
});