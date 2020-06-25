<header class="header" style="background-color: #ffffff;box-shadow: 1px 2px 10px grey;">

		<nav class="navbar navbar-style">
			<div class="container">
				<div class="navbar-header">
					<h2 class=" display-3">Flight Booking</h2>
				</div>
				<ul class="nav navbar-nav  navbar-right"	>
				<li>	<a type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Login/Singup</a></li>
				</ul>

			</div>

		</nav>
	</header>
	
	
	

<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Login</h4>
      </div>
      <div class="modal-body">
         <form action="login" method="post">
 		<div class="form-group">
 		<label for="emailId">Email</label>
   		 <input class="form-control"type="text" id="emailId" name="emailId" placeholder="Email">
 		</div>
     	<div class="form-group">
     	<label for="password">Password</label>
    	<input class="form-control" type="password" id="password" name="password" placeholder=" Password">
     	</div>
   		 <input type="submit" class="btn btn-primary btn-block" value="Submit">
  		</form>
  		<br>
  		<a class="btn btn-primary btn-block" href="/register">Register</a>
 
</div>

      </div>
     
    </div>

  </div>
