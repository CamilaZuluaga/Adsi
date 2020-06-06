function loginUser(){
	var datoslogin = $('#formLogin').serialize();
	$.ajax({
		url: '../control/controlLogin.php',
		type: 'POST',
		data: datoslogin,
	})
	.done(function(respuesta){
		$('#resultado').html(respuesta);
		console.log(respuesta);
		respuesta = parseInt(respuesta);
		switch(respuesta){
			case 1:
				window.location = "../index.php";
			break;
			case 2:
				window.location = "../cliente.php";
			break;
			default:
				$('#resultado').html(respuesta);
			break;
		}
	})