
<!-- 
		datatables插件显示
	https://www.datatables.net/blog/2012-02-01(不错) 
	https://datatables.net/(官网)    http://datatables.club/ (对应中文网)
	选项配置说明   http://blog.csdn.net/zhu_xiao_yuan/article/details/51252300
	bootstrap  响应式布局   随着浏览器的大小  自动跳转布局格式
	bootstrap 可以兼容pc ipad  移动端
	一般图标 可以用 <i 标签或<span  标签  来显示
	提供分页功能
	datatables支持前端分页和服务器分页 前端分页是把所有记录都查出来由datatables来分页   服务器分页 需要自己去控制
	ajax删除   修改     停留在当前页  (始终保持每页显示的记录数，方案是 把当前页码传递到后台)
	ajax新增 /修改 局部刷新表格数据
	支持每页显示多少条的切换
	支持当前显示 当前页  为xx条记录到xx条记录  格式显示
	支持点击表头字段 可排序
	支持可某个字段内容过滤记录  显示
	支持服务器分页   每次点击排序  都会去调用后台
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
		
	给表格第一列加上复选框  http://blog.csdn.net/switch_man/article/details/38898109
	给表格 设置工具栏   http://blog.csdn.net/switch_man/article/details/38873087
 -->
 <!-- 国际化
 	var table = $('#example').DataTable({
	    "language": {
	        "processing": "处理中...",
	        "lengthMenu": "显示 _MENU_ 项结果",
	        "zeroRecords": "没有匹配结果",
	        "info": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
	        "infoEmpty": "显示第 0 至 0 项结果，共 0 项",
	        "infoFiltered": "(由 _MAX_ 项结果过滤)",
	        "infoPostFix": "",
	        "search": "搜索:",
	        "searchPlaceholder": "搜索...",
	        "url": "",
	        "emptyTable": "表中数据为空",
	        "loadingRecords": "载入中...",
	        "infoThousands": ",",
	        "paginate": {
	            "first": "首页",
	            "previous": "上页",
	            "next": "下页",
	            "last": "末页"
	        },
	        "aria": {
	            paginate: {
	                first: '首页',
	                previous: '上页',
	                next: '下页',
	                last: '末页'
	            },
	            "sortAscending": ": 以升序排列此列",
	            "sortDescending": ": 以降序排列此列"
	        },
	        "decimal": "-",
	        "thousands": "."
	    }
	});
  -->
  <!-- 
     	加载时异常报错  dataTables warning: table id={example} - Requested unknown parameter '0' for row {0}, column{0}`
     	解决:http://stackoverflow.com/questions/21552041/datatables-warning-table-id-example-requested-unknown-parameter-0-from
	
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
    <title>datatables插件分页</title>
	
    
    <!--font-awesome.css 下载地址 http://www.bootcdn.cn/font-awesome/ 然后需要下载其图标  放到font目录中   再重新编译   注意该图标在font目录下   上传组件的图标在fonts下-->
    <link href="http://127.0.0.1:8080/style/bootstrap/font-awesome.css" rel="stylesheet" type="text/css" />
    <link href="http://127.0.0.1:8080/style/bootstrap/bootstrap.css" rel="stylesheet">
   
    <!-- 首先要下载  bootstrap源码 版     dashboard.css 在bootstrap-3.3.5\docs\examples\dashboard    -->
     <link href="http://127.0.0.1:8080/style/bootstrap/dashboard.css" rel="stylesheet">
     <link href="http://127.0.0.1:8080/style/bootstrap/bootstrapValidator.css" rel="stylesheet">
     <link href="http://127.0.0.1:8080/style/bootstrap/bootstrap-select.css" rel="stylesheet">
     <link href="http://127.0.0.1:8080/style/bootstrap/bootstrap-datetimepicker.css" rel="stylesheet">
     <link href="http://127.0.0.1:8080/style/bootstrap/jquery.dataTables.css" rel="stylesheet">
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
    <!-- dataTables css-->
	<script src="http://127.0.0.1:8080/script/bootstrap/jquery.dataTables.js"></script>
    <script src="http://127.0.0.1:8080/script/bootstrap/bootstrap-datetimepicker.js" charset="UTF-8"></script>
    <script src="http://127.0.0.1:8080/script/bootstrap/bootstrap-datetimepicker.zh-CN.js"></script>
    
    <!-- bootstrap-table 所需   end -->
    <script type="text/javascript">
    //var t;		
    $(function(){
		 	  var t=$('#example').DataTable( {
			 	"pagingType": "full_numbers",//显示首页 及尾页
			 	//"iDisplayLength": 20,//每页显示xx条数据,默认为10条
			 	//"bProcessing": true, //开启读取服务器数据时显示正在加载中……特别是大数据量的时候，开启此功能比较好
			 	"bServerSide": true,//开启服务器分页  每次点击页码都回去请求 后台    			 	
			 	"sAjaxSource": "findOrderPageData1.do",
			 	"aoColumns": [
	  			 	         { "mData": 'id' },
	  			 	         { "mData": 'orderNo' },
	  			 	         { "mData": 'createPerson' },
	  			 	         { "mData": 'orderStatus' },
	  			 	         { "mData": 'des' },
	  			 	         { "mData": 'remark' },
	  			 	         { "sDefaultContent": ''}, // sDefaultContent 如果这一列不需要填充数据用这个属性，值可以不写，起占位作用
	  	                     //{ "sDefaultContent": '', "sClass": "action"},//sClass 表示给本列加class
			 	     		 ],
			 	     		"columnDefs": [
				 	           {
				 	               "visible": false,
				 	               "targets": [0] //因此第一列
				 	           }
			 	           ],	 
	    		"language": {
	  	        "processing": "处理中...",
	  	        "lengthMenu": "每页_MENU_ 条记录",
	  	        "zeroRecords": "没有匹配结果",
	  	        "info": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
	  	        "infoEmpty": "显示第 0 至 0 项结果，共 0 项",
	  	        "infoFiltered": "(由 _MAX_ 项结果过滤)",
	  	        "infoPostFix": "",
	  	        "search": "搜索:",
	  	        "searchPlaceholder": "搜索...",
	  	        "url": "",
	  	        "emptyTable": "表中数据为空",
	  	        "loadingRecords": "载入中...",
	  	        "infoThousands": ",",
	  	        "paginate": {
	  	            "first": "首页",
	  	            "previous": "上页",
	  	            "next": "下页",
	  	            "last": "末页"
	  	        },	 	   	       
	  	        "decimal": "-",
	  	        "thousands": "."
	  	    },
	    	//"dom": '<"toolbar">frtip',
	    	 "dom": '<"top"fl><"toolbar">rt<"bottom"ip><"clear">',
		   	"fnRowCallback": function(nRow, aData, iDisplayIndex) {// 当创建了行，但还未绘制到屏幕上的时候调用，通常用于改变行的class风格 
		          if (aData.orderStatus == 'UNPAY') {
		              $('td:eq(2)', nRow).html("<span class='text-error'>未支付</span>");//格式化列
		          } 
		          /*else if (aData.orderStatus == 'UNPAY') {
		              $('td:eq(7)', nRow).html("<span class='text-error'>审核失败</span>");
		          }  else {
		              $('td:eq(7)', nRow).html("<span class='text-success'>显示</span>");
		          }*/
		          //$('td:eq(6)', nRow).html("<a href='' user_id='" + aData.user_id + "' class='ace_detail'>详情</a>");
	          	  return nRow;
	      	  },
		      "fnInitComplete": function(oSettings, json) { //表格初始化完成后调用 在这里和服务器分页没关系可以忽略
		          
		      },
	      
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
    		
    		$('#query').click(function(){
        		//alert();
        		var orderStartTime=$("input[name$='orderStartTime']").val();
        		var orderEndTime = $("input[name$='orderEndTime']").val(); 
        		//alert(orderType);
        		t.search(orderStartTime+'&&'+orderEndTime).draw();  //将参数传递通过search方法传递
        		//t.search(createPerson+" "+orderType).draw(); //将参数传递通过search方法传递
        		//t.draw(false);  false时   查询后  页面不刷新  停留在当前页面
        		//DataTables 多条件查询、多列搜索   参考  http://datatables.club/blog/2016/06/10/multiple-columns-search.html
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
						                            <input type="text" class="form-control" name="createPerson" placeholder="审核人" required data-bv-notempty-message="The first name is required and cannot be empty" />
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
													        <select  name="orderType" class="selectpicker show-menu-arrow form-control" multiple data-max-options="1">
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
									                    <input class="form-control" size="16" name="orderStartTime" type="text"  readonly>
														<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
									                </div>
													<input type="hidden" id="dtp_input2" value="" /><br/>
												</div>	
												<label class="col-lg-20 control-label" >至</label>
						                    	<div class="col-lg-21">
							                    	<div class="input-group date form_date col-md-5" style="width:137px;" data-date="" data-date-format="yyyy-mm-dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
									                    <input class="form-control" size="16" name="orderEndTime"  type="text" readonly>
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
						                    	<button type="button" class="btn btn-primary" id="query">　查&nbsp;询　</button>
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
						<table id="example" class="display" cellspacing="0" width="100%">   
							 <thead>
					            <tr>
					                <th>ID</th>
					                <th>订单号</th>
					                <th>创建人</th>
					                <th>订单状态</th>
					                <th>订单描述</th>
					                <th>备注</th>
					                <th>操作</th>
					            </tr>
			       			 </thead>    
   			 			</table>	   
				    </div>
				</div>
		  </div>
		</div>
  </body>
</html>