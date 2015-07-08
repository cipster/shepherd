package configuration;

import model.dao.*;
import model.implementation.*;
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
	public EvidentaDAO evidentaDAO() {
		return new EvidentaDAOImpl(dataSource);
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
	public Cod2Service cod2Service() {
		return new Cod2ServiceImpl();
	}

	@Bean
	public PersoanaService persoanaService() {
		return new PersoanaServiceImpl();
	}

	@Bean
	public LocService locService() {
		return new LocServiceImpl();
	}

	@Bean
	public ArticolService articolService() {
		return new ArticolServiceImpl();
	}

}
