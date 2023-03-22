package test;
import db.impCategory;
import db.interfaceCategory;
import model.Categorie;
import managers.CategorieManager;

public class test {

	public static void main(String[] args) {
		Categorie Cat1 =new Categorie();
		
		Cat1.setLibelleCat("lib335555");
		CategorieManager cm = new CategorieManager();
		cm.AjouterCategorie(Cat1);
		

	}

}
