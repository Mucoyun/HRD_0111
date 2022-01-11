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
		
		/* System.out.println(id);
		System.out.println(name);
		System.out.println(dept);
		System.out.println(position);
		System.out.println(duty);
		System.out.println(phone);
		System.out.println(address); */
		
		try{
			String sql = "update info0111 set name=?,dept=?,position=?,duty=?,phone=?,address=? where id=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, name);
			pstmt.setString(2, dept);
			pstmt.setString(3, position);
			pstmt.setString(4, duty);
			pstmt.setString(5, phone);
			pstmt.setString(6, address);
			pstmt.setString(7, id);
			
			pstmt.executeUpdate();
			
			%><script>
				alert("인사변경이 완료되었습니다.");
				location.href="/HRD_0111/index.jsp";
			</script><%
			
			
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
</body>
</html>