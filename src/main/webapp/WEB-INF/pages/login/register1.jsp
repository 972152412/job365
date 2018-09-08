<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../common/taglibs.jsp" %>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<title>job365后台管理系统</title>
   <script type="text/javascript">
   $(function(){
	 var flag= true;
	 $("#register-form").submit(function(){		
		
		if(flag){			
		 	var url = "<%=basePath%>login/register.do";	
			$.post(url,$("#register-form").serialize(),function(data){
				
				var jsonReturn = eval("(" + data +")");
					console.log(data);
	   			   if(jsonReturn.code == "1"){
	   				  
	   			   		layer.alert(jsonReturn.msg, {icon: 6,time:0}, function(data){
			    			var index = parent.layer.getFrameIndex(window.name);
						    window.parent.location.reload(true);
							parent.layer.close(index); 
	   			   			<%-- location.href = "<%=basePath%>login/init.do"; --%>

	   			   		});
	   			   		
	   			   }else{
	   				   
	   			   		layer.msg(jsonReturn.msg,{icon: 5,time:3000});
	   			   }
			   });			
		} 		
	   return false;
	 });
     
   });
    var usertype='';
    $(".tag").click(function(){
		if($(this).children("label").text()=="普通用户"){
			usertype=1;
		}
		if($(this).children("label").text()=="企业用户"){
			usertype=2;
		}
	});
   </script>
   <style type="text/css">
   .loginBox {
    background: #fff;
    }
    .loginWraper{

    background: #fff;
    }
   </style>
</head>
<body>

 <div class="loginWraper">
  <div id="loginform" class="loginBox">
  	<h2 style="margin-left:43%;margin-top:-40px; color:#333; font-family:"微软雅黑">用户注册</h2>
    <form class="form form-horizontal" action="#" id="register-form" method="post" style="margin-top:-10px;">
      <div class="row cl">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60d;</i></label>
        <div class="formControls col-xs-8">
        <p><span class="name"></span>
            <a class="tag" style="margin-left:80px"><input type="radio" name="uType" id="ResUser"/>
            <label for="ResUser" class="ResUser">普通用户</label></a>
            <a class="tag"><input type="radio" name="uType" id="PosUser"/>
            <label for="PosUser" class="PosUser">企业用户</label></a>
        </p>
        <input id="userName" name="userName" type="text" placeholder="用户名(限16位，中英文、数字、减号或下划线)" required="required"
        class="input-text size-L" >
        </div>
      </div>
      <div class="row cl">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60e;</i></label>
        <div class="formControls col-xs-8">
          <input id="password" name="password" type="password" placeholder="密码(限6-20位，字母、数字、字符)" required="required"
          class="input-text size-L" >
        </div>
     </div>
     <div class="row cl">
     <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60e;</i></label>
        <div class="formControls col-xs-8">
          <input id="checkPwd" name="checkPwd" type="password" placeholder="确认密码"  required="required"
          class="input-text size-L" onblur="validateCheckPwd()">
        </div>
     </div>
      <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3">        
          <input name="register" type="submit" class="btn btn-success radius size-L" value="&nbsp;确&nbsp;&nbsp;&nbsp;&nbsp;认&nbsp;"
          style="margin-left:5%; padding-left:20px;">
          <input style="margin-left:16%; padding-left:20px;margin-top:8px;" name="" 
          type="reset" class="btn btn-default radius size-L" value="&nbsp;重&nbsp;&nbsp;&nbsp;&nbsp;置&nbsp;">             
        </div>      
      </div>
    </form>
  </div>
</div> 
</body>
</html>