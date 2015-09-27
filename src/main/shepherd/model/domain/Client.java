package model.domain;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;


@Entity(name = "clienti")
public class Client {

    private long idClient;
    private String client;

    @Id
    @Column(name = "id_client", nullable = false, insertable = true, updatable = true)
    public long getIdClient() {
        return idClient;
    }

    public void setIdClient(long idClient) {
        this.idClient = idClient;
    }

    @Basic
    @Column(name = "client", nullable = false, insertable = true, updatable = true, length = 250)
    public String getClient() {
        return client;
    }

    public void setClient(String client) {
        this.client = client;
    }

}
