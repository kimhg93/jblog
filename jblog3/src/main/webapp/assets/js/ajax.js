function checkId() {
    var id = $("#blog-id").val();
    var checkPath = $("#check_path").val();
    $.ajax({
        type: "GET",
        url: checkPath+"?id="+id,
        data: "",
        success: function(response) {
        	if(response==0){
        		$("#success").show();
        		$("#fail").hide();
        	} else {
        		$("#success").hide();
        		$("#fail").show();
            	$("#blog-id").val("");
        	}        	
        },
        error: function(request,status,error) {	
        	alert("message=" + request.responseText);
            location.reload();
        }        
    });    
}

function hideResult(){
	$("#success").hide();
	$("#fail").hide();
}
function addCategory() {
    var formData = $("#add_category").serialize();
    var rowcnt = $("#category_list tr").length;
    var postUrl = $("#add_url").val();
    var path = $("#path").val();
    $.ajax({
        type: "POST",
        url: postUrl,
        data: formData,
        success: function(response) {	        	
        	$("#category_list").append("<tr id='category_"+response.no+"'><td>"+
        								rowcnt+"</td><td>"+
        								response.name+"</td><td>"+
        								0+"</td><td>"+
        								response.comment+"</td><td>"+        								
        								"<form id=del_"+response.no+">"+
        								"<input type='image' src='"+path+"/assets/images/delete.jpg' onclick='removeCategory(this.form);return false;'>"+			
        								"<input type='hidden' id='category_no' name='no' value='"+response.no+"'>"+
        								"</form>"+
        								"</td></tr>");
        	$("#add_name").val("");
        	$("#add_comment").val("");
        },
        error: function() {	
        	alert("message=" + request.responseText);
            location.reload();
        }        
    });    
}

function removeCategory(form) {	
	var formData = $("#"+form.id).serialize();
	var postUrl = $("#del_url").val();
    $.ajax({
        type: "POST",
        url: postUrl,
        data: formData,
        success: function(response) {		  
        	if(response>0){
        		$("#category_"+response).remove();
        	}
        	
        },
        error: function() {	
        	alert("message=" + request.responseText);
            location.reload();
        }        
    });    
}

function updateBlog() {
    var form = $('#update_form')[0];
    var data = new FormData(form);
    var updatePath = $("#update_path").val();
    var path = $("#path").val();
    $.ajax({
        type: "POST",
        enctype: "multipart/form-data",
        url: updatePath,
        data: data,
        processData: false,
        contentType: false,
        success: function(response) {
        	$("#logo_img").attr("src", path+"/assets/logos/"+response.logo);
        	$("#title").val(response.title);
        },
        error: function(request,status,error) {	
        	alert("message=" + request.responseText);
            location.reload();
        }        
    });    
}