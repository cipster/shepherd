package controllers.admin;

import model.ControllerResult;
import model.dto.Cod1;
import model.dto.Persoana;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.dao.DataAccessException;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import services.Cod1Service;
import services.PersoanaService;
import util.enums.Response;

import java.util.List;

/**
 * Created by Ciprian on 3/12/2015.
 * Project Shepherd
 */

@Controller
@RequestMapping(value = "/global/admin/inventar")
public class AdminInventarController {

	@Autowired
	private Cod1Service cod1Service;
	@Autowired
	private PersoanaService persoanaService;


	@Transactional(isolation = Isolation.READ_UNCOMMITTED)
	@PreAuthorize("hasAnyRole('ROLE_SUPERUSER','ROLE_ADMIN')")
	@RequestMapping(value = "/cod1list", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public List<Cod1> getAllCod1() {
		return cod1Service.fetchAllCod1();
	}

	@Transactional(isolation = Isolation.READ_UNCOMMITTED)
	@PreAuthorize("hasAnyRole('ROLE_SUPERUSER','ROLE_ADMIN')")
	@RequestMapping(value = "/persoanelist", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public List<Persoana> getAllPersoane() {
		return persoanaService.fetchAllPersoane();
	}

	@Transactional(isolation = Isolation.READ_COMMITTED)
	@PreAuthorize("hasAnyRole('ROLE_SUPERUSER','ROLE_ADMIN')")
	@RequestMapping(value = "/adaugapersoana", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public ControllerResult addPersoana(@RequestBody Persoana persoana) {
		return persoanaService.addPersoana(persoana);
	}

}


