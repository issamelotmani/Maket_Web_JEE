<%@page import="model.Categorie"%>
<%@page import="managers.CategorieManager"%>
<%@page import="model.Produit"%>
<%@page import="managers.ProduitManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
CategorieManager categorieDao = new CategorieManager();
if (request.getMethod().equalsIgnoreCase("post")) {
String libelle = request.getParameter("libelle");
Categorie categorie = new Categorie();
categorie.setLibelleCat(libelle);
categorieDao.AjouterCategorie(categorie);
response.sendRedirect("Categories.jsp");
}
%>
</body>
</html>