<?php 



 ?>

<script type="text/javascript" src="../js/usuario.js?rev=<?php echo time(); ?>"></script>
 <div class="col-md-12">
	<div class="box box-warning box-solid">
		<div class="box-header with-border">
		  <h3 class="box-title">Bienvenido al contenido del usuariooo</h3>

		  <div class="box-tools pull-right">
		    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
		    </button>
		  </div>
		  <!-- /.box-tools -->
		</div>
		<!-- /.box-header -->
		<div class="box-body">

			<div class="form-group">
				
				<div class="col-lg-10">
					<div class="input-group">
						<input type="text" class="global_filter form-control" id="global_filter" placeholder="ingresar dato a buscar">
						<span class="input-group-addon"><i class="fa fa-search"></i></span>
					</div>
				</div>
				<div class="col-lg-2">
					<button class="btn btn-danger" style="width:100%" onclick="AbrirModalRegistro()"><i class="glyphicon glyphicon-plus" ></i>Nuevo registro</button>
				</div>
			</div>

			<table id="tabla_usuario" class="display responsive nowrap" style="width:100%">
				<thead>
					<tr>
						<th>#</th>
						<th>Usuario</th>
						<th>Rol</th>
						<th>Sexo</th>
						<th>Estatus</th>
						<th>Accion</th>
					</tr>
				</thead>

				<tfoot>
					<tr>
						<th>#</th>
						<th>Usuario</th>
						<th>Rol</th>
						<th>Sexo</th>
						<th>Estatus</th>
						<th>Accion</th>
					</tr>		
				</tfoot>

			</table>

		</div>
	<!-- /.box-body -->
	</div>
  <!-- /.box -->
</div>

<form autocomplete="false" onsubmit="return false">
	<div class="modal fade" id="modal_registro" role="dialog">
	    <div class="modal-dialog modal-sm">
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">Registro de usuario</h4>
	        </div>
	        <div class="modal-body">
	        	<div class="col-lg-12">
	        		<label>Usuario</label>
	        		<input type="text" class="form-control" id="txt_usu" placeholder="Ingrese usuario" name="">
	        		<br>
	        	</div>
	        	<div class="col-lg-12">
	        		<label>Contrase&ntilde;a</label>
	        		<input type="password" class="form-control" id="txt_con1" placeholder="Ingrese Contrase&ntilde;a" name="">
	        		<br>
	        	</div>
	        	<div class="col-lg-12">
	        		<label>Repita la Contrase&ntilde;a</label>
	        		<input type="password" class="form-control" id="txt_con2" placeholder="repita Contrase&ntilde;a" name="">
	        		<br>
	        	</div>    
	           	<div class="col-lg-12">
	        		<label>Sexo</label>
	        		<select class="js-example-basic-single" name="state" id="cbm_sexo" style="width:100%">
	        			<option value="M">Masculino</option>
	        			<option value="F">Femenino</option>
					</select>
	        		<br>
	        	</div>	
	           	<div class="col-lg-12">
	        		<label>Rol</label>
	        		<select class="js-example-basic-single" name="state" id="cbm_rol" style="width:100%">
					</select>
	        		<br><br>
	        	</div>
	        </div>
	        <div class="modal-footer">
	        	<button class="btn btn-primary" onclick="Registrar_Usuario()"><i class="fa fa-check"><b>&nbsp;Registrar</b></i></button>
	          <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-close"> <b>&nbsp;Cerrar</b></i></button>
	        </div>
	      </div>
	    </div>
  	</div>
</form>


<form autocomplete="false" onsubmit="return false">
	<div class="modal fade" id="modal_editar" role="dialog">
	    <div class="modal-dialog modal-sm">
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">Editar datos del usuario</h4>
	        </div>
	        <div class="modal-body">
	        	<div class="col-lg-12">
	        		<input type="text" id="txtidusuario" hidden>
	        		<label>Usuario</label>
	        		<input type="text" class="form-control" id="txtusu_editar" placeholder="Ingrese usuario" name="" disabled>
	        		<br>
	        	</div> 
	           	<div class="col-lg-12">
	        		<label>Sexo</label>
	        		<select class="js-example-basic-single" name="state" id="cbm_sexo_editar" style="width:100%">
	        			<option value="M">Masculino</option>
	        			<option value="F">Femenino</option>
					</select>
	        		<br>
	        	</div>	
	           	<div class="col-lg-12">
	        		<label>Rol</label>
	        		<select class="js-example-basic-single" name="state" id="cbm_rol_editar" style="width:100%">
					</select>
	        		<br><br>
	        	</div>
	        </div>
	        <div class="modal-footer">
	        	<button class="btn btn-primary" onclick="Modificar_Usuario()"><i class="fa fa-check"><b>&nbsp;Modificar</b></i></button>
	          <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-close"> <b>&nbsp;Cerrar</b></i></button>
	        </div>
	      </div>
	    </div>
  	</div>
</form>

<script>
	
	$(document).ready(function() {
	   listar_usuario();
	    $('.js-example-basic-single').select2();
	    listar_combo_rol();

	    $("#modal_registro").on('shown.bs.modal',function(){
	    	$("#txt_usu").focus();
	    })
	} );
</script>




















