$(document).ready(function () {

//revisa si la contraseña tiene minimo 8 caracateres y es texto y numero
$("#contra").keyup(function(){

    var regx_pass = /\S+[0-9]/;
    var pass_input = $(this).val();
    if (regx_pass.test(pass_input)){
        if($(this).val().lenght >= 8 && $(this).val().lenght <=50){
            $("#pass_status").text("Valido");
            $("#pass_status").removeClass("text-danger");
        }
        else{
            $("#pass_status").addClass("text-danger");
            $("#pass_status").text("Invalido");
        }
        

    }
        else{
            $("#pass_status").addClass("text-danger");
            $("#pass_status").text("Invalido.");
        }    



});


});