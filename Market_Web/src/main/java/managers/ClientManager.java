package managers;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.mysql.cj.Query;

import model.Client;
import model.Information;

public class ClientManager {
	
	private final String JPA_UNIT_NAME= "Market_Web";
	private EntityManager entityManager;
	
	public EntityManager getEntityManager() {
		if(entityManager == null) {
			entityManager =  Persistence.createEntityManagerFactory(JPA_UNIT_NAME).createEntityManager();
		}
		return entityManager;
	}

	public void setEntityManager(EntityManager entityManager) {
		this.entityManager = entityManager;
	}
	
	public void AjouterClient(Client client) {
		getEntityManager().getTransaction().begin();

		getEntityManager().persist(client);
		getEntityManager().getTransaction().commit();
	}
	
	public void ModifierClient(Client client) {
		getEntityManager().getTransaction().begin();
		getEntityManager().merge(client);
		getEntityManager().getTransaction().commit();
	}
	
	public void SupprimerClient(Client client) {
		getEntityManager().getTransaction().begin();
		getEntityManager().remove(client);
		getEntityManager().getTransaction().commit();
	}
	
	
	public Client rechercherById(int id) {
		return getEntityManager().find(Client.class, id);
	}
	
	public void AfficherClient(int id) {
		Client client =  getEntityManager().find(Client.class, id);
		System.out.println(client);
	}
	
	public List<Client> AfficherTout() {
		javax.persistence.Query query = getEntityManager().createQuery("select c from Client c");
		return query.getResultList();
		
	}
	
	

}
