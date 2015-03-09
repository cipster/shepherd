package controllers.admin;

import model.ControllerResult;
import model.dao.ClientDAO;
import model.dao.UserRoleDAO;
import model.dto.Client;
import model.dto.UserRole;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import services.ClientService;
import util.enums.Response;

import java.util.List;

@Controller
@RequestMapping(value = "/apis/v1/admin/client")
public class AdminClientRestController {
	@Autowired
	private UserRoleDAO userRoleDAO;
	@Autowired
	private ClientService clientService;

	@PreAuthorize("hasAnyRole('ROLE_SUPERUSER','ROLE_ADMIN')")
	@RequestMapping(value = "/addclient", method = RequestMethod.POST)
	public
	@ResponseBody
	ControllerResult createClient(@RequestBody Client client) {
		ControllerResult controllerResult;

		try {
			clientService.createClient(client);
			controllerResult = new ControllerResult(HttpStatus.OK.value(), "Clientul " + client.getClient() + " a fost creat cu succes!");
		} catch (IllegalArgumentException e) {
			controllerResult = new ControllerResult(HttpStatus.INTERNAL_SERVER_ERROR.value(), e.getMessage());
		} catch (RuntimeException e) {
			controllerResult = new ControllerResult(HttpStatus.INTERNAL_SERVER_ERROR.value(), "A apărut o eroare, clientul nu a fost creat!");
		}
		return controllerResult;
	}


	@Transactional(isolation = Isolation.READ_COMMITTED)
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "/modifyclient", method = RequestMethod.POST)
	@ResponseBody
	public ControllerResult modificaClient(@RequestBody Client client) {
		ControllerResult controllerResult;

		try {
			clientService.modifyClient(client);
			controllerResult = new ControllerResult(HttpStatus.OK.value(), "Clientul " + client.getClient() + " a fost modificat cu succes!");
		} catch (IllegalArgumentException ex) {
			ex.printStackTrace();
			controllerResult = new ControllerResult(HttpStatus.INTERNAL_SERVER_ERROR.value(), ex.getMessage());
		} catch (RuntimeException ex) {
			ex.printStackTrace();
			controllerResult = new ControllerResult(HttpStatus.INTERNAL_SERVER_ERROR.value(), "A apărut o eroare, clientul nu a fost modificat!");
		}

		return controllerResult;
	}

	@Transactional(isolation = Isolation.SERIALIZABLE)
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "/deleteclient", method = RequestMethod.POST)
	@ResponseBody
	public ControllerResult stergeClient(@RequestBody Client client) {
		ControllerResult controllerResult;

		try {
			clientService.deleteClient(client);
			controllerResult = new ControllerResult(HttpStatus.OK.value(), "Clientul " + client.getClient() + " a fost sters!");
		} catch (RuntimeException ex) {
			ex.printStackTrace();
			controllerResult = new ControllerResult(HttpStatus.INTERNAL_SERVER_ERROR.value(), "A apărut o eroare, clientul nu a fost sters!");
		}

		return controllerResult;
	}
}
