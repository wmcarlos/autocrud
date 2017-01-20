<div class="row">
	<div class="col-md-12">
		<div class="panel panel-default">
			<div class="panel-heading"><h4>Login</h4></div>
			<div class="panel-body">
				<form name="flogin" method="post" action="?v=login">
					<div class="form-group">
						<label for="txtusername">Username: </label>
						<input type="text" name="txtusername" id="txtusername" class="form-control">
					</div>
					<div class="form-group">
						<label for="txtpassword">Password: </label>
						<input type="password" name="txtpassword" id="txtpassword" class="form-control">
						<input type="hidden" name="txtoperation" id="txtoperation" value="login">
					</div>
					<button type="submit" name="blogin" class="btn btn-default">Login</button>
				</form>
			</div>
		</div>
	</div>
</div>