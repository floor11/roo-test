package fr.floor11.test.roo;

import fr.floor11.test.roo.ClientDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ClientIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ClientIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ClientIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private ClientDataOnDemand ClientIntegrationTest.dod;
    
    @Test
    public void ClientIntegrationTest.testCountClients() {
        org.junit.Assert.assertNotNull("Data on demand for 'Client' failed to initialize correctly", dod.getRandomClient());
        long count = fr.floor11.test.roo.Client.countClients();
        org.junit.Assert.assertTrue("Counter for 'Client' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ClientIntegrationTest.testFindClient() {
        org.junit.Assert.assertNotNull("Data on demand for 'Client' failed to initialize correctly", dod.getRandomClient());
        java.lang.Long id = dod.getRandomClient().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Client' failed to provide an identifier", id);
        fr.floor11.test.roo.Client obj = fr.floor11.test.roo.Client.findClient(id);
        org.junit.Assert.assertNotNull("Find method for 'Client' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'Client' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void ClientIntegrationTest.testFindAllClients() {
        org.junit.Assert.assertNotNull("Data on demand for 'Client' failed to initialize correctly", dod.getRandomClient());
        long count = fr.floor11.test.roo.Client.countClients();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'Client', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<fr.floor11.test.roo.Client> result = fr.floor11.test.roo.Client.findAllClients();
        org.junit.Assert.assertNotNull("Find all method for 'Client' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'Client' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ClientIntegrationTest.testFindClientEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'Client' failed to initialize correctly", dod.getRandomClient());
        long count = fr.floor11.test.roo.Client.countClients();
        if (count > 20) count = 20;
        java.util.List<fr.floor11.test.roo.Client> result = fr.floor11.test.roo.Client.findClientEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'Client' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'Client' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void ClientIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'Client' failed to initialize correctly", dod.getRandomClient());
        java.lang.Long id = dod.getRandomClient().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Client' failed to provide an identifier", id);
        fr.floor11.test.roo.Client obj = fr.floor11.test.roo.Client.findClient(id);
        org.junit.Assert.assertNotNull("Find method for 'Client' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyClient(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Client' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void ClientIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'Client' failed to initialize correctly", dod.getRandomClient());
        java.lang.Long id = dod.getRandomClient().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Client' failed to provide an identifier", id);
        fr.floor11.test.roo.Client obj = fr.floor11.test.roo.Client.findClient(id);
        org.junit.Assert.assertNotNull("Find method for 'Client' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyClient(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Client' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void ClientIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'Client' failed to initialize correctly", dod.getRandomClient());
        fr.floor11.test.roo.Client obj = dod.getNewTransientClient(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'Client' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'Client' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'Client' identifier to no longer be null", obj.getId());
    }
    
    @Test
    @Transactional
    public void ClientIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'Client' failed to initialize correctly", dod.getRandomClient());
        java.lang.Long id = dod.getRandomClient().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Client' failed to provide an identifier", id);
        fr.floor11.test.roo.Client obj = fr.floor11.test.roo.Client.findClient(id);
        org.junit.Assert.assertNotNull("Find method for 'Client' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        obj.flush();
        org.junit.Assert.assertNull("Failed to remove 'Client' with identifier '" + id + "'", fr.floor11.test.roo.Client.findClient(id));
    }
    
}
