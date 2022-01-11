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
		}#i_iu_table th{
			width: 200px;
		}#i_iu_table td{
			width: 600px;
		}
		#i_iu_table input[type="text"]{
			height: 50px;
			width: 400px;
		}#i_iu_table input[type="radio"]{
			height: 25px;
			width: 50px;
			padding: 0 20px;
		}#i_iu_table select{
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
			if(document.i_i_form.name.value==""){
				alert("성명이 입력되지 않았습니다.");
				document.i_i_form.name.focus();
			}else{
				document.i_i_form.submit();
			}
		}
		
		function retry() {
			history.back(-1);
		}
	</script>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<%
		String send_id = request.getParameter("send_id");
		String id = "";
		String name = "";
		String dept = "";
		String position = "";
		String duty = "";
		String phone = "";
		String address = "";
		
		//System.out.println(send_id);
		
		try{
			String sql = "select * from info0111 where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, send_id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				id = rs.getString(1);
				name = rs.getString(2);
				dept = rs.getString(3);
				position = rs.getString(4);
				duty = rs.getString(5);
				phone = rs.getString(6);
				address = rs.getString(7);
			}else{
				%><script>
					alert("no search id");
					history.back(-1);
				</script><%
			}
			
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
	<section>
		<h2>인사관리 시스템</h2><hr>
		<form name="i_i_form" method="post" action="info0111_update_process.jsp">
			<table id="i_iu_table">
				<tr>
					<th>사원번호(자동생성)</th>
					<td><input type="text" name="id" value="<%=id %>" readonly>마지막 번호 +1</td>
				</tr>
				<tr>
					<th>성명</th>
					<td><input type="text" name="name"  value="<%=name %>"></td>
				</tr>
				<tr>
					<th>소속부서</th>
					<td>
						<select name="dept">
							<option value="10" <%if(dept.equals("10")){%> selected <%} %>>인사부</option>
							<option value="20" <%if(dept.equals("20")){%> selected <%} %>>기획부</option>
							<option value="30" <%if(dept.equals("30")){%> selected <%} %>>홍보부</option>
							<option value="40" <%if(dept.equals("40")){%> selected <%} %>>영업부</option>
							<option value="50" <%if(dept.equals("50")){%> selected <%} %>>경리부</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>직급</th>
					<td>
						<input type="radio" name="position" value="1" <%if(position.equals("1")){%> checked <%} %>> 1급
						<input type="radio" name="position" value="2" <%if(position.equals("2")){%> checked <%} %>> 2급
						<input type="radio" name="position" value="3" <%if(position.equals("3")){%> checked <%} %>> 3급
						<input type="radio" name="position" value="4" <%if(position.equals("4")){%> checked <%} %>> 4급
						<input type="radio" name="position" value="5" <%if(position.equals("5")){%> checked <%} %>> 5급
					</td>
				</tr>
				<tr>
					<th>직책</th>
					<td><input type="text" name="duty" value="<%=duty %>"></td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><input type="text" name="phone" value="<%=phone %>"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="address" value="<%=address %>"></td>
				</tr>
				<tr>
					<td id="btntd" colspan="2">
						<button type="button" onclick="check()">등록</button>
						<button type="button" onclick="retry()">취소</button>
					</td>
				</tr>
			</table>
		</form><hr>
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>