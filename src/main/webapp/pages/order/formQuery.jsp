<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 表单插件样式 -->
 <link href="http://127.0.0.1:8080/style/bootstrap/bootstrapValidator.css" rel="stylesheet">
 <!--表单插件 js 引入 -->
 <script src="http://127.0.0.1:8080/script/bootstrap/bootstrapValidator.js"></script>
<title>Insert title here</title>
</head>
<body>

<!-- form  begin -->
				<div class="container">
    				<div class="row">
	        			<section>
	            			<div class="col-lg-8 col-lg-offset-2">
				                <form id="defaultForm" method="post" class="form-horizontal" action="target.php"
				                      data-bv-message="This value is not valid"
				                      data-bv-feedbackicons-valid="glyphicon glyphicon-ok"
				                      data-bv-feedbackicons-invalid="glyphicon glyphicon-remove"
				                      data-bv-feedbackicons-validating="glyphicon glyphicon-refresh">
					                    <div class="form-group">
					                        <label class="col-lg-3 control-label">Full name</label>
					                        <div class="col-lg-4">
					                            <input type="text" class="form-control" name="firstName" placeholder="First name" required data-bv-notempty-message="The first name is required and cannot be empty" />
					                        </div>
					                        <div class="col-lg-4">
					                            <input type="text" class="form-control" name="lastName" placeholder="Last name" required data-bv-notempty-message="The last name is required and cannot be empty" />
					                        </div>
					                    </div>
				                  </form>
				              </div>
				           </section>  
				         </div>
			      </div>   
				<!-- from end -->
</body>
</html>