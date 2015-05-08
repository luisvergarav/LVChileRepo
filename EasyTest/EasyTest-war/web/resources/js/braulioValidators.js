/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
	$(document).ready(function () {
		var validator = $("#registroForm").bootstrapValidator({
			feedbackIcons: {
				valid: "glyphicon glyphicon-ok",
				invalid: "glyphicon glyphicon-remove", 
				validating: "glyphicon glyphicon-refresh"
			}, 
			fields : {
				nombre : {
					validators: {
						notEmpty : {
							message : "El nombre es requerido"
						},
						stringLength : {
							min : 3,
							max: 30,
							message:  "El nombre debe contener entre 3 y 30 caracteres"
						}, 
					}
				},

				apellido : {
					validators: {
						notEmpty : {
							message : "El apellido es requerido"
						},
						stringLength : {
							min : 3,
							max: 30,
							message:  "El apellido debe contener entre 3 y 30 caracteres"
						}, 
					}
				},	


				email :{
					message : "Email es requerido",
					validators : {
						notEmpty : {
							message : "Por favor ingrese un email"
						}, 
						stringLength: {
							min : 6, 
							max: 35,
							message: "Email debe contener entre 6 and 35 caracteres"
						},
						emailAddress: {
							message: "Email invalido"
						}
					}
				}, 

				dpbox_sexo : {
					validators : {
						greaterThan : {
							value: 1,
							message: "Una compañia es requerida"
						}
					}
				}
			}
		});
	
		validator.on("success.form.bv", function (e) {
			e.preventDefault();
			$("#registroForm").addClass("hidden");
			$("#confirmation").removeClass("hidden");
		});
		
	});

