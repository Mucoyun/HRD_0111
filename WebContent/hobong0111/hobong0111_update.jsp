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
		}#h_iu_table th{
			width: 200px;
		}#h_iu_table td{
			width: 600px;
		}
		#h_iu_table input[type="text"]{
			height: 50px;
			width: 400px;
		}#h_iu_table input[type="radio"]{
			height: 25px;
			width: 50px;
			padding: 0 20px;
		}#h_iu_table select{
			height: 50px;
			width: 400px;
		}
		
		
		#btntd{
			text-align: center;
		}#btntd button{
			height: 40px;
			width: 150px;
		}
		
		
	
	</style>
	<script>
		function check() {
			if(document.h_u_form.salary.value==""){
				alert("급여가 입력되지 않았습니다.");
				document.h_u_form.salary.focus();
			}else{
				document.h_u_form.submit();
			}
		}
		
		function retry() {
			location.href="/HRD_0111/index.jsp";
		}
	</script>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<%
		String send_dunggub = request.getParameter("send_dunggub");
		String dunggub = "";
		String salary = "";
		
		try{
			String sql = "select * from hobong0111 where dunggub=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, send_dunggub);
			rs = pstmt.executeQuery();
			if(rs.next()){
				dunggub = rs.getString(1);
				salary = rs.getString(2);
			}else{
				%><script>
					alert("no search dunggub");
					history.back(-1);
				</script><%
			}
			
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
	<section>
		<h2>인사관리 호봉 변경 화면</h2><hr>
		<form name="h_u_form" method="post" action="hobong0111_update_process.jsp">
			<table id="h_iu_table">
				<tr>
					<th>직급</th>
					<td><input type="text" name="dunggub" value="<%=dunggub %>" readonly></td>
				</tr>
				<tr>
					<th>급여</th>
					<td><input type="text" name="salary" value="<%=salary %>"></td>
				</tr>
				<tr>
					<td id="btntd" colspan="2">
						<button type="button" onclick="check()">등록</button>
						<button type="button" onclick="retry()">취소</button>
					</td>
				</tr>
			</table>
		</form>
	<hr></section>
	<%@ include file="/footer.jsp" %>
</body>
</html>