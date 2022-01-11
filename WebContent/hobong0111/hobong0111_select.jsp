<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>윤원태 - 0111</title>
	<style>
		#h_iu_table tr{
			height: 50px;
		}
	</style>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<section>
	<h2>호봉 정보 조회</h2><hr>
		<table id="h_iu_table">
			<tr>
				<th width="50">no</th>
				<th width="100">등급</th>
				<th width="200">급여</th>
			</tr>
			<%
				int no=0;
				try{
					String sql = "select * from hobong0111";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()){
						no++;
						String dunggub = rs.getString(1);
						String salary = rs.getString(2);
						
						%>
							<tr>
								<td><%=no %></td>
								<td><a href="/HRD_0111/hobong0111/hobong0111_update.jsp?send_dunggub=<%=dunggub %>"><%=dunggub %>급</a></td>
								<td><%=salary %></td>
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