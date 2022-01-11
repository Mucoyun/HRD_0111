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
			location.href="/HRD_0111/index.jsp";
		}
	</script>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<%
		int id=0;
		try{
			String sql = "select max(id) from info0111";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				id = rs.getInt(1);
				id++;
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
		<form name="i_i_form" method="post" action="info0111_insert_process.jsp">
			<table id="i_iu_table">
				<tr>
					<th>사원번호(자동생성)</th>
					<td><input type="text" name="id" value="<%=id %>" readonly>마지막 번호 +1</td>
				</tr>
				<tr>
					<th>성명</th>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<th>소속부서</th>
					<td>
						<select name="dept">
							<option value="10" selected>인사부</option>
							<option value="20">기획부</option>
							<option value="30">홍보부</option>
							<option value="40">영업부</option>
							<option value="50">경리부</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>직급</th>
					<td>
						<input type="radio" name="position" value="1" checked> 1급
						<input type="radio" name="position" value="2"> 2급
						<input type="radio" name="position" value="3"> 3급
						<input type="radio" name="position" value="4"> 4급
						<input type="radio" name="position" value="5"> 5급
					</td>
				</tr>
				<tr>
					<th>직책</th>
					<td><input type="text" name="duty"></td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><input type="text" name="phone"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="address"></td>
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