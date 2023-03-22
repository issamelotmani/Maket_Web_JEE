package db;

import java.util.List;

import model.Categorie;

public interface interfaceCategory {
	
public Categorie ajouter(Categorie cat);
public Categorie modifier(Categorie cat,int id);
public List<Categorie> getAllCategories();
public void supprimer(int id);



}
