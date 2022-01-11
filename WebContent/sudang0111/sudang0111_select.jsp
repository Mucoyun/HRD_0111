<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>윤원태 - 0111</title>
	<style>
		#s_s_table tr{
			height: 50px;
		}#s_s_table th{
			text-align: center;
		}
	</style>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<section>
	<h2>수당 정보 조회</h2><hr>
		<table id="s_s_table">
			<tr>
				<th width="50">no</th>
				<th width="100">사원번호</th>
				<th width="100">이름</th>
				<th width="100">가족수당</th>
				<th width="100">직책수당</th>
				<th width="100">근속수당</th>
				<th width="100">기타수당</th>
				<th width="100">수당합계</th>
				<th width="100">구분</th>
			</tr>
			<%
				int no=0;
				try{
					String sql = "select a.id, a.name, b.gajok, b.jikchak, b.gunsok, b.gitasudang, (b.gajok + b.jikchak + b.gunsok + b.gitasudang) from info0111 a, sudang0111 b where a.id=b.id";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()){
						no++;
						String id = rs.getString(1);
						String name = rs.getString(2);
						String gajok = rs.getString(3);
						String jikchak = rs.getString(4);
						String gunsok = rs.getString(5);
						String gitasudang = rs.getString(6);
						String sum = rs.getString(7);
						
						%>
							<tr>
								<td align="center"><%=no %></td>
								<td align="center"><%=id %></td>
								<td align="center"><%=name %></td>
								<td align="right"><%=gajok %></td>
								<td align="right"><%=jikchak %></td>
								<td align="right"><%=gunsok %></td>
								<td align="right"><%=gitasudang %></td>
								<td align="right"><%=sum %></td>
								<td align="center">수정/삭제</td>
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