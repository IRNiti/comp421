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

<div class="row" id="Reserve" style="display:none">
  <div class="col-xs-8 col-md-8">
    <h2>Make a Reservation</h2>
    <form id="reserveForm">
    <fieldset class="form-group">
    <label for="exampleSelect1">Branches</label>
    <select name="branch"class="form-control" id="exampleSelect1">
      <option>1</option>
      <option>2</option>
      <option>3</option>
      <option>4</option>
      <option>5</option>
    </select>
  </fieldset>
  <fieldset class="form-group">
      <label for="pickupDate">Input pickup date dd/mm/yyyy</label>
      <input name="" type="date" class="form-control" id="pickupDate" placeholder="dd/mm/yyyy">
    </fieldset>
    <fieldset class="form-group">
      <label for="dropOffDate">Input dropOff date dd/mm/yyyy</label>
      <input name="" type="date" class="form-control" id="dropOffDate" placeholder="dd/mm/yyyy">
    </fieldset>
    <fieldset class="form-group">
    <label for="exampleSelect2">Vehicles</label>
    <select name="car"class="form-control" id="exampleSelect2">
      <option>1</option>
      <option>2</option>
      <option>3</option>
      <option>4</option>
      <option>5</option>
    </select>
  </fieldset>
  <fieldset class="form-group">
    <label for="exampleSelect3">Insurance policy</label>
    <select name="insurance"class="form-control" id="exampleSelect3">
      <option>1</option>
      <option>2</option>
      <option>3</option>
      <option>4</option>
      <option>5</option>
    </select>
  </fieldset>
  
  </form>
  <button id="makeReservationButton" class="btn btn-primary">Reserve!</button>
  

  </div>
</div>

<div class="row" id="mainPage" style="display:none">
  <div class="col-xs-8 col-md-8">
    <h2>Welcome to Number 1 Car Rental!</h2>
    <h2 id="loginName"></h2>
    <button id="reserveButton" class="btn btn-primary">Reserve</button>
    <button id="reviewButton" class="btn btn-primary">Sign up</button>
    <button id="returnButton" class="btn btn-primary">Return car</button>
    <form id="loginForm">
    <fieldset class="form-group">
      <label for="exampleInputEmail1">Login with email address</label>
      <input name="address" type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email">
    </fieldset>
  </form>
  

  </div>
</div>

<div class="row" id="login">
  <div class="col-xs-8 col-md-8">
    <form id="loginForm">
    <fieldset class="form-group">
      <label for="exampleInputEmail1">Login with email address</label>
      <input name="address" type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email">
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
      <input name="address" type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email">
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
<h2> ${name} ${address} ${email} ${isPremium} ${points}</h2>
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
          alert('success');
          $('#createAccount').hide();
          $('#login').show();
        },
        error: function() 
        {
          alert('something went wrong')
        }
    });
    });
      

    $('#loginButton').click( function() {
        debugger;
        $.ajax({
            cache: false,
            url: 'http://localhost:8080/comp421/create',
            type: 'post',
            dataType:'text',
            data: $('#loginForm').serialize(),
            success: function()
            {
              alert('success');
            },
            complete: function(data){
              alert(data);
            }
        });

        
    });
    $('#signUpButton').click( function() {
      alert(userName);
      $('#createAccount').show();
      $('#login').hide();
    });

    </script>
</body>
</html>