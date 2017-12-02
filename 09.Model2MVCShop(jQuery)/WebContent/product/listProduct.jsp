<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
<meta charset="EUC-KR">
<title>listProduct.jsp</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<!-- CDN(Content Delivery Network) ȣ��Ʈ ��� -->
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">

//�˻� / page �ΰ��� ��� ��� Form ������ ���� JavaScrpt �̿�  
function fncGetList(currentPage) {
//	document.getElementById("currentPage").value = currentPage;
// 	document.detailForm.submit();
	
	$("#currentPage").val(currentPage)
	$("form").attr("method", "POST").attr("action", "/product/listProduct?menu=${ menu }").submit();
}

function fncLowPrice(currentPage) {
//	document.getElementById("currentPage").value = currentPage;
//	document.getElementById("lowPriceSearch").value = "lowPrice";
//	document.getElementById("highPriceSearch").value = null;
// 	document.detailForm.submit();		
   	
	$("#currentPage").val(currentPage)
   	$("#lowPriceSearch").val('lowPrice')
   	$("#highPriceSearch").val(null)
	$("form").attr("method", "POST").attr("action", "/product/listProduct?menu=${ menu }").submit();
}
 
function fncHighPrice(currentPage) {
//	document.getElementById("currentPage").value = currentPage;
//	document.getElementById("lowPriceSearch").value = null;
//	document.getElementById("highPriceSearch").value = "highPrice";
// 	document.detailForm.submit();
	
	$("#currentPage").val(currentPage)
   	$("#lowPriceSearch").val(null)
   	$("#highPriceSearch").val('highPrice')
	$("form").attr("method", "POST").attr("action", "/product/listProduct?menu=${ menu }").submit();
	
}

$(function(){
	$( "td.ct_btn01:contains('�˻�')").css("color", "blue").bind("click", function(){
		fncGetList('${ search.currentPage }');
	});
});

$(function(){
	$("input[type = "hidden"]:contains('[�������ݼ� ��]')").css("color", "blue").bind("click", function(){
		fncLowPrice('${ search.currentPage }');
	});
});
				
$(function(){
	$("input:hidden:contains('[�������ݼ� ��]')").css("color", "blue").bind("click", function(){
		fncHighPrice('${ search.currentPage }');
	});
});

$(function(){
	
	$( $( ".ct_list_pop td:nth-child(3)" )[0] ).bind("click" , function() {
		self.location ="/product/getProduct?prodNo=${ product.prodNo }&menu=${ menu }"
	});
	
	$( ".ct_list_pop td:nth-child(9):contains('����ϱ�')" ).bind("click" , function() {
		self.location = "/purchase/updateTranCodeByProd?prodNo=${product.prodNo}&tranCode=1"
	});
	
});

 
	</script>
</head>


<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">
<!-- <form name="detailForm" action="/product/listProduct?menu=${ menu }" method="post"> -->
<form name="detailForm">
		
<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">
						${ menu == 'manage' ? "��ǰ����" : "��ǰ �����ȸ" }
					</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="right">
			<select name="searchCondition" class="ct_input_g" style="width:80px">
			
				<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>��ǰ��ȣ</option>
				<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>��ǰ��</option>
				<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>��ǰ����</option>
				
			</select>
			<input type="text" name="searchKeyword" value="${! empty search.searchKeyword ? search.searchKeyword : ""}" class="ct_input_g" style="width:200px; height:19px" />
		</td>
		
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						�˻�
					<!-- <a href="javascript:fncGetList('${ search.currentPage }');">�˻�</a> -->
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td colspan="11" >
			��ü  ${ resultPage.totalCount } �Ǽ�, ���� ${ resultPage.currentPage } ������
		</td>
	</tr>
	<tr>
		
		<td colspan="4">
			
			<input type="hidden" id="lowPriceSearch" name="lowPriceCondition" value="${ lowPrice }"/>
				[�������ݼ� ��]
			<!-- <a href = "javascript:fncLowPrice('${ search.currentPage }')">[�������ݼ� ��]</a> -->
	
			<input type="hidden" id="highPriceSearch" name="highPriceCondition" value="${ highPrice }"/>
				[�������ݼ� ��]
			<!-- <a href = "javascript:fncHighPrice('${ search.currentPage }')">[�������ݼ� ��]</a> -->
		</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">��ǰ��</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��ǰ ������</td>	
		<td class="ct_line02"></td>
		<td class="ct_list_b">�������</td>	
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	<c:set var="i" value="0" />
	<c:forEach var="product" items="${ list }">
		<c:set var="i" value="${ i+1 }" />
		<tr class="ct_list_pop">
			<td align="center">${ i }</td>
			<td></td>
			<td align="left">
				<c:if test = "${ product.proTranCode == null }">
					${ product.prodName }
				<!-- <a href="/product/getProduct?prodNo=${ product.prodNo }&menu=${ menu }">${ product.prodName }</a> -->
				</c:if>
				<c:if test = "${ product.proTranCode != null }">
					${ product.prodName }
				</c:if>
			</td>
			<td></td>
			<td align="left">${ product.price }</td>
			<td></td>
			<td align="left">${ product.prodDetail }</td>
			<td></td>
			<td align="left">
				<c:if test = "${ menu == 'search' }">
					<c:if test = "${ product.proTranCode == null }">�Ǹ���</c:if> 
					<c:if test = "${ product.proTranCode != null }">��� ����</c:if>
				</c:if>
				<c:if test = "${ menu == 'manage' }">
					<c:if test = "${ product.proTranCode == null }">�Ǹ���</c:if>
					<c:if test = "${ product.proTranCode == '0' }">���ſϷ�
					<!-- <a href="/purchase/updateTranCodeByProd?prodNo=${product.prodNo}&tranCode=1">����ϱ�</a> -->
						����ϱ�
					</c:if>
					<c:if test = "${ product.proTranCode == '1' }">�����</c:if>
					<c:if test = "${ product.proTranCode == '2' }">��ۿϷ�</c:if>
				</c:if>
			</td>
		</tr>
		<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
		</tr>
	</c:forEach>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="center">
			 <input type="hidden" id="currentPage" name="currentPage" value=""/>
			
			<jsp:include page="../common/pageNavigator.jsp"/>
				
    	</td>
	</tr>
</table>
<!--  ������ Navigator �� -->

</form>

</div>
</body>
</html>
