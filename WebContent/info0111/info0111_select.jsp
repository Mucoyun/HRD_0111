<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>윤원태 - 0111</title>
	<style>
		#i_iu_table tr{
			height: 50px;
		}
	</style>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<section>
	<h2>인사관리 시스템</h2><hr>
		<table id="i_iu_table">
			<tr>
				<th width="50">no</th>
				<th width="100">성명</th>
				<th width="100">사번</th>
				<th width="50">직급</th>
				<th width="50">직책</th>
				<th width="200">연락처</th>
				<th width="100">소속부서</th>
				<th width="200">주소</th>
			</tr>
			<%
				int no=0;
				try{
					String sql = "select * from info0111";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()){
						no++;
						String id = rs.getString(1);
						String name = rs.getString(2);
						String dept = rs.getString(3);
						String position = rs.getString(4);
						String duty = rs.getString(5);
						String phone = rs.getString(6);
						String address = rs.getString(7);
						
						%>
							<tr>
								<td><%=no %></td>
								<td><a href="/HRD_0111/info0111/info0111_update.jsp?send_id=<%=id %>"><%=id %></a></td>
								<td><%=name %></td>
								<td><%=dept %></td>
								<td><%=position %></td>
								<td><%=phone %></td>
								<td><%=duty %></td>
								<td><%=address %></td>
							</tr>
						<%
						
					}
				}catch(SQLException e){
					e.printStackTrace();
				}
			%>
		</table>
	<hr></section>
	<%@ include file="/footer.jsp" %>
</body>
</html>