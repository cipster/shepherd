package controllers.admin;

import model.ControllerResult;
import model.domain.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import services.ArticolService;
import services.Cod1Service;
import services.LocService;
import services.PersoanaService;

import java.util.List;

@Controller
@RequestMapping(value = "/global/admin/inventar")
public class AdminInventarRestController {

	@Autowired
	private Cod1Service cod1Service;
	@Autowired
	private PersoanaService persoanaService;
	@Autowired
	private LocService locService;
	@Autowired
	private ArticolService articolService;


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

	@PreAuthorize("hasAnyRole('ROLE_SUPERUSER','ROLE_ADMIN')")
	@RequestMapping(value = "/deleteloc", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public ControllerResult delLoc(@RequestBody Loc loc) {
		return locService.delLoc(loc);
	}

	@Transactional(isolation = Isolation.READ_COMMITTED)
	@PreAuthorize("hasAnyRole('ROLE_SUPERUSER','ROLE_ADMIN')")
	@RequestMapping(value = "/modifycod1", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public ControllerResult modCod1(@RequestBody Cod1 cod1) {
		return cod1Service.modCod1(cod1);
	}

	@Transactional(isolation = Isolation.READ_COMMITTED)
	@PreAuthorize("hasAnyRole('ROLE_SUPERUSER','ROLE_ADMIN')")
	@RequestMapping(value = "/addcod1", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public ControllerResult addCod1(@RequestBody Cod1 cod1) {
		return cod1Service.addCod1(cod1);
	}

	@PreAuthorize("hasAnyRole('ROLE_SUPERUSER','ROLE_ADMIN')")
	@RequestMapping(value = "/deletecod1", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public ControllerResult delLoc(@RequestBody Cod1 cod1) {
		return cod1Service.delCod1(cod1);
	}

	@PreAuthorize("hasAnyRole('ROLE_SUPERUSER','ROLE_ADMIN')")
	@RequestMapping(value = "/modifyarticol", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public ControllerResult modArticol(@RequestBody Cod3 articol) {
		return articolService.modArticol(articol);
	}

	@PreAuthorize("hasAnyRole('ROLE_SUPERUSER','ROLE_ADMIN')")
	@RequestMapping(value = "/articolelist", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public List<Cod3> fetchArticole() {
		return articolService.fetchAllCod3();
	}

	@PreAuthorize("hasAnyRole('ROLE_SUPERUSER','ROLE_ADMIN')")
	@RequestMapping(value = "/addarticol", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public ControllerResult addArticol(@RequestBody Cod3 articol) {
		return articolService.addArticol(articol);
	}

	@Transactional(isolation = Isolation.READ_COMMITTED)
	@PreAuthorize("hasAnyRole('ROLE_SUPERUSER','ROLE_ADMIN')")
	@RequestMapping(value = "/deletearticol", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public ControllerResult delArticol(@RequestBody Cod3 articol) {
		return articolService.delArticol(articol);
	}
}


