<%@page import="java.util.List"%>
<%@page import="managers.*"%>
<%@page import="model.*"%>

<!DOCTYPE html>
<html>
<head>
  <title>Create Product</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
<%@include file="header.jsp" %>

  <h1>Create Product</h1>
  <form action="createProduct.jsp" method="post">
    <div class="form-group">
      <label for="libelle">Libelle:</label>
      <input type="text" class="form-control" id="libelle" name="libelle">
    </div>
    <div class="form-group">
      <label for="prix">Prix:</label>
      <input type="number" class="form-control" id="prix" name="prix">
    </div>
    <div class="form-group">
      <label for="categorie">Categorie:</label>
      <select class="form-control" id="categorie" name="categorie">
        <%  
            CategorieManager categorieDao = new CategorieManager();
            List<Categorie> categories = categorieDao.AfficherTout();
            for (Categorie categorie : categories) {
                 
                    out.println("<option value='" + categorie.getIdCat() + "'>" + categorie.getLibelleCat() + "</option>");
                
            }
        %>
      </select>
    </div>
    <button type="submit" class="btn btn-primary">Create</button>
  </form>
</body>
</html>