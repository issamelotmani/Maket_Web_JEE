package model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the information database table.
 * 
 */
@Entity
@NamedQuery(name="Information.findAll", query="SELECT i FROM Information i")
public class Information implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int idinfo;

	private String adresse;

	private String email;

	//bi-directional one-to-one association to Client
	@OneToOne(mappedBy="information")
	private Client client;

	public Information() {
	}

	public int getIdinfo() {
		return this.idinfo;
	}

	public void setIdinfo(int idinfo) {
		this.idinfo = idinfo;
	}

	public String getAdresse() {
		return this.adresse;
	}

	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Client getClient() {
		return this.client;
	}

	public void setClient(Client client) {
		this.client = client;
	}

}