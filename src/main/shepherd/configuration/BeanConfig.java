package configuration;

import model.dao.AlteMaterialeDAO;
import model.dao.ArticolDAO;
import model.dao.BdDAO;
import model.dao.ChestionarFinalDAO;
import model.dao.ClientDAO;
import model.dao.Cod1DAO;
import model.dao.Cod2DAO;
import model.dao.Cod3DAO;
import model.dao.EvidentaInventarDAO;
import model.dao.LocDAO;
import model.dao.PersoanaDAO;
import model.dao.ProiectDAO;
import model.dao.PropunereDAO;
import model.dao.RoleDAO;
import model.dao.UserDAO;
import model.dao.UserRoleDAO;
import model.implementation.AlteMaterialeDAOImpl;
import model.implementation.ArticolDAOImpl;
import model.implementation.BdDAOImpl;
import model.implementation.ChestionarFinalDAOImpl;
import model.implementation.ClientDAOImpl;
import model.implementation.Cod1DAOImpl;
import model.implementation.Cod2DAOImpl;
import model.implementation.Cod3DAOImpl;
import model.implementation.EvidentaInventarDAOImpl;
import model.implementation.LocDAOImpl;
import model.implementation.PersoanaDAOImpl;
import model.implementation.ProiectDAOImpl;
import model.implementation.PropunereDAOImpl;
import model.implementation.RaportFinalDAOImpl;
import model.implementation.RoleDAOImpl;
import model.implementation.UserDAOImpl;
import model.implementation.UserRoleDAOImpl;
import org.apache.commons.dbcp.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import services.*;

@Configuration
public class BeanConfig {

	@Autowired
	private BasicDataSource dataSource;

	@Bean
	public ProiectDAO proiectDAO() {
		return new ProiectDAOImpl(dataSource);
	}

	@Bean
	public AlteMaterialeDAO alteMaterialeDAO() {
		return new AlteMaterialeDAOImpl(dataSource);
	}

	@Bean
	public BdDAO bdDAO() {
		return new BdDAOImpl(dataSource);
	}

	@Bean
	public ChestionarFinalDAO chestionarFinalDAO() {
		return new ChestionarFinalDAOImpl(dataSource);
	}

	@Bean
	public ClientDAO clientDAO() {
		return new ClientDAOImpl(dataSource);
	}

	@Bean
	public PropunereDAO propunereDAO() {
		return new PropunereDAOImpl(dataSource);
	}

	@Bean
	public RaportFinalDAOImpl raportFinalDAO() {
		return new RaportFinalDAOImpl(dataSource);
	}

	@Bean
	public UserDAO userDAO() {
		return new UserDAOImpl(dataSource);
	}

	@Bean
	public UserRoleDAO userRoleDAO() {
		return new UserRoleDAOImpl(dataSource);
	}

	@Bean
	public RoleDAO roleDAO() {
		return new RoleDAOImpl(dataSource);
	}

	@Bean
	public Cod1DAO cod1DAO() {
		return new Cod1DAOImpl(dataSource);
	}

	@Bean
	public Cod2DAO cod2DAO() {
		return new Cod2DAOImpl(dataSource);
	}

	@Bean
	public Cod3DAO cod3DAO() {
		return new Cod3DAOImpl(dataSource);
	}

	@Bean
	public LocDAO locDAO() {
		return new LocDAOImpl(dataSource);
	}

	@Bean
	public PersoanaDAO persoanaDAO() {
		return new PersoanaDAOImpl(dataSource);
	}

	@Bean
	public EvidentaInventarDAO evidentaInventarDAO() {
		return new EvidentaInventarDAOImpl(dataSource);
	}

	@Bean
	public ArticolDAO articolDAO() {
		return new ArticolDAOImpl(dataSource);
	}

	@Bean
	public ProiectService proiectService() {
		return new ProiectServiceImpl();
	}

	@Bean
	public ClientService clientService() {
		return new ClientServiceImpl();
	}

	@Bean
	public UserService userService() {
		return new UserServiceImpl();
	}

	@Bean
	public Cod1Service cod1Service() {
		return new Cod1ServiceImpl();
	}

	@Bean
	public PersoanaService persoanaService() {
		return new PersoanaServiceImpl();
	}

	@Bean
	public LocService locService() {
		return new LocServiceImpl();
	}
}
