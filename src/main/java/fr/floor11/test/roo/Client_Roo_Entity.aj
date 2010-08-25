package fr.floor11.test.roo;

import fr.floor11.test.roo.Client;
import java.lang.Integer;
import java.lang.Long;
import java.lang.SuppressWarnings;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PersistenceContext;
import javax.persistence.Version;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Client_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager Client.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Client.id;
    
    @Version
    @Column(name = "version")
    private Integer Client.version;
    
    public Long Client.getId() {
        return this.id;
    }
    
    public void Client.setId(Long id) {
        this.id = id;
    }
    
    public Integer Client.getVersion() {
        return this.version;
    }
    
    public void Client.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void Client.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Client.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Client attached = this.entityManager.find(this.getClass(), this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Client.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public Client Client.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Client merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager Client.entityManager() {
        EntityManager em = new Client().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Client.countClients() {
        return ((Number) entityManager().createQuery("select count(o) from Client o").getSingleResult()).longValue();
    }
    
    @SuppressWarnings("unchecked")
    public static List<Client> Client.findAllClients() {
        return entityManager().createQuery("select o from Client o").getResultList();
    }
    
    public static Client Client.findClient(Long id) {
        if (id == null) return null;
        return entityManager().find(Client.class, id);
    }
    
    @SuppressWarnings("unchecked")
    public static List<Client> Client.findClientEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from Client o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
