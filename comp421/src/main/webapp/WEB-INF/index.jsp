<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<title>Index</title>

</head>
<body>
<h1>COMP-421 Database Project</h1>
<div  class="row">
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
    <button id="submitButton" class="btn btn-primary">Submit</button>
   
    </form>
    <script type="text/javascript">

$('#submitButton').click( function() {
    
    debugger;
    $.ajax({
        cache: false,
        url: 'http://localhost:8080/comp421/create',
        type: 'post',
        data: $('#form').serialize(),
        success: function(){
    alert('success');
  },
  error: function(xhr, status, error) {
  var err = eval("(" + xhr.responseText + ")");
  alert(err.Message);
}
    });
});

</script>
  </div>
</div>
<h2> ${name} ${address} ${email} ${isPremium} ${points}</h2>
</body>
</html>