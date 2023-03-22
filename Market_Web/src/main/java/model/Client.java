package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the client database table.
 * 
 */
@Entity
@NamedQuery(name="Client.findAll", query="SELECT c FROM Client c")
public class Client implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int IDC;

	private String firstname;

	private int idinfo;



	private String lastname;

	//bi-directional one-to-one association to Information
	@OneToOne
	private Information information;

	//bi-directional many-to-many association to Produit
	@ManyToMany
	@JoinTable(
		name="commande"
		, joinColumns={
			@JoinColumn(name="IdClient", referencedColumnName="IDC")
			}
		, inverseJoinColumns={
			@JoinColumn(name="idProd")
			}
		)
	private List<Produit> produits;

	public Client() {
	}

	public String getFirstname() {
		return this.firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public int getIdinfo() {
		return this.idinfo;
	}

	public void setIdinfo(int idinfo) {
		this.idinfo = idinfo;
	}



	public String getLastname() {
		return this.lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public Information getInformation() {
		return this.information;
	}

	public void setInformation(Information information) {
		this.information = information;
	}

	public List<Produit> getProduits() {
		return this.produits;
	}

	public void setProduits(List<Produit> produits) {
		this.produits = produits;
	}

}