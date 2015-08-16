app.controller('VideoController', function ($routeParams,$sce){
	Video = this;
	Video.id = $routeParams.id;
	Video.url = $sce.trustAsResourceUrl("http://www.youtube.com/embed/"+ Video.id +"?autoplay=1"); 
});