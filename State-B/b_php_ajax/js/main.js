$(document).ready(function(){
	// Check username availability
	$('#username').blur(function(){
		var username = $(this).val();
		$.ajax({
			url: "check/check_user.php",
			method: "POST",
			data: {username:username},
			dataType: "text",
			success:function(data){
				$('#userstatus').html(data);
			}
		});
	});

	// Auto complete textbox
	$('#skill').keyup(function(){
		var skill = $(this).val();
		if (skill != '') {
			$.ajax({
				url: 'check/checkskill.php',
				method: 'POST',
				data: {skill:skill},
				success:function(data){
					$('#skillstatus').fadeIn();
					$('#skillstatus').html(data);
				}
			});
		}
	});

	$(document).on('click', 'li', function() {
		$('#skill').val($(this).text());
		$('#skillstatus').fadeOut();
	});

	// Create a show password button 
	$('#show_password').on('click', function() {
		var fieldtype = $('#password').attr('type');

		if (fieldtype == 'password') {
			$('#password').attr('type', 'text');
			$(this).text('Hide Password');
		} else {
			$('#password').attr('type', 'password');
			$(this).text('Show Password');
		}
	});

	// Auto refresh div content
	$('#autosubmit').on('click', function(){
		var content = $('#content').val();

		if ($.trim(content) != '') {
			$.ajax({
				url: "check/check_refresh.php",
				method: "POST",
				data: {content:content},
				dataType: "text",
				success:function(data){
					$('#content').val('');
				}
			});
			return false;
		}
	});
	setInterval(function() {
		$('#contentstatus').load('check/check_refresh.php').fadeIn('slow');
	}, 1000);

	// Live data search
	$('#livesearch').keyup(function(){
		var data = $(this).val();
		if (data != '') {
			$.ajax({
				url: 'check/livesearch.php',
				method: 'POST',
				data: {data:data},
				dataType: 'text',
				success:function(data){
					$('#livestatus').fadeIn();
					$('#livestatus').html(data);
				}
			});
		} else {
			$('#livestatus').html('');
		}
	});

	// Auto save data
	function autoSave() {
		var content = $('#content').val();
		var contentid = $('#contentid').val();
		if (content != '') {
			$.ajax({
				url: 'check/autosave.php',
				method: 'POST',
				data: {content:content, contentid:contentid},
				dataType: 'text',
				success:function(data){
					if (data != '') {
						$('#contentid').val(data);
					}
					$('#autostatus').text('Data save draft.');
					setInterval(function(){
						$('#autostatus').text('');
					}, 2000);
				}
			});
		}
	}
	setInterval(function() {
		autoSave();
	}, 10000);

});