<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
<title>addPurchase.jsp</title>
</head>

<body>

<form name="updatePurchase" action="/purchase/updatePurchase?tranNo=${ purchase.tranNo }" method="post">

�� ������ ���� ���Ű� �Ǿ����ϴ�.

<table border=1>
	<tr>
		<td>��ǰ��ȣ</td>
		<td>${ purchase.purchaseProd.prodNo }</td>
		<td></td>
	</tr>
	<tr>
		<td>�����ھ��̵�</td>
		<td>${ purchase.buyer.userId}</td>
		<td></td>
	</tr>
	<tr>
		<td>���Ź��</td>
		<td>
			${ purchase.paymentOption == '1  ' ? "���ݱ���" : "�ſ뱸��" }
		</td>
		<td></td>
	</tr>
	<tr>
		<td>�������̸�</td>
		<td>${ purchase.receiverName }</td>
		<td></td>
	</tr>
	<tr>
		<td>�����ڿ���ó</td>
		<td>${ purchase.receiverPhone }</td>
		<td></td>
	</tr>
	<tr>
		<td>�������ּ�</td>
		<td>${ purchase.dlvyAddr }</td>
		<td></td>
	</tr>
		<tr>
		<td>���ſ�û����</td>
		<td>${ purchase.dlvyRequest }</td>
		<td></td>
	</tr>
	<tr>
		<td>����������</td>
		<td>${ purchase.dlvyDate }</td>
		<td></td>
	</tr>
</table>
</form>

</body>
</html>