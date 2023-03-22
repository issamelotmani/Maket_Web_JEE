<%@page import="managers.*, model.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="header.jsp" %>
  <title>Update Product</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
  <h1>Update Product</h1>
  <%-- Get the product details from the form data --%>
  <%  
    int productId = Integer.parseInt(request.getParameter("id"));
    String libelle = request.getParameter("libelle");
    double prix = Double.parseDouble(request.getParameter("prix"));
    int categorieId = Integer.parseInt(request.getParameter("categorie"));
  %>
  <%-- Update the product in the database --%>
  <%  
    ProduitManager productDao = new ProduitManager();
  	CategorieManager cm = new CategorieManager();
    Produit product = new Produit();
    product.setIdproduit(productId);
    product.setNameproduit(libelle);
    product.setPrix(prix);
    Categorie c = cm.rechercherById(categorieId);
    product.setCategorie(c);
    productDao.ModifierProduit(product);
  %>
  <p>Product updated successfully!</p>
  <a href="Produits.jsp" class="btn btn-primary">Back to Product List</a>
</body>
</html>
