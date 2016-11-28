<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@include file="/common/common.jspf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>整合测试添加供应商信息</title>
	</head>
	<body>
		<form action="${pageContext.request.contextPath }/supplier/insertSupplier.action" method="post">
			供应商名称：<input type="text"	name="supName"><br> 
		          供应商类型：<select id="cc" class="easyui-combobox" name="supType" style="width:200px;">   
				   		<c:forEach items="${applicationScope.sysParam.supType}" var="stype">
				   			<option value='${stype.key}'>${stype.value}</option> 
				   		</c:forEach>
                     </select>  
			<input type="submit" value="添加供应商信息">
		</form>
	</body>
</html>