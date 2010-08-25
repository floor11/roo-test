package fr.floor11.test.roo;

import org.springframework.roo.addon.test.RooIntegrationTest;
import fr.floor11.test.roo.Client;
import org.junit.Test;

@RooIntegrationTest(entity = Client.class)
public class ClientIntegrationTest {

    @Test
    public void testMarkerMethod() {
    }
}
