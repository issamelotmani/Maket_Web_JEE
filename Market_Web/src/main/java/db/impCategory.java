package db;

import java.util.List;

import javax.persistence.Query;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import model.Categorie;

public class impCategory implements interfaceCategory {
	
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("Market_Web");
	EntityManager em = emf.createEntityManager();
	
	public impCategory() {
		
	}

	@Override
	public Categorie ajouter(Categorie cat) {
		// TODO Auto-generated method stub
		
		em.getTransaction().begin();
		em.persist(cat);
		
		em.getTransaction().commit();
		
	
		
		em.close();
		emf.close();
		
		return null;
	}

	@Override
	public Categorie modifier(Categorie cat, int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Categorie> getAllCategories() {
		em.getTransaction().begin();
		Query query = em.createQuery("SELECT C FROM Categorie C");
		List<Categorie> users = query.getResultList();
		em.getTransaction().commit();
		em.close();
		emf.close();
		return null;
	}

	@Override
	public void supprimer(int id) {
		// TODO Auto-generated method stub
		
	}
	
	

}
