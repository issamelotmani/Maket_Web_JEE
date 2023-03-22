<%@page import="model.Categorie"%>
<%@page import="managers.CategorieManager"%>
<%@page import="model.Produit"%>
<%@page import="managers.ProduitManager"%>
<%
  int id = Integer.parseInt(request.getParameter("id"));
  CategorieManager categorieDao = new CategorieManager();
  Categorie categorie = categorieDao.rechercherById(id);
  categorieDao.SupprimerCategorie(categorie);
%>