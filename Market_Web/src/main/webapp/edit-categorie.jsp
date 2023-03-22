<%@page import="java.util.List"%>
<%@page import="managers.*"%>
<%@page import="model.*"%>

<!DOCTYPE html>
<html>
<head>
  <title>Edit Categorie</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
<%@include file="header.jsp" %>
  <h1>Edit Categorie</h1>
  <form action="update-categorie.jsp" method="post">
    <%  
        int categorieId = Integer.parseInt(request.getParameter("id"));
        CategorieManager categorieDao = new CategorieManager();
        Categorie categorie = categorieDao.rechercherById(categorieId);
    %>
    <div class="form-group">
      <label for="libelle">Libelle:</label>
      <input type="text" class="form-control" id="libelle" name="libelle" value="<%= categorie.getLibelleCat() %>">
    </div>
    
    <input type="hidden" name="id" value="<%= categorieId %>">
    <button type="submit" class="btn btn-primary">Update Product</button>
  </form>
</body>
</html>
