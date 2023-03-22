<%@page import="managers.ProduitManager"%>
<%@page import="model.Produit"%>
<%
  int id = Integer.parseInt(request.getParameter("id"));
  ProduitManager productDao = new ProduitManager();
  Produit produit = productDao.rechercherById(id);
  productDao.SupprimerProduit(produit);
%>