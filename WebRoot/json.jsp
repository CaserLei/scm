<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/common/common.jspf" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>My JSP 'json.jsp' starting page</title>
  	<script type="text/javascript">
  		$(function(){
	  			$("#bt1").click(
	  				function(){
		  				$.post(
		  					"${proPath}/supplier/doAjax.action",
		  					{supId:1001,supName:"name1001"},
		  					function(json){
		  						alert(json.supId+"||"+json.supName);
		  					},
		  					"json"
		  				);
		  			}
	  			);	  			
	  		}
  		);
  	
  	</script>
  
  </head>  
  <body>
 	<button id="bt1" >testJson</button> 
  </body>
</html>