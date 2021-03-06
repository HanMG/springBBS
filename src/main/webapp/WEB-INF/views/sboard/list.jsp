<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../include/header.jsp" %>

	<!-- main content -->
	<section class="content">
		<div class="row">
			<!-- left column -->
			<div class="col-md-12">
				<!-- general form elements -->
				<div class="box">
					<div class="box-header with-border">
						<div class="box-title">List ALL PAGE</div>											
					</div>
					<div class="box-body">		
						<select name="searchType">
							<option value="n" <c:out value="${cri.searchType == null?'selected':''}"/>>---</option>
							<option value="t" <c:out value="${cri.searchType eq 't'?'selected':''}"/>>Title</option>
							<option value="c" <c:out value="${cri.searchType eq 'c'?'selected':''}"/>>Content</option>
							<option value="w" <c:out value="${cri.searchType eq 'w'?'selected':''}"/>>Writer</option>
							<option value="tc" <c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>Title OR Content</option>
							<option value="cw" <c:out value="${cri.searchType eq 'cw'?'selected':''}"/>>Content OR Writer</option>
							<option value="tcw" <c:out value="${cri.searchType eq 'tcw'?'selected':''}"/>>Title OR Content OR Writer</option>
						</select>			
						<input type="text" name="keyword" id="keywordInput" value="${cri.keyword}">
						<button id="searchBtn">Search</button>
						<button id="newBtn">New Board</button>
						<table class="table table-bordered">
							<tr>
								<th style="width: 10px">BNO</th>
								<th>TITLE</th>
								<th>WRITER</th>
								<th>REGDATE</th>
								<th style="width:40px">VIEWCNT</th>
							</tr>
							<c:forEach items="${list}" var="boardVO">
								<tr>
									<td>${boardVO.bno}</td>
									<td><a href="/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${boardVO.bno}">${boardVO.title }</a></td>
									<td>${boardVO.writer }</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardVO.regdate }"/></td>
									<td><span class="badge bg-red">${boardVO.viewcnt }</span></td>									
								</tr>
							</c:forEach>
						</table>
						<div class="text-center">
							<ul class="pagination">
								<c:if test="${pageMaker.prev }">
									<li><a href="list?page=${pageMaker.startPage -1}">&laquo;</a></li>
								</c:if>
								<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage}" var="idx">
									<!-- 해당 idx와 page가 일치하면 해당 li에 class = active를 추가해서 css처리									 -->
									<li <c:out value="${pageMaker.cri.page == idx?'class = active':''}"/>>
										<a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
									</li>
								</c:forEach>
								<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
									<li><a href="list${pageMaker.makeSearch(pageMaker.endPage+1)}">&raquo;</a></li>
								</c:if>
							</ul>
						</div>
					</div>
					<div class="box-footer">FOOTER</div>
				</div>
			</div>
		</div>
	</section>
	<form id="jobForm">
		<input type="hidden" name="page" value= ${pageMaker.cri.page }>
		<input type="hidden" name="perPageNum" value= ${pageMaker.cri.perPageNum }>
	</form>
	<script>
		var result = '${msg}';
		if(result == 'success'){
			alert("처리가 완료되었습니다.");
		}

		$(".pagenation li a").on("click", function(event){
			event.preventDefault();

			var targetPage = $(this).attr("href");

			var jobForm = $("#jobForm");

			jobForm.find("[name='page']").val(targetPage);
			jobForm.attr("action","board/listPage").attr("method","get");
			jobForm.submit();	
		});		
	</script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#searchBtn").on("click", function(event){
					self.location = "list"
					+"${pageMaker.makeQuery(1)}"
					+"&searchType="
					+$("select option:selected").val()
					+"&keyword="
					+$('#keywordInput').val();
			});
			
			$("#newBtn").on("click", function(event){
				self.location = "register";
			});
		});
	</script>
	
<%@ include file="../include/footer.jsp" %>
