<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<button type="button" onclick="get()">ajax get요청</button>
	
	<script>
		function get() {
			
			fetch("test.ajax?name=홍길동&age=20")
			.then(function(response) {
				return response.text();
			})
			.then(function(data) {
				console.log(data);
			})
			
		}
		
	</script>
	
	
</body>
</html>