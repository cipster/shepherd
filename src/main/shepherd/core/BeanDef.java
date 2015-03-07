package core;

import model.implementation.*;
import model.interfaces.*;
import org.apache.commons.dbcp.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.*;

@Configuration
public class BeanDef {

    @Autowired
    private BasicDataSource dataSource;

    @Bean
    public ListaProiecteDAO listaProiecteDAO() {
        return new ListaProiecteDAOImpl(dataSource);
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
    public ClientDAO clientiDAO() {
        return new ClientiDAOImpl(dataSource);
    }

    @Bean
    public PropunereDAO propunereDAO() {
        return new PropunereDAOImpl(dataSource);
    }

    @Bean
    public RaportFinalDAOImpl raportFinalJDBCDAO() {
        return new RaportFinalDAOImpl(dataSource);
    }

    @Bean
    public UserDAO userDAO() {
        return new UserDAOImpl(dataSource);
    }

    @Bean
    public UserRolesDAO userRolesDAO() {
        return new UserRolesDAOImpl(dataSource);
    }

    @Bean
    public RolesDAO rolesJDBCDAO() {
        return new RolesDAOImpl(dataSource);
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
    public ArticoleDAO articoleDAO() {
        return new ArticoleDAOImpl(dataSource);
    }
}
