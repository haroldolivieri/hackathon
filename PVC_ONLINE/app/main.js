app = angular.module('PVC',['ngRoute']);
//Configuração de Rotas
app.config(function ($routeProvider, $locationProvider){
   $routeProvider 
   .when('/disciplinas', {
      templateUrl : 'app/views/disciplinas.html',
      controller  : 'DisciplinasController',
   })
   .when('/disciplinas/:id', {
      templateUrl : 'app/views/assuntos.html',
      controller  : 'AssuntosController',
   })
   .when('/videos/:id_disciplina/:id_assunto', {
      templateUrl : 'app/views/videos.html',
      controller  : 'VideosController',
   })
   .when('/video/:id', {
      templateUrl : 'app/views/video.html',
      controller  : 'VideoController',
   })
 
   // caso não seja nenhum desses, redirecione para a rota '/'
   .otherwise ({ redirectTo: '/disciplinas' });
});