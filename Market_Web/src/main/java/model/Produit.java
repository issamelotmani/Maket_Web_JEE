package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the produit database table.
 * 
 */
@Entity
@NamedQuery(name="Produit.findAll", query="SELECT p FROM Produit p")
public class Produit implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int idproduit;

	private String nameproduit;

	private double prix;

	private String type;

	//bi-directional many-to-many association to Client
	@ManyToMany(mappedBy="produits")
	private List<Client> clients;

	//bi-directional many-to-one association to Categorie
	@ManyToOne
	@JoinColumn(name="IdCategory")
	private Categorie categorie;

	public Produit() {
	}

	public int getIdproduit() {
		return this.idproduit;
	}

	public void setIdproduit(int idproduit) {
		this.idproduit = idproduit;
	}

	public String getNameproduit() {
		return this.nameproduit;
	}

	public void setNameproduit(String nameproduit) {
		this.nameproduit = nameproduit;
	}

	public double getPrix() {
		return this.prix;
	}

	public void setPrix(double prix) {
		this.prix = prix;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public List<Client> getClients() {
		return this.clients;
	}

	public void setClients(List<Client> clients) {
		this.clients = clients;
	}

	public Categorie getCategorie() {
		return this.categorie;
	}

	public void setCategorie(Categorie categorie) {
		this.categorie = categorie;
	}

}