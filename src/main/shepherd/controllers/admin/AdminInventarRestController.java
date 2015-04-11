package controllers.admin;

import model.ControllerResult;
import model.dto.Cod1;
import model.dto.Loc;
import model.dto.Persoana;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import services.Cod1Service;
import services.LocService;
import services.PersoanaService;

import java.util.List;

/**
 * Created by Ciprian on 3/12/2015.
 * Project Shepherd
 */

@Controller
@RequestMapping(value = "/global/admin/inventar")
public class AdminInventarRestController {

	@Autowired
	private Cod1Service cod1Service;
	@Autowired
	private PersoanaService persoanaService;
	@Autowired
	private LocService locService;


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
	@RequestMapping(value = "/addpersoana", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public ControllerResult addPersoana(@RequestBody Persoana persoana) {
		return persoanaService.addPersoana(persoana);
	}

	@Transactional(isolation = Isolation.READ_COMMITTED)
	@PreAuthorize("hasAnyRole('ROLE_SUPERUSER','ROLE_ADMIN')")
	@RequestMapping(value = "/modifyperson", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public ControllerResult modPersoana(@RequestBody Persoana persoana) {
		return persoanaService.modPersoana(persoana);
	}


	@Transactional(isolation = Isolation.READ_COMMITTED)
	@PreAuthorize("hasAnyRole('ROLE_SUPERUSER','ROLE_ADMIN')")
	@RequestMapping(value = "/deleteperson", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public ControllerResult delPersoana(@RequestBody Persoana persoana) {
		return persoanaService.delPersoana(persoana);
	}

	@Transactional(isolation = Isolation.READ_COMMITTED)
	@PreAuthorize("hasAnyRole('ROLE_SUPERUSER','ROLE_ADMIN')")
	@RequestMapping(value = "/modifyloc", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public ControllerResult modLoc(@RequestBody Loc loc) {
		return locService.modLoc(loc);
	}

	@Transactional(isolation = Isolation.READ_COMMITTED)
	@PreAuthorize("hasAnyRole('ROLE_SUPERUSER','ROLE_ADMIN')")
	@RequestMapping(value = "/addloc", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public ControllerResult addLoc(@RequestBody Loc loc) {
		return locService.addLoc(loc);
	}

	@Transactional(isolation = Isolation.READ_COMMITTED)
	@PreAuthorize("hasAnyRole('ROLE_SUPERUSER','ROLE_ADMIN')")
	@RequestMapping(value = "/deleteloc", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public ControllerResult delLoc(@RequestBody Loc loc) {
		return locService.delLoc(loc);
	}
}


