<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

    <form:form action="/mailer/send"
               method="post" enctype="multipart/form-data" modelAttribute="mailinfo">
        <div>From:</div>
        <form:input path="from" value="tantdps12745@fpt.edu.vn"/>
        <div>To:</div>
        <form:input path="to" value="tantdps12745@fpt.edu.vn"/>
        <div>Subject:</div>
        <form:input path="subject"/>
        <div>Body:</div>
        <form:textarea path="body" rows="3" cols="30"/>
       
        <hr/>
        <input type="submit" value="Send" />
    </form:form>

</body>
</html>