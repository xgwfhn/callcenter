
<!-- 
	bootstrap-table 插件显示
	 参考  http://www.imooc.com/article/8917   官网:http://www.bootcdn.cn/bootstrap-table/
	 
	bootstrap  响应式布局   随着浏览器的大小  自动跳转布局格式
	bootstrap 可以兼容pc ipad  移动端
	提供分页功能
	ajax删除   修改     停留在当前页  (始终保持每页显示的记录数，方案是 把当前页码传递到后台)
	ajax新增 /修改 局部刷新表格数据
	
	*不支持 每页显示多少条的切换
                支持  按字段排序
                支持当前显示 当前页  为xx条记录到xx条记录  格式显示
                
	css设置
	设置 表格行间隔之间  斑马条纹样式 table-striped
	设置表格边框 table-bordered
	每一行对鼠标悬停状态作出响应  table-hover
	紧缩表格  table-condensed
	将表格设置为响应式
	<div class="table-responsive">
  		<table class="table">
    		...
  		</table>
	</div>		
	
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>bootstrap-table插件分页</title>
	
    
    <!--font-awesome.css 下载地址 http://www.bootcdn.cn/font-awesome/ 然后需要下载其图标  放到font目录中   再重新编译   注意该图标在font目录下   上传组件的图标在fonts下-->
    <link href="http://127.0.0.1:8080/style/bootstrap/font-awesome.css" rel="stylesheet" type="text/css" />
    <link href="http://127.0.0.1:8080/style/bootstrap/bootstrap.css" rel="stylesheet">
   
    <!-- 首先要下载  bootstrap源码 版     dashboard.css 在bootstrap-3.3.5\docs\examples\dashboard    -->
     <link href="http://127.0.0.1:8080/style/bootstrap/dashboard.css" rel="stylesheet">
     <link href="http://127.0.0.1:8080/style/bootstrap/bootstrapValidator.css" rel="stylesheet">
     <link href="http://127.0.0.1:8080/style/bootstrap/bootstrap-select.css" rel="stylesheet">
     <link href="http://127.0.0.1:8080/style/bootstrap/bootstrap-datetimepicker.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]  小于ie9的支持配置>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <!-- js 放在这里  是因为如果放到前面  在引入时会比较慢,可以考虑放置到末尾 -->
    <!--2 jQuery js库必须在  bootstrap.js之前-->
    <script src="http://127.0.0.1:8080/script/jquery-2.1.1.js"></script>
    <!-- 3 Include all compiled plugins (below), or include individual files as needed -->
    <script src="http://127.0.0.1:8080/script/bootstrap/bootstrap.js"></script>
     <script src="http://127.0.0.1:8080/script/bootstrap/bootstrap-select.js"></script>
    <!-- bootstrap-table 所需   begin-->
    <link href="http://127.0.0.1:8080/style/bootstrap/bootstrap-table.css" rel="stylesheet">
    <!--排序等扩展插件 js 引入 -->
    <script src="http://127.0.0.1:8080/script/bootstrap/bootstrap-table.js"></script>    
    <script src="http://127.0.0.1:8080/script/bootstrap/bootstrap-table-zh-CN.js"></script>
    <script src="http://127.0.0.1:8080/script/bootstrap/bootstrap-datetimepicker.js" charset="UTF-8"></script>
    <script src="http://127.0.0.1:8080/script/bootstrap/bootstrap-datetimepicker.zh-CN.js"></script>
    
    <!-- bootstrap-table 所需   end -->
    <script type="text/javascript">
    	$(function(){
    		$('#test-table').bootstrapTable({ 
    			method: 'get', //必须已get 请求  后台才能获取  排序的 字段名称
    			toolbar: '#toolbar', //工具按钮用哪个容器 
    			striped: true, //是否显示行间隔色 
    			cache: false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*） 
    			pagination: true, //是否显示分页（*） 
    			sortable: true, //是否启用排序 
    			sortOrder: "itemid asc", //排序方式 
    			pageNumber: 1, //初始化加载第一页，默认第一页 
    			pageSize: 5, //每页的记录行数（*） 
    			pageList: [20, 50, 100, 150], //可供选择的每页的行数（*） 
    			url: "findOrderPageData",//这个接口需要处理bootstrap table传递的固定参数 
    			queryParamsType: "", //默认值为 'limit' ,在默认情况下 传给服务端的参数为：offset,limit,sort // 设置为 '' 在这种情况下传给服务器的参数为：pageSize,pageNumber //queryParams: queryParams,//前端调用服务时，会默认传递上边提到的参数，如果需要添加自定义参数，可以自定义一个函数返回请求参数 
    			sidePagination:"server",   //分页方式：client客户端分页，server服务端分页（*）  //search: true, //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大 
    			strictSearch: true, //showColumns: true, //是否显示所有的列 //showRefresh: true, //是否显示刷新按钮 
    			minimumCountColumns: 2, //最少允许的列数 
    			clickToSelect: true, //是否启用点击选中行 
    			searchOnEnterKey: true, 
    			search:false, 
    			columns:
    			[ 
    				{ 
    					title: "ID", 
    					field: "id", 
    					align: "center", 
    					valign: "middle"
    				}, 
    				{ 
    					title: "订单号",
    					field: "orderNo", 
    					align: "center",
    					valign: "middle", 
    					sortable:true 
    				}, 
    				{ 
    					title: "创建人", 
    					field: "createPerson", 
    					align: "center", 
    					valign: "middle"
    				}, 
    				{ 
    					title: "订单状态", 
    					field: "status",
    					align: "center", 
    					valign: "middle" 
    				}, 
    				{ 
    					title: "订单描述", 
    					field: "des",
    					align: "center", 
    					valign: "middle"
    				},
    				{ 
    					title: "备注", 
    					field: "remark",
    					align: "center", 
    					valign: "middle"
    				}
    			], 
    			pagination: true 
    		});
    		
    		$('.form_date').datetimepicker({
    	        language:  'zh-CN',
    	        weekStart: 1,
    	        todayBtn:  1,
    			autoclose: 1,
    			todayHighlight: 1,
    			startView: 2,
    			minView: 2,
    			forceParse: 0
    	    });
    	})
    </script>
    <style type="text/css">
    	.col-lg-20{
    		width:10%;
    		float:left;
    	}
    	.col-lg-21{
    		width:15%;
    		float:left;
    		padding-left:15px;
    	}
    	.col-lg-3{
    		width:12%
    	}
    	.col-lg-4{
    		width:32%
    	}
    	.col-lg-5{
    		width:20%;float:left;
    	}
    	.col-lg-offset-2 {
    		margin-left: 1%;
		}
    </style>
  </head>
  <body>
		<nav class="navbar navbar-inverse navbar-fixed-top">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">Project name</a>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#">Dashboard</a></li>
						<li><a href="#">Settings</a></li>
						<li><a href="#">Profile</a></li>
						<li><a href="#">Help</a></li>
					</ul>
					<form class="navbar-form navbar-right">
						<input type="text" class="form-control" placeholder="Search...">
					</form>
				</div>
		  </div>
		</nav>
		
		<div class="container-fluid">
		    <div class="row">
				<div class="col-sm-3 col-md-2 sidebar">
				  <ul class="nav nav-sidebar">
					<li class="active"><a href="#">Overview <span class="sr-only">(current)</span></a></li>
					<li><a href="#">Reports</a></li>
					<li><a href="#">Analytics</a></li>
					<li><a href="#">Export</a></li>
				  </ul>
				  <ul class="nav nav-sidebar">
					<li><a href="">Nav item</a></li>
					<li><a href="">Nav item again</a></li>
					<li><a href="">One more nav</a></li>
					<li><a href="">Another nav item</a></li>
					<li><a href="">More navigation</a></li>
				  </ul>
				  <ul class="nav nav-sidebar">
					<li><a href="">Nav item again</a></li>
					<li><a href="">One more nav</a></li>
					<li><a href="">Another nav item</a></li>
				  </ul>
				</div>
				 
				<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
					 <!-- form  begin -->
					<div class="container">
			  				<div class="row">
			       			<section>
			           			<div class="col-lg-8 col-lg-offset-2" style="width:1000px">
					                <form id="defaultForm" method="post" class="form-horizontal" action="target.php"
					                      data-bv-message="This value is not valid"
					                      data-bv-feedbackicons-valid="glyphicon glyphicon-ok"
					                      data-bv-feedbackicons-invalid="glyphicon glyphicon-remove"
					                      data-bv-feedbackicons-validating="glyphicon glyphicon-refresh">
						                    <div class="form-group">
						                        <label class="col-lg-20  control-label">审核人</label>
						                        <div class="col-lg-21">
						                            <input type="text" class="form-control" name="firstName" placeholder="First name" required data-bv-notempty-message="The first name is required and cannot be empty" />
						                        </div>
						                        <label class="col-lg-20 control-label">快速查询</label>
						                        <div class="col-lg-21">
						                            <input type="text" class="form-control" name="lastName" placeholder="票号,订单号"  required data-bv-notempty-message="The last name is required and cannot be empty" />
						                        </div>
						                        <div class="col-lg-21" style="padding-left:15px;">
						                            <button type="submit" class="btn btn-primary">快说查询</button>
						                        </div>
						                    </div>
						                    <div class="form-group" style="margin-bottom:0px;">
						                        <label class="col-lg-20  control-label">订单类型</label>
						                        <div class="col-lg-21" >
						                              <div class="form-group">
													      <div class="col-lg-10" style="width:165px;">
													        <select id="maxOption2" class="selectpicker show-menu-arrow form-control" multiple data-max-options="1">
													          <option>chicken</option>
													          <option selected>turkey</option>
													          <option disabled>duck</option>
													          <option>goose</option>
													        </select>
													      </div>
												      </div>
						                        </div>
						                        <label class="col-lg-20 control-label">订单状态</label>
						                        <div class="col-lg-21" >
						                            <div class="form-group" >
													      <div class="col-lg-10" style="width:165px;">
													        <select id="maxOption2"  class="selectpicker show-menu-arrow form-control" multiple data-max-options="1">
													          <option selected>chicken</option>
													          <option>turkey</option>
													          <option disabled>duck</option>
													          <option>goose</option>
													        </select>
													      </div>
												      </div>
						                        </div>
						                        <label class="col-lg-20 control-label">承运人</label>
						                        <div class="col-lg-21" >
						                            <div class="form-group" >
													      <div class="col-lg-10" style="width:165px;">
													        <select id="maxOption2" class="selectpicker show-menu-arrow form-control" multiple data-max-options="1">
													          <option selected>chicken</option>
													          <option>turkey</option>
													          <option disabled>duck</option>
													          <option>goose</option>
													        </select>
													      </div>
												      </div>
						                        </div>
						                        <label class="col-lg-20 control-label" >区域</label>
						                        <div  class="col-lg-21" >
						                            <div class="form-group" >
													      <div class="col-lg-10" style="width:165px;">
													        <select id="maxOption2" class="selectpicker show-menu-arrow form-control" multiple data-max-options="1">
													          <option selected>chicken</option>
													          <option>turkey</option>
													          <option disabled>duck</option>
													          <option>goose</option>
													        </select>
													      </div>
												      </div>
						                        </div>
						                    </div>
						                    <div class="form-group">
						                    	<label class="col-lg-20  control-label">旅客姓名</label>
						                        <div class="col-lg-21">
						                            <input type="text" class="form-control" name="firstName" placeholder="First name" required data-bv-notempty-message="The first name is required and cannot be empty" />
						                        </div>
						                        <label class="col-lg-20  control-label">证件号码</label>
						                        <div class="col-lg-21">
						                            <input type="text" class="form-control" name="firstName" placeholder="First name" required data-bv-notempty-message="The first name is required and cannot be empty" />
						                        </div>
						                        <label class="col-lg-20  control-label">联系电话</label>
						                        <div class="col-lg-21">
						                            <input type="text" class="form-control" name="firstName" placeholder="First name" required data-bv-notempty-message="The first name is required and cannot be empty" />
						                        </div>
						                        <label class="col-lg-20  control-label">会员卡号</label>
						                        <div class="col-lg-21">
						                            <input type="text" class="form-control" name="firstName" placeholder="First name" required data-bv-notempty-message="The first name is required and cannot be empty" />
						                        </div>
						                    </div>
						                    <div class="form-group" style="margin-bottom:0px;">
						                    	<label class="col-lg-20  control-label">订单日期</label>
						                    	<div class="col-lg-21">
							                    	<div class="input-group date form_date col-md-5" style="width:137px;" data-date="" data-date-format="yyyy-mm-dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
									                    <input class="form-control" size="16" type="text" value="" readonly>
														<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
									                </div>
													<input type="hidden" id="dtp_input2" value="" /><br/>
												</div>	
												<label class="col-lg-20 control-label" >至</label>
						                    	<div class="col-lg-21">
							                    	<div class="input-group date form_date col-md-5" style="width:137px;" data-date="" data-date-format="yyyy-mm-dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
									                    <input class="form-control" size="16" type="text" value="" readonly>
														<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
									                </div>
													<input type="hidden" id="dtp_input2" value="" /><br/>
												</div>
												
												<label class="col-lg-20  control-label">航班日期</label>
						                    	<div class="col-lg-21">
							                    	<div class="input-group date form_date col-md-5" style="width:137px;" data-date="" data-date-format="yyyy-mm-dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
									                    <input class="form-control" size="16" type="text" value="" readonly>
														<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
									                </div>
													<input type="hidden" id="dtp_input2" value="" /><br/>
												</div>	
												<label class="col-lg-20 control-label" >至</label>
						                    	<div class="col-lg-21">
							                    	<div class="input-group date form_date col-md-5" style="width:137px;" data-date="" data-date-format="yyyy-mm-dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
									                    <input class="form-control" size="16" type="text" value="" readonly>
														<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
									                </div>
													<input type="hidden" id="dtp_input2" value="" /><br/>
												</div>		
						                    </div>
						                    <div class="form-group" style="margin-bottom:0px;">
						                    	<label class="col-lg-20  control-label">建单员工号</label>
						                        <div class="col-lg-21">
						                            <input type="text" class="form-control" name="firstName" placeholder="First name" required data-bv-notempty-message="The first name is required and cannot be empty" />
						                        </div>
						                        <label class="col-lg-20 control-label" >销售渠道</label>
						                        <div  class="col-lg-21" >
						                            <div class="form-group" >
													      <div class="col-lg-10" style="width:165px;">
													        <select id="maxOption2" class="selectpicker show-menu-arrow form-control" multiple data-max-options="1">
													          <option selected>chicken</option>
													          <option>turkey</option>
													          <option disabled>duck</option>
													          <option>goose</option>
													        </select>
													      </div>
												      </div>
						                        </div>
						                    </div> 
						                    <div class="form-group" style="padding-left:115px;">
						                    	<button type="button" class="btn btn-primary">　查&nbsp;询　</button>
						                    	<button type="button" class="btn btn-primary">　重&nbsp;填　</button>
						                    	<button type="button" class="btn btn-primary">刷新当前页面</button>
						                    </div>
					                  </form>
					              </div>
					           </section>  
					         </div>
				      </div>   
					<!-- from end -->
					<div class="table-responsive">
						<table id="test-table" class="col-xs-12" data-toolbar="#toolbar"></table>	   
				    </div>
				</div>
		  </div>
		</div>
  </body>
</html>