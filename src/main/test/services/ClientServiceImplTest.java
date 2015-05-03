package services;

import model.dao.ClientDAO;
import model.domain.Client;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.ExpectedException;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.runners.MockitoJUnitRunner;

import static org.mockito.Matchers.any;
import static org.mockito.Matchers.anyString;
import static org.mockito.Mockito.when;

/**
 * @author Ciprian on 3/26/2015.
 *
 *         Shepherd
 */

@RunWith(MockitoJUnitRunner.class)
public class ClientServiceImplTest {

    @Rule
    private ExpectedException expectedException = ExpectedException.none();

    @Mock
    private ClientDAO clientDAOMock;

    private Client clientStub;

    @Before
    public void setUp() throws Exception {

        clientStub = new Client();
        clientStub.setClient(anyString());
    }

    @Test
    public void testIfClientExists() throws Exception {
        expectedException = expectedException;
        when(clientDAOMock.create(clientStub)).thenThrow(new IllegalArgumentException("Clientul exist? deja!"));

    }
}