package controllers;

import model.ProiectResult;
import model.dao.ClientDAO;
import model.dao.ProiectDAO;
import model.dao.UserRoleDAO;
import model.dto.Client;
import model.dto.Proiect;
import model.dto.UserRole;
import org.springframework.beans.factory.annotation.Autowired;
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
import services.ProiectService;
import util.enums.Response;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping(value = "/apis/v1/admin/project")
public class AdminProjectRestController {
	@Autowired
	private ProiectDAO proiectDAO;
	@Autowired
	private ClientDAO clientDAO;
	@Autowired
	private UserRoleDAO userRoleDAO;
	@Autowired
	private ProiectService proiectService;

	@PreAuthorize("hasAnyRole('ROLE_SUPERUSER','ROLE_ADMIN')")
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@RequestMapping(value = "/getrole", method = RequestMethod.POST)
	public
	@ResponseBody
	String getRole(@RequestParam String username) throws Exception {
		String responseString;
		String roleString = "";
		try {
			List<UserRole> userRoles = userRoleDAO.findByID(username);
			if ( userRoles != null && !userRoles.isEmpty() ) {
				for (UserRole s : userRoles) {
					roleString += s.getRoleType() + "=";
				}
			}
			responseString = "{\"username\":\"" + username + "\", \"role\":\"" + roleString + "\"}";
		} catch (Exception x) {
			responseString = "error";
		}

		return responseString;
	}

	@PreAuthorize("hasAnyRole('ROLE_SUPERUSER','ROLE_ADMIN')")
	@RequestMapping(value = "/addproject", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public ProiectResult addNewProject(@RequestBody Proiect proiect) {
		ProiectResult proiectResult;

		try {
			proiectService.createProject(proiect);
			proiectResult = new ProiectResult(HttpStatus.OK.value(), "Proiectul " + proiect.getNumeProiect() + " a fost creat cu succes!");
		} catch (RuntimeException e) {
			e.printStackTrace();
			proiectResult = new ProiectResult(HttpStatus.INTERNAL_SERVER_ERROR.value(), "A apărut o eroare, proiectul nu a fost creat!");
		}

		return proiectResult;
	}

	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@Transactional(isolation = Isolation.SERIALIZABLE)
	@RequestMapping(value = "/deleteproject", method = RequestMethod.POST)
	@ResponseBody
	public ProiectResult deleteProiect(@RequestParam(defaultValue = "0") String idProiect) {
		ProiectResult proiectResult;
		try {
			proiectService.deleteProject(idProiect);
			proiectResult = new ProiectResult(HttpStatus.OK.value(), "Proiectul a fost sters cu succes!");
		} catch (RuntimeException e) {
			e.printStackTrace();
			proiectResult = new ProiectResult(HttpStatus.INTERNAL_SERVER_ERROR.value(), "A apărut o eroare, proiectul nu a fost sters!");
		}
		return proiectResult;
	}

	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@Transactional(isolation = Isolation.SERIALIZABLE)
	@RequestMapping(value = "/modifyproject", method = RequestMethod.POST)
	@ResponseBody
	public ProiectResult modifyProject(@RequestBody Proiect proiect) throws Exception {
		ProiectResult proiectResult;

		try {
			proiectService.modifyProject(proiect);
			proiectResult = new ProiectResult(HttpStatus.OK.value(), "Proiectul " + proiect.getNumeProiect() + " a fost modificat cu succes!");
		} catch (RuntimeException e) {
			e.printStackTrace();
			proiectResult = new ProiectResult(HttpStatus.INTERNAL_SERVER_ERROR.value(), "A apărut o eroare, proiectul nu a fost modificat!");
		}
		return proiectResult;
	}

	@PreAuthorize("hasAnyRole('ROLE_SUPERUSER','ROLE_ADMIN')")
	@RequestMapping(value = "/addclient", method = RequestMethod.POST)
	public
	@ResponseBody
	String createClient(HttpServletRequest request) throws Exception {
		Client client = new Client();
		String numeClient = request.getParameter("client");
		client.setClient(numeClient);
		String responseString = null;
		int ok;
		try {
			ok = clientDAO.create(client);
			if ( ok > 0 )
				responseString = "{\"client\":\"" + numeClient + "\"}";
		} catch (Exception e) {
			responseString = Response.EMPTY.getLabel();
		}
		return responseString;
	}

}
