<%@page import="java.util.List"%>
<%@page import="managers.*"%>
<%@page import="model.*"%>

<!DOCTYPE html>
<html>
<head>
  <title>Edit Product</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
<%@include file="header.jsp" %>
  <h1>Edit Product</h1>
  <form action="update-product.jsp" method="post">
    <%  
        int productId = Integer.parseInt(request.getParameter("id"));
        ProduitManager productDao = new ProduitManager();
        Produit product = productDao.rechercherById(productId);
    %>
    <div class="form-group">
      <label for="libelle">Libelle:</label>
      <input type="text" class="form-control" id="libelle" name="libelle" value="<%= product.getNameproduit() %>">
    </div>
    <div class="form-group">
      <label for="prix">Prix:</label>
      <input type="number" class="form-control" id="prix" name="prix" value="<%= product.getPrix() %>">
    </div>
    <div class="form-group">
      <label for="categorie">Categorie:</label>
      <select class="form-control" id="categorie" name="categorie">
        <%  
            CategorieManager categorieDao = new CategorieManager();
            List<Categorie> categories = categorieDao.AfficherTout();
            for (Categorie categorie : categories) {
                if(categorie.getIdCat() == product.getCategorie().getIdCat()) {
                    out.println("<option value='" + categorie.getIdCat() + "' selected>" + categorie.getLibelleCat() + "</option>");
                } else {
                    out.println("<option value='" + categorie.getIdCat() + "'>" + categorie.getLibelleCat() + "</option>");
                }
            }
        %>
      </select>
    </div>
    <input type="hidden" name="id" value="<%= productId %>">
    <button type="submit" class="btn btn-primary">Update Product</button>
  </form>
</body>
</html>
