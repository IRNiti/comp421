<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<title>Index</title>
<script type="text/javascript">
 var user;
 var userName="";
 var userEmail="";
 var userAddress="";
 var points;
 var branches;
 var cars;
</script>

</head>
<body>
<h1>COMP-421 Database Project</h1>

<div class="row" id="return" style="display:none">
  <div class="col-xs-8 col-md-8">
    <h2>Return a car</h2>
    <form id="returnForm">
    <fieldset class="form-group">
    <label for="returnBranch">Branches</label>
    <select name="branchAddress"class="form-control" id="returnBranch">
      <option id="1">475 President Kennedy</option>
      <option id="2">5960 Boulevard Decarie</option>
      <option id="3">1717 Rue Berri</option>
      <option id="4">3480 Boulevard Des Sources</option>
      <option id="5">1555 Cure Labelle</option>
    </select>
    <fieldset class="form-group">
      <label for="reservationNumber">Reservation Number</label>
      <input name="reservationID"type="text" class="form-control" id="reservationNumber" placeholder="Enter Reservation Number">
      <small class="text-muted"></small>
    </fieldset>
  </fieldset>
  </form>
  <button id="makeReturnButton" class="btn btn-primary">Return</button>
  <button id="ReturnBackButton" class="btn btn-primary">Back</button>
  </div>
</div>



<div class="row" id="Reserve" style="display:none">
  <div class="col-xs-8 col-md-8">
    <h2>Make a Reservation</h2>
    <form id="reserveForm">
    <fieldset class="form-group">
      <label for="licenseNumber">License Number</label>
      <input name="licenseNumber"type="text" class="form-control" id="licenseNumber" placeholder="Enter License Number">
      <small class="text-muted"></small>
    </fieldset>
    <fieldset class="form-group">
    <label for="exampleSelect1">Pickup Branch</label>
    <select name="branch"class="form-control" id="exampleSelect1">
      <option id="1">475 President Kennedy</option>
      <option id="2">5960 Boulevard Decarie</option>
      <option id="3">1717 Rue Berri</option>
      <option id="4">3480 Boulevard Des Sources</option>
      <option id="5">1555 Cure Labelle</option>
    </select>
  </fieldset>
  <fieldset class="form-group">
      <label for="pickupDate">Input pickup date dd/mm/yyyy</label>
      <input name="pickupDate" type="date" class="form-control" id="pickupDate" placeholder="dd/mm/yyyy">
    </fieldset>
    <label for="returnBranch">Dropoff Branch</label>
    <select name="dropoffBranchAddress"class="form-control" id="returnBranch">
      <option id="1">475 President Kennedy</option>
      <option id="2">5960 Boulevard Decarie</option>
      <option id="3">1717 Rue Berri</option>
      <option id="4">3480 Boulevard Des Sources</option>
      <option id="5">1555 Cure Labelle</option>
    </select>
    <fieldset class="form-group">
      <label for="dropOffDate">Input dropOff date dd/mm/yyyy</label>
      <input name="dropOffDate" type="date" class="form-control" id="dropOffDate" placeholder="dd/mm/yyyy">
    </fieldset>
    <fieldset class="form-group">
    <label for="exampleSelect2">Vehicles</label>
    <select name="car"class="form-control" id="exampleSelect2">
    </select>
  </fieldset>
  <fieldset class="form-group">
    <label for="exampleSelect3">Insurance policy</label>
    <select name="insurance"class="form-control" id="exampleSelect3">
      <option>N/A</option>
      <option>loss-damage waiver</option>
      <option>liability coverage</option>
      <option>personal accident insurance</option>
      <option>personal effects coverage</option>
    </select>
  </fieldset>
  </form>
  <button id="makeReservationButton" class="btn btn-primary">Reserve!</button>
  <button id="ReservationBackButton" class="btn btn-primary">Back</button>
  </div>
</div>


<div class="row" id="review" style="display:none">
  <div class="col-xs-8 col-md-8">
    <h2>Submit A Review</h2>
    <form id="reviewForm">
    
    <fieldset class="form-group">
    <label for="exampleSelectReview">Vehicles</label>
    <select name="car"class="form-control" id="exampleSelectReview">
    </select>
  </fieldset>
  <fieldset class="form-group">
    <label for="stars">Stars</label>
    <select name="rating"class="form-control" id="stars">
      <option>1</option>
      <option>2</option>
      <option>3</option>
      <option>4</option>
      <option>5</option>
    </select>
  </fieldset>
  <div class="form-group">
  <label for="comment">Review Text</label>
  <textarea name="review"class="form-control" rows="5" id="comment"></textarea>
	</div>
  </form>
  <button id="submitReviewButton" class="btn btn-primary">Submit</button>
  <button id="ReviewBackButton" class="btn btn-primary">Back</button>
  </div>
</div>
<div class="row" id="mainPage" style="display:none">
  <div class="col-xs-8 col-md-8">
    <h2>Welcome to Number 1 Car Rental!</h2>
    <h2 id="loginName"></h2>
    <button id="reserveButton" class="btn btn-primary">Reserve</button>
    <button id="reviewButton" class="btn btn-primary">Review</button>
    <button id="returnButton" class="btn btn-primary">Return car</button>
    <button id="deleteAcountButton" class="btn btn-primary">Delete account</button>
    <button id="LogoutButton" class="btn btn-primary">Log out</button>
  </div>
</div>

<div class="row" id="login">
  <div class="col-xs-8 col-md-8">
    <form id="loginFormBasic">
    <fieldset class="form-group">
      <label for="exampleInputEmail1">Login with email address</label>
      <input name="emailAddress" type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email">
    </fieldset>
  </form>
  <button id="loginButton" class="btn btn-primary">Login</button>
  <button id="signUpButton" class="btn btn-primary">Sign up</button>
  

  </div>
</div>

<div  class="row" id="createAccount" style="display:none;">
  <div class="col-xs-8 col-md-8">
  <form id="form">
    <fieldset class="form-group">
      <label for="exampleInputEmail1">Email address</label>
      <input name="emailAddress" type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email">
      <small class="text-muted">We'll never share your email with anyone else.</small>
    </fieldset>
    <fieldset class="form-group">
      <label for="name">Name</label>
      <input name="name"type="text" class="form-control" id="name" placeholder="Enter name">
      <small class="text-muted"></small>
    </fieldset>
     <fieldset class="form-group">
      <label for="name">Address</label>
      <input name="address"type="text" class="form-control" id="address" placeholder="Enter address">
      <small class="text-muted"></small>
    </fieldset>
     <div class="checkbox">
    <label>
      <input name="isPremium"type="checkbox"> Premium Account
    </label>
  </div>
    </form>
    <button id="submitButton" class="btn btn-primary">Submit</button>
    <button id="cancelButton" class="btn btn-primary">Cancel</button>
</div>

</div>

<script type="text/javascript">

    $('#submitButton').click( function() {
    debugger;
    $.ajax({
        cache: false,
        url: 'http://localhost:8080/comp421/create',
        type: 'post',
        data: $('#form').serialize(),
        success: function()
        {
         
        },
        error: function() 
        {
          alert('something went wrong')
        },
        complete: function(data){
        	user = null;
        	$('#login').show();
        	$('#createAccount').hide();
        	
        }
    });
    });
      

    $('#loginButton').click( function() {
        debugger;
        $.ajax({
            cache: false,
            url: 'http://localhost:8080/comp421/login',
            type: 'post',
            dataType:'text',
            data: $('#loginFormBasic').serialize(),
            success: function()
            {
              
            },
            complete: function(data){
            	user = JSON.parse(data.responseText);
            	if(user.uId == "-1")
            	{
            		alert("User Does Not Exist");
            	}
            	else
            	{
            		$('#mainPage').show();
                	$('#login').hide();
                	$('#loginName').html(user.name);
            	}
            		
            	
            }
        });

        
    });
    $('#signUpButton').click( function() {
      $('#createAccount').show();
      $('#login').hide();
    });
    $('#reserveButton').click( function() {
        $('#Reserve').show();
        $('#mainPage').hide();
        var selected = $('#exampleSelect1 option:selected').val();
        $.ajax({
            cache: false,
            url: 'http://localhost:8080/comp421/vehicles',
            type: 'get',
            dataType:'text',
            data: '&branchAddress='+selected,
            success: function()
            {
              
            },
            complete: function(data){
            	debugger;
            	cars = JSON.parse(data.responseText);
            	$('#exampleSelect2').html("");
            	for (var i = 0; cars.length; i++) {
            	    $('#exampleSelect2').append(" <option>"+cars[i].make+":"+ cars[i].model+":"+cars[i].costPerDay+":"+cars[i].vId+"</option>");
            	}
            	
            }
        });
      });
    
    $('#exampleSelect1').on('change', function(){
    	   var selected = $('#exampleSelect1 option:selected').val();
    	   $.ajax({
               cache: false,
               url: 'http://localhost:8080/comp421/vehicles',
               type: 'get',
               dataType:'text',
               data: '&branchAddress='+selected,
               success: function()
               {
                 
               },
               complete: function(data){
               	debugger;
               	cars = JSON.parse(data.responseText);
                $('#exampleSelect2').html("");
               	for (var i = 0; cars.length; i++) {
               	    $('#exampleSelect2').append(" <option>"+cars[i].make+":"+ cars[i].model+":"+cars[i].costPerDay+":"+cars[i].vId+"</option>");
               	}
               	
               }
           });
    	});
    $('#ReservationBackButton').click(function() {
    		      $('#mainPage').show();
    		      $('#Reserve').hide();
    		    }
    		);
    
    $('#makeReservationButton').click( function() {
        debugger;
        var resData = $('#reserveForm').serialize();
        var selected = $('#exampleSelect2 option:selected').val().split(":")[3];
        resData = resData + "&vId=" + selected +"&uId="+user.uId;
        $.ajax({
            cache: false,
            url: 'http://localhost:8080/comp421/reserve',
            type: 'post',
            dataType:'text',
            data: resData,
            success: function()
            {
              
            },
            complete: function(data){
            	var res = JSON.parse(data.responseText);
            	if(res.result == -1)
            	{
            		alert("Reservation not made, car not available on those dates, or your pickup date is after your dropoff date ");
            	}
            	else
            	{
            		alert("Reservation Made!");
            		$('#mainPage').show();
         		    $('#Reserve').hide();
            		
            	}
            	
            
            }
        });

        
    });
    
    $('#deleteAcountButton').click( function() {
        debugger;
        $.ajax({
            cache: false,
            url: 'http://localhost:8080/comp421/delete',
            type: 'post',
            dataType:'text',
            data: "uID="+user.uId,
            success: function()
            {
              
            },
            complete: function(data){
            	user = null;
            	alert("Account deleted");
            	$('#mainPage').hide();
            	$('#login').show();
            }
        });
    });
    
    $('#reviewButton').click(function() {
	      $('#mainPage').hide();
	      $('#review').show();
	      $.ajax({
	            cache: false,
	            url: 'http://localhost:8080/comp421/vehicles',
	            type: 'get',
	            dataType:'text',
	            data: 'all=True',
	            success: function()
	            {
	              
	            },
	            complete: function(data){
	            	debugger;
	            	cars = JSON.parse(data.responseText);
	            	$('#exampleSelectReview').html("");
	            	for (var i = 0; cars.length; i++) {
	            	    $('#exampleSelectReview').append(" <option>"+cars[i].make+":"+ cars[i].model+":"+cars[i].costPerDay+":"+cars[i].vId+"</option>");
	            	}
	            	
	            }
	        });
	    }
	);
    
    $('#ReviewBackButton').click(function() {
	      $('#mainPage').show();
	      $('#review').hide();
	    }
	);
    
    $('#submitReviewButton').click( function() {
        debugger;
        var resData = $('#reviewForm').serialize();
        var selected = $('#exampleSelectReview option:selected').val().split(":")[3];
        resData = resData + "&vehicleID=" + selected +"&userName="+user.name;
        $.ajax({
            cache: false,
            url: 'http://localhost:8080/comp421/review',
            type: 'get',
            dataType:'text',
            data: resData,
            success: function()
            {
              
            },
            complete: function(data){
            	alert("Review submited");
            	$('#mainPage').show();
      	      $('#review').hide();
            }
        });

        
    });
    
    $('#returnButton').click(function() {
	      $('#mainPage').hide();
	      $('#return').show();
	    }
	);
    $('#ReturnBackButton').click(function() {
	      $('#mainPage').show();
	      $('#return').hide();
	    }
	);
    $('#makeReturnButton').click(function() {
    	
    	 $.ajax({
             cache: false,
             url: 'http://localhost:8080/comp421/return',
             type: 'get',
             dataType:'text',
             data: $('#returnForm').serialize(),
             success: function()
             {
               
             },
             complete: function(data){
            	 debugger;
             	alert(data.responseText);
             	
             	 $('#mainPage').show();
       	      $('#return').hide();
             }
         });
    	
	     
	    }
	);
    $('#LogoutButton').click(function() {
	      $('#mainPage').hide();
	      $('#login').show();
	    });
    $('#cancelButton').click(function() {
	      $('#createAccount').hide();
	      $('#login').show();
	    });
    
    
    
    
   

    </script>
</body>
</html>