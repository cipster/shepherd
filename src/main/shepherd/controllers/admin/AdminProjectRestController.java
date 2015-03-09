package controllers.admin;

import model.ControllerResult;
import model.dto.Proiect;
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

@Controller
@RequestMapping(value = "/apis/v1/admin/project")
public class AdminProjectRestController {
	@Autowired
	private ProiectService proiectService;

	@PreAuthorize("hasAnyRole('ROLE_SUPERUSER','ROLE_ADMIN')")
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@RequestMapping(value = "/addproject", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public ControllerResult addNewProject(@RequestBody Proiect proiect) {
		ControllerResult controllerResult;

		try {
			proiectService.createProject(proiect);
			controllerResult = new ControllerResult(HttpStatus.OK.value(), "Proiectul " + proiect.getNumeProiect() + " a fost creat cu succes!");
		} catch (RuntimeException e) {
			e.printStackTrace();
			controllerResult = new ControllerResult(HttpStatus.INTERNAL_SERVER_ERROR.value(), "A apărut o eroare, proiectul nu a fost creat!");
		}

		return controllerResult;
	}

	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@Transactional(isolation = Isolation.SERIALIZABLE)
	@RequestMapping(value = "/deleteproject", method = RequestMethod.POST)
	@ResponseBody
	public ControllerResult deleteProiect(@RequestParam(defaultValue = "0") String idProiect) {
		ControllerResult controllerResult;

		try {
			proiectService.deleteProject(idProiect);
			controllerResult = new ControllerResult(HttpStatus.OK.value(), "Proiectul a fost sters cu succes!");
		} catch (RuntimeException e) {
			e.printStackTrace();
			controllerResult = new ControllerResult(HttpStatus.INTERNAL_SERVER_ERROR.value(), "A apărut o eroare, proiectul nu a fost sters!");
		}
		return controllerResult;
	}

	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@Transactional(isolation = Isolation.SERIALIZABLE)
	@RequestMapping(value = "/modifyproject", method = RequestMethod.POST)
	@ResponseBody
	public ControllerResult modifyProject(@RequestBody Proiect proiect) {
		ControllerResult controllerResult;

		try {
			proiectService.modifyProject(proiect);
			controllerResult = new ControllerResult(HttpStatus.OK.value(), "Proiectul " + proiect.getNumeProiect() + " a fost modificat cu succes!");
		} catch (RuntimeException e) {
			e.printStackTrace();
			controllerResult = new ControllerResult(HttpStatus.INTERNAL_SERVER_ERROR.value(), "A apărut o eroare, proiectul nu a fost modificat!");
		}
		return controllerResult;
	}

}
