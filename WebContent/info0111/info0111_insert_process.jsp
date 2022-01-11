<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>윤원태 - 0111</title>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String dept = request.getParameter("dept");
		String position = request.getParameter("position");
		String duty = request.getParameter("duty");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
	
		try{
			String sql = "insert into info0111 values(?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, dept);
			pstmt.setString(4, position);
			pstmt.setString(5, duty);
			pstmt.setString(6, phone);
			pstmt.setString(7, address);
			pstmt.executeUpdate();
			
			%><script>
				alert("인사등록이 완료되었습니다.");
				location.href="/HRD_0111/index.jsp";
			</script><%
			
			
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
</body>
</html>