package projectManager.core;

import projectManager.repository.dao.*;
import projectManager.repository.dao.jdbc.*;
import org.springframework.context.annotation.*;

@Configuration
public class BeanDef {
    @Bean
    public ListaProiecteDAO listaProiecteDAO() {
        return new ListaProiecteJDBCDAO(dataSource());
    }

    @Bean
    public AlteMaterialeDAO alteMaterialeDAO() {
        return new AlteMaterialeJDBCDAO(dataSource());
    }

    @Bean
    public BdDAO bdDAO() {
        return new BdJDBCDAO(dataSource());
    }

    @Bean
    public ChestionarFinalDAO chestionarFinalDAO() {
        return new ChestionarFinalJDBCDAO(dataSource());
    }

    @Bean
    public ClientDAO clientiDAO() {
        return new ClientiJDBCDAO(dataSource());
    }

    @Bean
    public PropunereDAO propunereDAO() {
        return new PropunereJDBCDAO(dataSource());
    }

    @Bean
    public RaportFinalJDBCDAO raportFinalJDBCDAO() {
        return new RaportFinalJDBCDAO(dataSource());
    }

    @Bean
    public UserDAO userDAO() {
        return new UserJDBCDAO(dataSource());
    }

    @Bean
    public UserRolesDAO userRolesDAO() {
        return new UserRolesJDBCDAO(dataSource());
    }

    @Bean
    public RolesDAO rolesJDBCDAO() {
        return new RolesDAOImpl(dataSource());
    }

    @Bean
    public Cod1DAO cod1DAO() {
        return new Cod1DAOImpl(dataSource());
    }

    @Bean
    public Cod2DAO cod2DAO() {
        return new Cod2DAOImpl(dataSource());
    }

    @Bean
    public Cod3DAO cod3DAO() {
        return new Cod3DAOImpl(dataSource());
    }

    @Bean
    public LocDAO locDAO() {
        return new LocDAOImpl(dataSource());
    }

    @Bean
    public PersoanaDAO persoanaDAO() {
            return new PersoanaDAOImpl(dataSource());
        }

    @Bean
    public EvidentaInventarDAO evidentaInventarDAO() {
        return new EvidentaInventarDAOImpl(dataSource());
    }

    @Bean
    public ArticoleDAO articoleDAO() {
        return new ArticoleDAOImpl(dataSource());
    }
}
